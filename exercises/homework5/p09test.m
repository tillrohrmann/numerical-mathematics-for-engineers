function [lam,err,eoc]=p09test()


u =@(x,y) cos(2*pi*x).*exp(y.^3);
    
f= @(x,y) cos(2*pi*x).*exp(y.^3)*(4*pi^2.-6*y-9*y.^4);
g= @(x,y) (x==1).*3*cos(2*pi*x).*exp(1);

lam=zeros(8,1);

for p=1:8
    
    n=2^p;
    
    h=1/(n+1);
    
    [Lh,fh] = p08getLS(n,f,g);
    
    e=ones(n^2,1);
    
    LhExtended = [Lh e; [e' 0]];
    fhExtended = [fh ; 0];
    
    [uh lam(p)]' = LhExtended \ fhExtended;
    
    xh = h:h:1-h;
    [X,Y] = meshgrid(xh);
    
    uex = u(X,Y);
    
    error = uh - uhe;
    err(p) = norm(error,'inf');
    if(p > 1)
       eoc(p) = log(e2(p)/e2(p-1))/log(h/prevH);
    end
    prevH=h;
end

end