function newimg = lab1linscale(img)

[row,col,color] = size(img);

if(color==3)
    img = rgb2gray(img);  
end

newimg = zeros(size(img));
img = double(img);

imgmax = max(img(:));
imgmin = min(img(:));
Gmax = 255;
a = -imgmin;
b = Gmax/(imgmax-imgmin);


newimg = b.*(img+a);

newimg = uint8(newimg);
imshow(newimg)
end

