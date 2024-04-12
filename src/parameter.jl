"""
    Parameter{T}(name::String, label::String, value::T)
A parameter.
"""
@kwdef mutable struct Parameter{T} <: AbstractParameter{T}
    name::String
    label::String
    value::T
    unit::Unitful.Units
    metadata::Dict{String, <:Any} = Dict{String, Any}("Name"=>name, "Label"=>label, "Value"=>value, "Unit"=>unit)
    # function Parameter(name, label, value::T) where {T}
    #     new{T}(name, label, value, Dict("Name"=>name, "Label"=>label, "Value"=>value))
    # end
end

Parameter(name, label, value::T, unit) where {T} = Parameter{T}(name=name, label=label, value=value, unit=unit)

valuetype(::Parameter{T}) where {T} = T

@forward Parameter{<:AbstractArray}.value Base.getindex, Base.iterate, Base.length
@forward Parameter{<:AbstractVector}.value Base.append!, Base.push!