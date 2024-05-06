@testset "instrument test" begin
    instrument1 = Instrument(
        Val(:sim);
        model = :dummy,
        name  = "instrument",
        address = "192.168.0.0",
        label = "label",
    )
    @test repr(
        "text/plain",
        instrument1
    ) == """
      Instrument
        model  : dummy
        name   : instrument
        address: 192.168.0.0
        label  : label
        ──────────
        Parameters
        ╭─────┬──────┬─────┬──────╮
        │Name │Label │Unit │Value │
        ├─────┼──────┼─────┼──────┤
        ╰─────┴──────┴─────┴──────╯
      """

    @test instrument1.metadata == Dict(
        "model" => :dummy,
        "name"  => "instrument",
        "address" => "192.168.0.0",
        "label" => "label",
        "ts"    => instrument1.ts,
    )
    @test instrument1.model == :dummy

    para1 = Parameter(;
        name  = "voltage",
        label = "Voltage",
        value = 1:100,
        unit  = u"V",
    )

    @test_throws "Unsupported property" instrument1.voltage
    addparameter!(instrument1, para1)
    @test instrument1.voltage == para1
    @test_throws "already exists in instrument" addparameter!(instrument1, para1)

    @test repr(
        "text/plain",
        instrument1,
    ) == """
      Instrument
        model  : dummy
        name   : instrument
        address: 192.168.0.0
        label  : label
        ──────────
        Parameters
        ╭────────┬────────┬─────┬──────────────────────╮
        │Name    │Label   │Unit │Value                 │
        ├────────┼────────┼─────┼──────────────────────┤
        │voltage │Voltage │V    │[1, 2, 3  …  99, 100] │
        ╰────────┴────────┴─────┴──────────────────────╯
      """
end
