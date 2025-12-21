# AI Coding Agent Instructions for BEE-4750-Final-Project

## Project Overview
This is a Julia-based optimization project modeling waste heat reuse from data centers to greenhouses. The goal is to minimize water evaporation in cooling towers by reusing excess heat for greenhouse heating.

## Architecture
- **Core Model**: Single JuMP optimization model in `Model.ipynb` minimizing water use subject to heat balance and demand constraints.
- **Data Generation**: Random synthetic data for data center heat output and outdoor temperatures using Distributions.jl.
- **Solver**: HiGHS open-source linear programming solver.
- **Key Components**:
  - Heat demand calculation function `monthly_heating_demand_MWh` based on greenhouse thermal properties.
  - Decision variables: `x_reuse` (heat reused) and `x_reject` (heat rejected).

## Developer Workflows
- **Environment Setup**: Run `Pkg.activate(".")` then `Pkg.instantiate()` to set up dependencies from `Project.toml`.
- **Package Management**: Use `Pkg.add()` for new dependencies; update `Project.toml` manually or via REPL.
- **Execution**: Run notebook cells sequentially; first cell handles package setup and precompilation.
- **Debugging**: Use `println()` for variable inspection; JuMP provides `value()` for optimized variables.

## Conventions and Patterns
- **Julia Style**: Use descriptive variable names (e.g., `Q_data` for heat data, `D_th` for thermal demand).
- **JuMP Syntax**: Define models with `Model(Solver)`, variables with `@variable(model, name[indices] >= 0)`, objectives with `@objective(model, Min/Max, expression)`, constraints with `@constraint(model, [indices], expression)`.
- **Data Structures**: Use arrays for time-series data (e.g., `Q_data` as Vector); functions return Vectors for daily values.
- **Randomness**: Set seeds with `Random.seed!(42)` for reproducible results.
- **Output Formatting**: Use `rpad()` and `println()` for tabular results display.

## Dependencies and Integration
- **Core Packages**: JuMP (modeling), HiGHS (solver), Distributions (random data).
- **Version Constraints**: Specified in `Project.toml` for compatibility.
- **External Calls**: No APIs or databases; self-contained optimization runs.

## Key Files
- `Model.ipynb`: Main implementation with setup, data, model definition, and results.
- `Project.toml`: Dependency declarations.
- `scripts/setup_packages.jl`: (Currently empty) Intended for automated package setup.

## Best Practices
- Always activate the project environment before running code.
- Precompile packages after installation for performance.
- Use HiGHS.Optimizer for linear problems; switch solvers if needed via `Model(NewSolver)`.
- Validate model feasibility by checking constraint satisfaction post-optimization.