function [ b ] = p11getBoundDOFs( p, e )
% Numerical mathematics for engineers II
% Homework 8
% Programming exercise 8
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

tempB = zeros(size(p,2),1);

for col=1:size(e,2)
    for el=1:size(e,1)
        tempB(e(el,col)) = 1;
    end
end
b = sparse(tempB);

end

