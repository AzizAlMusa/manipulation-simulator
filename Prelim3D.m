syms q1 q2 q3 L1 L2 L3

vbase = [0; 0 ; 0];
v1 = [L1; 0; 0];
v2 = [L2; 0; 0];
v3 = [L3; 0; 0];

Tbase = transform_z(q1, vbase);
T1 = transform_z(q2, v1);
T2 = transform_z(q3, v2);
T3 = transform_z(0, v3);

transformations = {Tbase, T1, T2, T3};
tmap = transform_map(transformations);
g = simplify(tmap{end});

%e1 = simplify((vectorize_matrix(inv(g)*simplify(diff(g, q1)))))
%e2 = simplify((vectorize_matrix(inv(g)*simplify(diff(g, q2)))))
%e3 = simplify((vectorize_matrix(inv(g)*simplify(diff(g, q3)))))

e1 = simplify(diff(g(1:3,4),q1));
e2 = simplify(diff(g(1:3,4),q2));
e3 = simplify(diff(g(1:3,4),q3));



J = [e1, e2, e3]

