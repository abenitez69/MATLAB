function moodyplot
% Moody (Darcy) friction factor

Re = [ 2E2:1E2:1E3  1E3:1E3:1E4  1E4:1E4:1E5  1E5:1E5:1E6 ...
       1E6:1E6:1E7  1E7:1E7:1E8  1E8:1E8:1E9  1E9:1E9:1E10 ];

e = [ 0.05 0.04 0.03 0.02 0.015 0.01 0.008 0.006 0.004 0.002 ...
      0.001 0.0008 0.0006 0.0004 0.0002 0.0001 0.00005 0.00001];

for j=1:length(e);
   for i=1:length(Re);
      f(j, i) = darcy( Re(i), e(j) );
   end
end

h = loglog(Re, f);

title( 'Moody plot' )
set( gcf, 'Name', 'Moody plot' )
xlabel( 'Reynolds number, Re_D' )
ylabel( 'Friction factor, f' )
set(gcf, 'NumberTitle', 'off')


grid;
set( gca, 'YLim', [0.008 0.2] )
set( gca, 'GridLineStyle', '-' )
for j=1:length(h);
   set(h(j), 'LineWidth', 2)
   set(h(j), 'Color', 'k')
   y=get(h(j),'YData');
   text( 1.2E9, y(end) + y(end)*0.05, ['\epsilon = ' num2str( e(j)) ] )
end

