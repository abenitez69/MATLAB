function y = nusseltexamp1( h )
% Incropera, example 8.5

    D = 0.15;           %m
    W = 0.05;           % kg/s
    mu = 208E-7;        % kg/s·m
    Pr = 0.70;          %
    k = 0.030;          % J/s·m·°C

    if nargin == 0
        h = fzero( mfilename, 0 );
        fprintf( '\t Heat transfer coefficent: h = %5.4f W/m²·°C \n', h )
    else
        Re = reynolds( 'pipe', D, W, mu );
        Nu1 = nusseltcorr( 'dittus-boelter cooling', Re, Pr );
        Nu2 = nusselt( h, k, D );
        y = Nu1 - Nu2;
    end

