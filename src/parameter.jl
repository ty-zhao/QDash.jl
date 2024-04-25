"""
    Parameter{T}(name::String, label::String, value::T, unit::Unitful.Units)
A parameter.
"""
mutable struct Parameter{T} <: AbstractParameter
    name     :: String
    label    :: String
    value    :: T
    unit     :: Unitful.Units
    ts       :: String
    metadata :: Dict{String, <:Any}
end

function Parameter(;
    name  :: String = "parameter",
    label :: String = "label",
    value :: T = T[],
    unit  :: Unitful.Units = Unitful.NoUnits
) where {T}
    timestamp = string(now())
    metadata = Dict(
        "name"=>name,
        "label"=>label,
        "value"=>value,
        "unit"=>unit,
        "ts"=>timestamp
    )

    return Parameter{T}(name, label, value, unit, timestamp, metadata)
end

function Base.setproperty!(p::AbstractParameter, s::Symbol, v)
    p.metadata[string(s)] = v
    ts = string(now())
    p.metadata["ts"] = ts
    setfield!(p, s, convert(fieldtype(typeof(p), s), v))
    setfield!(p, :ts, ts)

    return nothing
end

valuetype(::Parameter{T}) where {T} = T

@forward Parameter{<:AbstractArray}.value Base.getindex, Base.iterate, Base.length
@forward Parameter{<:AbstractVector}.value Base.append!, Base.push!

function Base.show(io::IO, ::MIME"text/plain", p::AbstractParameter)
    println(io, "Parameter")
    fields = [:name, :label, :value, :unit]
    lmax =  maximum([length(string(f)) for f in fields])
    for f in fields
        println(io, "  ", f, " "^(lmax-length(string(f))), ": ", getproperty(p, f))
    end

    return nothing
end