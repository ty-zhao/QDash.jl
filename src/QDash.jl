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

    export Instrument, modelof, addparameter!

    include("instrument.jl")
end

# using .Instruments
include("visa/VISA.jl")
include("drivers/drivers.jl")

end