function p16test
% Numerical mathematics for engineers II
% Homework 13
% Programming exercise 16
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

f =@(x) 12*x.^2.*sin(pi*x)+8*x.^3.*cos(pi*x)*pi-x.^4.*sin(pi*x)*pi^2;
u = @(x) -x.^4.*sin(pi*x);

k = 14;
kmin = 4;
xi = zeros(2^k-1,1);
h = 1/2^k;
gamma = 1;
m1 =5;
m2 = m1;
omega = 2/3;
tol=1e-12;

xh = (h:h:1-h)';
uh = u(xh);

cycles=20;

errors = zeros(cycles,1);
residuals = zeros(cycles,1);

[A b] = p16getLS(k,f);

for i=1:cycles
    xi = p16mgcycle(A,b,xi,k,kmin,gamma,m1,m2,omega,tol);
    residual = b-A*xi;
    error = uh - xi;
    
    errors(i) = norm(error,'inf');
    residuals(i) = norm(residual,'inf');
end

semilogy(1:cycles,residuals,1:cycles,errors);
legend('residuals','errors');
title('Residuals and errors of multi-grid jacobi method');

drawnow;