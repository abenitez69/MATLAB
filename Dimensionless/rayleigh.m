function Ra = rayleigh( Ts, Tinf, L, v, alpha, beta, g )
% Rayleigh number:
%    Ra = RAYLEIGH( Ts, Tinf, L, nu, alpha )
%         Ts = Surface temperature, °C
%         Tinf = Room temperature, °C
%         L = Characteristic length, m
%             Height of vertical plate
%             Outside diameter of horizontal cylinder
%         nu = Kinematic viscosity, m²/s
%         alpha = Thermal diffusivity, m²/s
%
%    Ra = RAYLEIGH( Ts, Tinf, L, [mu rho], alpha )
%         mu = Viscosity, kg/s·m
%         rho = Mass density, kg/m³
%
%    Ra = RAYLEIGH( ..., beta )
%         beta = Volumetric thermal expansion coeff., 1/K
%         by default:  beta = 1/Tmean
%
%    Ra = RAYLEIGH( ..., g )
%         g = Graviational acceleration, m/s²
%         by default:  g = 9.81 m/s²

   if length( v ) == 2
       v = v(1)/v(2);
   end
   if nargin < 6
       Tf = (Ts + Tinf)/2 + 273;
       beta = 1/Tf;
   end
   if nargin < 7
       g = 9.81;
   end
   Ra = (g * beta * (Ts - Tinf) * L^3) / (alpha * v);
