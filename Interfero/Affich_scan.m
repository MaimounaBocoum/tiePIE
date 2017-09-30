Mat = Datas3D;

Mat = Mat(:,:,:,500:end);

Mat_sorted = sort(Mat,4,'ascend');

Mat_mean = mean(Mat_sorted(:,:,:,1:10),4);

figure; imagesc(abs(squeeze(Mat_mean)));

Mat_med = medfilt2(squeeze(Mat_mean));

figure; imagesc(abs(squeeze(Mat_med)));
