function [ y ] = integrate( f, a,b,m )
%INTEGRATE Summary of this function goes here
%   Detailed explanation goes here


gamma = (b-a)/(m+1);

fsum = 1/2*(f(a)+f(b));

for i = 1:m
   fsum = fsum + f(a+i*gamma); 
end

y = gamma*fsum;

end

