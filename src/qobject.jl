abstract type Qobject end

load_metadata!(q::Qobject, metadata::Dict{String, <:Any}) = merge!(q.metadata, metadata)

snapshot(q::Qobject) = deepcopy(q.metadata)

abstract type AbstractParameter <: Qobject end
abstract type AbstractInstrument <: Qobject end