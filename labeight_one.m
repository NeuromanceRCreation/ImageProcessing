%Title: Image Acquisition and Coin Detection Using Image Labelling
%Author: Rabi Raj Khadka
%Date: 2074/03/27
close all;
clear variables;
clc;
A=imread('img\cc.png');
figure;
subplot(221);imshow(A);title('Original Image');
B=im2bw(A);
subplot(222);imshow(B);title('B/W Image');
c=imfill(B,'holes');
subplot(223);imshow(c);
label=bwlabel(c);
max(max(label))
im1=(label==2);
subplot(224);imshow(im1);
figure;
for j=1:max(max(label))
    [row,col]=find(label==j);
    len=max(row)-min(row)+2;
    breadth=max(col)-min(col)+2;
    target=uint8(zeros([len breadth]));
    sy=min(col)-1;
    sx=min(row)-1;
    for i=1:size(row,1)
        x=row(i,1)-sx;
        y=col(i,1)-sy;
        target(x,y)=A(row(i,1),col(i,1));
    end
    mytitle=strcat('object number:',num2str(j));
    subplot(4,3,j);imshow(target);title(mytitle);
    
end