function Nu = nusselt( h, k, L )
% Nusselt number:
%    Nu = NUSSELT( h, k, L )
%         h = Convection heat transfer coeff., J/s·m²·°C
%         k = Thermal conductivity, J/s·m·°C
%         L = Characteristic length, m
%             Height of vertical plate
%             Outside diameter of horizontal cylinder

   Nu = (h * L) / k;
