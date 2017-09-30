function [Datas_1pos] = acq_tension(fenetre2,Gen,Scp,Nmoy,B,A)
            
            for kk=1:Nmoy
                    Scp.Start;
                    Gen.Start;
             
                 while ~Scp.IsDataReady
                         pause( 0.01 ) % 10ms delay, to save CPU time.
                 end
               signal=Scp.Data(:,1);
                if kk==1
                    temp=signal;
                else
                    temp=temp+signal; 
                end;
                kk;
                
                pause(0.1) % Woj, pause pour histo
                
            end;
            temp=temp/Nmoy;
            Datas_1pos = temp(1:end-1);
            figure(fenetre2.fig);
            x2limit=get(fenetre2.hhhh,'value');
            y2limit=get(fenetre2.hhh,'value');
            v_x=1:length(temp);v_x=v_x./200e6;
            plot(fenetre2.axe,v_x(1:round(length(v_x)*x2limit./100)),temp(1:round(length(v_x)*x2limit./100)),'LineWidth',2);
            axis(fenetre2.axe,[0 v_x(round(length(v_x)*x2limit./100)) -1*(y2limit./100)*0.5 (y2limit./100)*0.5]);grid on
                         xlabel('temps');ylabel('tension [V]')
        
    
end