function [ xj,r2u,r2,e2,eA ] = p12cg( A,b,x0,maxit,tol,x )
%% Numerical mathematics for engineers II
% Homework 5
% Programming exercise 8
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

r0=b-A*x0;
r=b-A*x0;
p=r;
xj=x0;
r2u(1)=1; %relative Euklideisch Norm
r2(1)=1; %relative Euklidische norm
e2(1)=1; %relativer Fehler Euklidische Norm
eA(1)=1;%relativer Fehler A-norm
for j=1:maxit
    
   Ap=A*p;
   pAp=p'*Ap; %p'*A*p A-norm
   gamma=(r'*r)/pAp; %Schrittweite
   xj=xj+gamma*p; %Update der Lösung
   ralt=r;%altes Residuum merken
   r=r-gamma*Ap;%neues Residuum
   if norm(r,2)/norm(r0,2) <= tol 
       return
   end
   beta=(r'*r)/(ralt'*ralt); % konjugierte Abstiegsrichtung
   p=r+beta*p;%neue Abstiegsrichtung
   
   r2u(j+1)=norm(r,2)/norm(r0,2); %relative Euklideisch Norm
   r2(j+1)=norm(b-A*xj,2)/norm(r0,2); %relative Euklidische norm
   e2(j+1)=norm(x-xj,2)/norm(x-x0,2); %relativer Fehler Euklidische Norm
   eA(j+1)=((x-xj)'*A*(x-xj))/((x-x0)'*A*(x-x0));%relativer Fehler A-norm
    
end    
end

