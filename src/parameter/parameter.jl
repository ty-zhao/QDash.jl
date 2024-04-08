"""
    Parameter{T}(name::String, label::String, value::T)
A parameter.
"""
@kwdef mutable struct Parameter{T} <: AbstractParameter{T}
    name::String
    label::String = ""
    value::Union{T, Nothing} = nothing
    metadata::Dict{String, <:Any} = Dict{String, <:Any}()
    function Parameter(name, label, value::T) where {T}
        new{T}(name, label, value, Dict("Name"=>name, "Label"=>label, "Value"=>value))
    end
end

valuetype(::Parameter{T}) where {T} = T

@forward Parameter{<:AbstractArray}.value Base.getindex, Base.iterate, Base.length
@forward Parameter{<:AbstractVector}.value Base.append!, Base.push!