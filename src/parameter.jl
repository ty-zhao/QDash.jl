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

valuetype(::Parameter{T}) where {T} = T

@forward Parameter{<:AbstractArray}.value Base.getindex, Base.iterate, Base.length
@forward Parameter{<:AbstractVector}.value Base.append!, Base.push!