function [ Lh] = p15getLS( a,b,c,h)
% Numerical mathematics for engineers II
% Homework 12
% Programming exercise 15
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
% Matlab

n = 1/h -1;

A = 1/h^2*gallery('tridiag',n,-1,2,-1);
B = 1/h*gallery('tridiag',n,-1,1,0);
C = speye(n,n);

Lh = a*A + b*B + c*C;     

end
