@testset "instrument test" begin
    instrument1 = Instrument(;
        name  = "instrument",
        label = "label",
    )

    @test instrument1.metadata == Dict(
        "name"  => "instrument",
        "label" => "label",
        "ts"    => instrument1.ts,
    )

    para1 = Parameter(;
        name  = "voltage",
        label = "Voltage",
        value = 1:100,
        unit  = u"V",
    )
    addparameter!(instrument1, :voltage, para1)
    @test instrument1.voltage == para1
end