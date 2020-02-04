function lab4houghcircles(img)

tic;
    [r,c,color] = size(img);
        if(color==3)
             img = rgb2gray(img);  
        end

         Rmin = 20;
         Rmax = 65;
         
        %  [centers, radii] = imfindcircles(img,[Rmin Rmax]);
          imshow(img);
            %hold on;
          %viscircles(centers, radii,'Color','b');
        
       %  [centersSensLow, radiiSensLow] = imfindcircles(img,[Rmin Rmax],'Sensitivity',0.6);
        %  [centersSensHigh, radiiSensHigh] = imfindcircles(img,[Rmin Rmax],'Sensitivity',0.9);
          
          [centersDark, radiiDark] = imfindcircles(img, [Rmin Rmax],'ObjectPolarity','dark');
         % [centersBright, radiiBright] = imfindcircles(img, [Rmin Rmax],'ObjectPolarity','bright');
  
        %  viscircles(centersSensHigh, radiiSensHigh,'Color','b')
        %  viscircles(centersSensLow, radiiSensLow,'LineStyle','--');
           
        %  viscircles(centersBright, radiiBright,'Color','b');
          viscircles(centersDark, radiiDark,'LineStyle','--');
   toc;    
   
end
