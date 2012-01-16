function p12diag()
%% Numerical mathematics for engineers II
% Homework 5
% Programming exercise 8
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

A=diag(1:48);
x0=zeros(48,1);
x=ones(48,1);
b=A*x;
maxit=200;
tol=10^(-12);

[ xj,r2u,r2,e2,eA ] = p12cg( A,b,x0,maxit,tol,x );

semilogy(1:length(r2),r2u,1:length(r2),r2,1:length(r2),e2,1:length(r2),eA)
xlabel('Iterations')
legend('relative 2-norm of the updated residual','relative 2-norm of the explicitly computed residual','relative 2-norm of the error','relative A-norm of the error','Location','Southwest')

end

