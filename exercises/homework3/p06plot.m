function [ err ] = p06plot( epsi, xh, uh )
% Numerical Mathematics for Engineers II
% Homework 3
% Programming exercise 6
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
% Matlab

u = xh - (exp(-(1-xh)/epsi) - exp(-1/epsi))/(1-exp(-1/epsi));

err = norm(u(:)-uh(:),'inf');

plot(xh,uh,'-r',xh,u,'-b');
legend('Numerical','Analytic','Location','South');

end

