@testset "dataset" begin
    settable1 = Parameter(;
        name  = "voltage",
        label = "Voltage",
        value = 0.0,
        unit  = u"V",
    )
    settable2 = Parameter(;
        name  = "current",
        label = "Current",
        value = 0.0,
        unit  = u"A",
    )
    gettable1 = Parameter(;
        name  = "i_quadrature",
        label = "I Quadrature",
        value = 0.0,
        unit  = u"V",
    )
    gettable2 = Parameter(;
        name  = "q_quadrature",
        label = "Q Quadrature",
        value = 0.0,
        unit  = u"V",
    )

    ds = initialize_dataset(
        [settable1, settable2],
        [1:100, 1:200],
        [gettable1, gettable2],
    )

    @test size(ds.x1) == (100,)
    @test size(ds.y1) == (100, 200)
end