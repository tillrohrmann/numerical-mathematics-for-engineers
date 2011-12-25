function [ value ] = p11integrate( pt, f,j )
% Numerical mathematics for engineers II
% Homework 8
% Programming exercise 11
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

dim = size(pt,1);

if dim == 3
    value = 1/6*1/4*f(pt*[1/4;1/4;1/4;1/4]);
elseif dim ==2
    beta=[1/6;1/6;1/6];
    x= [1/2, 0; 0, 1/2; 1/2, 1/2]';
    
    Fk = @(x) [pt(:,1) ,pt(:,2:end)-pt(:,1)*ones(1,2)]*[ones(1,3);x];
    W = [1 -1 -1; 0 1 0; 0 0 1];
    
    w = @(x) W(j,:)*[ones(1,3);x];
    
    value = sum((f(Fk(x)).*w(x))'.*beta);
else
    error = MException('Dim %s not supported yet',dim);
    throw(error);
end
    


end

