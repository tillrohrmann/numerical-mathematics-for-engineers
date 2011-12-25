function [ elS, elM, elfh ] = p11getLoc( pt, c, f)
% Numerical mathematics for engineers II
% Homework 8
% Programming exercise 11
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

P = [ones(1,size(pt,2)); pt];
invP = inv(P);
Q = invP(:,2:end);
detP = det(P);
elS = Q*Q'*detP/factorial(size(pt,1));

tempElM = p11getElM(size(pt,1));
elM = c*detP*tempElM;

value = 1/6*detP*1/4*f(pt*[1/4;1/4;1/4;1/4]);
elfh = ones(size(pt,2),1)*value;

end

