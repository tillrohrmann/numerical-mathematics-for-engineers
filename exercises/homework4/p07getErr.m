function [e2,einf,eoc2,eocinf] = p07getErr(r,v1)
% Numerical mathematics for engineers 2
% Homework 4
% Programming exercise 7 b)
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
% Matlab

sigma = sqrt(v1^2+4*pi^2)/2;
ue =@(x,y) 1/sinh(sigma)*exp(v1*x./2).*sinh(sigma*(1-x)).*sin(pi.*y);

f= @functionf;
g= @functiong;

e2 = zeros(r,1);
einf = zeros(r,1);
eoc2 = zeros(r,1);
eocinf = zeros(r,1);

eoc2(1) = 0;
eocinf(1) = 0;

prevH = 0;


for p = 1:r
    h = 1/(2^p+1);
    n = 2^p;
    [Lh,fh] = p07getLS(n,[v1 0]', f, g);
    xh = h:h:1-h;
    [X,Y] = meshgrid(xh);
    
    uh = Lh\fh;
    uhe = ue(X,Y);
    uhe = reshape(uhe',numel(uhe),1);
   
    error = uh - uhe;
    e2(p) = norm(error,2);
    einf(p) = norm(error,'inf');
    
    if(p > 2)
       eoc2(p) = log(e2(p)/e2(p-1))/log(h/prevH);
       eocinf(p) = log(einf(p)/einf(p-1))/log(h/prevH);
    end
    
    prevH = h;
    
end

end
