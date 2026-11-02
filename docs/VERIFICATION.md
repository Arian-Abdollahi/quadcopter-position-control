# Verification

Checked on 2026-11-02.

## Algebraic checks

The supplied nonlinear equations were independently reconstructed in Python/NumPy using both inertia sets. Complex-step derivatives at hover were compared with the documented linear state-space matrices. These checks do not execute the MATLAB or Simulink files.

| Configuration | Equilibrium residual at hover | Controllability rank | Observability rank |
| --- | --- | --- | --- |
| Phase 1 inertia set | 0 | 12 / 12 | 12 / 12 |
| Phases 2 and 3 inertia set | 0 | 12 / 12 | 12 / 12 |

- Confirmed the documented 12-by-12 hover `A` and 12-by-4 `B` structure from derivatives of the nonlinear equations.
- Confirmed `A^4=0` with nontrivial integrator chains; zero open-loop poles do not establish stability.
- Confirmed 16-by-16 / 16-by-4 integral augmentation and controllability rank 16.
- Solved the nominal phase 3 augmented LQR algebraic Riccati equation with SciPy using the weights in the saved live script. Maximum closed-loop pole real part: **-1.817491**. Relative Riccati residual: **2.433e-14**.

## File and presentation checks

- Preserved all six supplied MLX/SLX files byte-for-byte; recorded source SHA-256 hashes.
- Validated ZIP integrity and parsed 119 embedded XML documents.
- Confirmed all 46 executable code paragraphs appear unchanged in the readable MATLAB exports.
- Checked local Markdown/image/report links, phase-folder separation, and the new phase-opening helper for accidental multiline character literals.
- Scanned published text and embedded XML for credential patterns and excluded framing labels; no matches were found.
- Checked the three reports contain 45, 26, and 65 pages after cover omission. Checked removal of the targeted framing words and student identifiers.
- Rendered and inspected every changed report page and each published first page; inspected the extracted tracking and observer figures.

## Not run

MATLAB and Octave were unavailable. No full MATLAB syntax/runtime check, Simulink simulation, 3D visualization, physical flight test, raw-log benchmark, or hardware deployment was performed. Nominal matrix checks do not validate nonlinear tracking, saturation behavior, observer robustness, or the exact reproduction of historical figures.
