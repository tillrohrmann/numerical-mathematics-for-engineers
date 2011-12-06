function [ err eoc errhalf eochalf ] = p10test( m )
% Numerical mathematics for engineers II
% Homework 5
% Programming exercise 8
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

c=1;
f = @(x) exp(x).*4.*x;
u = @(x) exp(x).*(x-x.^2);

maxP=14;

err = zeros(maxP,1);
eoc = zeros(maxP,1);
errhalf = zeros(maxP,1);
eochalf = zeros(maxP,1);

for p = 1:maxP
    h = 1/(2^p+1);
    G = (0:h:1)';
    xh = G(2:end-1);
    xh2 = (h/2:h/2:1-h/2)';
    h2 = h/2;
    
    Lh = p10getLS(G,c);
    fh = p10getRS(f,G,m);
    alphah = Lh\fh;
    uh = p10evalFunc(xh,alphah,G);
    uh2 = p10evalFunc(xh2,alphah,G);
    
    err(p) = norm(u(xh)-uh,'inf');
    errhalf(p) = norm(u(xh2)-uh2,'inf');
    
    if(p > 1)
       eoc(p) = log(err(p)/err(p-1))/log(h/hprev); 
       eochalf(p) = log(errhalf(p)/errhalf(p-1))/log(h2/h2prev);
    end
    
    hprev= h;
    h2prev = h2;
    
end
end

