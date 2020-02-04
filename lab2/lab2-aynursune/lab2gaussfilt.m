function [newimg] = lab2gaussfilt(img)

[r,c,color] = size(img);
if(color==3)
    img = rgb2gray(img);  
end

newimg = zeros(size(img));
img=double(img);

filter = (1/273)*[1 4 7 4 1;4 16 26 16 4;7 26 41 26 7;4 16 26 16 4;1 4 7 4 1];
k=2;

for i=k+1:1:r-k-1
    for j= k+1:1:c-k-1
        subimg = img(i-k:i+k,j-k:j+k);
        newimg(i,j) = sum(sum(subimg.*filter));
    end
end

newimg = uint8(newimg);
imshow(newimg)
end

