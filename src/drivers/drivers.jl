function AgilentN5183M(;
    name    :: String,
    address :: String,
    label   :: String = "label",
)
    model = :AgilentN5183M
    timestamp = string(now())
    metadata = Dict(
        "model" => model,
        "name"  => name,
        "label" => label,
        "ts"    => timestamp,
        "address" => address,
    )

    parameters = Dict{Symbol, Parameter}()
    parameters[:frequency] = Parameter(;
        name="frequency",
        label="Frequency",
        value=0.0,
        unit=u"Hz",
        instrument = model,
    )

    return Instrument{model}(
        name,
        address,
        label,
        timestamp,
        0,
        false,
        UInt32(1024),
        metadata,
        parameters,
    )
end