function [ Lh ] = p10getLS( G, c )
% Numerical mathematics for engineers II
% Homework 5
% Programming exercise 8
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

h = G(2:end) - G(1:end-1);

X = -1./h(2:end-1) + c/6*h(2:end-1);
Y = 1./h(1:end-1)+1./h(2:end) + c/3*h(1:end-1)+c/3*h(2:end);

Lh = gallery('tridiag',X,Y,X);

end

