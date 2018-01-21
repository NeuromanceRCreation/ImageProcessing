%Title: To study the implemenntation of edge detection filters (Laplace).
%Developed By: Rabi Raj Khadka
%Date: July 3, 2017
%-------------------------------------------------------------------
%Three critical statements
%-------------------------------------------------------------------
close all;
clear variables;
clc;
%-------------------------------------------------------------------
%Image creation
%-------------------------------------------------------------------
a=[150 150 10 150 150 150 150 150;
   150 150 10 150 150 150 150 150;
   150 150 10 150 150 150 150 150;
    10  10 10 10  10  10  10  10 ; 
   150 150 10 150 150 150 150 150;
   150 150 10 150 150 150 150 150;
   150 150 10 150 150 150 150 150;];
a=uint8(a);
%Laplace Filter Mask
h=[0 1 0;1 -4 1;0 1 0];
c=conv2(a,h);
figure;imshow(c);
%-------------------------------------------------------------------
%Implementation on specific image
%-------------------------------------------------------------------
x=imread('img\neuromancer.jpg');
x=rgb2gray(x);
x=im2double(x);
y=conv2(x,h,'valid');
%-------------------------------------------------------------------
%Implementation of built in laplace filter on specific image
%-------------------------------------------------------------------
h=fspecial('laplacian');
z=conv2(x,h,'valid');
figure; 
subplot(121),imshow(y),title('Laplace filtering on image ');
subplot(122),imshow(z),title('Built in laplace filter ');