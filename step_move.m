function arm = step_move(arm, nextpoint)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

arm.q = nextpoint;

arm = forward_kinematics(arm);
arm = update_drawing(arm);


end

