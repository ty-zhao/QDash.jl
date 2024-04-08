module QDash

using Lazy: @forward

export Parameter, Qobject, valuetype

include("qobject/qobject.jl")
include("parameter/parameter.jl")

end