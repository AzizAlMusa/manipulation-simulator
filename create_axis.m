function [ax,f] = create_axis(fignum)
% Clear out a specified figure and create a clean set of axes in that
% figure with equal-axis aspect ratio
%
% Input:
%
%   fignum: The number of the figure (or a figure handle) in which to
%       create the axes 
%
% Outputs:
%
%   ax: A handle to the created axes
%   f: A handle to the figure that was created

    %%%%%%%
    % Use the 'figure' command to make sure that the figure in the input
    % exists. The output to figure provides a handle to the figure
    f = figure(fignum);
    %%%%%%%
    % Use the 'clf' command with the 'reset' option to clean out any
    % existing contents in the figure. Use the figure handle to make sure
    % that the 'clf' command targets this figure
    clf(f, 'reset');
    
    %%%%%%%
    % Use the 'axes' command to create an axis for plotting. Use the
    % 'Parent' option on axes with the figure handle to make sure that the
    % axes are created in that figure. The output of 'axes' provides a
    % handle to the axis
    ax = axes('Parent', f);
    %%%%%%
    % Use the 'axis' command with the 'equal' option to make sure that all
    % the axes of the plot have the same length scale. Use the handle of
    % the axis to make sure that this action applies to the axis you want
    % it to apply to
    set(gcf,'color','w');
    axis(ax, 'equal');
    axis([-4 ,4, -4, 4, -4, 4]);
    
    view(ax, 3)
    %camorbit(0,120)
    %view(0,10)
    %view(0,90)  % XY
  
    %view(0,0)   % XZ

    view(90,0)  % YZ
    camorbit(0,120)
    
    xlabel('X') 
    ylabel('Y') 
    zlabel('Z')
    set(gcf,'position',[0,0,1920,1080])
    %set(gcf,'position',[0,0,1920,1080])
    %%%%%%
    % Use the 'box' command with the 'on' option to have all edges of the
    % plotting axis marked Use the handle of the axis to make sure that
    % this action applies to the axis you want it to apply to
    box on
    %grid on
    hold all
    
    [X,Y, Z] = cylinder2P(2.1, 40, [-10, 0, 0], [10,0,0]);
    surf(X,Y,Z, 'FaceColor', [0 0.4470 0.7410], 'FaceAlpha', 0.1, 'EdgeColor', 'none');
    

end
