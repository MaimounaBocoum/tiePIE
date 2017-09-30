%% Display line scan Axe 1
time_axis = 0:1/(200e6):l_data/(200e6);
k = 1;
i = 1;

figure(21),imagesc(time_axis,Axe1,squeeze(Datas3D(k,i,:,1000:l_data-1000)))
% caxis([-500 500])
clear M
for ii = 1:length(Axe1),
    M(ii) = max(squeeze(Datas3D(k,i,ii,100:20000)));
end
figure; plot(Axe1,M)

%% Display line scan Axe 2
time_axis = 0:1/(200e6):l_data/(200e6);
k = 1;
i = 1;

Data3D = squeeze(Datas3D);
figure(22),imagesc(time_axis,Axe2,Data3D(:,100:end-100))

% for ii = 1:length(Axe2),
%     M(ii) = max(squeeze(Datas3D(k,ii,i,100:20000)))
% end
M = max(Data3D(:,100:end-100), [], 2);
figure; plot(Axe2,M)

%% Display line scan Axe 3
time_axis = 0:1/(200e6):l_data/(200e6);

k = 1;
i = 1;
%figure(22),imagesc(time_axis,Axe3,squeeze(Datas3D(:,k,i,1000:l_data-1000)))
% figure(23),plot(time_axis(1:end-1),squeeze(Datas3D(80,k,i,:)))
% caxis([-500 500])
clear M
for ii = 1:length(Axe3),
    M(ii) = max(squeeze(Datas3D(ii,k,i,501:25000)))
end

 figure; plot(Axe3,M)

%% 2D normal
Mat = squeeze(Datas3D(:,:,:,:));
Mat_3D = max(Mat(:,:,500:end-500),[], 3);
figure, imagesc(Mat_3D)
colorbar
%caxis([0 1.5e5])

%% 2D log
Mat = squeeze(Datas3D(:,:,:,:));
Mat_3D = max(Mat(:,:,500:end-500),[], 3);
figure, imagesc(20*log10(Mat_3D/max(max(Mat_3D))))
colorbar


%% 2D normal donnees compressees
for k=1:size(Datas3D,1)
Mat = squeeze(Datas3D(k,:,:));
figure, imagesc(Mat)
colorbar
%caxis([0 6e6])
end

%% 2D log donnees compressees
Mat = squeeze(Datas3D(:,:,:));
figure, imagesc(20*log10(Mat/max(max(Mat))))
colorbar


%% 2D tension
Mat = squeeze(U_Tx3D);
Mat_3D = max(Mat(:,:,500:end-500),[], 3);
figure, imagesc(Mat_3D)
colorbar
figure
plot(squeeze(U_Tx3D(1,5,5,:)))
%caxis([0 1.5e5])

%% 2D sectoriel
%ad1 = cat(1,Mat_3D, zeros(size(Mat_3D,1)-size(Datas3D,1),size(Mat_3D,2),size(ad,3)));
F = zeros(512,512,'single');
processing.ScanConvertLin(UFLutimage.LUT_coeff,UFLutimage.LUT_X,UFLutimage.LUT_Z,UFLutimage.LUT_Vois1,UFLutimage.LUT_Vois2,UFparametersimage.NbVois,UFLutimage.lutsize,single(Mat_3D(:,:)'),F);%%
Mat_3D_Scan_Convert(:,:) = F';
figure, imagesc(Mat_3D_Scan_Convert)
