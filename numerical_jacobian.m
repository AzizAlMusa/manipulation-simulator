function arm = numerical_jacobian(arm)
%NUMERICAL_JACOBIAN Summary of this function goes here
%   Detailed explanation goes here


num_links = length(arm.L);
fx = arm.g(1,4);
fy = arm.g(2,4);
fz = arm.g(3,4);
f = [fx;fy;fz];

dq = 0.001;


if arm.contrainPose
    dim = 4;
else 
    dim = 3;
   
end
arm.J = zeros(dim,num_links );

arm1 = arm;
for i=1:num_links
    arm1.q(i) = arm1.q(i) + dq;
    arm1 = forward_kinematics(arm1);
    
    fx1 = arm1.g(1,4);
    fy1 = arm1.g(2,4);
    fz1 = arm1.g(3,4);
    f1 = [fx1 ; fy1 ; fz1];
    arm.J(1:3,i) = f1 - f;
    if dim >=4
        if arm.rot{i} == 'x'
            %arm.J(4,i) = 1;
        elseif arm.rot{i} == 'y'
            %arm.J(5,i) = 1;
        else
            arm.J(4,i) = 1;
        end
    end
    
    arm1 = arm;
    
    
end

arm.J = 1/dq * arm.J;

end

