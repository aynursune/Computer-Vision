clear all; close all; clc;
% Load the files given in SUcourse as Seq variable 
load('traffic.mat');
Seq = traffic;
    
[row,col,num]=size(Seq);

% Define k and Threshold
k=10;
Threshold = 100;
for j=2:1:num
         ImPrev = Seq(:,:,j-1);
         ImCurr = Seq(:,:,j);
         lab6OF(ImPrev,ImCurr,k,Threshold);
         pause(0.1);
end