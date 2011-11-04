function [ uh ] = p06solve( epsi,xh,d )
% Numerical mathematics for engineers II
% Homework 3
% Programming exercise 6
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
%

a = epsi;
b = 1;
c = 0;
alpha = 0;
beta =0;
f = @(x) ones(length(x),1);

[Lh fh] = p05getLS(a,b,c,alpha,beta,f,xh,d);

uh = Lh\fh;

uh = [alpha; reshape(uh,length(uh),1);beta];

end

