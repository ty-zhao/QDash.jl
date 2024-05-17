function AgilentN5183M(;
    name    :: String,
    address :: String,
    label   :: String,
)
    instr = Instrument(
        Val(:VISA);
        model=:AgilentN5183M,
        name=name,
        address=address,
        label=label,
    )

    addparameter!(
        instr,
        Parameter(
            name="frequency",
            label="Frequency",
            value=0.0,
            unit=u"Hz",
            get="SOUR:FREQ?",
            set="SOUR:FREQ ",
        )
    )

    return instr
end


function setvalue(i::Instrument{:AgilentN5183M}, p::Parameter, v)
    write(i, p.set*"$v")

    return nothing
end

function getvalue(i::Instrument{:AgilentN5183M}, p::Parameter)
    return query(i, p.get)
end
