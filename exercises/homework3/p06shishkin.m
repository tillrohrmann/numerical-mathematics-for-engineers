function [ xh ] = p06shishkin( n,sigma )
% Numerical Mathematics for Engineers II
% Homework 3
% Programming exercise 6
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
%

H = (1-sigma)/n;
h = sigma/n;
xh = zeros(2*n+1,1);

for i=1:n
    xh(i) = (i-1)*H;
end
for i=n+1:2*n+1
    xh(i) = (1-sigma)+(i-n-1)*h;
end

end

