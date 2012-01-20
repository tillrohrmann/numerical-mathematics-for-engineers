function [ xj,r2u ] = p13pcg( A,b,x0,maxit,tol,L )
%% Numerical mathematics for engineers II
% Homework 10
% Programming exercise 13
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

r0=b-A*x0;
r=r0;
y=L\r;
z=L'\y;
p=z;
xj=x0;
r2u(1)=1; %relative Euklidisch Norm
for j=1:maxit
   
   Ap=A*p;
   pAp=p'*Ap; %p'*A*p A-norm
   gamma=(r'*z)/pAp; %Schrittweite
   xj=xj+gamma*p; %Update der Lösung
   ralt=r;%altes Residuum merken
   r=r-gamma*Ap;%neues Residuum
   if norm(r,2)/norm(r0,2) <= tol 
       return
   end
   zalt=z; %altes z merken
   y=L\r;
   z=L'\y;
   beta=(r'*z)/(ralt'*zalt); % konjugierte Abstiegsrichtung
   p=z+beta*p;%neue Abstiegsrichtung
   
   r2u(j+1)=norm(r,2)/norm(r0,2); %relative Euklidisch Norm
  
end    
end

