function [gy] = transform_y(angle, translation)
%Provides a homogenous transformation given a angle and
%translation vector

%Input:
%angle to rotate around the Z axis
%translation as a 3x1 vector [ x; y; z]

q = angle; 

gy = [cos(q)  0      -sin(q) translation(1);
      0       1      0       translation(2);
      sin(q)  0      cos(q)  translation(3);
      0       0      0      1];

end