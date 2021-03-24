function output = display_solution(q)
%DISPLAY_SOLUTION Summary of this function goes here
%   Detailed explanation goes here
q = rad2deg(q);
q = wrapTo360(q);
txt = "Solution angles: \newline" ...
    + "q1 = " + q(1) + "\newline" ...
    + "q2 = " + q(2) + "\newline" ...
    + "q3 = " + q(3);
output = text(6, 4, txt);
end

