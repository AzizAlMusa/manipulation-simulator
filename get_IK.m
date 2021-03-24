function [arm, sol] = get_IK(arm, desired_pos)

%calculate initial conditions
arm = forward_kinematics(arm);
arm = numerical_jacobian(arm);

%resultant angles in case of constrained pose
arm = get_current_pose(arm);

%calculate trajectory - (currently linear)
n = 3;
t = linspace(0, 1, n);
%this is a nx3 matrix where each row is a point on the line path
traj =(1-t).*arm.current_pos + t.*desired_pos;

%draw robot




%set learning rate
alpha = 1;
sol = [];


for i=1:size(traj, 2)
    
    %calculate error
    desired_pos = traj(:, i);
    error = (desired_pos-arm.current_pos);
    
    %loop to get to converge to a point in the workspace
    while norm(error)>10^-2
        error
        arm = numerical_jacobian(arm);
        %M = true_jacobian(q, L)

        arm  = forward_kinematics(arm);

        arm = get_current_pose(arm); %current_pos = [tform2vec(arm.g) ; arm.q(2) + arm.q(3) + arm.q(4)]

        error = (desired_pos-arm.current_pos);
        %path = draw_trajectory(path,current_pos, ax);
        arm  = IK_solver(arm, desired_pos, alpha);
        %link_lines = update_drawing(link_lines,tmap, ax);



    end
    
    sol = [sol, arm.q];
    %output = display_solution(q);

end

end

