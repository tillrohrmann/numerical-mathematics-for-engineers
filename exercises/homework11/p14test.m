function [ ] = p14test( )
% Numerical mathematics for engineers II
% Homework 11
% Programming exercise 14
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

n = 2^5;
v= [0,1,5,10,25,50,100];
x0 = zeros(n^2,1);
maxit = 300;
tol = 1e-10;
colors='rgbckymc';

for i=1:size(v,2)
    [Lh, fh] = p07getLS(n,[v(i),0],@functionf,@functiong);
    [ xj, r2{i} ] = p14gmres(Lh,fh,x0,maxit,tol); 
end


hold on
for i=1:size(r2,2)
    semilogy(1:size(r2{i},1),r2{i},colors(mod(i,size(colors,2)+1)));
end
hold off

set(gca, 'YScale','log');
title('Euclidean norm of residual w.r.t to different convection coefficients');
xlabel('Steps');
ylabel('Euclidean norm of residual');

for i= 1:size(r2,2)
    names{i} = strcat('v=(',num2str(v(1,i)),',0)');
end

legend(names);


end

