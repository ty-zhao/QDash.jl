abstract type Qobject end

abstract type AbstractParameter <: Qobject end
abstract type AbstractInstrument <: Qobject end

mutable struct Parameter{T} <: AbstractParameter
    name     :: String
    label    :: String
    value    :: T
    unit     :: Union{Unitful.Units, Unitful.MixedUnits}
    instrument :: Union{AbstractInstrument, Nothing}
    get      :: Union{Nothing, String, Function}
    set      :: Union{Nothing, String, Function}
    ts       :: String
    metadata :: Dict{String, <:Any}
end

mutable struct Instrument{model} <: AbstractInstrument
    name     :: String
    address  :: String
    label    :: String
    ts       :: String
    handle   :: Any
    initialized :: Bool
    bufSize  :: UInt32
    metadata :: Dict{String, <:Any}
    parameters :: Dict{Symbol, <:AbstractParameter}
end
