# Model and controller details

## Coordinates and inputs

State order is `[x, x_dot, y, y_dot, z, z_dot, phi, theta, psi, p, q, r]`. Positions are in meters; angles are in radians in the symbolic model; body angular rates are in radians/second. `U1` is thrust in newtons and `U2..U4` are torques in newton-meters. Some original plots have limited unit labeling, so verify each signal before using its scale quantitatively.

The nonlinear model contains thrust projection through Euler angles, rigid-body rotational coupling, and body-rate/Euler-rate kinematics. The hover equilibrium is zero velocity/attitude/rates and `U = [m*g, 0, 0, 0]`. The nonlinear plant therefore needs the thrust bias; the linear plant uses input deviations about hover.

## Parameter sets

| Parameter | Phase 1 | Phases 2 and 3 |
| --- | --- | --- |
| Mass `m` | 1 kg | 1 kg |
| Gravity `g` | 9.81 m/s² | 9.81 m/s² |
| `Ixx = Iyy` | 0.0035 kg m² | 0.0085532 kg m² |
| `Izz` | 0.005 kg m² | 0.01476 kg m² |
| Rotor-speed difference `Omega` | 0 | 0 |

Phase 1 declares a gyroscopic constant `J=0.0001`; its gyroscopic contribution vanishes for the saved `Omega=0`. The same variable name is later reused for the Jordan matrix, which should be reviewed if changing that model. Later phases also declare thrust/drag coefficients and arm length; the main symbolic controller inputs remain aggregate thrust and torques rather than individual motor speeds.

## Hover state-space structure

For MATLAB's one-based indices, the nonzero entries of `A` are:

```matlab
A(1,2)=1; A(3,4)=1; A(5,6)=1;
A(2,8)=g; A(4,7)=-g;
A(7,10)=1; A(8,11)=1; A(9,12)=1;
```

The nonzero entries of `B` are `B(6,1)=1/m`, `B(10,2)=1/Ixx`, `B(11,3)=1/Iyy`, and `B(12,4)=1/Izz`. `C` selects states `[1,3,5,9]`, namely position and yaw. It is a four-output measurement matrix, despite a full-state comment in the supplied scripts. `C_simulink=eye(12)` is a separate diagnostic output matrix.

All open-loop eigenvalues are zero, with nontrivial integrator chains. This does not imply asymptotic or BIBO stability. The nominal pair is fully controllable and observable with the specified measurements.

## Tracking designs

- Pole placement uses `Kfeedback = place(A_eq,B_eq,Poles)` and `A_feedback = A_eq-B_eq*Kfeedback`.
- State LQR uses `lqr(A_eq,B_eq,Q1,R1)`.
- Static precompensation uses a pseudoinverse of the selected closed-loop DC response.
- Integral tracking augments the model with four error integrators:

```matlab
Ai = [A_eq, zeros(12,4); -C, zeros(4,4)];
Bi = [B_eq; zeros(4,4)];
```

For phase 3, the saved integral weights are `Q=diag([10 1 10 1 40 3 10 10 1 1 1 1 500 3000 3000 400])` and `R=diag([1 5 1 1])`. The report instead prints 3500 for the second integral weight. Treat the live script and report as distinct saved configurations.

## Observer designs

The full-order gain is obtained by dual pole placement with target poles between -20 and -22. The reduced-order design has eight dynamic states because four measurements are directly available. It uses an upper-triangular `F`, a chosen `L_RO`, a Sylvester equation through `lyap`, and reconstruction from the stacked matrix `[C; T_O]`.

The active `F` and `L_RO` values in the final live script differ from the values printed in the report. Check reconstruction conditioning, injection gains, and base-workspace values before reproducing an observer comparison.
