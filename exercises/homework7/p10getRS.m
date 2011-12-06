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
    xmiddle = G(i+1);
    
    hstart = xmiddle-xstart;
    hend = xend-xmiddle;
    
    lf = @(x) f(x).*(x-xstart)/hstart;
    rf = @(x) f(x).*(xend-x)/hend;
    
    lgamma = (xmiddle-xstart)/(m+1);
    rgamma = (xend-xmiddle)/(m+1);
    
    lfsum = 1/2*(lf(xstart) + lf(xmiddle));
    rfsum = 1/2*(rf(xmiddle)+rf(xend));
    
    for j = 1:m
       lfsum = lfsum + lf(xstart+j*lgamma);
       rfsum = rfsum + rf(xmiddle+j*rgamma);
    end
    
    fh(i) = lgamma*lfsum + rgamma*rfsum;
end

end

