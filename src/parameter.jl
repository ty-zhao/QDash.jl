function Parameter(;
    name  :: String = "parameter",
    label :: String = "label",
    value :: T = T[],
    unit  :: Unitful.Units = Unitful.NoUnits,
    instrument :: Union{Instrument, Nothing} = nothing
) where {T}
    timestamp = string(now())
    metadata = Dict(
        "name"=>name,
        "label"=>label,
        "value"=>value,
        "unit"=>unit,
        "ts"=>timestamp
    )

    return Parameter{T}(
        name,
        label,
        value,
        unit,
        instrument,
        timestamp,
        metadata,
    )
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

Base.show(io::IO, p::AbstractParameter) = print(io, "Parameter: ", p.name)
function Base.show(io::IO, ::MIME"text/plain", p::AbstractParameter)
    println(io, "Parameter")
    fields = [:name, :label, :value, :unit]
    lmax =  maximum([length(string(f)) for f in fields])
    for f in fields
        println(io, "  ", rpad(f, lmax), ": ", getproperty(p, f))
    end

    return nothing
end
