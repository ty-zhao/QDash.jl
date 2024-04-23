"""
    Parameter{T}(name::String, label::String, value::T, unit::Unitful.Units)
A parameter.
"""
mutable struct Parameter{T} <: AbstractParameter{T}
    name     :: String
    label    :: String
    value    :: T
    unit     :: Unitful.Units
    metadata :: Dict{String, <:Any}
end

function Parameter(;
    name  :: String = "parameter",
    label :: String = "label",
    value :: T      = T[],
    unit  :: Unitful.Units = Unitful.NoUnits) where {T}

    metadata = Dict("name"=>name, "label"=>label, "value"=>value, "unit"=>unit)
    Parameter{T}(name, label, value, unit, metadata)
end

function Base.setproperty!(p::Parameter, s::Symbol, v)
    p.metadata[string(s)] = v
    setfield!(p, s, convert(fieldtype(typeof(p), s), v))
end

valuetype(::Parameter{T}) where {T} = T

@forward Parameter{<:AbstractArray}.value Base.getindex, Base.iterate, Base.length
@forward Parameter{<:AbstractVector}.value Base.append!, Base.push!