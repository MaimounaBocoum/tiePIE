function [t,P] = get_pressure(Ipd,Fe,fmod)
% Fe : sampling frequency in Hz
Zwater = 1.49e6 ; % accoustic impedance of water SI unit
% remove DC componant
%Ipd = Ipd - 0*mean(Ipd(1:10)) ;
n0 = 1.33 ;
lambda= 633e-9 ;

%fmod = 70e6 ;     % modulation AO
N = length(Ipd)-1 ;
t = (0:N)*(1/Fe);
% for x = hilbert(xr), we return : x = xr + i*xi
Ih = hilbert(Ipd).*exp(2i*pi*fmod*t); % generate complex signal from real signal

% unwrap phase and remove AO mulated componant
%P = unwrap( angle( Ipd ) ) ;
%P = Ipd + 1i*real(Ih)  ;

P = unwrap(angle(Ih)) ;
X = P/((2*pi/lambda)*2*n0) ;

P = [0 , diff(X*Fe)]*Zwater ;

P = P - mean(P(10:100)) ;


%% fourier filter
% Ifourier = fft(Ipd.*cos(2*pi*fmod*t))  ;
% Ifourier(1000:4000) = 0;
% P = ifft(Ifourier);
% P = acos(P) ;
% %Ifourier( f > )
% 
% plot(abs(Ifourier))



















end