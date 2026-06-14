function Sc = schmidt( Dab, v )
% Schmidt number:
%    Sc = SCHMIDT( Dab, nu )
%         Dab = Diffusivity of A in solvent B, m²/s
%         nu = Kinematic viscosity, m²/s
%
%    Sc = SCHMIDT( Dab, [mu rho] )
%         mu = Viscosity, kg/s·m
%         rho = Mass density, kg/m³


   if length( v ) == 2
       v = v(1)/v(2);
   end
   Sc = v/Dab;

