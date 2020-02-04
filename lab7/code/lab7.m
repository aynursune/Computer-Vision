imgR = imread('S01R.png');
imgL = imread('S01L.png');
 
[r,c,color] = size(imgR);
if(color==3)
    imgR = rgb2gray(imgR);  
end
 
[r,c,color] = size(imgL);
if(color==3)
    imgL = rgb2gray(imgL);  
end
 
k=3;
omega = 60;
offset = 60;
 
%imshow(stereoAnaglyph(imgL,imgR));
 
paddedImL = padarray(imgL,[offset offset],'both');
paddedImR = padarray(imgR,[offset offset],'both');
 
paddedImR = double(paddedImR);
paddedImL = double(paddedImL);
 
dispar = zeros(size(paddedImR));
 
for i=offset+k+1:1:r-k+offset-1
    for j= offset+k+1:1:c-k+offset-1
        
        subimgL = paddedImL(i-k:i+k,j-k:j+k);
        dist =[];
        
        for j2= j-omega:1:j
             subimgR = paddedImR(i-k:i+k,j2-k:j2+k);
       
            %SSD        
            ssd = sum(sum((subimgR-subimgL).^2));
            dist = [dist; i j2 ssd];
        
        end
        
       ind = find(dist(:,3) == min (dist(:,3))) ;
       ind = ind(1);
       dispar(i,j) = j - dist(ind(1),2);
       
    end
end
 
%figure; imagesc(dispar); colormap jet; colorbar

range = [0,48];
map = disparity(imgL,imgR,'BlockSize',9,'DisparityRange',range);
figure;
imshow(map,range);
title('Disparity Map');
colormap(gca,jet)
colorbar

