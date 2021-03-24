function arm = get_current_pose(arm)
%GET_RESULTANT_ANGLE Summary of this function goes here
%   Detailed explanation goes here
if arm.contrainPose
    arm.current_pos = zeros(4,1);
    arm.current_pos(1:3) = tform2vec(arm.g);
    
    for i=1:length(arm.q)
       if arm.rot{i} == 'x'
           %
       elseif arm.rot{i} == 'y'

           %
       else
           arm.current_pos(4) = arm.current_pos(4) + arm.q(i);

       end
    end
else
    arm.current_pos = zeros(3,1);
    arm.current_pos(1:3) = tform2vec(arm.g);
end
end

