function Parameter(;
    name  :: String = "parameter",
    label :: String = "label",
    value :: T = T[],
    unit  :: Union{Unitful.Units, Unitful.MixedUnits} = Unitful.NoUnits,
    instrument :: Union{Instrument, Nothing} = nothing,
    get   :: Union{Nothing, String, Function} = nothing,
    set   :: Union{Nothing, String, Function} = nothing,
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
        get,
        set,
        timestamp,
        metadata,
    )
end

function setvalue(i::Union{Instrument, Nothing}, p::Parameter, v)
    if p.set === nothing
        return nothing
    else
        error("Not implemented")
    end
end

function getvalue(i::Union{Instrument, Nothing}, p::Parameter)
    if p.get === nothing
        return getfield(p, :value)
    else
        error("Not implemented")
    end
end

function Base.setproperty!(p::AbstractParameter, s::Symbol, v)
    if s ≡ :value
        setvalue(p.instrument, p, v)
    end
    p.metadata[string(s)] = v
    ts = string(now())
    p.metadata["ts"] = ts
    setfield!(p, s, convert(fieldtype(typeof(p), s), v))
    setfield!(p, :ts, ts)

    return nothing
end

function Base.getproperty(p::AbstractParameter, s::Symbol)
    if s ≡ :value
        return getvalue(p.instrument, p)
    end

    return getfield(p, s)
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
