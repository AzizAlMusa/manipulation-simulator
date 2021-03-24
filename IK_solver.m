function arm = IK_solver(arm, desired_pos, alpha)
%IK_SOLVER Summary of this function goes here
%   Detailed explanation goes here
 
 arm = forward_kinematics(arm);
 %current_pos = [tform2vec(arm.g) ; arm.q(2) + arm.q(3) + arm.q(4)];
 %current_pos = [current_pos;sum(q)];
 arm = get_current_pose(arm);

 grad = pinv(arm.J)*(desired_pos-arm.current_pos);
 arm.q = arm.q + alpha*grad;
 
 
 
 
end

