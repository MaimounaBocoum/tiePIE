function [Datas2D, U_Tx2D] = scan2D(fenetre2,Moteur,Axes,Nos_axes,Gen,Scp,Nmoy,B,A)

    fprintf(Moteur,[num2str(Nos_axes(1)) 'PA' num2str(Axes{Nos_axes(1)}(1))]);
    if length(Axes{Nos_axes(1)}) ~= 1
        pause(1)
    end

    % Datas2D = double(zeros(length(Axes{Nos_axes(1)}), length(Axes{Nos_axes(2)}),l_data ));

    for k = 1:length(Axes{Nos_axes(1)})
        
        fprintf(Moteur,[num2str(Nos_axes(1)) 'PA' num2str(Axes{Nos_axes(1)}(k))]);    
        pause(0.3)
        [Datas1D, U_Tx1D] = scan1D(fenetre2,Moteur,Axes,Nos_axes(2),Gen,Scp,Nmoy,B,A);
        %Datas2D(k,:,:) = Datas1D(:,:);
        Datas2D(k,:) = max(Datas1D(:,500:end-500),[],2);
        %U_Tx2D(k,:,:) = U_Tx1D(:,:);
        U_Tx2D(k,:) = max(U_Tx1D(:,500:end-500),[],2);
        disp(['ligne no : ' num2str(k)])
        
    end
end