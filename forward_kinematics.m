function arm = forward_kinematics(arm)

V = cell(1, numel(arm.L) + 1);
transformations  = cell(size(V));

V{1} = [0; 0 ; 0];

for i=2:numel(V)
    
    V{i} = arm.L{i-1};
    
end


for i=1:numel(transformations)
    %check whether its that last joint
    if i == numel(transformations)
        transformations{i} = transform_z(0, V{i});
    
    else
        
        if arm.rot{i} == 'x'
            transformations{i} = transform_x(arm.q(i), V{i});
        elseif arm.rot{i} == 'y'
            transformations{i} = transform_y(arm.q(i), V{i});
        else
            transformations{i} = transform_z(arm.q(i), V{i});
        end
        
    
    end
end

% Tbase = transform_x(arm.q(1), vbase);
% T1 = transform_z(arm.q(2), v1);
% T2 = transform_z(arm.q(3), v2);
% T3 = transform_z(0, v3);
% 
% transformations = {Tbase, T1 , T2, T3};
arm.tmap = transform_map(transformations);
arm.g = arm.tmap{end};

end

