function [newimg] = lab3sobel(img,t)

[r,c,color] = size(img);
if(color==3)
    img = rgb2gray(img);  
end

newimg = zeros(size(img));
newimg = double(newimg);

img=double(img);

[newimgx,newimgy] = lab2sobelfilt(img);

newimgx = double(newimgx);
newimgy = double(newimgy);

grad = sqrt(((newimgx).^2 + (newimgy).^2));

k = find(grad>t); 
newimg(k)=255;

a = find(grad<=t); 
newimg(a)=0;

newimg = uint8(newimg);
imshow(newimg);
end

