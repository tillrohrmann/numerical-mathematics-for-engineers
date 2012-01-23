function [ xj, r2u ] = p13pcg( A, b, x0, maxit, tol, L )
% Numerical mathematics for engineers II
% Homework 10
% Programming exercise 13
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

r0 = b- A*x0;
ztemp = L\r0;
z0 = L'\ztemp;
p = z0;

rold = r0;
zold = z0;
r2utemp = zeros(maxit,1);
xj = x0;
nr0 = sqrt(r0'*r0);

for j = 0:maxit
    Ap = A*p;
    gamma = (rold'*zold)/(p'*Ap);
    xj = xj + gamma*p;
    rnew = rold - gamma*Ap;
    nrnew = sqrt(rnew'*rnew);
    r2utemp(j+1) = nrnew/nr0;
    if nrnew/nr0 < tol
        r2u = r2utemp(1:j+1,1);
        return;
    end
    ztemp = L\rnew;
    znew = L'\ztemp;
    beta = rnew'*znew/(rold'*zold);
    p = znew + beta*p;
    
    zold = znew;
    rold = rnew;
end

r2u = r2utemp;


end

