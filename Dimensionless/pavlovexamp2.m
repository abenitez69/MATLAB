function y = pavlovexamp2( Dp )
% Pavlov, example 3-3

    u = 0.5;      % m/s
    rhop = 2710;  % kg/m³
    rho = 1000;   % kg/m³
    mu = 1.3E-3;  % kg/s·m

    if nargin == 0
        Dp = fzero( mfilename, 0 );
        fprintf( '\t Diameter of particle: Dp = %5.4f m \n', Dp )
    else
        Ly = lyashenko( u, rhop, rho, mu );
        Re1 = pavlovcorr( 'Re_Ly', Ly );
        Re2 = reynolds( Dp, u, rho, mu );
        y = Re1 - Re2;
    end

