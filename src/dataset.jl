function initialize_dataset(
    settable_pars :: Vector{<:Parameter},
    setpoints     :: Vector,
    gettable_pars :: Vector{<:Parameter},
)
    fields_to_log = ["name", "label", "unit"]
    axlist = Tuple(
        Dim{Symbol("x$i")}(setpoints[i]; metadata=filter_metadata(settable, fields_to_log))
        for (i, settable) in enumerate(settable_pars)
    )
    axshape = Tuple(length(ax) for ax in axlist)

    varnames = Tuple(Symbol("y$i") for i in eachindex(gettable_pars))
    varlist = Tuple(
        YAXArray(axlist, fill(NaN, axshape), filter_metadata(gettable, fields_to_log))
        for (i, gettable) in enumerate(gettable_pars)
    )

    return Dataset(;properties=Dict("tuid"=>gen_tuid()), NamedTuple{varnames}(varlist)...)
end

function gen_tuid(;time::TimeType=now())
    timestring = string(Dates.format(time, "yyyymmdd-HHMMSS-sss"))

    return string(timestring, "-", string(uuid4())[1:6])
end

function filter_metadata(p::AbstractParameter, fields::Vector{String})
    metadata = snapshot(p)

    return Dict(f => metadata[f] for f in fields if haskey(metadata, f))
end
