function [z] = functionf(x)
% Numerical mathematics for engineers 2
% Homework 4
% Programming exercise 7
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
% Matlab
z=zeros(numel(x),1);
for i = 1:numel(x)
    z(i)=sin(2*pi*x(i))*exp(10*x(i));
end

end