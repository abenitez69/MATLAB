function y = nusseltexamp2( h )
% Incropera, example 9.4

    Ts = 165;           % °C
    Tinf = 23;          % °C
    D = 0.1;            % m
    nu = 22.8E-6;       % m²/s
    alpha = 32.8E-6;    % m²/s
    Pr = 0.697;         %
    k = 0.0313;         % J/s·m·°C

    if nargin == 0
        h = fzero( mfilename, 0 );
        q = h * pi * D * (Ts - Tinf);
        fprintf( '\t Heat loss: q = %5.4f W/m \n', q )
    else
        Ra = rayleigh( Ts, Tinf, D, nu, alpha );
        Nu1 = nusseltcorr( 'churchill-chu', Ra, Pr );
        Nu2 = nusselt( h, k, D );
        y = Nu1 - Nu2;
    end

