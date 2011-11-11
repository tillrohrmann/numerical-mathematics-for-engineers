function p07err(r, v1 )
% Numerical Mathematics for Engineers II
% Homework 4
% Programming exercise 7 c
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
% Matlab

[e2, einf, eoc2, eocinf]=p07getErr(r,v1);

subplot(1,2,1);
semilogy(1:r,e2,1:r,einf);
title('Fehler in der 2- Norm und der inf-Norm')
legend('E2','EINF');
xlabel('Gridpoints in log(n)/log(2)');
subplot(1,2,2);
plot(1:r,eoc2,1:r,eocinf);
title('EOC');
legend('EOC2','EOCINF');
xlabel('Gridpoints in log(n)/log(2)');

end