@testset "parameter instance" begin
    para1 = Parameter("voltage", "Voltage", 0.0)
    @test para1.metadata == Dict("Name"=>"voltage", "Label"=>"Voltage", "Value"=>0)

    QDash.load_metadata!(para1, Dict("Description"=>"Voltage of the system"))
    @test QDash.snapshot(para1) == Dict("Name"=>"voltage", "Label"=>"Voltage", "Value"=>0,
                                "Description"=>"Voltage of the system")

    para2 = Parameter("voltage", "Voltage", [0.0, 1.0, 2.0])
    @test valuetype(para2) == Vector{Float64}

    para3 = Parameter("voltage", "Voltage", [0, 1, 2])
    push!(para3, 3, 4)
    @test para3.value == [0, 1, 2, 3, 4]
    append!(para3, [5, 6], [7, 8])
    @test para3.value == [0, 1, 2, 3, 4, 5, 6, 7, 8]
end