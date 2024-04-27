using QDash
using Test
using Unitful

@testset verbose=true "QDash" begin
    include("parameter.jl")
    include("dataset.jl")
    include("instrument.jl")
end