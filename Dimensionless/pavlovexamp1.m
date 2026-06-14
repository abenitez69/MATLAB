function y = pavlovexamp1( u )
% Pavlov, example 3-2

    Dp = 0.9E-3;  % m
    rhop = 2650;  % kg/m³
    rho = 1000;   % kg/m³
    mu = 1E-3;    % kg/s·m

    if nargin == 0
        u = fzero( mfilename, 0 );
        fprintf( '\t Sedimentation velocity: u = %5.4f m/s \n', u )
    else
        Ar = archimedes( Dp, rhop, rho, mu );
        Re1 = pavlovcorr( Ar );
        Re2 = reynolds( Dp, u, rho, mu );
        y = Re1 - Re2;
    end

