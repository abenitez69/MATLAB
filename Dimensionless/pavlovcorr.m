function y = pavlovcorr( x1, x2 )
% Reynolds correlations for spherical particles:
%    Re = PAVLOVCORR( Ar )  or  Re = PAVLOVCORR( 'Re_Ar', Ar )
%         Ar = Archimedes number
%
%    Re = PAVLOVCORR( 'Re_Ly', Ly )
%         Ly = Lyashenko number
%
% Lyashenko correlations for spherical particles:
%    Ly = PAVLOVCORR( 'Ly_Re', Re )
%         Re = Reynolds number
%
%    Ly = PAVLOVCORR( 'Ly_Ar', Ar )
%         Ar = Archimedes number
%
% Archimedes correlations for spherical particles:
%    Ar = PAVLOVCORR( 'Ar_Re', Re )
%         Re = Reynolds number
%
%    Ar = PAVLOVCORR( 'Ar_Ly', Ly )
%         Ly = Lyashenko number


   % Pavlov correlations, Fig 3-1, Pag 111
   Ar_l = [2E0    2E1   2E2   2E3   2E4    2E5    2E6   1E7];
   Re_l = [1E-1   9E-1  7E0   4E1   2E2    7E2    3E3   6E3];
   Ly_l = [7E-4   6E-2  2E0   4E1   3E2    2E3    9E3   2.5E4];

   if nargin == 1
      x2 = x1;
      x1 = 're_ar';
   end
   switch lower( x1 )
      case {'re_ar', 'rear'}
         y = interp1( Ar_l, Re_l, x2, 'linear' );
      case {'re_ly', 'rely'}
         y = interp1( Ly_l, Re_l, x2, 'linear' );
      case {'ly_re', 'lyre'}
         y = interp1( Re_l, Ly_l, x2, 'linear' );
      case {'ly_ar', 'lyar'}
         y = interp1( Ar_l, Ly_l, x2, 'linear' );
      case {'ar_re', 'arre'}
         y = interp1( Re_l, Ar_l, x2, 'linear' );
      case {'ar_ly', 'arly'}
         y = interp1( Ly_l, Ar_l, x2, 'linear' );
   end
