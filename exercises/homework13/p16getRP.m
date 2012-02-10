function [Rk,Pk] = p16getRP(k)
% Numerical mathematics for engineers II
% Homework 13
% Programming exercise 16
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

m = 2^(k-1)-1;
n = 2^(k)-1;

rows = kron(ones(3,1),(1:m)');
columns = [(1:2:n-2)';(2:2:n-1)';(3:2:n)'];
values = kron([1/4;1/2;1/4],ones(m,1));

Rk=sparse(rows,columns,values,m,n);

Pk = 2*transpose(Rk);