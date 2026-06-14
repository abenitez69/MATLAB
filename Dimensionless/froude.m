function Fr = froude( u, d, g )
% Froude number:
%    Fr = FROUDE( u, d )
%         u = Velocity of fluid, m/s
%         d = Hydraulic diameter of pipe, m
%
%    Fr = FROUDE( ..., g )
%         g = Graviational acceleration, m/s²
%         by default:  g = 9.81 m/s²

   if nargin < 3
       g = 9.81;
   end
   Fr = u^2 / (d * g);
