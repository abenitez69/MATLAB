function Ly = lyashenko( u, rhop, rho, mu, g )
% Lyashenko number:
%    Ly = LYASHENKO( u, rhop, rho, mu )
%         u = Sedimentation velocity, m/s
%         rhop = Mass density of particle, kg/m³
%         rho = Mass density, kg/m³
%         mu =  Viscosity, kg/s·m
%
%    Ly = LYASHENKO( ..., g )
%         g = Graviational acceleration, m/s²
%         by default:  g = 9.81 m/s²

   if nargin < 5
       g = 9.81;
   end
   Ly = u^3 * rho^2 / (mu * (rhop - rho) * g);
