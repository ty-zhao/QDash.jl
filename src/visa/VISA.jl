# Full Wrapper over NIVISA, api and constants
# don't make visa a module since it needs to export all constants and error messages into other instrument modules
if Sys.iswindows()
	const libniscope = "C:/Program Files/IVI Foundation/IVI/Bin/niScope_64"
	const libnidmm   = "C:/Program Files/IVI Foundation/IVI/Bin/nidmm_64"
	const libnifgen  = "C:/Program Files/IVI Foundation/IVI/Bin/niFgen_64"
	const libnihsdio = "C:/Program Files/IVI Foundation/IVI/Bin/niHSDIO_64"
	const libvisa    = "C:/Windows/System32/visa64"
end

include("ctypes.jl")
include("visa_common.jl")
include("visa_errors.jl")
include("visa_api.jl")
include("visa_utils.jl")
include("Ivi_common.jl")