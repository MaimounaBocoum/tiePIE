function [Datas_1pos] = acq_pression(fenetre2,Gen,Scp,Nmoy,B,A)


%     if get(Graph.gene,'value')==1; % si on utilise le generateur de fonction du TiePie
%         Gen.Amplitude=str2num(get(s1,'string'));
%         Gen.Data = Graph.gen1;
%     else
%         Gen.Data = 0. * Graph.gen1;
%         Gen.Amplitude=0;
%     end;
%     
%     
%     if get(Graph.fourier,'value')==0 % Sion cherche à observer le signal démodulé   
%         if tata==1 % Si on veut enregistrer chacune des acquisition
            
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
        
    %end;
end