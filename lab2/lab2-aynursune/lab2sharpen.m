function [newimg] = lab2sharpen(img,lamda, M,k)

[r,c,color] = size(img);
if(color==3)
    img = rgb2gray(img);  
end

newimg = zeros(size(img));
smoothed = zeros(size(img));
img=double(img);

if(M==1)
    smoothed = lab1locbox(img,k);
end 

if(M==2)
     smoothed = lab2gaussfilt(img);
end

if(M==3)
     smoothed = lab2medfilt(img,k);
end

smoothed=double(smoothed);
newimg = img+lamda*(img-smoothed);

newimg = uint8(newimg);
imshow(newimg)
end