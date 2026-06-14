function Ar = archimedes( Dp, rhop, rho, mu, g )
% Archimedes number:
%    Ar = ARCHIMEDES( Dp, rhop, rho, mu )
%         Dp = Diameter of particle, m
%         rhop = Mass density of particle, kg/m³
%         rho = Mass density, kg/m³
%         mu =  Viscosity, kg/s·m
%
%    Ar = ARCHIMEDES( ..., g )
%         g = Graviational acceleration, m/s²
%         by default:  g = 9.81 m/s²

   if nargin < 5
       g = 9.81;
   end
   Ar = Dp^3 * (rhop - rho) * rho * g / (mu^2);
