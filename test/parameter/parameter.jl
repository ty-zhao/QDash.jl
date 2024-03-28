using QDash
using Test
using Unitful

@testset "parameter instance" begin
    para = GenericParameter("voltage", "Voltage", u"V")
    @test para.name == "voltage"
    @test para.label == "Voltage"
    @test para.unit == u"V"
end