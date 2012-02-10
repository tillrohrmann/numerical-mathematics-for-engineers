function [ Romega, omegaMb ] = p16getRomega( A,b,omega )
% Numerical mathematics for engineers II
% Homework 13
% Programming exercise 16
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

%Jacobi iteration matrix
diagA = diag(A);
m = size(A,1);
n = size(A,2);
M = spdiags(diagA,0,m,n);
invM = spdiags(1./diagA,0,m,n);
N = M - A;

Romega = omega*invM*N+(1-omega)*speye(m,n);
omegaMb = omega*invM*b;

end

