function [newimg] = lab1locbox(img,k)
[r,c,color] = size(img);

if(color==3)
    img = rgb2gray(img);  
end
newimg = zeros(size(img));
img = double(img);

for i=k+1:1:r-k-1
    for j= k+1:1:c-k-1
        subimg = img(i-k:i+k,j-k:j+k);
        newimg(i,j) = mean(subimg(:));
    end
end

newimg = uint8(newimg);
%imshow(newimg)
end
