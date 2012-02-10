function [ xj, resvec ] = p16jacobi( A, b, x0, omega, tol, maxit )
% Numerical mathematics for engineers II
% Homework 13
% Programming exercise 16
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

[Romega, omegaMb] = p16getRomega(A,b,omega);

xj = x0;
normb = norm(b);

resvec(1) = norm(b-A*xj)/normb;

for j = 1:maxit
    xj = Romega*xj+omegaMb;

    value = norm(b-A*xj)/normb;
    resvec(j+1) = value;
    
    if value < tol
        break;
    end
end

end

