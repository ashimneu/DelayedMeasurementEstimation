clear; clc;

% P_z = diag(randi([5 10],3,1));
m = rand(3,3); 
M = m'*m;
P_z = [2 0 0; 0 4 0; 0 0 8];
posDef = @(A) ~(any(any(jordan(A)<0))); % check if mtx is positive definite(p.d.), 1- p.d., 0 - not p.d.
real_eig = isreal(jordan(M));
while ~posDef(M) || ~isreal(jordan(M))% recompute if M has negative 
    m = rand(3,3);
    M = m'*m;
end
P_x = M*P_z;
E_P = chol(P_x);
xest = E_P*randn(3,1);

[V,J] = jordan(P_x);