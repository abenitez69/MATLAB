function Nu = nusseltcorr( x1, x2, x3, x4, x5 )
% Nusselt number convection correlations:
%   TURBULET FLOW:
%
%      Nu = NUSSELTCORR( 'Colburn', Re, Pr )
%         Colburn equation for circular tubes
%
%      Nu = NUSSELTCORR( 'Dittus-Boelter heating', Re, Pr )
%         Dittus-Boelter equation for heaing in circular tubes
%
%      Nu = NUSSELTCORR( 'Dittus-Boelter cooling', Re, Pr )
%         Dittus-Boelter equation for cooling in circular tubes
%
%      Nu = NUSSELTCORR( 'Sieder-Tate', Re, Pr, mu/mu_s )
%         Sieder-Tate equations for circular tubes
%         mu_s = Viscosity at surface temperature
%
%      Nu = NUSSELTCORR( 'Petukhov', Re, Pr, f )
%         Petukhov equation for circular tubes
%         f = Darcy friction factor
%
%      Nu = NUSSELTCORR( 'Gnielinski', Re, Pr, f )
%         Gnielinski equation for circular tubes
%         f = Darcy friction factor
%
%      Nu = NUSSELTCORR( 'Pavlov', Re, Pr, Pr_s, L/D )
%         Pavlov equation for tubes
%         Pr_s = Prandtl number at surface temperature
%         L/D = Length/diameter ratio
%
%   FREE CONVECTION:
%
%      Nu = NUSSELTCORR( 'Morgan', Ra )
%         Morgan equation for long horizontal cylinders
%
%      Nu = NUSSELTCORR( 'Churchill-Chu', Ra, Pr )
%         Churchill-Chu equation for long horizontal cylinders
%
%      Nu = NUSSELTCORR( 'Churchill-Chu vertical', Ra, Pr )
%         Churchill-Chu equation for vertical plates and cylinders
%
%      Nu = NUSSELTCORR( 'Churchill-Chu laminar', Ra, Pr )
%         Churchill-Chu equation for vertical plates and cylinders
%         and laminar flow
%
%      Nu = NUSSELTCORR( 'upper hot', Ra )
%         Horizontal and inclined plates: upper surface of hot plate
%
%      Nu = NUSSELTCORR( 'upper cold', Ra )
%         Horizontal and inclined plates: upper surface of cold plate
%
%      Nu = NUSSELTCORR( 'lower hot', Ra )
%         Horizontal and inclined plates: lower surface of hot plate
%
%      Nu = NUSSELTCORR( 'lower cold', Ra )
%         Horizontal and inclined plates: lower surface of cold plate


   Ra = x2;
   Re = x2;
   if nargin >= 3
       Pr = x3;
   end
   if nargin >= 4
       mu_r = x4;
       f = x4;
       Prw = x4;
   end
   if nargin >= 5
       dl_r = x5;
   end

   switch lower( x1 )
      case {'colburn', 'turbulent horizontal pipe'}                %Incropera, Ec 8.59
         Nu = 0.023*Re^(4/5)*Pr^(1/3);
      case {'dittus-boelter heating', 'dittus-boelter'}            %Incropera, Ec 8.60
         Nu = 0.023*Re^(4/5)*Pr^0.4;
         if Pr < 0.7 | Pr > 160 | Re < 10000, error( 'Re or Pr out of range' ), end
      case 'dittus-boelter cooling'                                %Incropera, Ec 8.60
         Nu = 0.023*Re^(4/5)*Pr^0.3;
         if Pr < 0.7 | Pr > 160 | Re < 10000, error( 'Re or Pr out of range' ), end
      case 'sieder-tate'                                           %Incropera, Ec 8.61
         Nu = 0.027*Re^(4/5)*Pr^(1/3)*mu_r^0.14;
         if Pr < 0.7 | Pr > 16700 | Re < 10000, error( 'Re or Pr out of range' ), end
      case 'petukhov'                                              %Incropera, Ec 8.62
         Nu = (f/8)*Re*Pr / (1.07 + 12.7*(f/8)^(1/2)*(Pr^(2/3)-1));
      case 'gnielinski'                                             %Incropera, Ec 8.63
         Nu = (f/8)*(Re-1000)*Pr / (1 + 12.7*(f/8)^(1/2)*(Pr^(2/3)-1));
      case 'pavlov'                                                 %Pavlov, Ec 4-16
         [Re_l, dl_l] = meshgrid( [1E4 2E4 5E4 1E5 1E6], [10 20 30 40 50 100] );
         e_l  = [1.23 1.13 1.07 1.03 1 1; 1.18 1.1 1.05 1.02 1 1; 1.13 1.08 1.04 1.02 1 1; 1.1 1.06 1.03 1.02 1 1; 1.05 1.03 1.02 1.01 1 1];
         if dl_r > 100, dl_r = 100; end
         e = interp2( Re_l, dl_l, e_l', Re, dl_r);
         Nu = 0.021*e*Re^0.8*Pr^0.43*(Pr/Prw)^0.25;
         if Re < 1E4 | Re > 1E6 | dl_r < 10, error( 'Re or L/D out of range' ), end


      case {'churchill-chu', 'free horizontal pipe'}                 %Incropera, Ec 9.34
         Nu = ( 0.6 + ( 0.387*Ra^(1/6) ) / ( (1 + (0.559/Pr)^(9/16))^(8/27) ))^2 ;
      case 'morgan'                                                  %Incropera, Ec 9.33
         if     Ra >= 1E-10 & Ra < 1E-2, C = 0.675; n = 0.058;
         elseif Ra >= 1E-2  & Ra < 1E2,  C = 1.020; n = 0.148;
         elseif Ra >= 1E2   & Ra < 1E4,  C = 0.850; n = 0.188;
         elseif Ra >= 1E4   & Ra < 1E7,  C = 0.480; n = 0.250;
         elseif Ra >= 1E7   & Ra < 1E12, C = 0.125; n = 0.333;
         else, error( 'Ra out of range' ), end
         Nu = C*Ra^n ;
      case 'churchill-chu vertical'                                  %Incropera, Ec 9.26
         Nu = ( 0.825 + ( 0.387*Ra^(1/6) ) / ( (1 + (0.492/Pr)^(9/16))^(8/27) ))^2 ;
      case 'churchill-chu laminar'                                   %Incropera, Ec 9.27
         Nu = 0.68 + ( 0.670*Ra^(1/4) ) / ( (1 + (0.492/Pr)^(9/16))^(4/9) ) ;
         if Ra > 1E9, error( 'Ra out of range' ), end
      case {'upper hot', 'lower cold'}                               %Incropera, Ec 9.30 & 9.31
         if     Ra >= 1E4 & Ra < 1E7,  Nu = 0.54*Ra^(1/4);
         elseif Ra >= 1E7 & Ra < 1E11, Nu = 0.15*Ra^(1/3);
         else, error( 'Ra out of range' ), end
      case {'lower hot', 'upper cold'}                               %Incropera, Ec 9.32
         Nu = 0.52*Ra^(1/5);
         if Ra < 1E4 | Ra > 1E9, error( 'Ra out of range' ), end


   end
