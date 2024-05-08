load_metadata!(q::Qobject, metadata::Dict{String, <:Any}) = merge!(q.metadata, metadata)

snapshot(q::Qobject) = deepcopy(q.metadata)
