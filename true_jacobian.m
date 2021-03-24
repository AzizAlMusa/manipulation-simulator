function j = true_jacobian(q, L)
%JACOBIAN Summary of this function goes here
%   Detailed explanation goes here

q1 = q(1);
q2 = q(2);
q3 = q(3);

L1 = L{1}(1);
L2 = L{2}(1);
L3 = L{3}(1);
% 
% j = [-l1*sin(q1)-l2*sin(q1+q2), -l2*sin(q1+q2);
%     l1*cos(q1)+l2*cos(q1+q2), l2*cos(q1+q2)];

% j = [-L1*sin(q1)-L2*sin(q1+q2)-L3*sin(q1+q2+q3), -L2*sin(q1+q2)-L3*sin(q1+q2+q3), -L3*sin(q1+q2+q3);
%      L1*cos(q1)+L2*cos(q1+q2)+L3*cos(q1+q2+q3), L2*cos(q1+q2)+L3*cos(q1+q2+q3), L3*cos(q1+q2+q3)]; 
    % 1,                                          1,                               1             ];
    
%%3D Jacobian of lab model

j = [                                       0,         - L3*sin(q2 + q3) - L2*sin(q2),        -L3*sin(q2 + q3);
 -sin(q1)*(L3*sin(q2 + q3) + L2*sin(q2)), cos(q1)*(L3*cos(q2 + q3) + L2*cos(q2)), L3*cos(q2 + q3)*cos(q1);
  cos(q1)*(L3*sin(q2 + q3) + L2*sin(q2)), sin(q1)*(L3*cos(q2 + q3) + L2*cos(q2)), L3*cos(q2 + q3)*sin(q1)];
           
          
% [                            0,               1,  1]
% [                -sin(q2 + q3),               0,  0]
% [                 cos(q2 + q3),               0,  0]
end

