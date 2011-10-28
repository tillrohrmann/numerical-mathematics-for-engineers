function [ t ] = p03getPDEType( A, b )
% Numerical Mathematics for Engineers 2
% Homework 2
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% MATLAB
% 
% This functions determines the types of a second order PDE:
% 0 - PDE cannot be classified
% 1 - PDE is elliptic
% 2 - PDE is parabolic
% 3 - PDE is hyperbolic

isZero = @(x) x == 0;
isPositive = @(x) x > 0;
isNegative = @(x) x < 0;

eigenvalues = eig(A);

numZeros = sum(arrayfun(isZero,eigenvalues));
numPositives = sum(arrayfun(isPositive,eigenvalues));
numNegatives = sum(arrayfun(isNegative,eigenvalues));

numberEigenvalues = size(A,2);

t = 0;

if(numPositives == numberEigenvalues || numNegatives == numberEigenvalues)
    t = 1;
elseif((numPositives == numberEigenvalues-1 && numNegatives == 1) || (numNegatives == numberEigenvalues-1 && numPositives == 1))
    t = 3;
elseif(numZeros == 1 && (numPositives == numberEigenvalues -1 || numNegatives == numberEigenvalues -1) && rank([A,b]) == numberEigenvalues)
    t = 2;
end

end

