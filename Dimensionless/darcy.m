function f = darcy( Re, e )
% Darcy friction factor:
%    f = DARCY( Re, E )
%         Re = Reynolds number
%         E = Relative roughness
%
%    f = DARCY( Re, [D e] )
%         D = Inside diameter of pipe, m
%         e = Absolute roughness, m


   if length( e ) == 2
       e = e(2)/e(1);
   end
   if Re < 2100
       f = 64/Re;
   else
       f = (1 / (-2 * log10( e/3.7 + (6.81/Re)^0.9 )))^2;
   end

