function output = draw_target(desired_pos)
%DRAW_TARGET Summary of this function goes here
%   Detailed explanation goes here
txt = "x = " + desired_pos(1) + "\newliney = " + desired_pos(2) + "\newlinez = " + desired_pos(3);
text(-4.5, 4.5, txt);

scatter3(desired_pos(1), desired_pos(2), desired_pos(3), 'MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm');
end

