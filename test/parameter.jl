@testset "parameter instance" begin
    para1 = Parameter(name="voltage", label="Voltage", value=0.0, unit=u"V")
    @test para1.metadata == Dict("name"=>"voltage", "label"=>"Voltage", "value"=>0.0, "unit"=>u"V")

    QDash.load_metadata!(para1, Dict("description"=>"Voltage of the system"))
    @test QDash.snapshot(para1) == Dict("name"=>"voltage", "label"=>"Voltage", "value"=>0.0, "unit"=>u"V",
                                        "description"=>"Voltage of the system")

    para2 = Parameter(name="voltage", label="Voltage", value=[0.0, 1.0, 2.0], unit=u"V")
    @test valuetype(para2) == Vector{Float64}

    para3 = Parameter(name="voltage", label="Voltage", value=[0, 1, 2], unit=u"V")
    push!(para3, 3, 4)
    @test para3.value == [0, 1, 2, 3, 4]
    append!(para3, [5, 6], [7, 8])
    @test para3.value == [0, 1, 2, 3, 4, 5, 6, 7, 8]
end