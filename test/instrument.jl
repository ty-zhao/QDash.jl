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
        value = collect(1:100),
        unit  = u"V",
    )

    @test_throws "Unsupported property" instrument1.voltage

    addparameter!(instrument1, :voltage, para1)
    @test instrument1.voltage == para1

    @test repr(
        "text/plain",
        instrument1.parameters,
    ) == """Parameters
      ╭─────────┬────────┬────────┬──────────────────────┬─────╮
      │Symbol   │Name    │Label   │Value                 │Unit │
      ├─────────┼────────┼────────┼──────────────────────┼─────┤
      │:voltage │voltage │Voltage │[1, 2, 3  …  99, 100] │V    │
      ╰─────────┴────────┴────────┴──────────────────────┴─────╯
      """
end