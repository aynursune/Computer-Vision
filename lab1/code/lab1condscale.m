function [newimg] = lab1condscale(img1,img2)

[row,col,color] = size(img1);
if(color==3)
    img1 = rgb2gray(img1);  
end

[row2,col2,color2] = size(img2);
if(color2==3)
    img2 = rgb2gray(img2);  
end
newimg = zeros(size(img2));
img1=double(img1);
img2=double(img2);

meanref = mean(img1(:)); % img1 reference image I oldu
stdref =std(img1(:));

meanimg = mean(img2(:)); % img2 our image
stdimg =std(img2(:));

a = meanref*(stdimg/stdref)-meanimg;
b = stdref/stdimg;

newimg = b.*(img2+a);

newimg = uint8(newimg);
img1 = uint8(img1);
imshow(newimg)
imshow(img1)
end

