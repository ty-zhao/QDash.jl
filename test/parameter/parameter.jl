using QDash
using Test
using Unitful

@testset "parameter instance" begin
    para = GenericParameter("voltage", "Voltage", u"V")
    @test para.metadata == Dict("Name"=>"voltage", "Unit"=>u"V")

    QDash.load_metadata!(para, Dict("Description"=>"Voltage of the system"))
    @test para.metadata == Dict("Name"=>"voltage", "Unit"=>u"V",
                                "Description"=>"Voltage of the system")
end