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
        )
    )

    addparameter!(
        instr,
        Parameter(
            name="power",
            label="Power",
            value=0.0,
            unit=u"dBm",
        )
    )

    return instr
end

macro scpifloat(name, instrType, scpiStr, scale, units)
	setterFunc = Symbol(string(name)*"!")
	setterProto = :($(setterFunc)(instr::$instrType, val::Real))
	setterBody = :(write(instr, $scpiStr * " $val"))
	setter = Expr(:function, esc(setterProto), esc(setterBody))
	getCmd = scpiStr*"?"
	getterProto = :($name(instr::$instrType))
	getterBody = :(parse(Float64, query(instr, $getCmd)))
	getter = Expr(:function, esc(getterProto), esc(getterBody))
	Expr(:block, setter, getter)
end

@scpifloat(frequency, Instrument{:AgilentN5183M}, "SOUR:FREQ", 1, "Hz")
@scpifloat(power, Instrument{:AgilentN5183M}, "SOUR:POW", 1, "dBm")
