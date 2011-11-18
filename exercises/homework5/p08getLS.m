function [ Lh fh ] = p08getLS( n,f,g )
% Numerical mathematics for engineers II
% Homework 5
% Programming exercise 8
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

h = 1/(n+1);

I = speye(n);
T = gallery('tridiag',n,-1,2,-1);

C = sparse(n,n);
C(1) = 1;
C(n^2) = 1;

Lh = kron(I,T) + kron(T,I) - kron(I,C) - kron(C,I);

xh = (h:h:1-h)';

[Xh Yh] = meshgrid(xh);

fh = f(Xh,Yh);

vOnes = ones(n,1);
vZeros = sparse(n,1);

boundaryLeft = 1/h*g(vZeros,xh);
boundaryRight = 1/h*g(vOnes,xh);
boundaryNorth = 1/h*g(xh,vOnes);
boundarySouth = 1/h*g(xh,vZeros);

indexLeft = 1:n:n^2;
indexRight = n:n:n^2;
indexSouth = 1:1:n;
indexNorth = n^2-n+1:1:n^2;

fh = reshape(fh,numel(fh),1)...
    + sparse(indexLeft,ones,boundaryLeft,n^2,1,n^2)...
    + sparse(indexRight,ones,boundaryRight,n^2,1,n^2)...
    + sparse(indexNorth,ones,boundaryNorth,n^2,1,n^2)...
    + sparse(indexSouth,ones,boundarySouth,n^2,1,n^2);

end

