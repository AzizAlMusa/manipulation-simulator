function solution = arm_solve_backend(GUI_axes)



L1 = [1, 0, 0];
L2 = [2, 0, 0];
L3 = [1, 0, 0];
L4 = [1, 0, 0];
L5 = [0, 0, 0];
L = {L1, L2, L3, L4};

arm.q = [0, 0, 0, 0]';
arm.rot = {'x', 'z', 'z', 'z'};
arm.L = L;
arm.ax = GUI_axes;
arm.graphics = {};
arm = forward_kinematics(arm);
arm.contrainPose = true;

%% trajectory
% 
th = 0:pi/50:2*pi;
t = linspace(1,3,length(th));
y = 2*cos(th);
z = 2*sin(th);
x = 0.5*sin(12*th) + 2;

angle = ones(1, length(th))*deg2rad(90);
trajectory = [x; y; z ;  angle];

plot3(GUI_axes, x,y,z, '--m');

% pos = ones(3,20).*[2; 0 ; -2];
% 
% angle = linspace(0,pi, length(pos));
% 
% trajectory = [pos ; angle];
%plot3(pos', '--m');

%% solve

solution = move(arm, trajectory);


    
end