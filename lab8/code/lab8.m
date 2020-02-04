clear all; close all; clc;
%% Definitions
rng(1);
L = 300;
I1 = zeros(L,L);

f=L;
u0 = L/2;
v0 = L/2;

K = [f 0 u0;
    0 f v0;
    0 0 1];

DEG_TO_RAD = pi/180;

%% World Coordinates
P_W=[0	2	0	1;
     0	1	0	1;
   %  0	0	0	1;
     0	2	-1	1;
     0	1	-1	1;
   %  0	0	-1	1;
     0	2	-2	1;
     0	1	-2	1;
  %   0	0	-2	1;
  %   1	0	0	1;
  %   2	0	0	1;
    % 1	0	-1	1;
    % 2	0	-1	1;
   %  1	0	-2	1;
    % 2	0	-2	1;
     1	1	0	1;
     2	1	0	1;
     1	2	0	1;
     2	2	0	1];

P_W = P_W';
NPTS = size(P_W,2); %Number of points

%% Visualization
figure;
subplot(1,3,1)
wally = meshgrid(0:0.1:3); 
wallz = meshgrid(-3:0.1:0); 
wallx = 0*ones(size(wallz,1));
surf(wallx, wally, wallz','FaceColor',(1/255)*[97 178 205],'EdgeColor','none') 
hold on
wallx = meshgrid(0:0.1:3); 
wallz = meshgrid(-3:0.1:0); 
wally = 0*ones(size(wallz,1)); 
surf(wallx, wally, wallz','FaceColor',(1/255)*[77 137 157],'EdgeColor','none') 
wallx = meshgrid(0:0.1:3); 
wally = meshgrid(0:0.1:3); 
wallz = zeros(size(wally,1)); % Generate z data
surf(wallx, wally', wallz,'FaceColor',(1/255)*[45 162 200],'EdgeColor','none') 
plot3(P_W(1,:),P_W(2,:),P_W(3,:),'b.','MarkerSize',36);
axis equal;
grid on
axis vis3d;
axis([-3 3 -3 3 -3 3])
grid on
xlabel('x')
ylabel('y')
zlabel('z')

%% Camera Transformation for View 1
ax = 120 * DEG_TO_RAD;
ay = 0 *DEG_TO_RAD;
az = 60 * DEG_TO_RAD;

Rx = [1 0 0;
      0 cos(ax) -sin(ax);
      0 sin(ax) cos(ax)];
Ry = [cos(ay)  0  sin(ay);
           0   1     0;
      -sin(ay) 0  cos(ay)];
Rz = [cos(az) -sin(az) 0;
      sin(az) cos(az)  0;
      0          0     1];
  
Rc1 = Rx*Ry*Rz;
Tc1 = [0;0;5];
M = [Rc1 Tc1];

p1 = K*(M * P_W);
noise1 = 4*rand(3,NPTS)-2;
noise1(3,:)=1;
p1 = p1 + noise1;

u1(1,:) = p1(1,:) ./ p1(3,:);
u1(2,:) = p1(2,:) ./ p1(3,:);
u1(3,:) = p1(3,:) ./ p1(3,:);

for i=1:length(u1)
    x = round(u1(1,i)); y=round(u1(2,i));
    I1(y-2:y+2, x-2:x+2) = 255;
end

subplot(1,3,2), imshow(I1, []), title('View 1', 'FontSize',20);

%% Camera Transformation for View 2
ax = 0 * DEG_TO_RAD;
ay = -25 *DEG_TO_RAD;
az = 0 * DEG_TO_RAD;

Rx = [1 0 0;
      0 cos(ax) -sin(ax);
      0 sin(ax) cos(ax)];
Ry = [cos(ay)  0  sin(ay);
           0   1     0;
      -sin(ay) 0  cos(ay)];
Rz = [cos(az) -sin(az) 0;
      sin(az) cos(az)  0;
      0          0     1];

Rc2c1 = Rx*Ry*Rz;
TrueR = Rc2c1;
Tc2c1 = [3;0;1];
TrueT = Tc2c1;
Hc1 = [Rc1 Tc1; 0 0 0 1];
Hc2c1 = [Rc2c1 Tc2c1; 0 0 0 1];
Hc2 = Hc2c1*Hc1;

Rc2 = Hc2(1:3,1:3);
Tc2 = Hc2(1:3,4);

M = [Rc2 Tc2];

I2 = zeros(L,L);
p2 = K*(M*P_W);

noise2 = 4*rand(3,NPTS)-2;
noise2(3,:)=1;
p2 = p2 + noise2;

u2(1,:) = p2(1,:) ./ p2(3,:);
u2(2,:) = p2(2,:) ./ p2(3,:);
u2(3,:) = p2(3,:) ./ p2(3,:);

for i=1:length(u2)
    x = round(u2(1,i)); y=round(u2(2,i));
    I2(y-2:y+2, x-2:x+2) = 255;
end

subplot(1,3,3), imshow(I2, []), title('View 2', 'FontSize',20);

t = Tc2c1;
T_skew = [0 -t(3) t(2); t(3) 0 -t(1); -t(2) t(1) 0];
Etrue = T_skew*Rc2c1;

%% Displaying the information
disp('u1: Pixel coordinates in view 1')
u1info = ['Size of u1 is ' num2str(size(u1,1)) 'x' num2str(size(u1,2))];
disp(u1info)
disp('u2: Pixel coordinates in view 2')
u2info = ['Size of u2 is ' num2str(size(u2,1)) 'x' num2str(size(u2,2))];
disp(u2info)
disp('-------------')
%% Lab#8 Assignment starts here.
%% Transform pixel coordinates and construct X matrix using Equations 1 and 2

Kinv= inv(K);
x1 = Kinv*u1(:,:);
x2 = Kinv*u2(:,:);

a1 = [x1(1,1)*x2(1,1) x1(1,1)*x2(2,1) x1(1,1)*x2(3,1) x1(2,1)*x2(1,1) x1(2,1)*x2(2,1) x1(2,1)*x2(3,1)...
    x1(3,1)*x2(1,1) x1(3,1)*x2(2,1) x1(3,1)*x2(3,1)]';

a2 = [x1(1,2)*x2(1,2) x1(1,2)*x2(2,2) x1(1,2)*x2(3,2) x1(2,2)*x2(1,2) x1(2,2)*x2(2,2) x1(2,2)*x2(3,2)...
    x1(3,2)*x2(1,2) x1(3,2)*x2(2,2) x1(3,2)*x2(3,2)]';

a3 = [x1(1,3)*x2(1,3) x1(1,3)*x2(2,3) x1(1,3)*x2(3,3) x1(2,3)*x2(1,3) x1(2,3)*x2(2,3) x1(2,3)*x2(3,3)...
    x1(3,3)*x2(1,3) x1(3,3)*x2(2,3) x1(3,3)*x2(3,3)]';

a4 = [x1(1,4)*x2(1,4) x1(1,4)*x2(2,4) x1(1,4)*x2(3,4) x1(2,4)*x2(1,4) x1(2,4)*x2(2,4) x1(2,4)*x2(3,4)...
    x1(3,4)*x2(1,4) x1(3,4)*x2(2,4) x1(3,4)*x2(3,4)]';

a5 = [x1(1,5)*x2(1,5) x1(1,5)*x2(2,5) x1(1,5)*x2(3,5) x1(2,5)*x2(1,5) x1(2,5)*x2(2,5) x1(2,5)*x2(3,5)...
    x1(3,5)*x2(1,5) x1(3,5)*x2(2,5) x1(3,5)*x2(3,5)]';

a6 = [x1(1,6)*x2(1,6) x1(1,6)*x2(2,6) x1(1,6)*x2(3,6) x1(2,6)*x2(1,6) x1(2,6)*x2(2,6) x1(2,6)*x2(3,6)...
    x1(3,6)*x2(1,6) x1(3,6)*x2(2,6) x1(3,6)*x2(3,6)]';

a7 = [x1(1,7)*x2(1,7) x1(1,7)*x2(2,7) x1(1,7)*x2(3,7) x1(2,7)*x2(1,7) x1(2,7)*x2(2,7) x1(2,7)*x2(3,7)...
    x1(3,7)*x2(1,7) x1(3,7)*x2(2,7) x1(3,7)*x2(3,7)]';

a8 = [x1(1,8)*x2(1,8) x1(1,8)*x2(2,8) x1(1,8)*x2(3,8) x1(2,8)*x2(1,8) x1(2,8)*x2(2,8) x1(2,8)*x2(3,8)...
    x1(3,8)*x2(1,8) x1(3,8)*x2(2,8) x1(3,8)*x2(3,8)]';

a9 = [x1(1,9)*x2(1,9) x1(1,9)*x2(2,9) x1(1,9)*x2(3,9) x1(2,9)*x2(1,9) x1(2,9)*x2(2,9) x1(2,9)*x2(3,9)...
    x1(3,9)*x2(1,9) x1(3,9)*x2(2,9) x1(3,9)*x2(3,9)]';

a10 = [x1(1,10)*x2(1,10) x1(1,10)*x2(2,10) x1(1,10)*x2(3,10) x1(2,10)*x2(1,10) x1(2,10)*x2(2,10) x1(2,10)*x2(3,10)...
    x1(3,10)*x2(1,10) x1(3,10)*x2(2,10) x1(3,10)*x2(3,10)]';

%a11 = [x1(1,11)*x2(1,11) x1(1,11)*x2(2,11) x1(1,11)*x2(3,11) x1(2,11)*x2(1,11) x1(2,11)*x2(2,11) x1(2,11)*x2(3,11)...
 %   x1(3,11)*x2(1,11) x1(3,11)*x2(2,11) x1(3,11)*x2(3,11)]';

%a12 = [x1(1,12)*x2(1,12) x1(1,12)*x2(2,12) x1(1,12)*x2(3,12) x1(2,12)*x2(1,12) x1(2,12)*x2(2,12) x1(2,12)*x2(3,12)...
%    x1(3,12)*x2(1,12) x1(3,12)*x2(2,12) x1(3,12)*x2(3,12)]';

%a13 = [x1(1,13)*x2(1,13) x1(1,13)*x2(2,13) x1(1,13)*x2(3,13) x1(2,13)*x2(1,13) x1(2,13)*x2(2,13) x1(2,13)*x2(3,13)...
 %   x1(3,13)*x2(1,13) x1(3,13)*x2(2,13) x1(3,13)*x2(3,13)]';

%a14 = [x1(1,14)*x2(1,14) x1(1,14)*x2(2,14) x1(1,14)*x2(3,14) x1(2,14)*x2(1,14) x1(2,14)*x2(2,14) x1(2,14)*x2(3,14)...
 %   x1(3,14)*x2(1,14) x1(3,14)*x2(2,14) x1(3,14)*x2(3,14)]';

%a15 = [x1(1,15)*x2(1,15) x1(1,15)*x2(2,15) x1(1,15)*x2(3,15) x1(2,15)*x2(1,15) x1(2,15)*x2(2,15) x1(2,15)*x2(3,15)...
 %   x1(3,15)*x2(1,15) x1(3,15)*x2(2,15) x1(3,15)*x2(3,15)]';

%a16 = [x1(1,16)*x2(1,16) x1(1,16)*x2(2,16) x1(1,16)*x2(3,16) x1(2,16)*x2(1,16) x1(2,16)*x2(2,16) x1(2,16)*x2(3,16)...
 %   x1(3,16)*x2(1,16) x1(3,16)*x2(2,16) x1(3,16)*x2(3,16)]';

%a17 = [x1(1,17)*x2(1,17) x1(1,17)*x2(2,17) x1(1,17)*x2(3,17) x1(2,17)*x2(1,17) x1(2,17)*x2(2,17) x1(2,17)*x2(3,17)...
 %   x1(3,17)*x2(1,17) x1(3,17)*x2(2,17) x1(3,17)*x2(3,17)]';

%a18 = [x1(1,18)*x2(1,18) x1(1,18)*x2(2,18) x1(1,18)*x2(3,18) x1(2,18)*x2(1,18) x1(2,18)*x2(2,18) x1(2,18)*x2(3,18)...
  %  x1(3,18)*x2(1,18) x1(3,18)*x2(2,18) x1(3,18)*x2(3,18)]';

%a19 = [x1(1,19)*x2(1,19) x1(1,19)*x2(2,19) x1(1,19)*x2(3,19) x1(2,19)*x2(1,19) x1(2,19)*x2(2,19) x1(2,19)*x2(3,19)...
 %   x1(3,19)*x2(1,19) x1(3,19)*x2(2,19) x1(3,19)*x2(3,19)]';



X = [a1';a2';a3';a4';a5';a6';a7';a8';a9';a10'];


%% Estimate E, cure it and check for Essential Matrix Characterization 

[U,S,V] = svd(X);
Es = V(:,end);
E = [Es(1) Es(4) Es(7); Es(2) Es(5) Es(8); Es(3) Es(6) Es(9)];

[U1,S1,V1] = svd(E);
S1(1,1) = 1;
S1(2,2) = 1;
S1(3,3) = 0;

detU1 = det(U1);
detV1 = det(V1);

if detU1 ~= 1
    disp('det U1 not 1');
end

if detV1 ~= 1
    disp('det V1 not 1');
end
E = U1*S1*V1;
%% Find epipoles and epipolar lines
l1 = E'*x2(:,1);
l2 = E*x1(:,1);

e1 = null(E);
e2 = null(E');

%% Verify epipoles and epipolar lines
c1 = l1'*e1;
c2 = l2'*e2;
if c1 == 0
    disp('l1 e1 verified');
end

if c2 == 0
    disp('l2 e2 verified');
end


%% Recover the rotation and the translation
Rz1 = [0 -1 0;
       1 0 0;
       0 0 1]; % 90 degree

  Rz2 = [0 1 0;
        -1 0 0;
         0 0 1]; % -90 degree
  
T1 = U1*Rz1*S1*U1';
R1 = U1*Rz1'*V1';
T2 = U1*Rz2*S1*U1';
R2 = U1*Rz2'*V1';

T1 = [T1(3,2) ; T1(1,3); T1(2,1)];
T2 = [T2(3,2) ; T2(1,3); T2(2,1)];

%% Compare your results with ground truth
disp('True E =')
disp(Etrue)
disp('Estimated E = ')
% disp(your estimated E variable)
disp(E)

disp('True R =')
disp(TrueR)
disp('Estimated R = ')
% disp(your estimated R variable)
disp(R1)
disp(R2)

disp('True T =')
disp(TrueT)
disp('Estimated T = ')
% disp(your estimated T variable)
disp(T1)
disp(T2)









