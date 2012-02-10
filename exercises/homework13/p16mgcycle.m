function xj = p16mgcycle(A,b,x0,k,kmin,gamma,m1,m2,omega,tol)
% Numerical mathematics for engineers II
% Homework 13
% Programming exercise 16
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

if k > kmin 
    [Rk Pk] = p16getRP(k);
    xj = p16jacobi(A,b,x0,omega,tol,m1);
    d = b-A*xj;
    dcoarse = Rk*d;
    Acoarse = Rk*A*Pk;
    N = 2^(k-1)-1;
    ycoarse = zeros(N,1);
    
    for j =1:gamma
        ycoarse = p16mgcycle(Acoarse,dcoarse,ycoarse,k-1,kmin,gamma,m1,m2,omega,tol);
    end
    xj = xj +Pk*ycoarse;
    xj = p16jacobi(A,b,xj,omega,tol,m2);
else
    xj = A\b;
end