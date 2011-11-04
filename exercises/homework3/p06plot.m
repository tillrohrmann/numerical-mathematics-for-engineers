function [ err ] = p06plot( epsi, xh, uh )
% Numerical Mathematics for Engineers II
% Homework 3
% Programming exercise 6
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
%

x = 0:0.0001:1;
u = x - (exp(-(1-x)/epsi) - exp(-1/epsi))/(1-exp(-1/epsi));
rhu = xh - (exp(-(1-xh)/epsi) - exp(-1/epsi))/(1-exp(-1/epsi));

err = norm(rhu(:)-uh(:),'inf');

plot(xh,uh,'-r',x,u,'-g',xh,rhu,'-b');

end

