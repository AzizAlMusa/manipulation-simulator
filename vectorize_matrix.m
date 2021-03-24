function V = vectorize_matrix(g)
%VECTORIZE_MATRIX Summary of this function goes here
%   Detailed explanation goes here
V = sym(zeros(6,1));

V(1) = g(1,4);
V(2) = g(2,4);
V(3) = g(3,4);

V(4)= -g(1,2);
V(5)= g(1,3);
V(6)= -g(2,3);
end

