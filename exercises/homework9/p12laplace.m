function p12laplace()
%% Numerical mathematics for engineers II
% Homework 5
% Programming exercise 8
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

maxit=400;
tol=10^(-6);
M=200;
E=speye(M);
T=sparse(gallery('tridiag',M,-1,-4,-1));
b=1/(M+1)^2*ones(M^2,1);
end

