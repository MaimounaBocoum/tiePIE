function [Moteur] = Motors_on(MotV,MotAcc,MotDecc)
%% Comm controleur moteurs
% MotV : vecteur vitesses moteurs [mm/s]
% MotAcc : vecteur accelerations moteurs [mm/s^2]

Moteur = visa('ni', 'ASRL5::INSTR');
fopen(Moteur);
set(Moteur,'baudrate', 921600);
set(Moteur,'terminator', 'CR');

% Moteurs ON
for i = 1:3
    fprintf(Moteur,[num2str(i) 'MO']);
end

%% Controle des vitesses moteur
for i = 1:3
    fprintf(Moteur,[num2str(i) 'VA' num2str(MotV(i))]);    
    fprintf(Moteur,[num2str(i) 'AC' num2str(MotAcc(i))]);
    fprintf(Moteur,[num2str(i) 'AG' num2str(MotDecc(i))]);
end

end