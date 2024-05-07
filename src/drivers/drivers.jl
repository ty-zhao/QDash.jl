function AgilentN5183M(;
    name    :: String,
    address :: String,
    label   :: String = "label",
)
    parameters = Dict{Symbol, Parameter}()
    # parameters[:frequency] = Parameter(;
    #     name="frequency",
    #     label="Frequency",
    #     value=0.0,
    #     unit=u"Hz",
    #     instrument=:AgilentN5183M,
    # )

    return Instrument(
        Val(:VISA);
        model=:AgilentN5183M,
        name=name,
        address=address,
        label=label,
        parameters=parameters,
    )
end

@scpifloat(frequency, Instrument{:AgilentN5183M}, "SOUR:FREQ", 1, "Hz")
