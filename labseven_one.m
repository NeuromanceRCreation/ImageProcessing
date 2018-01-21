%Title: To study the implemenntation of edge detection filters (Gradient).
%Lab: 07
%Author: Rabi Raj Khadka
%Date: July 3, 2017
%-------------------------------------------------------------------
%Three critical statements
%-------------------------------------------------------------------
close all;
clear variables;
clc;
%-------------------------------------------------------------------
%Image input
%-------------------------------------------------------------------
a=imread('img\neuromancer.jpg');
b=rgb2gray(a);
%-------------------------------------------------------------------
%Gradient Filter Implementation
%-------------------------------------------------------------------
h=[1 0 -1;2 0 -2;1 0 -1]/9;% 3*3 prewitt filter
c=imfilter(b,h); %Filtering image with prewitt 
%-------------------------------------------------------------------
%Subplot of both figures
%-------------------------------------------------------------------
figure;
subplot(241),imshow(b),title('Original Image');
subplot(242),imshow(c),title('Gradient Filtered Image');
%-------------------------------------------------------------------
%Robert filter implementation on x axis
%-------------------------------------------------------------------
rob=[1 0;-1 0]; %2*2 robert filter mask in x axis
c=conv2(b,rob,'valid');
%-------------------------------------------------------------------
%Robert filter implementation on y axis
%-------------------------------------------------------------------
yrob=[1 -1;0 0]; %2*2 robert filter mask in y axix
ab=conv2(b,yrob,'valid');
%-------------------------------------------------------------------
%Sub plot of both images with robert filter
%-------------------------------------------------------------------
subplot(245),imshow(c),title('Robert filter in x axis');
subplot(246),imshow(ab),title('Robert filter in y axis');
%-------------------------------------------------------------------
%Filtering eith built in Gradient filters
%-------------------------------------------------------------------
a=edge(b,'roberts'); %Built in robert mask
ab=edge(b,'sobel');%Built in sobel mask
abc=edge(b,'prewitt');%Built in prewitt mask
abcd=edge(b,'canny');%Built in canny mask
%-------------------------------------------------------------------
%Subplot of all filter effects
%-------------------------------------------------------------------
subplot(243),imshow(a),title('Robert filter');
subplot(244),imshow(ab),title('Sobel filter');
subplot(247),imshow(abc),title('Prewitt filter');
subplot(248),imshow(abcd),title('Canny filter');
%-------------------------------------------------------------------