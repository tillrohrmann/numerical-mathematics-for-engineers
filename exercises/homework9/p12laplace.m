function p12laplace()
%% Numerical mathematics for engineers II
% Homework 5
% Programming exercise 8
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

maxit=400;
tol=10^(-6);
M=200;
E=speye(M);
T=sparse(gallery('tridiag',M,-1,2,-1));
b=1/(M+1)^2*ones(M^2,1);

A = kron(T,E) + kron(E,T);

x = A\b;

x0 = sparse(M^2,1);

[xj r2u r2 e2 eA] = p12cg(A,b,x0,maxit,tol,x);

semilogy(1:length(r2u),r2u,1:length(r2),r2,1:length(e2),e2,1:length(eA),eA);
xlabel('Iterations')
legend('relative 2-norm of the updated residual','relative 2-norm of the explicitly computed residual','relative 2-norm of the error','relative A-norm of the error','Location','Southwest')

end

