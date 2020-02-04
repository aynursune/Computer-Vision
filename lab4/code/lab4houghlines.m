function [val]= lab4houghlines(img)
tic;
[r,c,color] = size(img);
if(color==3)
    img = rgb2gray(img);  
end
   
    BW = edge(img,'canny'); % extract edges
    [H,T,R] = hough(BW,'RhoResolution',0.5,'Theta',-90:0.5:89.5);
       
    %subplot(2,1,1);
    %imshow(BW);
  
 
       % hough matrix
      %subplot(2,1,2);
      %imshow(imadjust(rescale(H)),'XData',T,'YData',R,'InitialMagnification','fit');
      %title('Hough transform of checker');
      %xlabel('\theta'), ylabel('\rho');
      %axis on, axis normal, hold on;
     % colormap(gca,hot);
       
       
       
       P  = houghpeaks(H,3,'Threshold',0.1*max(H(:)));
     % imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
     % xlabel('\theta'), ylabel('\rho');
      %axis on, axis normal, hold on;
      %plot(T(P(:,2)),R(P(:,1)),'s','color','white');
       

       lines = houghlines(BW,T,R,P,'FillGap',10,'MinLength',40);
       figure, imshow(img), hold on
       max_len = 0;
       min_len = 1000;
       for k = 1:length(lines)
         xy = [lines(k).point1; lines(k).point2];
         plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
 
         plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
         plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','blue');

         len = norm(lines(k).point1 - lines(k).point2);
         if ( len > max_len)
           max_len = len;
           xy_long = xy;
         end
         
         if ( len < min_len)
           min_len = len;
           xy_short = xy;
         end
       end
         
       plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');    % longest line     
       plot(xy_short(:,1),xy_short(:,2),'LineWidth',2,'Color','red');  % shortest line
       
       val = xy_long;
     
    toc;   
end
