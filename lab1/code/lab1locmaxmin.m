function [newimgmin, newimgmax] = lab1locmaxmin(img,k)
[r,c,color] = size(img);

if(color==3)
    img = rgb2gray(img);  
end

newimgmin = zeros(size(img));
newimgmax = zeros(size(img));
img = double(img);

for i=k+1:1:r-k-1
    for j= k+1:1:c-k-1
        subimg = img(i-k:i+k,j-k:j+k);
        newimgmin(i,j) = min(subimg(:));
        newimgmax(i,j) = max(subimg(:));
    end
end

newimgmin = uint8(newimgmin);
newimgmax = uint8(newimgmax);
imshow(newimgmin);
imshow(newimgmax);
end
