# Phase 1: Modeling and Analysis

Derive nonlinear translational and rotational equations, linearize at hover, and inspect state-space dynamics, transfer functions, poles, state transitions, controllability, and observability. The Simulink model compares linear and nonlinear behavior for selected inputs and initial conditions.

This phase uses the earlier inertia parameters. Its final decomposition section contains legacy indexing/interpretation issues; use the documented 12-state model and review that section before treating its printed decomposition results as definitive.

| File | Purpose |
| --- | --- |
| [Phase1.mlx](Phase1.mlx) | Supplied MATLAB live script, preserved with saved outputs |
| [Phase1_simulink.slx](Phase1_simulink.slx) | Supplied Simulink model, preserved unchanged |
| [analysis_export.m](analysis_export.m) | Readable extraction of live-script code; headings converted to comments |
| [Report](../../reports/01_modeling_and_analysis.pdf) | Persian project report body |

From the repository root, call `open_phase(1)`, run the relevant live-script sections, then open `Phase1_simulink.slx`. See [running notes](../../docs/RUNNING.md) and [model details](../../docs/MODEL.md).
