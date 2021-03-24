function [gz] = transform_z(angle, translation)
%Provides a homogenous transformation given a angle and
%translation vector

%Input:
%angle to rotate around the Z axis
%translation as a 3x1 vector [ x; y; z]

q = angle;

gz = [cos(q) -sin(q) 0 translation(1);
      sin(q) cos(q)  0 translation(2);
      0      0       1 translation(3);
      0      0       0 1];

end

