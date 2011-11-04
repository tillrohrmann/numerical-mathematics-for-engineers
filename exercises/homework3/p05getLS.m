function [ Lh, fh ] = p05getLS( a,b,c, alpha,beta,f,xh,d)
% Numerical mathematics for engineers II
% Homework 3
% Programming exercise 5
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
%

n = length(xh)-2;
h = xh(2:length(xh))-xh(1:length(xh)-1);
h2 = h(1:length(h)-1)+h(2:length(h));
hp = h(1:length(h)-1).*h(2:length(h));

fh = f(xh(2:length(xh)-1));

switch d
    case '-'
        B = gallery('tridiag',-1./h(2:length(h)-1),1./h(1:length(h)-1),zeros(length(h)-2,1));
        fh(1) = fh(1) + alpha*(2*a/h2(1)/h(1)+b/h(1));
        fh(n) = fh(n) + beta*(2*a/h2(n)/h(end));
    case '+'
        B = gallery('tridiag',zeros(length(h)-2,1),-1./h(2:length(h)),1./h(2:length(h)-1));
        fh(1) = fh(1) + alpha*(2*a/h2(1)/h(1));
        fh(end) = fh(end) + beta*(2*a/h2(end)/h(end)-b/h(end));
    case '0'
        B = gallery('tridiag',-1./h2(2:length(h2)),zeros(length(h2),1),1./h2(1:length(h2)-1));
        fh(1) = fh(1) + alpha*(2*a/h2(1)/h(1) + b/h2(1));
        fh(end) = fh(end) + beta * ( 2*a/h2(end)/h(end) - b / h2(end));
end

C = speye(n);

A = 2*gallery('tridiag',1./(h2(2:length(h2)).*h(2:length(h)-1)),-1./hp,1./(h2(1:length(h2)-1).*h(2:length(h)-1)));

Lh = -a*A + b*B + c*C;
        

end

