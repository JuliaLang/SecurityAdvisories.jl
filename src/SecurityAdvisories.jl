module SecurityAdvisories

include("VersionStrings.jl")
using .VersionStrings: VersionString

include("common.jl")
include("CVSS.jl")
include("advisory.jl")
include("diff.jl")
include("rejected.jl")
include("protect_identifiers.jl")
include("GitHub.jl")
include("NVD.jl")
include("EUVD.jl")

export CVSS, GitHub, NVD, EUVD

end
