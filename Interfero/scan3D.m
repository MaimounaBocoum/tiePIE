function scan3D(fenetre2,Moteur,Axes,Nos_axes,Gen,Scp,Nmoy,B,A)

    global Datas3D
    global U_Tx3D

    fprintf(Moteur,[num2str(Nos_axes(1)) 'PA' num2str(Axes{Nos_axes(1)}(1))]);
    fprintf(Moteur,[num2str(Nos_axes(2)) 'PA' num2str(Axes{Nos_axes(2)}(1))]);
    fprintf(Moteur,[num2str(Nos_axes(3)) 'PA' num2str(Axes{Nos_axes(3)}(1))]);
    pause(2)

    % Datas2D = double(zeros(length(Axes{Nos_axes(1)}), length(Axes{Nos_axes(2)}),l_data ));

    for k = 1:length(Axes{Nos_axes(1)})
        fprintf(Moteur,[num2str(Nos_axes(1)) 'PA' num2str(Axes{Nos_axes(1)}(k))]);
        pause(1)

        [Datas2D, U_Tx2D] = scan2D(fenetre2,Moteur,Axes,Nos_axes(2:3),Gen,Scp,Nmoy,B,A);
        %Datas3D(k,:,:,:) = single(Datas2D(:,:,:));
        Datas3D(k,:,:) = single(Datas2D);
        %U_Tx3D(k,:,:,:) = single(U_Tx2D(:,:,:));
        U_Tx3D(k,:,:) = single(U_Tx2D);
        disp(['ligne dim 1 no : ' num2str(k)])
    end
end