using Unitful

abstract type Parameter <: Qobject end

"""
    GenericParameter(name::String, label::String, unit::Unitful.Units)
A generic parameter with a name, label, and unit.
"""
@kwdef mutable struct GenericParameter <: Parameter
    name::String
    label::String
    unit::Unitful.Units
    metadata::Dict{String, Any} = Dict{String, Any}()
    GenericParameter(name, label, unit) = new(name, label, unit, Dict("Name"=>name, "Unit"=>unit))
end

# GenericParameter() = GenericParameter("", "", NoUnits)
