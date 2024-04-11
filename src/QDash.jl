module QDash

using Lazy: @forward

export Parameter, Qobject, valuetype

include("qobject.jl")
include("parameter.jl")

end