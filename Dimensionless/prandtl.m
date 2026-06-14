function Pr = prandtl( x1, x2, x3 )
% Prandtl number:
%    Pr = PRANDTL( Cp, mu, k )
%         Cp = Specific heat, J/kg·°C
%         mu = Viscosity, kg/s·m
%         k = Thermal conductivity, J/s·m·°C
%
%    Pr = PRANDTL( alpha, nu )
%         alpha = Thermal diffusivity, m²/s
%         nu = Kinematic viscosity, m²/s
%
%    Pr = PRANDTL( 'name', T )
%         'name' = Name of substance
%         T = Temperature, °C

   if strcmp( 'char', class( x1 ))

   else
       if nargin == 3
            Cp = x1;
            mu = x2;
            k = x3;
            Pr = Cp * mu / k;
       else
            v = x1;
            alpha = x2;
            Pr = v/alpha;
       end
   end



