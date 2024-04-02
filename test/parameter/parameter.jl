using QDash
using Test

@testset "parameter instance" begin
    para1 = Parameter("voltage", "Voltage", 0.0)
    @test para1.metadata == Dict("Name"=>"voltage", "Label"=>"Voltage", "Value"=>0)

    QDash.load_metadata!(para1, Dict("Description"=>"Voltage of the system"))
    @test para1.metadata == Dict("Name"=>"voltage", "Label"=>"Voltage", "Value"=>0,
                                "Description"=>"Voltage of the system")

    test_array = [0.0, 1.0, 2.0]
    para2 = Parameter("voltage", "Voltage", test_array)
    @test para2 isa Parameter{Vector{Float64}}

    para3 = Parameter("voltage", "Voltage", [0, 1, 2])
    @test para3 isa Parameter{Vector{Int64}}

    print(QDash.parameter_type(typeof(para3)))
end