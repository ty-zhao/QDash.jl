using QDash
using Test

@testset "parameter instance" begin
    para1 = Parameter("voltage", "Voltage", 0.0)
    @test para1.metadata == Dict("Name"=>"voltage", "Label"=>"Voltage", "Value"=>0)

    QDash.load_metadata!(para1, Dict("Description"=>"Voltage of the system"))
    @test QDash.snapshot(para1) == Dict("Name"=>"voltage", "Label"=>"Voltage", "Value"=>0,
                                "Description"=>"Voltage of the system")

    para2 = Parameter("voltage", "Voltage", [0.0, 1.0, 2.0])
    @test QDash.parameter_type(para2) == Vector{Float64}

    para3 = Parameter("voltage", "Voltage", [0, 1, 2])
    @test QDash.parameter_type(para3) == Vector{Int64}

    para4 = Parameter("voltage", "Voltage", nothing)
    para4.value = 1.0
end