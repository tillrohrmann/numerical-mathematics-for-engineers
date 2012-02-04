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
i=0;
k=1;
xh=zeros(202,1);
while (i<=1)
xh(k)=i;
i=i+1/201;
k=k+1;
end
f = functionf(xh(2:length(xh)-1));
b=[0 10^(-4) 10^(-2) 1 10^2 10^4];
EYE=eye(200);
resvecMATRIX=zeros(251,5,6);
for j=1:length(b)
    [Lh, fh] = p12getLS( -1,b(j),50,0,0,f,xh);
    
    [x1,flag,relres,iter,resvec] = pcg(Lh,fh,tol,maxit,EYE,EYE,x0);
    flags(j,1)=flag;
    if(length(resvec)==251)
        resvecMATRIX(:,1,j)=resvec;
    else
        resvecMATRIX(:,1,j)=[resvec;zeros(251-length(resvec),1)];
    end
    
    [x2,flag,relres,iter,resvec] = minres(Lh,fh,tol,maxit,EYE,EYE,x0);
    flags(j,2)=flag;
    if(length(resvec)==251)
        resvecMATRIX(:,2,j)=resvec;
    else
        resvecMATRIX(:,2,j)=[resvec;zeros(251-length(resvec),1)];
    end
    
    [x3,flag,relres,iter,resvec] = bicg(Lh,fh,tol,maxit,EYE,EYE,x0);
    flags(j,3)=flag;
    if(length(resvec)==251)
        resvecMATRIX(:,3,j)=resvec;
    else
        resvecMATRIX(:,3,j)=[resvec;zeros(251-length(resvec),1)];
    end
    
    [x4,flag,relres,iter,resvec] = qmr(Lh,fh,tol,maxit,EYE,EYE,x0);
    flags(j,4)=flag;
    if(length(resvec)==251)
        resvecMATRIX(:,4,j)=resvec;
    else
        resvecMATRIX(:,4,j)=[resvec;zeros(251-length(resvec),1)];
    end
    
    [x5,flag,relres,iter,resvec] = gmres(Lh,fh,[],tol,maxit,EYE,EYE,x0);
    flags(j,5)=flag;
    if(length(resvec)==251)
        resvecMATRIX(:,5,j)=resvec;
    else
        resvecMATRIX(:,5,j)=[resvec;zeros(251-length(resvec),1)];
    end

end

for j=1:6
    
    p = 1:251;
    figure();
    semilogy(p,resvecMATRIX(:,1,j),'r')
    
    hold on

    semilogy(p,resvecMATRIX(:,2,j),'g')
    legend(['Residuals using PCG for the ',num2str(j),'-th equation'],['Residuals using MINRES for the ',num2str(j),'-th equation']);


    hold on 
    
    semilogy(p,resvecMATRIX(:,3,j),'b')

    hold on
    semilogy(p,resvecMATRIX(:,4,j),'c')

    hold on
    
    semilogy(p,resvecMATRIX(:,5,j),'m')
    legend(['Residuals using PCG for the ',num2str(j),'-th equation'],['Residuals using MINRES for the ',num2str(j),'-th equation'],['Residuals using BICG for the ',num2str(j),'-th equation'],['Residuals using QMR for the ',num2str(j),'-th equation'],['Residuals using GMRES without restart for the ',num2str(j),'-th equation']);
    
end

end