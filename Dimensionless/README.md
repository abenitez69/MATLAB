# Dimensionless Numbers #
## MATLAB Toolbox ##
### by Agustín Benítez Hernández ###

## 1.1 Reynolds number ##

```MATLAB
  Re = reynolds( L, u, rho, mu );
  Re = reynolds( L, u, nu );
  Re = reynolds( 'pipe', D, m, mu );
```
where `rho` is the density of the fluid (kg/m3); `mu` is the dynamic viscosity of the fluid (Pa·s) or \nu is the kinematic viscosity of the fluid (m2/s); u is the speed between the fluid and the solid (m/s); and L is a characteristic linear dimension (m). The characteristic linear dimension (L) can be:
