%% simaulation of input pressure field 
clearvars 

fmod = 70e6 ;      % modulation AO

f0 = 3e5 ;        % porteuse accoustic
fs = 500e6 ;      % sampling frequency
Zwater = 1.49e6 ; % accoustic impedance of water SI unit
lambda = 633e-9 ; % laser He-Ne wavelength
n0 = 1.33 ;       % optical index of water

t = 0:(1/fs):(50e-6);

% pressure in Pa
P = (10e6)*exp(-(t-20e-6).^2/(5e-6)^2).*cos(2*pi*f0*t) ;
U = P/Zwater ; % m/s
X = cumsum(U*(1/fs)); % m
Phase = (2*pi/lambda)*2*n0*X;
% signal on the PD
%2*pi*fmod*t + Phase
Ipd = cos(2*pi*fmod*t  + Phase );

% signal deconvomution
[~,p] = get_pressure(Ipd,fs,fmod);
% [u,v] = func_demod(fs,Ipd',1) ;
% 
 clf;figure(100)
 plot(t*1e6,P)
 hold on
% % [B,A]=butter(4,0.5);
% % u =filtfilt(B,A,double(u));
% %plot(t*1e6,[0,Zwater*diff(u*fs*1e-9)],'color','red')
 plot(t*1e6,p,'color','green')


