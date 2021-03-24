ax = create_axis(1);
q = [0, 30, 0]';
L1 = [1, 0, 0];
L2 = [2, 0, 0];
L3 = [1, 0, 0];
L = {L1, L2, L3};


[g, tmap] = forward_kinematics(q, L);

[X1, Y1, Z1] = cylinder(0.1);
[X2, Y2, Z2] = cylinder(0.1);
[X3, Y3, Z3] = cylinder(0.1);

Z1 = Z1 * 1;
Z2 = Z2 * 2;
Z3 = Z3 * 2;

orig = size(X1);
correct1 = transform_y(90, [0, 0, 0]);
correct2 = transform_y(90, [1, 0, 0]);
correct3 = transform_y(90, [1, 0, 0]);

H1 =  [reshape(X1, 1, []); reshape(Y1, 1, []) ;reshape(Z1, 1, [])];
ONE = ones(1, size(H1,2));
H1 = [H1; ONE];

H2 =  [reshape(X2, 1, []); reshape(Y2, 1, []) ;reshape(Z2, 1, [])];
H2 = [H2; ONE];


H3 =  [reshape(X3, 1, []); reshape(Y3, 1, []) ;reshape(Z3, 1, [])];
H3 = [H3; ONE];


H1 = correct1*H1;
H1 = tmap{1}*H1;
X1 = reshape(H1(1,:), 2, 21);
Y1 = reshape(H1(2,:), 2, 21);
Z1 = reshape(H1(3,:), 2, 21);

H2 = correct2*H2;
H2 = tmap{2}*H2;
X2 = reshape(H2(1,:), 2, 21);
Y2 = reshape(H2(2,:), 2, 21);
Z2 = reshape(H2(3,:), 2, 21);

H3 = correct3*H3;
H3 = tmap{3}*H3;
X3 = reshape(H3(1,:), 2, 21);
Y3 = reshape(H3(2,:), 2, 21);
Z3 = reshape(H3(3,:), 2, 21);

link1 = surf(X1,Y1,Z1, 'FaceColor', 'r');
hold all
link2 = surf(X2,Y2,Z2, 'FaceColor', 'g');
link3 = surf(X3,Y3,Z3, 'FaceColor', 'b');


