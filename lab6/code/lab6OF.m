function lab6OF(ImPrev,ImCurr,k,Threshold)
% Smooth the input images using a Box filter
   % ImPrev = lab1locbox(ImPrev,2);
   % ImCurr = lab1locbox(ImCurr,2);
   
   ImPrev = lab2gaussfilt(ImPrev);
   ImCurr = lab2gaussfilt(ImCurr);
% Calculate spatial gradients (Ix, Iy) using Prewitt filter 
Ix = zeros(size(ImCurr));
Iy = zeros(size(ImCurr));
[r,c,color] = size(ImCurr);
%ImCurr=double(ImCurr);
%ImPrev=double(ImPrev);

filterX = [-1 0 1;-1 0 1;-1 0 1];
Ix = conv2(ImCurr,filterX,'same');
Iy = conv2(ImCurr,filterX.','same');


% Calculate temporal (It) gradient
It = double(ImPrev) - double(ImCurr);

[ydim,xdim] = size(ImCurr);
Vx = zeros(ydim,xdim);
Vy = zeros(ydim,xdim);
G = zeros(2,2);
b = zeros(2,1);
cx=k+1;

for x=k+1:k:xdim-k-1
    cy=k+1;
    for y=k+1:k:ydim-k-1
    % Calculate the elements of G and b
         subimg_x = Ix(y-k:y+k,x-k:x+k);
         subimg_y = Iy(y-k:y+k,x-k:x+k);
         subimg_t = It(y-k:y+k,x-k:x+k);
         
         g1 = sum(sum(subimg_x.^2));
         g2 = sum(sum(subimg_y.*subimg_x));
         g3 = sum(sum(subimg_y.^2));
         
         b1 = sum(sum(subimg_x.*subimg_t));
         b2 = sum(sum(subimg_y.*subimg_t));
         G = [g1 g2;g2 g3];
         b = [b1;b2];
         
         eigen = eigs(G);
        if (min(eigen) < Threshold)
           Vx(cy,cx)=0;
           Vy(cy,cx)=0;
        else
       % Calculate u 
       u = -inv(G)*b;
       Vx(cy,cx)=u(1); 
       Vy(cy,cx)=u(2);
        end
         cy=cy+k;
    end
    cx=cx+k;
end
cla reset;
imagesc(ImPrev); hold on;
[xramp,yramp] = meshgrid(1:1:xdim,1:1:ydim); quiver(xramp,yramp,Vx,Vy,10,'r');
colormap gray;
end