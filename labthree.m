%Title: To Demonstrate power and log transformation
%Author: Rabi Raj Khadka
%Date: 6th June 2017
%-------------------------------------------------------------------------
%Three Critical Statements
%-------------------------------------------------------------------------
close all;
clear variables;
clc;
%-------------------------------------------------------------------------
%INPUT
%------------------------------------------------------------------------
image=imread('img\neuromancer.jpg');
imshow(image);
imagedouble = im2double(image); %converting the image pixel to double value
x = imagedouble; %declaring an output image of size as size of input image
y = imagedouble; 
[r,c] = size(x); %determining the size of row and column
factor = 1;
gamma = 20;
%-------------------------------------------------------------------------
%CALCULATION
%-------------------------------------------------------------------------
for i = 1:r
    for j = 1:c
        x(i,j) = factor*log(1+imagedouble(i,j)); %log transformation
        y(i,j) = factor*imagedouble(i,j)^gamma;  %power transformation
    end
end
%-------------------------------------------------------------------------
%OUTPUT
%------------------------------------------------------------------------
subplot(1,3,1), imshow(imagedouble), title('Original Image');
subplot(1,3,2), imshow(x), title('Log Transformed Image');
subplot(1,3,3), imshow(y), title('Power Transformed Image');

