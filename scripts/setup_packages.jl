using Pkg
project_root = normpath(joinpath(@__DIR__, ".."))
Pkg.activate(project_root)
Pkg.add(["JuMP", "HiGHS"]) 
Pkg.instantiate()
Pkg.precompile()
println("Package setup complete.")
