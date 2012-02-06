function [ err, eoc, r2u ] = p13eoc( x0,maxit,tol,L )
% Numerical mathematics for engineers II
% Homework 10
% Programming exercise 13
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

global params;

c = 1/2;
f = @(x) sin(2*pi*x(1,:)).*sin(2*pi*x(2,:)).*(5/2+8*pi^2*x(3,:).*(1-x(3,:)))...
    +x(1,:).*x(2,:).*x(3,:);
g = @(x) exp(x(3,:)/sqrt(2))+x(1,:).*x(2,:).*x(3,:);

u = @(x) sin(2*pi*x(1,:)).*sin(2*pi*x(2,:)).*x(3,:).*(1-x(3,:))...
    +exp(x(3,:)/sqrt(2)) + x(1,:).*x(2,:).*x(3,:);

r = [1,2,3,4];
err = zeros(numel(r),1);
eoc = zeros(numel(r),1);

dim = 3;
params.dim = 3;
params.fac = factorial(3);
hprev = 0;
%filename = 'hw8';
for i=1:numel(r)
    h = 1/2^r(i);
    [p,e,t] = p11mshUnit(dim,2^r(i)-1);
    [S,M,D,fh] = p11getLS(p,e,t,c,f,g);
    Lh = S+M+D;
    b = p11getBoundDOFs(p,e);
    np = size(p,2);
    nb = sum(b);
    ni = np -nb;
    [sb, mapping] = sort(b);
    [temp,iMapping] = sort(mapping);
    bD = (ni+1:np)';
    bI = (1:ni)';
    LhII = Lh(bI,bI);
    LhID = Lh(bI,bD);
    fD = fh(bD);
    fI = fh(bI);
    [xI, r2u] = p13pcg(LhII,fI-LhID*fD,x0(size(LhII,1)),maxit,tol,L(LhII,size(LhII,1)));
    %xI = LhII\(fI-LhID*fD);
    xh = zeros(size(fh,1),1);
    xh([bD;bI]) =[fD;xI];
    err(i) = norm(u(p)'-xh(iMapping),'inf');
    
    %p11vtkWrite(strcat(filename,'_',int2str(i),'.vtu'),p,e,t,alpha);
    
    if(i > 1)
        eoc(i) = log(err(i)/err(i-1))/log(h/hprev);
    end
    hprev = h;
end

