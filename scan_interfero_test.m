%% Init program
clear all; close all; clc
w = instrfind; if ~isempty(w) fclose(w); delete(w); end
clear all;
if (exist('Pilotage_materiel')~=7)
    disp(['Library Pilotage_materiel not loaded']);
end

%% Tiepie
% Initialisation
TiePie1 = TiePie('TiePie','HS5','USB','1');
% Commandes Oscillo
TiePie1.State_channels = [1 1]; % Voies 1 et 2 activées
TiePie1.Resolution = 14; % 14bits de résolution
TiePie1.Nb_points = 1000; % Nombre de points acquis
TiePie1.Sample_Frequency = 1e6*50;% Fréquence d'échantillonage
TiePie1.Nb_points = 40000;
TiePie1.Trigger_EXT1 = 1; % On/Off
% %TiePie1.Trigger_Level1 = 0.5; % 50% du calibre de la voie 1
% TiePie1.Yscale1 = 4; % Amplitude max voie 1 [-4 4]V
% TiePie1.Yscale2 = 4; % Amplitude max voie 2 [-4 4]V
%
% % Commandes GBF
% TiePie1.Vpp = 5;
% TiePie1.Frequency = 1e6;
% TiePie1.Shape = 'BURST_SQUARE';
% TiePie1.BurstCount = 100;
% TiePie1.State = 'on';

%% Actionneur 3 axes
% Initialisation
Axes3D1 = Axes3D('Newport','ESP301','COM','5');


%%
xmin = -1;
xmax = 1;
xstep = 0.2;
ymin = -1;
ymax = 1;
ystep = 0.2;
zmin = 0;
zmax = 0;
zstep = 1;
%
x = xmin:xstep:xmax;
y = ymin:ystep:ymax;
z = zmin:zstep:zmax;

Data_scan = single(zeros(length(x),length(y),length(z),TiePie1.Nb_points));

%%
Axes3D1.startMotor

Axes3D1.X_position = x(1);
Axes3D1.Y_position = y(1);
Axes3D1.Z_position = z(1);

for xx=1:length(x)
    while round(Axes3D1.X_position-x(xx)) > 0.01
        Axes3D1.X_position = x(xx);
        pause(0.1)
    end
    for yy=1:length(y)
        while round(Axes3D1.Y_position-y(yy)) > 0.01
            Axes3D1.Y_position = y(yy);
            pause(0.1)
        end
        
        for zz=1:length(z)
            while round(Axes3D1.Z_position-z(zz)) > 0.01
                Axes3D1.Z_position = z(zz);
                pause(0.1)
            end
            
            disp(['Scan position X:' num2str(x(xx)) ',Y: ' num2str(y(yy)) ',Z: ' num2str(z(zz))]);
            Axes3D1.X_position = x(xx); %1m valeur absolue par rapport au zéro de la machine
            pause(0.1);
            TiePie1.Trigger_Armed = 1;
            while ~strcmp(TiePie1.Trigger_Armed,'Value available')
                
            end
            Data_scan(xx,yy,zz,:) = TiePie1.Data_channels(1);
        end
        Axes3D1.Y_position = y(yy);
    end
    Axes3D1.Z_position = z(zz);
end
Axes3D1.stopMotor
disp(['Scan terminé']);


%%
clear Axes3D1 Tiepie1


