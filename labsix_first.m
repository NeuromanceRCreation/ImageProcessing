%Title: To study bit plane slicing
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

% 8 bit planes of gray scale image
c0=mod(matrix_myimage,2);
c1=mod(floor(matrix_myimage/2),2);
c2=mod(floor(matrix_myimage/4),2);
c3=mod(floor(matrix_myimage/8),2);
c4=mod(floor(matrix_myimage/16),2);
c5=mod(floor(matrix_myimage/32),2);
c6=mod(floor(matrix_myimage/64),2);
c7=mod(floor(matrix_myimage/128),2);

%--------------------------------------------------------------------------
%output  
%--------------------------------------------------------------------------
figure;
subplot(3,3,1);imshow(gray_myimage); title('GrayScale(Original) Image');
impixelinfo;
subplot(3,3,2);imshow(c0); title('Bit 0 Plane');
subplot(3,3,3);imshow(c1);title('Bit 1 Plane');
subplot(3,3,4);imshow(c2);title('Bit 2 Plane');
subplot(3,3,5);imshow(c3);title('Bit 3 Plane');
subplot(3,3,6);imshow(c4);title('Bit 4 Plane');
subplot(3,3,7);imshow(c5);title('Bit 5 Plane');
subplot(3,3,8);imshow(c6);title('Bit 6 Plane');
subplot(3,3,9);imshow(c7);title('Bit 7 Plane');

%Getting original grayscale image from the bitplanes
original=(2*(2*(2*(2*(2*(2*(c7*2+c6)+c5)+c4)+c3)+c2)+c1))+c0;
original=uint8(original); %convert double into integer
figure;
subplot(1,2,1);imshow(gray_myimage);title('Original Image');impixelinfo;
subplot(1,2,2);imshow(original);title('Recovered Image');impixelinfo;