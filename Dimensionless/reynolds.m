function Re = reynolds( x1, x2, x3, x4 )
% Reynolds number:
%    Re = REYNOLDS( L, u, rho, mu )
%         L = Characteristic length, m
%             Height of vertical plate
%             Inside diameter of pipe
%             Outside diameter of particle
%             Diameter of agitators
%         u = Velocity of fluid or particle, m/s
%         rho = Mass density, kg/m³
%         mu = Viscosity, kg/s·m
%
%    Re = REYNOLDS( L, u, nu )
%         nu = Kinematic viscosity, m²/s
%
%    Re = REYNOLDS( 'pipe', D, W, mu )
%         Reynolds number in circular pipes
%         D = Inside diameter of pipe, m
%         W = Mass flow, kg/s
%         mu =  Viscosity, kg/s·m

   if strcmp( 'char', class( x1 ))

       D = x2;
       m = x3;
       mu = x4;
       Re = 4 * m / (pi * D * mu);

   else

       D = x1;
       u = x2;
       nu = x3;
       if nargin == 4
          nu = x4/x3;
       end
       Re = D * u / nu;

   end
