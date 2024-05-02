abstract type AbstractInstrument <: Qobject end

mutable struct Instrument{model} <: AbstractInstrument
    name     :: String
    address  :: String
    label    :: String
    ts       :: String
    handle   :: Any
    initialized :: Bool
    bufSize  :: UInt32
    metadata :: Dict{String, <:Any}
    parameters :: Dict{Symbol, <:AbstractParameter}
end

function Instrument(;
    model   :: Symbol,
    name    :: String,
    address :: String,
    label   :: String = "label",
    parameters :: Dict{Symbol, Parameter} = Dict{Symbol, Parameter}(),
)
    timestamp = string(now())
    metadata = Dict(
        "model" => model,
        "name"  => name,
        "label" => label,
        "ts"    => timestamp,
        "address" => address,
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

modelof(::Instrument{T}) where T = T

function Base.getproperty(i::AbstractInstrument, s::Symbol)
    direct_passthrough_fields = (
        :name,
        :address,
        :label,
        :ts,
        :handle,
        :initialized,
        :bufSize,
        :metadata,
        :parameters,
    )
    if s in direct_passthrough_fields
        return getfield(i, s)
    end

    if s in keys(i.parameters)
        return i.parameters[s]
    end

    if s ≡ :model
        return modelof(i)
    end
    
    error("Unsupported property: $s")
end

function addparameter!(i::AbstractInstrument, p::AbstractParameter)
    if Symbol(p.name) in keys(i.parameters)
        error("Parameter $(p.name) already exists in instrument")
    end

    i.parameters[Symbol(p.name)] = p

    return nothing
end

function Base.show(io::IO, ::MIME"text/plain", d::Dict{Symbol, Parameter{<:Any}})
    indent = get(io, :indent, 0)
    println(io, ' '^indent, "Parameters")

    if length(d) == 0
        column_widths = (4, 5, 4, 5)
        print_horizontal_line(io, column_widths, ('╭', '─', '┬', '╮'))
        println(io, ' '^indent, "│Name │Label │Unit │Value │")
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

    name_width   = max(length("Name"), maximum([length(v.name) for v in values(d)]))
    label_width  = max(length("Label"), maximum([length(v.label) for v in values(d)]))
    value_width  = max(length("Value"), maximum(length.(value_strings)))
    unit_width   = max(length("Unit"), maximum([length(string(v.unit)) for v in values(d)]))
    column_widths = (name_width, label_width, unit_width, value_width)

    print_horizontal_line(io, column_widths, ('╭', '─', '┬', '╮'))

    printstyled(io, ' '^indent, "│", rpad("Name", name_width, " "), " │"; bold=true)
    printstyled(io, rpad("Label", label_width, " "), " │"; bold=true)
    printstyled(io, rpad("Unit", unit_width, " "), " │"; bold=true)
    printstyled(io, rpad("Value", value_width, " "), " │"; bold=true)
    println(io)

    print_parameters(io, d, column_widths)
    print_horizontal_line(io, column_widths, ('╰', '─', '┴', '╯'))

    return nothing
end

function print_parameters(io::IO, d::Dict{Symbol, Parameter}, column_width::Tuple)
    indent = get(io, :indent, 0)
    for (k, v) in d
        print_horizontal_line(io, column_width, ('├', '─', '┼', '┤'))

        value_string = sprint(
            show_vector_pretty,
            v.value,
            context=IOContext(stdout, :limit=>true),
            sizehint=0
        )

        print(io, ' '^indent, "│", rpad(v.name, column_width[1], " "), " │")
        print(io, rpad(v.label, column_width[2], " "), " │")
        print(io, rpad(string(v.unit), column_width[3], " "), " │")
        print(io, rpad(value_string, column_width[4], " "), " │")
        println(io)
    end

    return nothing
end

function print_horizontal_line(io::IO, column_width::Tuple, line_elements::Tuple)
    indent = get(io, :indent, 0)
    print(io, ' '^indent, line_elements[1])
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

function Base.show(io::IO, mime::MIME"text/plain", i::AbstractInstrument)
    println(io, "Instrument")
    fields = [:model, :name,  :address, :label]
    lmax =  maximum([length(string(f)) for f in fields])
    for f in fields
        println(io, "  ", rpad(f, lmax), ": ", getproperty(i, f))
    end
    println(io, "  ", '─'^length("Parameters"))
    show(IOContext(io, :indent=>get(io, :indent, 0)+2), mime, i.parameters)

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