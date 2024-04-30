@testset "instrument test" begin
    instrument1 = Instrument(;
        model = :dummy,
        name  = "instrument",
        label = "label",
    )

    @test instrument1.metadata == Dict(
        "name"  => "instrument",
        "label" => "label",
        "ts"    => instrument1.ts,
    )
    @test modelof(instrument1) == :dummy

    para1 = Parameter(;
        name  = "voltage",
        label = "Voltage",
        value = 1:100,
        unit  = u"V",
    )

    @test_throws "Unsupported property" instrument1.voltage

    addparameter!(instrument1, para1)
    @test instrument1.voltage == para1

    @test repr(
        "text/plain",
        instrument1.parameters,
    ) == """Parameters
      ╭────────┬────────┬─────┬──────────────────────╮
      │Name    │Label   │Unit │Value                 │
      ├────────┼────────┼─────┼──────────────────────┤
      │voltage │Voltage │V    │[1, 2, 3  …  99, 100] │
      ╰────────┴────────┴─────┴──────────────────────╯
      """
end