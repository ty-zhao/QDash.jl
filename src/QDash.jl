module QDash

using Dates
using DimensionalData: Dimension
using Lazy: @forward
using Reexport
using Unitful
using UUIDs
using YAXArrays

export Parameter, valuetype, initialize_dataset

include("qobject.jl")
include("parameter.jl")
include("dataset.jl")

@reexport module Instruments
    using Dates: now
    using ..QDash: Qobject, Parameter, AbstractParameter

    export Instrument, modelof, addparameter!,
           query

    abstract type AbstractInstrument <: Qobject end

    include("visa/VISA.jl")
    include("instrument.jl")
end

module Drivers
    using ..Instruments
    using ..QDash: Parameter
    using Unitful

    include("drivers/drivers.jl")
end
end
