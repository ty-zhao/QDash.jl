function initialize_dataset(
    settable_pars :: Vector{<:Parameter},
    setpoints     :: Vector,
    gettable_pars :: Vector{<:Parameter},
)
axlist = Tuple(
    Dim{Symbol("x$i")}(setpoints[i], metadata=delete!(snapshot(settable), "ts"))
    for (i, settable) in enumerate(settable_pars)
)
axshape = Tuple(length(ax) for ax in axlist)

varnames = Tuple(Symbol("y$i") for i in eachindex(gettable_pars))
varlist = Tuple(
    YAXArray(axlist, fill(NaN, axshape), delete!(snapshot(gettable), "ts"))
    for (i, gettable) in enumerate(gettable_pars)
)

return Dataset(;properties=Dict("name"=>"dataset"), NamedTuple{varnames}(varlist)...)
end