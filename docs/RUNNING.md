# Running the project

## Software

The source uses MATLAB, Simulink, Control System Toolbox (`ss`, `tf`, `place`, `lqr`, `ctrb`, `obsv`, `minreal`, `lyap`) and Symbolic Math Toolbox (`syms`, `jacobian`, `jordan`, `ilaplace`).

Saved model metadata identifies R2021b for phase 1, R2020a for phase 2, and R2022a for phase 3. Some serialized scope settings mention a later release. Use an installation that can open these files and resolve its compatibility notices. No MATLAB or Octave executable was available during packaging, so no specific release has been runtime-validated here.

Phase 3 contains references to `sim3dlib` and `uavsim3dlib` 3D scene/UAV blocks. Those optional visualization references may require additional MathWorks products/support packages. Inspect the branch's parent subsystem and dependency report before enabling it. The ordinary controller/observer equations are documented separately from that visualization.

## Open one phase at a time

1. Clone the repository and make its root the MATLAB Current Folder.
2. Call `open_phase(1)`, `open_phase(2)`, or `open_phase(3)`.
3. In the Live Editor, run the sections needed to define model parameters, `A_eq`, `B_eq`, output matrices, initial conditions, controller gains, and observer gains.
4. Open the corresponding SLX file from that same folder.
5. Inspect switches, commented branches, trajectory sources, noise settings, limits, and solver configuration. Run the intended scenario and export its outputs if making a new comparison.

`open_phase` opens a file; it does not execute the live script or start a simulation. Live-script execution from the editor is needed to populate the base workspace used by the model. Both later models are called `Main`, so save and close one before switching. Avoid adding both phase folders to the path together.

Phase 1's saved stop time is 1 second; phases 2/3 use 30 seconds. These settings are part of the original models and can be changed deliberately for a new run. `Condition_0` and `Condition_1` are zero/nonzero initial-condition vectors in the scripts.

## Historical code and known issues

- `analysis_export.m` preserves executable MLX code and comments its rich-text headings. It is an inspection/export convenience, not a redesigned pipeline or guaranteed one-command reproduction.
- Phase 1's final decomposition section interprets `ctrbf` output `k` as controllable/observable dimensions. That interpretation and its partitioning are not a complete Kalman decomposition. The scalar-rank-based pole indexing/stabilizability diagnostics in the legacy analysis also need review. Full controllability/observability of the nominal model can be checked directly.
- The phase 1 symbol `J` is reused by the Jordan decomposition. Review workspace-variable names before modifying gyroscopic behavior.
- The measured-output matrix `C` selects four signals; a source comment calling it full-state output is inaccurate.
- The final report and final live script use different reduced-order observer matrices and one different integral weight. See `MODEL.md`.
- The final saved model includes a commented `Kalman Filter` block, a commented `Dynamic Pre-compensator Observer` branch, and commented motor branches. Presence of those blocks is not evidence of a completed active LQG or estimated-state feedback experiment.
- Some trial motor and 3D branches require manual configuration. No automatic switch sequence, raw simulation log set, or scenario export bundle was supplied.

Keep a record of active gains, switches, noise seeds, input limits, solver settings, and parameter set for every new run. Preserve the distinction between nominal integral LQR tracking and any newly enabled observer-feedback branch.
