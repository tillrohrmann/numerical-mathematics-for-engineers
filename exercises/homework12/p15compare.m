function [flags] = p15compare()
% Numerical mathematics for engineers II
% Homework 3
% Programming exercise 12
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
% Matlab

x0=zeros(200,1);
tol=1e-6;
maxit=250;
h = 1/201;

xh = (h:h:1-h)';
fh = sin(2*pi*xh).*exp(10*xh);
numSystems = 6;
numMethods = 5;
b=[0 10^(-4) 10^(-2) 1 10^2 10^4];

EYE=eye(200);
resvecMATRIX=zeros(251,6,5);

flags=zeros(numSystems,numMethods);
for j=1:numSystems
    Lh = p15getLS( 1,b(j),50,h);
    
    [~,flag,~,~,resvec] = pcg(Lh,fh,tol,maxit,EYE,EYE,x0);
    flags(j,1)=flag;
    resvecMATRIX(1:numel(resvec),j,1)=resvec;
    
    [~,flag,~,~,resvec] = minres(Lh,fh,tol,maxit,EYE,EYE,x0);
    flags(j,2)=flag;
    resvecMATRIX(1:numel(resvec),j,2)=resvec;
    
    [~,flag,~,~,resvec] = bicg(Lh,fh,tol,maxit,EYE,EYE,x0);
    flags(j,3)=flag;
    resvecMATRIX(1:numel(resvec),j,3)=resvec;
    
    [~,flag,~,~,resvec] = qmr(Lh,fh,tol,maxit,EYE,EYE,x0);
    flags(j,4)=flag;
    resvecMATRIX(1:numel(resvec),j,4)=resvec;
    
    [~,flag,relres,~,resvec] = gmres(Lh,fh,[],tol,maxit,EYE,EYE,x0);
    flags(j,5)=flag;
    resvecMATRIX(1:numel(resvec),j,5)=resvec;
    resvecMATRIX(numel(resvec)+1,j,5) = relres*norm(fh);

end

for j=1:6
    
    p = 1:250;
    figure();
    hold on
    semilogy(p,resvecMATRIX(2:end,j,1)/resvecMATRIX(1,j,1),'r')
    semilogy(p,resvecMATRIX(2:end,j,2)/resvecMATRIX(1,j,2),'g')
    semilogy(p,resvecMATRIX(2:end,j,3)/resvecMATRIX(1,j,3),'b')
    semilogy(p,resvecMATRIX(2:end,j,4)/resvecMATRIX(1,j,4),'c')
    semilogy(p,resvecMATRIX(2:end,j,5)/resvecMATRIX(1,j,5),'m')
    legend('PCG',...
        'MINRES',...
        'BICG',...
        'QMR',...
        'GMRES without restart');
    title(['Residual norms of ',num2str(j),'th equation']);
    hold off
    
end

end