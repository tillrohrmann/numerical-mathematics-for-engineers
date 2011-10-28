function [ Ah fh ] = p04getLS( p )
% Numerical Mathematics for Engineers 2
% Homework 2
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
% This functions calculates the left hand side matrix Ah and the right hand
% side fh of the discretization of
% -u'' - 3u' + u = -2 + 10x^2 - x^3 \Omega = (0,1)
% u(0) = u(1) =0
% h = (2^p + 1)^-1

alpha=0;
beta=0;
h = (2^p+1)^-1;
n = 2^p;
x = h:h:n*h;
a = @(x) 1;
b = @(x) -3;
c = @(x) +1;
f = @(x) -2 + 10*x.^2 - x.^3;
i = 1:n;
A = sparse(i,i,a(x),n,n);
B = sparse(i,i,b(x),n,n);
C = sparse(i,i,c(x),n,n);

Ah = 1/h^2*A*gallery('tridiag',n,-1,2,-1) + 1/(2*h)*B*gallery('tridiag',n,-1,0,1) + C;
fh = f(x);
fh(1) = fh(1) + alpha*(a(h)/h^2 + b(h)/(2*h));
fh(n) = fh(n) + beta*(a(n*h)/h^2 - b(n*h)/(2*h));

end

