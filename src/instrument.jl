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
    println(io)

    if length(d) == 0
        column_widths = (6, 4, 5, 5, 4)
        print_horizontal_line(io, column_widths, ('╭', '─', '┬', '╮'))
        printstyled(io, "│Symbol │Name │Label │Value │Unit │"; bold=true)
        println(io)
        print_horizontal_line(io, column_widths, ('├', '─', '┼', '┤'))
        print_horizontal_line(io, column_widths, ('╰', '─', '┴', '╯'))

        return nothing
    end

    value_strings = [
        sprint(
            show_vector_pretty,
            v.value,
            context=IOContext(stdout, :limit=>true),
            sizehint=0
        ) for v in values(d)
    ]

    symbol_width = max(length("Symbol"), maximum([length(string(k)) for k in keys(d)])) + 1
    name_width   = max(length("Name"), maximum([length(v.name) for v in values(d)]))
    label_width  = max(length("Label"), maximum([length(v.label) for v in values(d)]))
    value_width  = max(length("Value"), maximum(length.(value_strings)))
    unit_width   = max(length("Unit"), maximum([length(string(v.unit)) for v in values(d)]))
    column_widths = (symbol_width, name_width, label_width, value_width, unit_width)

    print_horizontal_line(io, column_widths, ('╭', '─', '┬', '╮'))

    printstyled(io, "│", rpad("Symbol", symbol_width, " "), " │"; bold=true)
    printstyled(io, rpad("Name", name_width, " "), " │"; bold=true)
    printstyled(io, rpad("Label", label_width, " "), " │"; bold=true)
    printstyled(io, rpad("Value", value_width, " "), " │"; bold=true)
    printstyled(io, rpad("Unit", unit_width, " "), " │"; bold=true)
    println(io)

    print_parameters(io, d, column_widths)
    print_horizontal_line(io, column_widths, ('╰', '─', '┴', '╯'))

end

function print_parameters(io::IO, d::Dict{Symbol, Parameter}, column_width::Tuple)
    for (k, v) in d
        print_horizontal_line(io, column_width, ('├', '─', '┼', '┤'))

        value_string = sprint(
            show_vector_pretty,
            v.value,
            context=IOContext(stdout, :limit=>true),
            sizehint=0
        )

        print(io, "│:", rpad(k, column_width[1]-1, " "), " │")
        print(io, rpad(v.name, column_width[2], " "), " │")
        print(io, rpad(v.label, column_width[3], " "), " │")
        print(io, rpad(value_string, column_width[4], " "), " │")
        print(io, rpad(string(v.unit), column_width[5], " "), " │")
        println(io)
    end

    return nothing
end

function print_horizontal_line(io::IO, column_width::Tuple, line_elements::Tuple)
    print(io, line_elements[1])
    for c in column_width[1:end-1]
        print(io, line_elements[2]^(c+1), line_elements[3])
    end
    print(io, line_elements[2]^(column_width[end]+1), line_elements[4])
    println(io)

    return nothing
end

function show_vector_pretty(io::IO, v, opn='[', cls=']')
    limited = get(io, :limit, false)::Bool

    if limited && length(v) > 10
        f, l = 1, length(v)
        Base.show_delim_array(io, v, opn, ",", "", false, f, f+2)
        print(io, "  …  ")
        Base.show_delim_array(io, v, "", ",", cls, false, l-1, l)
    else
        Base.show_delim_array(io, v, opn, ",", cls, false)
    end

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