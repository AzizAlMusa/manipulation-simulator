[ax, f] = create_axis(1);
button = 1;
q = [10, 10, -20]';

while sum(button) <=3   % read ginputs until a mouse right-button occurs
    [x,y, button] = ginput(1);
    %theta = 90;
    desired_pos = [x,y]'%, theta]';
    q = arm_solve(desired_pos, q);
end


function q = arm_solve(desired_pos, q )
[ax, f] = create_axis(1);
path = [];

txt = "x = " + desired_pos(1) + "\newliney = " + desired_pos(2);
text(-4.5, 4.5, txt);

scatter(desired_pos(1), desired_pos(2), 'MarkerEdgeColor', 'm', 'MarkerFaceColor', 'm');

[g, tmap] = forward_kinematics(q);
draw_bound();

J = true_jacobian(q, [2, 2, 1]);
link_lines = draw_links(tmap, ax);
current_pos = tform2vec(g);
%current_pos = [current_pos;sum(q)];
%grad = J'*(current_pos-desired_pos);
alpha = 1;


%stepsize = 0.1;
%traj = discretizeLine(current_pos', desired_pos', stepsize);
%target = traj(2,:);
%k=2;

% th = 0: pi/50: 2*pi;
% x = 3*cos(th);
% y = 3*sin(th);
% trajec = [x' y'];
% 
% k = 1;
% desired_pos = trajec(k,:)';
% plot(trajec(:,1), trajec(:,2),'--r');

error = (desired_pos-current_pos);

while norm(error)>10^-2
    
    
    J = true_jacobian(q, [2, 2, 1]);
    
    [g, tmap] = forward_kinematics(q);
    
    current_pos = tform2vec(g);
    %path = [path current_pos];
    %current_pos = [current_pos;sum(q)];
    error = (desired_pos-current_pos);
    path = draw_trajectory(path,current_pos, ax);
    [q, grad] = IK_solver(q, desired_pos, J, alpha);
    link_lines = update_drawing(link_lines,tmap, ax);
    
    
    
end

output = display_solution(q);





end




