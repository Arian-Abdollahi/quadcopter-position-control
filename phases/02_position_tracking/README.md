# Phase 2: Position Tracking

Develop pole-placement state feedback, compare LQR tuning, and build static and integral precompensators for position/yaw references. The Simulink model includes trajectory generation and linear/nonlinear paths.

This phase updates the inertia parameters and contains several gain variants. Identify which controller and trajectory switches are active before comparing results.

| File | Purpose |
| --- | --- |
| [Main.mlx](Main.mlx) | Supplied MATLAB live script, preserved with saved outputs |
| [Main.slx](Main.slx) | Supplied Simulink model, preserved unchanged |
| [analysis_export.m](analysis_export.m) | Readable extraction of live-script code; headings converted to comments |
| [Report](../../reports/02_position_tracking.pdf) | Persian project report body |

From the repository root, call `open_phase(2)`, run the relevant live-script sections, then open `Main.slx`. See [running notes](../../docs/RUNNING.md) and [model details](../../docs/MODEL.md).
