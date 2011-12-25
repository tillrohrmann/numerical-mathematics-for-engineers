function [ err, eoc ] = p11eoc(  )
% Numerical mathematics for engineers II
% Homework 8
% Programming exercise 11
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

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
hprev = 0;
filename = 'hw8';
for i=1:numel(r)
    h = 1/2^r(i);
    [p,e,t] = p11mshUnit(dim,2^r(i)-1);
    [S,M,D,fh] = p11getLS(p,e,t,c,f,g);
    alpha = (S+M+D)\fh;
    err(i) = norm(u(p)'-alpha,'inf');
    
    p11vtkWrite(strcat(filename,'_',int2str(i),'.vtu'),p,e,t,alpha);
    
    if(i > 1)
        eoc(i) = log(err(i)/err(i-1))/log(h/hprev);
    end
    hprev = h;
end

