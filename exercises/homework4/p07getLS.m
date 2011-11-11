function [ Lh, fh ] = p07getLS( n,v,f,g )
% Numerical mathematics for engineers 2
% Homework 4
% Programming exercise 7
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%

h = 1/(n+1);

I = speye(n);
Tn = 1/h^2*gallery('tridiag',n,-1,2,-1);
Cn = 1/(2*h)*gallery('tridiag',n,-1,0,1);

Lh = (kron(I,Tn)+kron(Tn,I)+v(1)*kron(I,Cn)+v(2)*kron(Cn,I));

[X Y] = meshgrid(0:h:1);

fEvaluated = f(X,Y);

paraZeros = sparse(n,1);
paraOnes = ones(n,1);
xh = 0:h:1;

gWest = g(paraZeros,xh);
gEast = g(paraOnes,xh);
gNorth = g(xh,paraOnes);
gSouth = g(xh,paraZeros);

helpIndexWest = 1:n:n^2;
helpIndexEast = n:n:n^2;
helpIndexSouth = 1:1:n;
helpIndexNorth = n^2-n+1:1:n^2;

fh = fEvaluated + sparse(helpIndexWest,paraOnes,1/h^2*gWest,n*n,1,n) + ...
sparse(helpIndexEast,paraOnes,1/h^2*gEast,n*n,1,n) + ...
sparse(helpIndexSouth,paraOnes,1/h^2*gSouth,n*n,1,n) + ...
sparse(helpIndexNorth,paraOnes,1/h^2*gNorth,n*n,1,n) + ...
sparse(helpIndexWest,paraOnes,1/(2*h)*gWest,n*n,1,n) + ...
sparse(helpIndexEast,paraOnes,-1/(2*h)*gEast,n*n,1,n) + ...
sparse(helpIndexSouth,paraOnes,1/(2*h)*gSouth,n*n,1,n) + ...
sparse(helpIndexNorth,paraOnes,-1/(2*h)*gNorth,n*n,1,n);

end

