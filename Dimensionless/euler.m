function Eu = euler( rho, u, p1, p2 )
% Euler number:
%    Eu = EULER( rho, u, dP )
%         rho = Mass density, kg/m³
%         u = Velocity of fluid, m/s
%         dP = Pressure drop, Pa
%
%    Eu = EULER( rho, u, P1, P2 )
%         P1, P2 = Pressure at ends of pipe,
%                  in any order, Pa

   if nargin == 4
       dp = abs( p1 - p2 );
   else
       dp = abs( p1 );
   end
   Eu = dp / (rho * u^2);
