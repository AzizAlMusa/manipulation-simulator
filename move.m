function [path_solution] = move(arm,trajectory, varargin)
%INPUTS

p = inputParser;

defaultInterpolation = 'linear';
validInterpolations = {'linear','quadratic','spline','quintic'};
checkInterpolation = @(x) any(validatestring(x,validInterpolations));

defaultInverseKineSolver = 'jacobian';
validSolvers = {'jacobian','CCD', 'FABRIK'};
checkSolvers = @(x) any(validatestring(x,validSolvers));

defaultShow = 'on';
validShow = {'on','off'};
checkShow = @(x) any(validatestring(x,validShow));

addRequired(p,'arm');
addRequired(p,'trajectory');
addParameter(p,'interpolation',defaultInterpolation, checkInterpolation)
addParameter(p,'solver',defaultInverseKineSolver,checkSolvers)
addParameter(p,'view',defaultShow,checkShow)

path_solution = [];
%% Get Initial Conditions

arm = forward_kinematics(arm);
arm.graphics = draw_links(arm);

%%
%myVideo = VideoWriter('Sim Example', 'Uncompressed AVI'); %open video file

%myVideo.FrameRate = 60;  %can adjust this, 5 - 10 works well for me
%myVideo.Quality = 100;  %can adjust this, 5 - 10 works well for me
%open(myVideo)
%% Calculate 

%For each point on the trajectory get the inverse kinematics
for n=1:size(trajectory,2)
    desired_pos = trajectory(:,n);
    [arm, sol] = get_IK(arm, desired_pos);
    path_solution = [path_solution sol];
   
    % Once a solution is found move the arm  with the interpolation 
     for i=1:size(sol,2)
        
        nextpoint = sol(:,i);
        arm = step_move(arm, nextpoint);
        
%         path_next = forward_kinematics(q,L);
%         path = [path path_next(1:3,4)];
%         delete(current_path);
%         current_path = plot3(path(1,:), path(2,:), path(3,:), 'b');
       % frame = getframe(gcf); %get frame
       % writeVideo(myVideo, frame);
    end
end

%close(myVideo)
end

