function [ elM ] = p11getElM( dim )
% Numerical mathematics for engineers II
% Homework 8
% Programming exercise 11
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

if (dim == 3)
    elM = 1/60*...
        [1, 1/2, 1/2, 1/2;...
        1/2, 1, 1/2, 1/2;...
        1/2, 1/2, 1, 1/2;...
        1/2, 1/2, 1/2,1];
elseif (dim == 2)
    elM = [1/12,1/24,1/24;...
        1/24,1/12,1/24;...
        1/24,1/24,1/12];
else
    error = MException('Dim %s is not supported yet',dim);
    throw(error);
end

end

