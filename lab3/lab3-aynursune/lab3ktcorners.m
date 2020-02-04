function [corners] = lab3ktcorners(img,t,k)
[r,c,color] = size(img);
if(color==3)
    img = rgb2gray(img);  
end

newimg = zeros(size(img));
img=double(img);

[Gx,Gy] = imgradientxy(img);

corners = [];

for i=k+1:k:r-k-1
    for j= k+1:k:c-k-1
         subimg_x = Gx(i-k:i+k,j-k:j+k);
         subimg_y = Gy(i-k:i+k,j-k:j+k);
         
         h1 = sum(sum(subimg_x.^2));
         h2 = sum(sum(subimg_y.*subimg_x));
         h3 = sum(sum(subimg_y.^2));
         
         H = [h1 h2;h2 h3];
        eigen = eigs(H);
        
        if(min(eigen)>t)
            corners = [corners; i j];
        end
    end
end

img = uint8(img);

imshow(img);
hold on;
plot(corners(:,2),corners(:,1),'r*');
end

