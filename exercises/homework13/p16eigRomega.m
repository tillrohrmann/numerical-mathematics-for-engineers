function p16eigRomega()
% Numerical mathematics for engineers II
% Homework 13
% Programming exercise 16
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

N = 128;
h = 1/(N+1);

omegas=[1/3;1/2;2/3;1];

A = 1/h^2*gallery('tridiag',N,-1,2,-1);
b = zeros(N,1);

colors='rbgc';
l = '';

hold on
for i = 1:numel(omegas)
    [Romega, ~ ] = p16getRomega(A,b,omegas(i));
    eigs = eig(full(Romega));
    plot(1:numel(eigs),real(eigs),[colors(i),'+']);
end

legend(['omega=',num2str(omegas(1))],...
    ['omega=',num2str(omegas(2))],['omega=',num2str(omegas(3))],...
    ['omega=',num2str(omegas(4))]);

hold off

drawnow;

