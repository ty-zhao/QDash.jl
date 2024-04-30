@testset "parameter test" begin
    para1 = Parameter(;
        name  = "voltage",
        label = "Voltage",
        value = 0.0,
        unit  = u"V",
    )
    @test repr(para1) == "Parameter: voltage"
    @test repr(
        "text/plain",
        para1
    ) == """
      Parameter
        name : voltage
        label: Voltage
        value: 0.0
        unit : V
      """
    @test para1.metadata == Dict(
        "name"  => "voltage",
        "label" => "Voltage",
        "value" => 0.0,
        "unit"  => u"V",
        "ts"    => para1.ts,
    )
    para1.value = 5.0
    @test para1.metadata["value"] == 5.0

    QDash.load_metadata!(para1, Dict("description"=>"Voltage of the system"))
    @test QDash.snapshot(para1) == Dict(
        "name"  => "voltage",
        "label" => "Voltage",
        "value" => 5.0,
        "unit"  => u"V",
        "ts"    => para1.ts,
        "description" => "Voltage of the system",
    )

    para2 = Parameter(
        name  = "voltage",
        label = "Voltage",
        value = [0.0, 1.0, 2.0],
        unit  = u"V",
    )
    @test valuetype(para2) == Vector{Float64}

    para3 = Parameter(
        name  = "voltage",
        label = "Voltage",
        value = [0, 1, 2],
        unit  = u"V",
    )

    push!(para3, 3, 4)
    @test para3.value == [0, 1, 2, 3, 4]
    @test para3.metadata == Dict(
        "name"  => "voltage",
        "label" => "Voltage",
        "value" => [0, 1, 2, 3, 4],
        "unit"  => u"V",
        "ts"    => para3.ts
    )

    append!(para3, [5, 6], [7, 8])
    @test para3.value == [0, 1, 2, 3, 4, 5, 6, 7, 8]
end