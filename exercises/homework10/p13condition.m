function [ con ] = p13condition( )
% Numerical mathematics for engineers II
% Homework 10
% Programming exercise 13
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

load('p13fem.mat');

N = size(A,1);

L1 = speye(N);
L2 = spdiags(sqrt(diag(A)),0,N,N);
L3 = cholinc(A,1e-1)';
L4 = cholinc(A,1e-2)';
L5 = cholinc(A,1e-3)';
L6 = cholinc(A,1e-4)';

con(1,1) = kappa(inv(L1*L1')*A);
con(2,1) = kappa(inv(L2*L2')*A);
con(3,1) = kappa(inv(L3*L3')*A);
con(4,1) = kappa(inv(L4*L4')*A);
con(5,1) = kappa(inv(L5*L5')*A);
con(6,1) = kappa(inv(L6*L6')*A);

% It can be said about the relation between the condition number and the
% speed of convergence, that the pcg method converges faster if the
% condition number of the preconditioned matrix is smaller.

end

