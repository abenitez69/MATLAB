# Dimensionless Numbers #
## MATLAB Toolbox ##
### by Agustín Benítez Hernández ###

## 1.1 Reynolds number ##

```MATLAB
  Re = reynolds( L, u, rho, mu );
  Re = reynolds( L, u, nu );
  Re = reynolds( 'pipe', D, m, mu );
```
where `rho` is the density of the fluid (kg/m³); `mu` is the dynamic viscosity of the fluid (Pa·s) or `nu` the kinematic viscosity of the fluid (m²/s); `u` is the speed between the fluid and the solid (m/s); and `L` is a characteristic linear dimension (m). The characteristic linear dimension (`L`) can be:

* The hydraulic diameter of pipes (the inside diameter Din if the pipe is circular, or equivalent diameter Deq= 4·Flow_area/Pipe_perimeter for non-circular pipes.

* The hydraulic diameter for annular ducts (such as the outer channel in a tube-in-tube heat exchanger) is: Dannulus=D_in,o-Dout,i ; where Din,o is the inside diameter of the outer pipe and Dout,i is the outside diameter of the inner pipe.

* The distance between the plates for a fluid moving between two plane parallel surfaces (where the width is much greater than the space between the plates).

* Diameter of spherical particles in a fluid or equivalent diameter of non-spherical particles: D_{eq}=1.241\,\sqrt[3]{V_{p}}=1.241\,\sqrt[3]{\frac{m_{p}}{\rho_{p}}}

* Diameter of agitators (turbine or propeller) in cylindrical vessels stirred by a central rotating paddle.
