function [ y ] = p10evalFunc( x,alphah, G )
% Numerical mathematics for engineers II
% Homework 5
% Programming exercise 8
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

y = zeros(numel(x),1);

for ih = 1:numel(alphah)
   y = y + p10evalBasis(x,ih,G)*alphah(ih); 
end

end

