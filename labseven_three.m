%Title: To compress an image with Discrete Cosine Transformation.
%Developed By: Rabi Raj Khadka
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
xorg=imread('img\neuromancer.jpg');
x=rgb2gray(xorg);
F=dct2(x);%built in DCT
ff=idct2(F);%Built in IDCT
%-------------------------------------------------------------------
%Block wise DCT Implementation
%-------------------------------------------------------------------
[r,c]=size(x);
%-------------------------------------------------------------------
%Variable Initialization
%-------------------------------------------------------------------
DF=zeros(r,c);
DFF=DF;
IDF=DF;
IDFF=DF;
depth=4;
N=8; %Size of transformation block
for i=1:N:r
    for j=1:N:c
        f=x(i:i+N-1,j:j+N-1);
        df=dct2(f);
        DF(i:i+N-1,j:j+N-1)=df;% DCT of the blocks
        dff=idct2(df);
        DFF(i:i+N-1,j:j+N-1)=dff; %Inverese DCT of the blocks;
        
        df(N:-1:depth+1,:)=0;
        df(:,N:-1:depth+1)=0;
        IDF(i:i+N-1,j:j+N-1)=df;%DCT of blocks with depth consideration)
        dff=idct(df);
  IDFF(i:i+N-1,j:j+N-1)=dff; %Inverese DCT of blocks with depth considered) 
    end
end
A=DFF/255;
imwrite(A,'DCTcompressed.jpg');

B=IDFF/255;
imwrite(B,'IDCTcompressed.jpg');

figure;
subplot(241),imshow(x),title('Gray Scale Image');
subplot(242),imshow(F*0.01),title('Built-in DCT ');
subplot(246),imshow(ff/255),title('Built-in IDCT');
subplot(243),imshow(DF),title('DCT Block Image');
subplot(247),imshow(DFF/255),title('IDCT Block Image');
subplot(244),imshow(A),title('DCT Compressed Image');
subplot(248),imshow(B),title('IDCT Compressed Image');
subplot(245),imshow(xorg),title('Original Image');
