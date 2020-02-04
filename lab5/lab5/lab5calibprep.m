img1 = imread('calibchecker.jpg');
img = imresize(img1,[360,360]);
[r,c,color] = size(img);
if(color==3)
    img = rgb2gray(img);  
end
   
     BW = edge(img,'canny'); % extract edges
     [H,T,R] = hough(BW,'RhoResolution',0.9,'Theta',-90:0.5:89.5);
       
     P  = houghpeaks(H,20,'Threshold',0.1*max(H(:)));
    
     lines = houghlines(BW,T,R,P,'FillGap',10,'MinLength',7);
     figure, imshow(img), hold on
       max_len = 0;
       min_len = 1000;
       
       for k = 1:length(lines)
         xy = [lines(k).point1; lines(k).point2];
         plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

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
       
        %-------- harris corners
         harriscorners = corner(img,'harris');          
         plot(harriscorners(:,1),harriscorners(:,2),'bo');    
       
       %------------ first line
       firstline = lines(26);
       secondline = lines(45);       
       thetafirst = firstline.theta;
       thetasecond = secondline.theta;      
       rhofirst = firstline.rho;
       rhosecond = secondline.rho;      
       A = [ cosd(thetafirst) sind(thetafirst) ; cosd(thetasecond) sind(thetasecond)];
       rho = [rhofirst;rhosecond];     
       point = inv(A)*rho;
      
        x1 = 0:0.1:350;
        x2 = 0:0.1:350;
        y1 = (rhofirst - (x1*cosd(thetafirst)))/ sind(thetafirst);
        y2 = (rhosecond - (x2*cosd(thetasecond)))/ sind(thetasecond);
       
        hold on
        plot(x1,y1,'m');
        plot(x2,y2,'m');       
        plot(point(1,1),point(2,1),'x','LineWidth',2,'Color','cyan');
    
            % -------- first distance
         corner1x = 126;
         corner1y = 76;
         corner2x = point(1,1);
         corner2y = point(2,1);
         
         distance1 = sqrt((corner1x-corner2x)^2 + (corner1y-corner2y)^2);
         disp(lines(26));
         disp(lines(45));
         disp(distance1);
         
         
       %------------ second line
       firstline = lines(30);
       secondline = lines(20);       
       thetafirst = firstline.theta;
       thetasecond = secondline.theta;      
       rhofirst = firstline.rho;
       rhosecond = secondline.rho;      
       A = [ cosd(thetafirst) sind(thetafirst) ; cosd(thetasecond) sind(thetasecond)];
       rho = [rhofirst;rhosecond];     
       point = inv(A)*rho;
      
        x1 = 0:0.1:350;
        x2 = 0:0.1:350;
        y1 = (rhofirst - (x1*cosd(thetafirst)))/ sind(thetafirst);
        y2 = (rhosecond - (x2*cosd(thetasecond)))/ sind(thetasecond);
       
        hold on
        plot(x1,y1,'m');
        plot(x2,y2,'m');       
        plot(point(1,1),point(2,1),'x','LineWidth',2,'Color','y');
   
         %-------- second distance
         corner1x = 98;
         corner1y = 252;
         corner2x = point(1,1);
         corner2y = point(2,1);
         
         distance2 = sqrt((corner1x-corner2x)^2 + (corner1y-corner2y)^2);
         disp(lines(30));
         disp(lines(20));
         disp(distance2);
         
       %------------ third line
       firstline = lines(38);
       secondline = lines(6);       
       thetafirst = firstline.theta;
       thetasecond = secondline.theta;      
       rhofirst = firstline.rho;
       rhosecond = secondline.rho;      
       A = [ cosd(thetafirst) sind(thetafirst) ; cosd(thetasecond) sind(thetasecond)];
       rho = [rhofirst;rhosecond];     
       point = inv(A)*rho;
      
        x1 = 0:0.1:350;
        x2 = 0:0.1:350;
        y1 = (rhofirst - (x1*cosd(thetafirst)))/ sind(thetafirst);
        y2 = (rhosecond - (x2*cosd(thetasecond)))/ sind(thetasecond);
       
        hold on
        plot(x1,y1,'m');
        plot(x2,y2,'m');       
        plot(point(1,1),point(2,1),'x','LineWidth',2,'Color','blue');
        
         % -------- third distance
         corner1x = 38;
         corner1y = 291;
         corner2x = point(1,1);
         corner2y = point(2,1);
         
         distance3 = sqrt((corner1x-corner2x)^2 + (corner1y-corner2y)^2);
         disp(lines(38));
         disp(lines(6));
         disp(distance3);
         
       %------------ fourth line
       firstline = lines(38);
       secondline = lines(20);       
       thetafirst = firstline.theta;
       thetasecond = secondline.theta;      
       rhofirst = firstline.rho;
       rhosecond = secondline.rho;      
       A = [ cosd(thetafirst) sind(thetafirst) ; cosd(thetasecond) sind(thetasecond)];
       rho = [rhofirst;rhosecond];     
       point = inv(A)*rho;
      
        x1 = 0:0.1:350;
        x2 = 0:0.1:350;
        y1 = (rhofirst - (x1*cosd(thetafirst)))/ sind(thetafirst);
        y2 = (rhosecond - (x2*cosd(thetasecond)))/ sind(thetasecond);
       
        hold on
        plot(x1,y1,'m');
        plot(x2,y2,'m');       
        plot(point(1,1),point(2,1),'x','LineWidth',2,'Color','red');
        
         % -------- fourth distance
         corner1x = 98;
         corner1y = 283;
         corner2x = point(1,1);
         corner2y = point(2,1);
         
         distance4 = sqrt((corner1x-corner2x)^2 + (corner1y-corner2y)^2);
         disp(lines(38));
         disp(lines(20));
          disp(distance4);
         
       %------------ fifth line
       firstline = lines(9);
       secondline = lines(30);       
       thetafirst = firstline.theta;
       thetasecond = secondline.theta;      
       rhofirst = firstline.rho;
       rhosecond = secondline.rho;      
       A = [ cosd(thetafirst) sind(thetafirst) ; cosd(thetasecond) sind(thetasecond)];
       rho = [rhofirst;rhosecond];     
       point = inv(A)*rho;
      
        x1 = 0:0.1:350;
        x2 = 0:0.1:350;
        y1 = (rhofirst - (x1*cosd(thetafirst)))/ sind(thetafirst);
        y2 = (rhosecond - (x2*cosd(thetasecond)))/ sind(thetasecond);
       
        hold on
        plot(x1,y1,'m');
        plot(x2,y2,'m');       
        plot(point(1,1),point(2,1),'x','LineWidth',2,'Color','magenta');
        
         %-------- fifth distance
         corner1x = 148;
         corner1y = 247;
         corner2x = point(1,1);
         corner2y = point(2,1);
         
         distance5 = sqrt((corner1x-corner2x)^2 + (corner1y-corner2y)^2);
         disp(lines(9));
         disp(lines(30));
          disp(distance5);
         
       %------------ sixth line
       firstline = lines(26);
       secondline = lines(29);       
       thetafirst = firstline.theta;
       thetasecond = secondline.theta;      
       rhofirst = firstline.rho;
       rhosecond = secondline.rho;      
       A = [ cosd(thetafirst) sind(thetafirst) ; cosd(thetasecond) sind(thetasecond)];
       rho = [rhofirst;rhosecond];     
       point = inv(A)*rho;
      
        x1 = 0:0.1:350;
        x2 = 0:0.1:350;
        y1 = (rhofirst - (x1*cosd(thetafirst)))/ sind(thetafirst);
        y2 = (rhosecond - (x2*cosd(thetasecond)))/ sind(thetasecond);
       
        hold on
        plot(x1,y1,'m');
        plot(x2,y2,'m');       
        plot(point(1,1),point(2,1),'x','LineWidth',2,'Color','green');
         
         % -------- sixth distance
         corner1x = 126;
         corner1y = 105;
         corner2x = point(1,1);
         corner2y = point(2,1);
         
         distance6 = sqrt((corner1x-corner2x)^2 + (corner1y-corner2y)^2);
         disp(lines(26));
         disp(lines(29));
          disp(distance6);

                   
       %------------ seventh line
       firstline = lines(29);
       secondline = lines(5);       
       thetafirst = firstline.theta;
       thetasecond = secondline.theta;      
       rhofirst = firstline.rho;
       rhosecond = secondline.rho;      
       A = [ cosd(thetafirst) sind(thetafirst) ; cosd(thetasecond) sind(thetasecond)];
       rho = [rhofirst;rhosecond];     
       point = inv(A)*rho;
      
        x1 = 0:0.1:350;
        x2 = 0:0.1:350;
        y1 = (rhofirst - (x1*cosd(thetafirst)))/ sind(thetafirst);
        y2 = (rhosecond - (x2*cosd(thetasecond)))/ sind(thetasecond);
        
        hold on
        plot(x1,y1,'m');
        plot(x2,y2,'m');       
        plot(point(1,1),point(2,1),'x','LineWidth',2,'Color','black');
        
         % -------- seventh distance
         corner1x = 42;
         corner1y = 92;
         corner2x = point(1,1);
         corner2y = point(2,1);
         
         distance7 = sqrt((corner1x-corner2x)^2 + (corner1y-corner2y)^2);
         disp(lines(29));
         disp(lines(5));
          disp(distance7);
         
       %------------ eighth line
       firstline = lines(39);
       secondline = lines(20);       
       thetafirst = firstline.theta;
       thetasecond = secondline.theta;      
       rhofirst = firstline.rho;
       rhosecond = secondline.rho;      
       A = [ cosd(thetafirst) sind(thetafirst) ; cosd(thetasecond) sind(thetasecond)];
       rho = [rhofirst;rhosecond];     
       point = inv(A)*rho;
      
        x1 = 0:0.1:350;
        x2 = 0:0.1:350;
        y1 = (rhofirst - (x1*cosd(thetafirst)))/ sind(thetafirst);
        y2 = (rhosecond - (x2*cosd(thetasecond)))/ sind(thetasecond);
       
        hold on
        plot(x1,y1,'m');
        plot(x2,y2,'m');       
        plot(point(1,1),point(2,1),'x','LineWidth',2,'Color','white');
         
         % -------- eighth distance
         corner1x = 99;
         corner1y = 221;
         corner2x = point(1,1);
         corner2y = point(2,1);
         
         distance8 = sqrt((corner1x-corner2x)^2 + (corner1y-corner2y)^2);
         disp(lines(39));
         disp(lines(20));
         disp(distance8);
 
      
             
        




      