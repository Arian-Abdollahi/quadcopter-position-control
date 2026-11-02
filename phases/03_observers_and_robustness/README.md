# Phase 3: Observers and Robustness Experiments

Extend the design with a 12-state full-order observer and an eight-state reduced-order observer. The model includes MAE calculation, measurement-noise sources, actuator limits and motor-lag experiments, plus optional visualization and disabled trial branches.

The final report discusses nominal, noisy, and 20% state-matrix mismatch scenarios. Its reduced-order observer matrices and one integral LQR weight differ from the saved live script. The Kalman-filter and estimated-state feedback trial branches are commented out in the saved model; they are not claimed as completed features.

| File | Purpose |
| --- | --- |
| [Main.mlx](Main.mlx) | Supplied MATLAB live script, preserved with saved outputs |
| [Main.slx](Main.slx) | Supplied Simulink model, preserved unchanged |
| [analysis_export.m](analysis_export.m) | Readable extraction of live-script code; headings converted to comments |
| [Report](../../reports/03_observers_and_robustness.pdf) | Persian project report body |

From the repository root, call `open_phase(3)`, run the relevant live-script sections, then open `Main.slx`. See [running notes](../../docs/RUNNING.md) and [model details](../../docs/MODEL.md).
