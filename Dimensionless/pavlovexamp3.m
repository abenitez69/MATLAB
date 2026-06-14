function y = pavlovexamp3( Dp )
% Pavlov, example 3-5(2)

    u = 0.1;      % m/s
    rhop = 2200;  % kg/m³
    rho = 1000;   % kg/m³
    mu = 1E-3;    % kg/s·m

    if nargin == 0
        Dp = fzero( mfilename, 1 );
        fprintf( '\t Diameter of particle: Dp = %6.4E m \n', Dp )
    else
        Ly = lyashenko( u, rhop, rho, mu );
        Ar1 = pavlovcorr( 'Ar_Ly', Ly );
        Ar2 = archimedes( Dp, rhop, rho, mu );
        y = Ar1 - Ar2;
    end

