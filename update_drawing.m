function arm = update_drawing(arm)
%UPDATE_DRAWING Summary of this function goes here
%   Detailed explanation goes here
    pause(0.0001);
    
    for i=1:numel(arm.graphics)
        delete(arm.graphics{i});
    end

    arm.graphics = draw_links(arm);
end

