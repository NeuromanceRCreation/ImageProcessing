%Title: To study noise filters
%Author:Rabi Raj Khadka
%Date:June 27, 2017
%--------------------------------------------------------------------------
% Three Critical Statements
%--------------------------------------------------------------------------
close all;
clear variables;
clc;
%--------------------------------------------------------------------------
%Two image Read
%--------------------------------------------------------------------------
myimage = imread('img\potrait.jpg');
%--------------------------------------------------------------------------
%Manipulation for bit plane slicing
%--------------------------------------------------------------------------
gray_myimage = rgb2gray(myimage);
matrix_myimage=double(gray_myimage);

figure;
subplot(1,3,1);imshow(gray_myimage);title('Original Image');

% Mean Filter h
meanf =[1 1 1;1 1 1;1 1 1]/9;
meanf_result = imfilter(gray_myimage,meanf);
subplot(1,3,2);imshow(meanf_result);title('Mean Filter on Original Image');

% Weighted Filter
weightf=[1 2 1;2 4 2;1 2 1]/16;
weightf_result = imfilter(gray_myimage,weightf);
subplot(1,3,3);imshow(weightf_result);title('Weighted Filter on Original Image');

%Salt and pepper noise added
sp = imnoise(gray_myimage,'salt & pepper',0.1);
figure;
subplot(1,3,1);imshow(sp);title('Salt and Pepper Noise on Original Image');
%S&P noise remove using mean filter
sp_remove_meanf_result = imfilter(sp,meanf);
subplot(1,3,2);imshow(sp_remove_meanf_result);title('S&P noise removed by Mean Filter');
%S&P noise remove using Weighted filter
sp_remove_weightf_result = imfilter(sp,weightf);
subplot(1,3,3);imshow(sp_remove_weightf_result);title('S&P noise removed by Weighted Filter');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Adding Gaussinan noise to Image  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Gaussinan noise added
gaussian_image = imnoise(gray_myimage,'gaussian',0.1);
figure;
subplot(2,3,1),imshow(gaussian_image),title('Gaussinan Noise on Original Image');

%Gaussinan noise remove using mean filter
gaussian_remove_meanf_result = imfilter(gaussian_image,meanf);
subplot(2,3,2),imshow(gaussian_remove_meanf_result),title('Gaussinan Noise removed by Mean Filter');

%Gaussinan noise remove using Weighted filter
gaussian_remove_weightf_result = imfilter(gaussian_image,weightf);
subplot(2,3,4),imshow(gaussian_remove_weightf_result),title('Gaussinan Noise removed by Weighted Filter');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Different Filtes Apply  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Gaussian filter
sigma =3;
cutoff = ceil(3*sigma);
gaussianf = fspecial('gaussian', 2*cutoff+1, sigma);
gaussian_remove_gaussianf_result = imfilter(gaussian_image, gaussianf);
subplot(2,3,6),imshow(gaussian_remove_gaussianf_result),title('Gaussinan Noise removed by Gaussian Filter');

%2D convolution
%out = conv2(gray_myimage,gaussianf,'same');
%figure, imshow(out/256);title('2D convolution on gray image');
%out = conv2(gaussian_image,gaussianf,'same');
%figure; imshow(out/256);title('2D convolution on gaussian noisy image');

%wiener filter 
wienerf= wiener2(gray_myimage,[5,5]);
subplot(2,3,5),imshow(wienerf),title('Gaussian Noise removed by Wiener Filter');

%median filter
medianf = medfilt2(gaussian_image,[3,3]);
subplot(2,3,3),imshow(medianf),title('Gaussian Noise removed by Median Filter');
% Surface of gaussian filters
%surf(1:2*cutoff+1,1:2*cutoff+1,gaussianf);title('Surface plot of gaussian Filter');

% frequesncy response of different filters
figure;
subplot(1,2,1); freqz2(meanf); title('Mean Filter Response');
%mf = medfilt2(gaussian_image,[3,3]);
subplot(1,2,2);freqz2(medianf); title('Median Filter Response');
