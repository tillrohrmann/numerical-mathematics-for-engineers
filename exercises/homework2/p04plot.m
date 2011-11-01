function [ errors ] = p04plot( )
% Numerical Mathematics for Engineers 2
% Homework 2
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
% MATLAB

u = @(x) x.^2-x.^3;

for p = 1:20
    n = 2^p;
    h = (2^p+1)^-1;
    xh = h:h:n*h;
    [Ah fh] = p04getLS(p);
    uh = Ah\fh';
    errors(p) = norm(u(xh)'-uh,Inf);
end

p = 1:20;
semilogy(p,errors);
title('Deviation of discrete solution from analytic solution');
xlabel('Number of discretization points in log(n)/log(2)');
ylabel('norm(u(xh)-uh,Inf)');
