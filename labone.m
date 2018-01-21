%Title: Introduction to MATLAB
%Author:Rabi Raj Khadka
%---------------------------------------------------------
%Three Critical Statements 
%---------------------------------------------------------
close all;
clear variables;
clc;
%---------------------------------------------------------
%Operations
%---------------------------------------------------------
fprintf('Choose Options\n');
fprintf('1.Basic Mathematical operation on Numbers\n');
fprintf('2.Matrix Operations\n');
fprintf ('3.Plot Graph\n');
logv = true;
while logv == true
    choice = input('Enter your Choice');
    if(choice == 1)
         a = input('Enter Number One');
         b = input ('Enter Number Two'); 
         disp('a+b:');disp(a+b);
         disp('a-b:');disp(a-b);
         disp('a/b:');disp(a/b);
         disp('a*b:');disp(a*b);
    elseif(choice == 2)
        matrixA = [12,15,18;12,18,15;14,19,13];
        matrixB = [1,25,14;18,13,1;12,15,15];
        disp('matrix A:\n');
        disp(matrixA);
        disp('matrix B:\n');
        disp(matrixB);
        disp('Addition of Two Matrix\n');
        disp(matrixA+matrixB);
        disp('Subtraction of Two Matrix\n');
        disp(matrixA-matrixB);
        disp('Multiplication of Two Matrix\n');
        disp(matrixA*matrixB);
        disp('submatrix A:\n');
        disp(matrixA(1:2,2:3));  
    elseif(choice == 3)
        x = 0:pi/100:2*pi;
        y = sin(x);
        plot(x,y);
    elseif (choice == 9)
          logv = false;
    end
end
%---------------------------------------------------------