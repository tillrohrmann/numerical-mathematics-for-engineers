function p13test( )
%% Numerical mathematics for engineers II
% Homework 10
% Programming exercise 13
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab
load p13fem.mat
N=size(A,1);
x0=zeros(N,1);
maxit=300;
tol=10^(-12);

L1=speye(N);
[ xj,r2uL1 ] = p13pcg( A,b,x0,maxit,tol,L1 );

L2=spdiags(sqrt(diag(A)),0,N,N);
[ xj,r2uL2 ] = p13pcg( A,b,x0,maxit,tol,L2 );

L3=cholinc(A,0.1);
[ xj,r2uL3 ] = p13pcg( A,b,x0,maxit,tol,L3 );

L4=cholinc(A,0.01);
[ xj,r2uL4 ] = p13pcg( A,b,x0,maxit,tol,L4 );

L5=cholinc(A,0.001);
[ xj,r2uL5 ] = p13pcg( A,b,x0,maxit,tol,L5 );

L6=cholinc(A,0.0001);
[ xj,r2uL6 ] = p13pcg( A,b,x0,maxit,tol,L6 );

semilogy(1:size(r2uL1,2),  r2uL1 ,1:size(r2uL2,2) , r2uL2, 1:size(r2uL3,2) , r2uL3 , 1:size(r2uL4,2) , r2uL4 , 1:size(r2uL5,2) , r2uL5 , 1:size(r2uL6,2) , r2uL6 )
title('Relativ euclidean norm for different preconditioners') 
legend('L1','L2','L3','L4','L5','L6')




end

