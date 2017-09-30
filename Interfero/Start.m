

%% Variables :

% Moteur
% --- 1ere mise en place à la main : pos 0 (reset pos) à la main ---
MotV = [10 25 25];       % vitesses moteurs [mm/s]
MotAcc = [100 100 20];  % accelerations moteurs [mm/s^2]
MotDecc = [100 100 20]; % decelerations moteurs [mm/s^2]

Tir_machine = 1;        % utilisé dans acq_pression

Fc = 50;                    % ATTENTION : freq de coupure [MHz]
% [B,A]=butter(4,Fc/100);     % filtre bruit; 100MHz : Freq de Nyquist (Fs/2)
% Nmoy=20;

% Axes scan 1D,2D,3D
if (str2num(get(x3,'string'))==0)
    Axe1 = [str2num(get(x1,'string'))];
else
    Axe1 = [str2num(get(x1,'string')):str2num(get(x3,'string')):str2num(get(x2,'string'))];    % [mm]
end;

if (str2num(get(y3,'string'))==0)
    Axe2 = [str2num(get(y1,'string'))];
else
    Axe2 = [str2num(get(y1,'string')):str2num(get(y3,'string')):str2num(get(y2,'string'))];    % [mm]
end;

if (str2num(get(z3,'string'))==0)
    Axe3 = [str2num(get(z1,'string'))];
else
    Axe3 = [str2num(get(z1,'string')):str2num(get(z3,'string')):str2num(get(z2,'string'))];    % [mm]
end;

Axes = {Axe1; Axe2; Axe3};

% Ordre des dimensions spatiales pour Datas3D
% --- le dernier est le plus imbriqué : ---
% --- Nos_axes(3) bouge en premier, Nos_axes(1) en dernier ---
Nos_axes = [3 2 1];



%% Progs d'execution :
% Moteur
% Si port moteur ouvert alors fermer
ports = instrfind;
if ~isempty(ports)
    fclose(ports);
    clear ports;
end

[Moteur] = Motors_on(MotV,MotAcc,MotDecc);


l_data = Scp.RecordLength-1;
%% balayage 1-2-3D

% test eventuel pour voir si la memoire va exploser :
global Datas3D
global U_Tx3D
%Datas3D = zeros(length(Axes{Nos_axes(1)}),length(Axes{Nos_axes(2)}),length(Axes{Nos_axes(3)}),l_data,'single');
Datas3D = zeros(length(Axes{Nos_axes(1)}),length(Axes{Nos_axes(2)}),length(Axes{Nos_axes(3)}),'single');
%U_Tx3D = zeros(length(Axes{Nos_axes(1)}),length(Axes{Nos_axes(2)}),length(Axes{Nos_axes(3)}),l_data+1,'single');
U_Tx3D = zeros(length(Axes{Nos_axes(1)}),length(Axes{Nos_axes(2)}),length(Axes{Nos_axes(3)}),'single');

scan3D(fenetre2,Moteur,Axes,Nos_axes,Gen,Scp,Nmoy,B,A);



% Motors_off
fclose(Moteur);
delete(Moteur);


