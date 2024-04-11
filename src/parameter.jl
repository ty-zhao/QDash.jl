"""
    Parameter{T}(name::String, label::String, value::T)
A parameter.
"""
@kwdef mutable struct Parameter{T} <: AbstractParameter{T}
    name::String
    label::String
    value::T
    metadata::Dict{String, <:Any} = Dict{String, Any}()
    # function Parameter(name, label, value::T) where {T}
    #     new{T}(name, label, value, Dict("Name"=>name, "Label"=>label, "Value"=>value))
    # end
end

Parameter(name, label, value::T) where {T} = Parameter{T}(name, label, value, Dict("Name"=>name, "Label"=>label, "Value"=>value))
# Parameter(;name, label, value::T) where {T} = Parameter{T}(name, label, value, Dict("Name"=>name, "Label"=>label, "Value"=>value))

valuetype(::Parameter{T}) where {T} = T

@forward Parameter{<:AbstractArray}.value Base.getindex, Base.iterate, Base.length
@forward Parameter{<:AbstractVector}.value Base.append!, Base.push!