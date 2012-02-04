function [ Lh, fh ] = p12getLS( a,b,c, alpha,beta,fh,xh)
% Numerical mathematics for engineers II
% Homework 3
% Programming exercise 12
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
% Matlab

n = length(xh)-2;
h = xh(2:length(xh))-xh(1:length(xh)-1);
h2 = h(1:length(h)-1)+h(2:length(h));

%fh = f(xh(2:length(xh)-1));

        B = gallery('tridiag',-1./h(2:length(h)-1),1./h(1:length(h)-1),zeros(length(h)-2,1));
        fh(1) = fh(1) + alpha*(2*a/h2(1)/h(1)+b/h(1));
        fh(n) = fh(n) + beta*(2*a/h2(n)/h(end));

C = speye(n);

%A = 2*gallery('tridiag',1./(h2(2:length(h2)).*h(2:length(h)-1)),-1./hp,1./(h2(1:length(h2)-1).*h(2:length(h)-1)));
A = gallery('tridiag',-1./h(2:length(h)-1),2./h(1:length(h)-1),-1./h(2:length(h)-1));

Lh = -a*A + b*B + c*C;
        

end
