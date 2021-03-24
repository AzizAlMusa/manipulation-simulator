%% CIRCLE
% th = 0:pi/50:2*pi;
% y = 2*cos(th);
% z = 2*sin(th);
% x = ones(size(z))*3;
% plot3(x,y,z, '--m')

%% HEART 
% t = -3:0.1:3;
% y = 1/15*16*(sin(t)).^3;
% z = 1/15*(15*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t));
% x = ones(size(z))*3;
% plot3(x,y,z, '--m')

%% Spiral
% th = 0:pi/50:3*pi;
% t = linspace(1,3,length(th));
% y = 2*cos(th);
% z = 2*sin(th);
% x = t;
% plot3(x,y,z)

%% MESH

% y = [-2:0.5:2];
% z = [-2:0.5:2];
% [Y,Z] = meshgrid(y,z);
% X1 = ones(size(Y));
% X2 = ones(size(Y))*1.5;
% 
% Y = reshape(Y,1, numel(Y));
% Z = reshape(Z,1, numel(Z));
% X1 = reshape(X1, 1, numel(X1));
% X2 = reshape(X2, 1, numel(X2));
% 
% Y = [Y(:), Y(:)].';
% Y = [Y(:)];
% 
% Z = [Z(:), Z(:)].';
% Z = [Z(:)];
% 
% X = [X1(:), X2(:)].';
% X = [X(:)];
% 
% plot3(X, Y, Z)

%% Modify Pose Angle at the same point

pos = ones(3,20).*[4; 0 ; 4];

angle = linspace(0,pi, length(pos));

trajectory = [pos ; angle];
%% 

th = 0:pi/50:6*pi;
t = linspace(1.5, 3, length(th));
y = t.*cos(th);
z = t.*sin(th);
x = ones(size(z))*1.5;
plot3(x,y,z, '--m')

angle = ones(1, length(th))*deg2rad(90);
trajectory = [x; y; z;  angle];

% pos = ones(3,20).*[2; 2 ; 2];
% 
% angle = linspace(0,pi, length(pos));
% 
% trajectory = [pos ; angle];

% trajectory = trajectory(:,1);
% 
% trajectory = [1.5;  0 ; 1.5 ; deg2rad(90)];

%% Sinusoidal Radial Scan
% 
% th = 0:pi/50:2*pi;
% t = linspace(1,3,length(th));
% y = 2*cos(th);
% z = 2*sin(th);
% x = 0.5*sin(12*th) + 2;
% 
% angle = ones(1, length(th))*deg2rad(90);
% trajectory = [x; y; z ;  angle];
% 
% plot3(x,y,z, '--m');

%% Sinusoidal Planar Scan

% th = 0:pi/50:2*pi;
% t = linspace(-2,2,length(th));
% c = ones(1, length(th))*3;
% y = t;
% z = 1.5*sin(5*th);
% x = c;
% 
% 
% th = 0:pi/50:2*pi;
% t = linspace(-2,2,length(th));
% c = ones(1, length(th))*3;
% y = [y 1.5*sin(5*th)];
% z = [z t]; 
% x = [x c];
% 
% angle = ones(1, length(x))*deg2rad(90);
% trajectory = [x; y; z]; %;  angle];
% 
% plot3(x,y,z, '--m');


% th = 0:pi/50:2*pi;
% t = linspace(1,3,length(th));
% y = 2*cos(th);
% z = 2*sin(th);
% x = 1*sin(12*th) + 1;
% 
% angle = ones(1, length(th))*deg2rad(90);
% trajectory = [x; y; z;  angle];
% 
% plot3(x,y,z, '--m');