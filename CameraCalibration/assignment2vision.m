img1 = imread('IMG_2807.JPG');
img = imresize(img1,[360,360]);
[r,c,color] = size(img);
if(color==3)
    img = rgb2gray(img);  
end
 %-------- harris corners
harriscorners = detectHarrisFeatures(img);  
imshow(img);
hold on;
plot(harriscorners.selectStrongest(300));    


p = [1*15 0*15 1*15 1 0 0 0 0 -172.1*1*15 -172.1*0*15 -172.1*1*15 -172.1*1;...
     0 0 0 0 1*15 0*15 1*15 1 -263.6*1*15 -263.6*0*15 -263.6*1*15 -263.6*1;... %1
     2*15 0*15 1*15 1 0 0 0 0 -161.3*2*15 -161.3*0*15 -161.3*1*15 -161.3*1;...
     0 0 0 0 2*15 0*15 1*15 1 -265.5*2*15 -265.5*0*15 -265.5*1*15 -265.5*1;... %2
     3*15 0*15 2*15 1 0 0 0 0 -150.2*3*15 -150.2*0*15 -150.2*2*15 -150.2*1;...
     0 0 0 0 3*15 0*15 2*15 1 -248.9*3*15 -248.9*0*15 -248.9*2*15 -248.9*1;... %3
     4*15 0*15 2*15 1 0 0 0 0 -138.4*4*15 -138.4*0*15 -138.4*2*15 -138.4*1;...
     0 0 0 0 4*15 0*15 2*15 1 -250.6*4*15 -250.6*0*15 -250.6*2*15 -250.6*1;... %4
     6*15 0*15 2*15 1 0 0 0 0 -112.3*6*15 -112.3*0*15 -112.3*2*15 -112.3*1;...
     0 0 0 0 6*15 0*15 2*15 1 -254.6*6*15 -240.6*0*15 -254.6*2*15 -254.6*1;... %5
     6*15 0*15 3*15 1 0 0 0 0 -112.4*6*15 -112.4*0*15 -112.4*3*15 -112.4*1;...
     0 0 0 0 6*15 0*15 3*15 1 -234*6*15 -234*0*15 -234*3*15 -234*1;...         %6
     9*15 0*15 3*15 1 0 0 0 0 -66.28*9*15 -66.28*0*15 -66.28*3*15 -66.28*1;...
     0 0 0 0 9*15 0*15 3*15 1 -238.8*9*15 -238.8*0*15 -238.8*3*15 -238.8*1;... %7
     11*15 0*15 3*15 1 0 0 0 0 -28.89*11*15 -28.89*0*15 -28.89*3*15 -28.89*1;...
     0 0 0 0 11*15 0*15 3*15 1 -242.9*11*15 -242.9*0*15 -242.9*3*15 -242.9*1;... %8
     4*15 0*15 0*15 1 0 0 0 0 -137.3*4*15 -137.3*0*15 -137.3*0*15 -137.3*1;...
     0 0 0 0 4*15 0*15 0*15 1 -289.2*4*15 -289.2*0*15 -289.2*0*15 -289.2*1;... %9
     1*15 0*15 3*15 1 0 0 0 0 -172.5*1*15 -172.5*0*15 -172.5*3*15 -172.5*1;...
     0 0 0 0 1*15 0*15 3*15 1 -228.2*1*15 -228.2*0*15 -228.2*3*15 -228.2*1;... %10
     3*15 0*15 4*15 1 0 0 0 0 -150.6*3*15 -150.6*0*15 -150.6*4*15 -150.6*1;...
     0 0 0 0 3*15 0*15 4*15 1 -211.5*3*15 -211.5*0*15 -211.5*4*15 -211.5*1;... %11
     5*15 0*15 4*15 1 0 0 0 0 -126.1*5*15 -126.1*0*15 -126.1*4*15 -126.1*1;...
     0 0 0 0 5*15 0*15 4*15 1 -212.7*5*15 -212.7*0*15 -212.7*4*15 -212.7*1;... %12
     9*15 0*15 4*15 1 0 0 0 0 -66.5*9*15 -66.5*0*15 -66.5*4*15 -66.5*1;...
     0 0 0 0 9*15 0*15 4*15 1 -216*9*15 -216*0*15 -216*4*15 -216*1;...         %13
     11*15 0*15 5*15 1 0 0 0 0 -29.73*11*15 -29.73*0*15 -29.73*5*15 -29.73*1;...
     0 0 0 0 11*15 0*15 5*15 1 -193.5*11*15 -193.5*0*15 -193.5*5*15 -193.5*1;... %14
     10*15 0*15 6*15 1 0 0 0 0 -49.4*10*15 -49.4*0*15 -49.4*6*15 -49.4*1;...
     0 0 0 0 10*15 0*15 6*15 1 -169.7*10*15 -169.7*0*15 -169.7*6*15 -169.7*1;... %15
     11*15 0*15 7*15 1 0 0 0 0 -30.8*11*15 -30.8*0*15 -30.8*7*15 -30.8*1;...
     0 0 0 0 11*15 0*15 7*15 1 -143.8*11*15 -143.8*0*15 -143.8*7*15 -143.8*1;... %16
     6*15 0*15 7*15 1 0 0 0 0 -113.5*6*15 -113.5*0*15 -113.5*7*15 -113.5*1;...
     0 0 0 0 6*15 0*15 7*15 1 -152.4*6*15 -152.4*0*15 -152.4*7*15 -152.4*1;... %17
     8*15 0*15 7*15 1 0 0 0 0 -83.88*8*15 -83.88*0*15 -83.88*7*15 -83.88*1;...
     0 0 0 0 8*15 0*15 7*15 1 -149.2*8*15 -149.2*0*15 -149.2*7*15 -149.2*1;... %18
     11*15 0*15 9*15 1 0 0 0 0 -31.72*11*15 -31.72*0*15 -31.72*9*15 -31.72*1;...
     0 0 0 0 11*15 0*15 9*15 1 -94.4*11*15 -94.4*0*15 -94.4*9*15 -94.4*1;... %19
     4*15 0*15 9*15 1 0 0 0 0 -139.5*4*15 -139.5*0*15 -139.5*9*15 -139.5*1;...
     0 0 0 0 4*15 0*15 9*15 1 -116.3*4*15 -116.3*0*15 -116.3*9*15 -116.3*1;... %20
     6*15 0*15 9*15 1 0 0 0 0 -114*6*15 -114*0*15 -114*9*15 -114*1;...
     0 0 0 0 6*15 0*15 9*15 1 -111.4*6*15 -111.4*0*15 -111.4*9*15 -111.4*1;... %21
     9*15 0*15 9*15 1 0 0 0 0 -68.34*9*15 -68.34*0*15 -68.34*9*15 -68.34*1;...
     0 0 0 0 9*15 0*15 9*15 1 -102.1*9*15 -102.1*0*15 -102.1*9*15 -102.1*1;... %22
     12*15 0*15 10*15 1 0 0 0 0 -12.54*12*15 -12.54*0*15 -12.54*10*15 -12.54*1;...
     0 0 0 0 12*15 0*15 10*15 1 -65.76*12*15 -65.76*0*15 -65.76*10*15 -65.76*1;... %23
     10*15 0*15 10*15 1 0 0 0 0 -51.33*10*15 -51.33*0*15 -51.33*10*15 -51.33*1;...
     0 0 0 0 10*15 0*15 10*15 1 -74.41*10*15 -74.41*0*15 -74.41*10*15 -74.41*1;... %24
     7*15 0*15 10*15 1 0 0 0 0 -100.2*7*15 -100.2*0*15 -100.2*10*15 -100.2*1;...
     0 0 0 0 7*15 0*15 10*15 1 -86.91*7*15 -86.91*0*15 -86.91*10*15 -86.91*1;... %25
     7*15 0*15 11*15 1 0 0 0 0 -101.3*7*15 -101.3*0*15 -101.3*11*15 -101.3*1;...
     0 0 0 0 7*15 0*15 11*15 1 -65.63*7*15 -65.63*0*15 -65.63*11*15 -65.63*1;... %26
     4*15 0*15 11*15 1 0 0 0 0 -140.6*4*15 -140.6*0*15 -140.6*11*15 -140.6*1;...
     0 0 0 0 4*15 0*15 11*15 1 -77.8*4*15 -77.8*0*15 -77.8*11*15 -77.8*1;... %27
     5*15 0*15 12*15 1 0 0 0 0 -128.6*5*15 -128.6*0*15 -128.6*12*15 -128.6*1;...
     0 0 0 0 5*15 0*15 12*15 1 -54.29*5*15 -54.29*0*15 -54.29*12*15 -54.29*1;... %28
     2*15 0*15 12*15 1 0 0 0 0 -164.5*2*15 -164.5*0*15 -164.5*12*15 -164.5*1;...
     0 0 0 0 2*15 0*15 12*15 1 -67.79*2*15 -67.79*0*15 -67.79*12*15 -67.79*1;... %29
     9*15 0*15 12*15 1 0 0 0 0 -69.33*9*15 -69.33*0*15 -69.33*12*15 -69.33*1;...
     0 0 0 0 9*15 0*15 12*15 1 -33.02*9*15 -33.02*0*15 -33.02*12*15 -33.02*1;... %30
     %
     0*15 1*15 12*15 1 0 0 0 0 -194.5*0*15 -194.5*1*15 -194.5*12*15 -194.5*1;...
     0 0 0 0 0*15 1*15 12*15 1 -71.27*0*15 -71.27*1*15 -71.27*12*15 -71.27*1;... %31
     0*15 6*15 12*15 1 0 0 0 0 -251.6*0*15 -251.6*6*15 -251.6*12*15 -251.6*1;...
     0 0 0 0 0*15 6*15 12*15 1 -49.46*0*15 -49.46*6*15 -49.46*12*15 -49.46*1;... %32
     0*15 11*15 12*15 1 0 0 0 0 -332.4*0*15 -332.4*11*15 -332.4*12*15 -332.4*1;...
     0 0 0 0 0*15 11*15 12*15 1 -20.01*0*15 -20.01*11*15 -20.01*12*15 -20.01*1;... %33
     0*15 11*15 11*15 1 0 0 0 0 -333.6*0*15 -333.6*11*15 -333.6*11*15 -333.6*1;...
     0 0 0 0 0*15 11*15 11*15 1 -45.69*0*15 -45.69*11*15 -45.69*11*15 -45.69*1;... %34
     0*15 8*15 11*15 1 0 0 0 0 -280.2*0*15 -280.2*8*15 -280.2*11*15 -280.2*1;...
     0 0 0 0 0*15 8*15 11*15 1 -61.39*0*15 -61.39*8*15 -61.39*11*15 -61.39*1;... %35
     0*15 3*15 11*15 1 0 0 0 0 -215.7*0*15 -215.7*3*15 -215.7*11*15 -215.7*1;...
     0 0 0 0 0*15 3*15 11*15 1 -81.68*0*15 -81.68*3*15 -81.68*11*15 -81.68*1;... %36
     0*15 6*15 11*15 1 0 0 0 0 -251.4*0*15 -251.4*6*15 -251.4*11*15 -251.4*1;...
     0 0 0 0 0*15 6*15 11*15 1 -70.38*0*15 -70.38*6*15 -70.38*11*15 -70.38*1;... %37
     0*15 12*15 11*15 1 0 0 0 0 -353.9*0*15 -353.9*12*15 -353.9*11*15 -353.9*1;...
     0 0 0 0 0*15 12*15 11*15 1 -40.27*0*15 -40.27*12*15 -40.27*11*15 -40.27*1;... %38
     0*15 11*15 10*15 1 0 0 0 0 -333.7*0*15 -333.7*11*15 -333.7*10*15 -333.7*1;...
     0 0 0 0 0*15 11*15 10*15 1 -71.44*0*15 -71.44*11*15 -71.44*10*15 -71.44*1;... %39
     0*15 2*15 9*15 1 0 0 0 0 -205.3*0*15 -205.3*2*15 -205.3*9*15 -205.3*1;...
     0 0 0 0 0*15 2*15 9*15 1 -121.5*0*15 -121.5*2*15 -121.5*9*15 -121.5*1;... %40
     0*15 6*15 9*15 1 0 0 0 0 -251.1*0*15 -251.1*6*15 -251.1*9*15 -251.1*1;...
     0 0 0 0 0*15 6*15 9*15 1 -112.9*0*15 -112.9*6*15 -112.9*9*15 -112.9*1;... %41
     0*15 8*15 8*15 1 0 0 0 0 -279.5*0*15 -279.5*8*15 -279.5*8*15 -279.5*1;...
     0 0 0 0 0*15 8*15 8*15 1 -130.2*0*15 -130.2*8*15 -130.2*8*15 -130.2*1;... %42
     0*15 12*15 8*15 1 0 0 0 0 -353.5*0*15 -353.5*12*15 -353.5*8*15 -353.5*1;...
     0 0 0 0 0*15 12*15 8*15 1 -120*0*15 -120*12*15 -120*8*15 -120*1;... %43
     0*15 10*15 7*15 1 0 0 0 0 -313.5*0*15 -313.5*10*15 -313.5*7*15 -313.5*1;...
     0 0 0 0 0*15 10*15 7*15 1 -150.5*0*15 -150.5*10*15 -150.5*7*15 -150.5*1;... %44
     0*15 7*15 7*15 1 0 0 0 0 -264.5*0*15 -264.5*7*15 -264.5*7*15 -264.5*1;...
     0 0 0 0 0*15 7*15 7*15 1 -153.7*0*15 -153.7*7*15 -153.7*7*15 -153.7*1;... %45
     0*15 5*15 7*15 1 0 0 0 0 -238.4*0*15 -238.4*5*15 -238.4*7*15 -238.4*1;...
     0 0 0 0 0*15 5*15 7*15 1 -155.6*0*15 -155.6*5*15 -155.6*7*15 -155.6*1;... %46
     0*15 1*15 7*15 1 0 0 0 0 -195*0*15 -195*1*15 -195*7*15 -195*1;...
     0 0 0 0 0*15 1*15 7*15 1 -158.4*0*15 -158.4*1*15 -158.4*7*15 -158.4*1;... %47
     0*15 2*15 5*15 1 0 0 0 0 -204.7*0*15 -204.7*2*15 -204.7*5*15 -204.7*1;...
     0 0 0 0 0*15 2*15 5*15 1 -194.2*0*15 -194.2*2*15 -194.2*5*15 -194.2*1;... %48
     0*15 6*15 5*15 1 0 0 0 0 -250.6*0*15 -250.6*6*15 -250.6*5*15 -250.6*1;...
     0 0 0 0 0*15 6*15 5*15 1 -196.5*0*15 -196.5*6*15 -196.5*5*15 -196.5*1;... %49
     0*15 9*15 5*15 1 0 0 0 0 -295.2*0*15 -295.2*9*15 -295.2*5*15 -295.2*1;...
     0 0 0 0 0*15 9*15 5*15 1 -199*0*15 -199*9*15 -199*5*15 -199*1;...          %50
     0*15 10*15 4*15 1 0 0 0 0 -312.6*0*15 -312.6*10*15 -312.6*4*15 -312.6*1;...
     0 0 0 0 0*15 10*15 4*15 1 -224.7*0*15 -224.7*10*15 -224.7*4*15 -224.7*1;... %51
     0*15 9*15 2*15 1 0 0 0 0 -295.5*0*15 -295.5*9*15 -295.5*2*15 -295.5*1;...
     0 0 0 0 0*15 9*15 2*15 1 -270.5*0*15 -270.5*9*15 -270.5*2*15 -270.5*1;... %52
     0*15 6*15 2*15 1 0 0 0 0 -250.2*0*15 -250.2*6*15 -250.2*2*15 -250.2*1;...
     0 0 0 0 0*15 6*15 2*15 1 -259.4*0*15 -259.4*6*15 -259.4*2*15 -259.4*1;... %53
     0*15 3*15 2*15 1 0 0 0 0 -214.6*0*15 -214.6*3*15 -214.6*2*15 -214.6*1;...
     0 0 0 0 0*15 3*15 2*15 1 -251.1*0*15 -251.1*3*15 -251.1*2*15 -251.1*1;... %54
     0*15 1*15 1*15 1 0 0 0 0 -194.2*0*15 -194.2*1*15 -194.2*1*15 -194.2*1;...
     0 0 0 0 0*15 1*15 1*15 1 -264.2*0*15 -264.2*1*15 -264.2*1*15 -264.2*1;... %55
     0*15 5*15 1*15 1 0 0 0 0 -237.1*0*15 -237.1*5*15 -237.1*1*15 -237.1*1;...
     0 0 0 0 0*15 5*15 1*15 1 -276.6*0*15 -276.6*5*15 -276.6*1*15 -276.6*1;... %56
     0*15 8*15 1*15 1 0 0 0 0 -278.7*0*15 -278.7*8*15 -278.7*1*15 -278.7*1;...
     0 0 0 0 0*15 8*15 1*15 1 -289*0*15 -289*8*15 -289*1*15 -289*1;...          %57
     0*15 11*15 1*15 1 0 0 0 0 -331.7*0*15 -331.7*11*15 -331.7*1*15 -331.7*1;...
     0 0 0 0 0*15 11*15 1*15 1 -305*0*15 -305*11*15 -305*1*15 -305*1;...       %58
     0*15 8*15 0*15 1 0 0 0 0 -277.6*0*15 -277.6*8*15 -277.6*0*15 -277.6*1;...
     0 0 0 0 0*15 8*15 0*15 1 -310.5*0*15 -310.5*8*15 -310.5*0*15 -310.5*1;...   %59
     0*15 4*15 0*15 1 0 0 0 0 -223.7*0*15 -223.7*4*15 -223.7*0*15 -223.7*1;...
     0 0 0 0 0*15 4*15 0*15 1 -291.6*0*15 -291.6*4*15 -291.6*0*15 -291.6*1  %60
];

[u,s,v] = svd(p, 'econ'); 
m = v(:,12);
M = [m(1:4)'; m(5:8)'; m(9:12)'];

[R,K] = qr(M(:,1:3));
T = inv(K)*M(:,4);

disp(m);
disp(M);
disp(R);
disp(K);
disp(T);




       
      
        




      