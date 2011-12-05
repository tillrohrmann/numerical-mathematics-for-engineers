function [ fh ] = p10getRS( f, G, m )
% Numerical mathematics for engineers II
% Homework 5
% Programming exercise 8
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

fh = zeros(numel(G)-2,1);

for i = 1:numel(G)-2
    xstart = G(i);
    xend = G(i+2);
    
    gamma = (xend-xstart)/(m+1);
    
    func = @(x) f(x).*p10evalBasis(x,i,G);
    
    fsum = 1/2*(func(xstart)+func(xend));
    
    for j = 1:m
        fsum = fsum + func(xstart+j*gamma);
    end
    
    fh(i) = gamma*fsum;
    fh(i) = quad(func,xstart,xend);
end

end

