mutable struct Instrument <: AbstractInstrument
    name     :: String
    label    :: String
    ts       :: String
    metadata :: Dict{String, <:Any}
    parameters :: Dict{Symbol, <:AbstractParameter}
end

function Instrument(;
    name  :: String = "instrument",
    label :: String = "label",
)
    timestamp = string(now())
    metadata = Dict(
        "name"=>name,
        "label"=>label,
        "ts"=>timestamp
    )

    parameters = Dict{Symbol, Parameter}()
    return Instrument(name, label, timestamp, metadata, parameters)
end

function Base.getproperty(i::AbstractInstrument, s::Symbol)
    direct_passthrough_fields = (:name, :label, :ts, :metadata, :parameters)
    if s in direct_passthrough_fields
        return getfield(i, s)
    end

    if s in keys(i.parameters)
        return i.parameters[s]
    end
    
    error("Unsupported property: $s")
end

function addparameter!(i::AbstractInstrument, name::Symbol, p::AbstractParameter)
    if name in keys(i.parameters)
        error("Parameter $name already exists in instrument")
    end

    i.parameters[name] = p

    return nothing
end

function Base.show(io::IO, ::MIME"text/plain", d::Dict{Symbol, Parameter})
    printstyled(io, "Parameters"; bold=true)
    println()

    symbol_width = max(length("Symbol"), maximum([length(string(k)) for k in keys(d)])) + 1
    name_width   = max(length("Name"), maximum([length(v.name) for v in values(d)]))
    label_width  = max(length("Label"), maximum([length(v.label) for v in values(d)]))
    value_width  = max(
        length("Value"),
        min(20, maximum([length(string(v.value)) for v in values(d)])),
    )
    unit_width   = max(length("Unit"), maximum([length(string(v.unit)) for v in values(d)]))

    print_horizontal_line(
        io,
        (symbol_width, name_width, label_width, value_width, unit_width),
        ('╭', '─', '┬', '╮')
    )

    printstyled(io, "│", rpad("Symbol", symbol_width, " "), " │"; bold=true)
    printstyled(io, rpad("Name", name_width, " "), " │"; bold=true)
    printstyled(io, rpad("Label", label_width, " "), " │"; bold=true)
    printstyled(io, rpad("Value", value_width, " "), " │"; bold=true)
    printstyled(io, rpad("Unit", unit_width, " "), " │"; bold=true)
    println()
   
    print_parameter(
        io,
        d,
        (symbol_width, name_width, label_width, value_width, unit_width),
    )
    println()

    print_horizontal_line(
        io,
        (symbol_width, name_width, label_width, value_width, unit_width),
        ('╰', '─', '┴', '╯')
    )

end

function print_parameter(io::IO, d::Dict{Symbol, Parameter}, column_width::Tuple)
    print_horizontal_line(io, column_width, ('├', '─', '┼', '┤'))
    for (k, v) in d
        print(io, "│:", rpad(k, column_width[1]-1, " "), " │")
        print(io, rpad(v.name, column_width[2], " "), " │")
        print(io, rpad(v.label, column_width[3], " "), " │")
        print(io, rpad(string(v.value), column_width[4], " "), " │")
        print(io, rpad(string(v.unit), column_width[5], " "), " │")
    end

    return nothing
end

function print_horizontal_line(io::IO, column_width::Tuple, line_elements::Tuple)
    print(io, line_elements[1])
    for c in column_width[1:end-1]
        print(io, line_elements[2]^(c+1), line_elements[3])
    end
    print(io, line_elements[2]^(column_width[end]+1), line_elements[4])
    println()

    return nothing
end

# function Base.setproperty!(i::AbstractInstrument, s::Symbol, v)
#     p.metadata[string(s)] = v
#     ts = string(now())
#     p.metadata["ts"] = ts
#     setfield!(p, s, convert(fieldtype(typeof(p), s), v))
#     setfield!(p, :ts, ts)

#     return nothing
# end