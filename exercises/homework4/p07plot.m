function p07plot(p,v1)
h=1/(2^p+1);
x=[0:h:1];
%Berechnung der L�sung mittels FD
[Lh,fh]=p07getLS(n,v,f,g);
uh=Lh\fh;
%Berechnung der exakten L�sung
sigma=sqrt(v1^2+4*pi^2)/2;
ue=@(x1,x2) 1/sinh(sigma)*exp(v1*x1/2)*sinh(sigma*(1-x1))*sin(pi*x2);

%plotten der L�sungen
[X]=meshgrid(x)
subplot(1,2,1)
surf(X,uh)
subplot(1,2,2)
surf(X,ue())


