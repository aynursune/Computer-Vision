function [newimgx,newimgy] = lab2sobelfilt(img)

[r,c,color] = size(img);
if(color==3)
    img = rgb2gray(img);  
end

newimgx = zeros(size(img));
newimgy = zeros(size(img));
img=double(img);

filterX = [-1 0 1;-2 0 2;-1 0 1];
filterY = [-1 -2 -1;0 0 0;1 2 1];
k=1;

for i=k+1:1:r-k-1
    for j= k+1:1:c-k-1
        subimg = img(i-k:i+k,j-k:j+k);
        newimgx(i,j) = sum(sum(subimg.*filterX));
        newimgy(i,j) = sum(sum(subimg.*filterY));
    end
end

newimgx = uint8(newimgx);
newimgy = uint8(newimgy);

%imshow(newimgy)
end
