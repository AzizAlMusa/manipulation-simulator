[ax, f] = create_axis(1);
button = 1;
q = [10, 10, -20]';

while sum(button) <=3   % read ginputs until a mouse right-button occurs
    [x,y, button] = ginput(1);
    desired_pos = [x,y]';
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

alpha = 1;




th = 0: pi/50: 2*pi;
x = 3*cos(th);
y = 3*sin(th);
trajec = [x' y'];

k = 1;
desired_pos = trajec(k,:)';
plot(trajec(:,1), trajec(:,2),'--r');
while true
error = (desired_pos-current_pos);

    while norm(error)>10^-1

    
        J = true_jacobian(q, [2, 2, 1]);

        [g, tmap] = forward_kinematics(q);

        current_pos = tform2vec(g);
        error = (desired_pos-current_pos);
        draw_trajectory(path,current_pos);
        [q, grad] = IK_solver(q, desired_pos, J, alpha);
        link_lines = update_drawing(link_lines,tmap, ax);



    end
    
    output = display_solution(q);
    delete(output);
    if k<length(trajec)
        k = k + 1;
    else
        k = 1;
    end
    
    desired_pos = trajec(k,:)';
    
    
    
end

end


