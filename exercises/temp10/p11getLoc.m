function [ elS, elM, elfh ] = p11getLoc( pt, c, f)
% Numerical mathematics for engineers II
% Homework 8
% Programming exercise 11
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

global params;

P = [ones(1,size(pt,2)); pt];
invP = inv(P);
Q = invP(:,2:end);
detP = det(P);
elS = Q*Q'*detP/params.fac;

if (params.dim == 3)
    elM = c*detP/60*...
        [1, 1/2, 1/2, 1/2;...
        1/2, 1, 1/2, 1/2;...
        1/2, 1/2, 1, 1/2;...
        1/2, 1/2, 1/2,1];
elseif (params.dim == 2)
    elM = c*detP*[1/12,1/24,1/24;...
        1/24,1/12,1/24;...
        1/24,1/24,1/12];
else
    error = MException('Dim %s is not supported yet',dim);
    throw(error);
end

value = detP/24*f(pt*[1/4;1/4;1/4;1/4]);
elfh = zeros(size(pt,2),1)+value;

end

