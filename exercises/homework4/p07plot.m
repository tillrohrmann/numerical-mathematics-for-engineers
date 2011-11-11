function p07plot(p,v1)
%Numerical Mathematics for Engineers II
% Homework 4
% Programming exercise 7 d
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
% Matlab

h=1/(2^p+1);
n=2^p;
x=(0:h:1)';
f=@functionf;
g=@functiong;
v=[v1;0];
%Berechnung der Lösung mittels FD
[Lh,fh]=p07getLS(n,v,f,g);
uh=Lh\fh;
%Berechnung der exakten Lösung
sigma=sqrt(v1^2+4*pi^2)/2;
ue=@(x1,x2) 1/sinh(sigma)*exp(v1*x1./2).*sinh(sigma*(1-x1)).*sin(pi*x2);

%plotten der Lösungen
[X,Y]=meshgrid(x);
subplot(1,2,1);
domain = zeros(n+2,n+2);
paraZeros = zeros(n+2,1);
paraOnes = ones(n+2,1);

domain(:,1) = g(paraZeros,x);
domain(:,end) = g(paraOnes,x);
domain(1,:) = g(x,paraZeros);
domain(end,:) = g(x,paraOnes);

domain(2:end-1,2:end-1)=reshape(uh,n,n)';

surf(X,Y,domain);
title('Numerical solution');
subplot(1,2,2);
surf(X,Y,ue(X,Y));
title('Exact solution');



