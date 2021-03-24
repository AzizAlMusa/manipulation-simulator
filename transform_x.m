function [gx] = transform_x(angle, translation)
%Provides a homogenous transformation given a angle and
%translation vector

%Input:
%angle to rotate around the Z axis
%translation as a 3x1 vector [ x; y; z]

q = angle;

gx = [1 0       0        translation(1);
      0 cos(q) -sin(q)   translation(2);
      0 sin(q)  cos(q)   translation(3);
      0      0       0   1];

end

