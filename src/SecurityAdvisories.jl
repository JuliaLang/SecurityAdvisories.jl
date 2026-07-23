module SecurityAdvisories

include("VersionStrings.jl")
using .VersionStrings: VersionString

include("common.jl")
include("advisory.jl")
include("protect_identifiers.jl")
include("GitHub.jl")
include("NVD.jl")
include("EUVD.jl")

export GitHub, NVD, EUVD

end
