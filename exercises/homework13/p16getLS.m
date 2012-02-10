function [ A,b ] = p16getLS( k,f )
% Numerical mathematics for engineers II
% Homework 13
% Programming exercise 16
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

N = 2^k -1;
h = 1/(N+1);
xh = (h:h:1-h)';

A = 1/h^2*gallery('tridiag',N,-1,2,-1);
b = f(xh);

end

