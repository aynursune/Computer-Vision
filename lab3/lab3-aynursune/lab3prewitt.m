function [newimg] = lab3prewitt(img,t)

[r,c,color] = size(img);
if(color==3)
    img = rgb2gray(img);  
end

newimg = zeros(size(img));
newimg = double(newimg);

newimgx = zeros(size(img));
newimgy = zeros(size(img));

img=double(img);

filterX = [-1 0 1;-1 0 1;-1 0 1];
filterY = [-1 -1 -1;0 0 0;1 1 1];
k=1;

for i=k+1:1:r-k-1
    for j= k+1:1:c-k-1
        subimg = img(i-k:i+k,j-k:j+k);
        newimgx(i,j) = sum(sum(subimg.*filterX));
        newimgy(i,j) = sum(sum(subimg.*filterY));
    end
end


grad = sqrt(((newimgx).^2 + (newimgy).^2));

k = find(grad>t); 
newimg(k)=255;

a = find(grad<=t); 
newimg(a)=0;

newimg = uint8(newimg);
imshow(newimg);
end
