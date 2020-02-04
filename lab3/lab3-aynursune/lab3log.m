function [newimg] = lab3log(img)
[r,c,color] = size(img);
if(color==3)
    img = rgb2gray(img);  
end

newimg = zeros(size(img));
img=double(img);

subimg = lab2gaussfilt(img);
subimg = double(subimg);
 
filter = [0 1 0;1 -4 1;0 1 0];
k=1;

for i=k+1:1:r-k-1
    for j= k+1:1:c-k-1
        subnewimg = subimg(i-k:i+k,j-k:j+k);
        newimg(i,j) = sum(sum(subnewimg.*filter));       
    end
end

 
end

