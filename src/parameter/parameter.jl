using Unitful

abstract type Parameter end

mutable struct GenericParameter <: Parameter
	name::String
	label::String
	unit::Unitful.Units
end

GenericParameter() = GenericParameter("", "", NoUnits)

function getfield()
	
end