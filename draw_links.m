function [link_lines] = draw_links(arm)
%Provides handles to lines for a link chain

%Input:
%tmap - the transformation for each respective link the world frame
%ax - axis to be drawn on
    tmap = arm.tmap;
    ax = arm.ax;
    colors = {[0,0,0] , 1/255*[71, 0, 163], 1/255*[128, 43, 240],  1/255*[240, 236, 43], 'r', 'b'};
       
    tmap = [{transform_z(0,[0;0;0])}, tmap];
    link_lines = cell(size(tmap)+3);
    
    for i=1:numel(tmap)-1
         end_points = [tmap{i}(1:3,4)' ; tmap{i+1}(1:3,4)'];
        %link_lines{i} = line('x', end_points(:,1), 'y', end_points(:,2), 'z',end_points(:,3), 'Parent', ax, 'Linestyle', '-', 'Marker', 'o', 'Color', colors{i});
        [X,Y,Z]=cylinder2P(0.08, 8 , end_points(1,:), end_points(2,:));
% 
%         
%         [U,V,W] = sphere;
%         
%         U = U*0.1 + end_points(2,1);
%         V = V*0.1 + end_points(2,2);
%         W = W*0.1 + end_points(2,3);
%         
        link_lines{i} = surf(X,Y,Z, 'FaceColor', colors{i});
%         link_lines{2*i} = surf(U,V,W);
    end
%         x_axis = end_points(2,:) - end_points(1,:);
%         x_axis = end_points + 0.35*x_axis./vecnorm(x_axis);
%         H = eye(4,4);
%         H(1:3,4) = tmap{end}(1:3,4);
        T = tmap{end};
        final = end_points(2,:) + 0.35*T(1:3,1)';
        x_axis = [end_points ; final];
        
         final = end_points(2,:) + 0.35*T(1:3,2)';
        y_axis = [end_points ; final];
        
         final = end_points(2,:) + 0.35*T(1:3,3)';
        z_axis = [end_points ; final];
        
        link_lines{end} = line('x', x_axis(:,1), 'y', x_axis(:,2), 'z',x_axis(:,3), 'Parent', ax, 'Linestyle', '-', 'LineWidth', 2, 'Color', 'r');
        link_lines{end-1} = line('x', y_axis(:,1), 'y', y_axis(:,2), 'z',y_axis(:,3), 'Parent', ax, 'Linestyle', '-', 'LineWidth', 2, 'Color', 'g');
        link_lines{end-2} = line('x', z_axis(:,1), 'y', z_axis(:,2), 'z',z_axis(:,3), 'Parent', ax, 'Linestyle', '-', 'LineWidth', 2, 'Color', 'b');
end

