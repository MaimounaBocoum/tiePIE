function [Datas1D, U_Tx1D] = scan1D(fenetre2,Moteur,Axes,No_axe,Gen,Scp,Nmoy,B,A)

    % Mouvement au debut
    fprintf(Moteur,[num2str(No_axe) 'PA' num2str(Axes{No_axe}(1))]);

    if length(Axes{No_axe}) ~= 1
        pause(3)
    end

    Datas1D = [];
    U_Tx1D = [];

    % Scan automatique
    for j = 1:length(Axes{No_axe})

        % Tir  lecture données oscillo
        % ligne 1 et 2 active : mesure de la pression au laser
        % ligne 3 active : mesure de la tension en sortie de l'hydrophone

        %%%Acq Pression
        
        for kk=1:Nmoy
                    Scp.start;
                    Gen.start;
             
                 while ~Scp.IsDataReady
                         pause( 0.01 ) % 10ms delay, to save CPU time.
                 end
               tmp=Scp.getData;
               signal = tmp(:,1);
                [u,v] = func_demod(200,signal,1);
                if kk==1
                    temp=u;
                else
                    temp=temp+u; 
                end;
                kk;
                
                pause(0.1) % Woj, pause pour histo
                
            end;
            temp=filtfilt(B,A,double(temp)./Nmoy);
            v=diff(temp).*200e6.*1e-9.*1.49e6; 
            Datas_1pos = v;
            figure(fenetre2.fig);
            x2limit=get(fenetre2.hhhh,'value');
            y2limit=get(fenetre2.hhh,'value');
            v_x=1:length(v);v_x=v_x./200e6;
            plot(fenetre2.axe,v_x(1:round(length(v_x)*x2limit./100)),v(1:round(length(v_x)*x2limit./100)),'LineWidth',6);
            axis(fenetre2.axe,[0 v_x(round(length(v_x)*x2limit./100)) -1*(y2limit./100).*6e6 (y2limit./100).*6e6]);grid on
                         xlabel('temps');ylabel('Pression (Pa)')
         
                         
         Datas1D = [Datas1D ; Datas_1pos];
         %[Datas_1pos] = acq_tension(fenetre2,Gen,Scp,Nmoy,B,A);

         %Datas1D = [Datas1D ; Datas_1pos'];
        
        
        % mesure de la tension en voie 2
        U_Tx1D = [U_Tx1D ; tmp(:,2)'];
        % mouvement moteur
        if j ~= length(Axes{No_axe})
            fprintf(Moteur,[num2str(No_axe) 'PA' num2str(Axes{No_axe}(j+1))]);
        end
        pause(0.3)
    end

end