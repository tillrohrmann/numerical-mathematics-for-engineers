function p13test( )
% Numerical mathematics for engineers II
% Homework 10
% Programming exercise 13
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

load('p13fem.mat')

N = size(A,1);
x0 = zeros(N,1);
maxit = 300;
tol = 10^-12;

L1 = speye(N);
L2 = spdiags(sqrt(diag(A)),0,N,N);
L3 = cholinc(A,1e-1)';
L4 = cholinc(A,1e-2)';
L5 = cholinc(A,1e-3)';
L6 = cholinc(A,1e-4)';

[x1,r1] = p13pcg(A,b,x0,maxit,tol,L1);
[x2,r2] = p13pcg(A,b,x0,maxit,tol,L2);
[x3,r3] = p13pcg(A,b,x0,maxit,tol,L3);
[x4,r4] = p13pcg(A,b,x0,maxit,tol,L4);
[x5,r5] = p13pcg(A,b,x0,maxit,tol,L5);
[x6,r6] = p13pcg(A,b,x0,maxit,tol,L6);

semilogy(1:size(r1,1),r1,1:size(r2,1),r2,1:size(r3,1),r3,...
    1:size(r4,1),r4,1:size(r5,1),r5,1:size(r6,1),r6);
legend('L1','L2','L3','L4','L5','L6');


end

