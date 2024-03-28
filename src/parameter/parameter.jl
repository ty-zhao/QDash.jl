using Unitful

abstract type Parameter end

"""
	GenericParameter(name::String, label::String, unit::Unitful.Units)
A generic parameter with a name, label, and unit.
"""
mutable struct GenericParameter <: Parameter
	name::String
	label::String
	unit::Unitful.Units
end

GenericParameter() = GenericParameter("", "", NoUnits)

function getfield()
	
end