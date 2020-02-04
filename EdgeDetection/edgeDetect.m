function edgeDetect(img)
img = imread(img);

[r,c,color] = size(img);
if(color==3)
    img = rgb2gray(img);  
end

subimg = double(img);
%subsmoothedimg = lab2gaussfilt(img);
subsmoothedimg = subimg;
canny = edge(subsmoothedimg,'canny');
prewitt = edge(subsmoothedimg,'prewitt');
roberts = edge(subsmoothedimg,'roberts');
log = edge(subimg,'log');

intsubimg = uint8(subimg);

figure;

subplot(1,5,1);
imshow(intsubimg);
xlabel('original image');

subplot(1,5,2);
imshow(canny);
xlabel('canny');

subplot(1,5,3);
imshow(prewitt);
xlabel('prewitt');

subplot(1,5,4);
imshow(roberts);
xlabel('roberts');

subplot(1,5,5);
imshow(log);
xlabel('log');

end

