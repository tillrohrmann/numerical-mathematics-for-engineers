function [ y ] = p10evalBasis( x,i,G )
% Numerical mathematics for engineers II
% Homework 5
% Programming exercise 8
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

xstart = G(i);
xmiddle = G(i+1);
xend = G(i+2);

y = ((x < xmiddle).*(x-xstart)/(xmiddle-xstart) + ...
    (x >= xmiddle).*(xend-x)/(xend-xmiddle)) .*( (x > xstart) .*( x < xend)); 

end

