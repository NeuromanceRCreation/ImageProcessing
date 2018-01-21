close all;
clear variables;
clc;
obj=videoinput('winvideo',1);
for i=1:10
    img=getsnapshot(obj);
    fname=['rabiraj',num2str(1)];
    disp(fname);
    imwrite(img,fname,'jpg');
    pause(2);
end
