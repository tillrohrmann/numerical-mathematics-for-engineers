function p13testFEM()
% Numerical mathematics for engineers II
% Homework 10
% Programming exercise 13
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

x0 = @(N) zeros(N,1);
L1 = @(A,N) speye(N);
L2 = @(A,N) spdiags(sqrt(diag(A)),0,N,N);
L3 = @(A,N) cholinc(A,1e-1)';
L4 = @(A,N) cholinc(A,1e-2)';
L5 = @(A,N) cholinc(A,1e-3)';
L6 = @(A,N) cholinc(A,1e-4)';
maxit = 3000;

tolerances = [1e-1,3e-2,1e-2,6e-3,3e-3,1e-3,1e-4,1e-5];
result1 = zeros(size(tolerances,2),1);
result2 = zeros(size(tolerances,2),1);
result3 = zeros(size(tolerances,2),1);
result4 = zeros(size(tolerances,2),1);
result5 = zeros(size(tolerances,2),1);
result6 = zeros(size(tolerances,2),1);

figure();
for i=1:size(tolerances,2)
    [err, eoc,r2u1] = p13eoc(x0,maxit,tolerances(i),L1);
    result1(i) = eoc(4);
    err1(i) = err(4);
    [err,eoc,r2u2] = p13eoc(x0,maxit,tolerances(i),L2);
    result2(i) = eoc(4);
    err2(i) = err(4);
    [err, eoc,r2u3] = p13eoc(x0,maxit,tolerances(i),L3);
    result3(i) = eoc(4);
    err3(i) = err(4);
    [err, eoc,r2u4] = p13eoc(x0,maxit,tolerances(i),L4);
    result4(i) = eoc(4);
    err4(i) = err(4);
    [err, eoc,r2u5] = p13eoc(x0,maxit,tolerances(i),L5);
    result5(i) = eoc(4);
    err5(i) = err(4);
    [err, eoc,r2u6] = p13eoc(x0,maxit,tolerances(i),L6);
    result6(i) = eoc(4);
    err6(i) = err(4);
    
    semilogy(1:size(r2u1,1),r2u1,1:size(r2u2,1),r2u2,1:size(r2u3,1),r2u3,...
        1:size(r2u4,1),r2u4,1:size(r2u5,1),r2u5,1:size(r2u6,1),r2u6);
    title(strcat('Relative updated residual error w.r.t the tolerance and preconditioner. Tol:',num2str(tolerances(i))));
    xlabel('Steps');
    ylabel('Error');
    legend('L1','L2','L3','L4','L5','L6');

end

figure();
semilogx(tolerances,result1,tolerances,result2,tolerances,result3,...
    tolerances, result4, tolerances, result5, tolerances, result6);

legend('L1','L2','L3','L4','L5','L6');
title('EOC w.r.t. the tolerance of the pcg method and the preconditioner');
ylabel('EOC');
xlabel('tolerance');

figure();

loglog(tolerances,err1,tolerances,err2,tolerances,err3,...
    tolerances, err4, tolerances, err5, tolerances, err6);

legend('L1','L2','L3','L4','L5','L6');
title('ERR w.r.t. the tolerance of the pcg method and the preconditioner');
ylabel('ERR');
xlabel('tolerance');

% For all preconditioner, it can be observed that the error is decreasing 
% with a decreasing tolerance until it reaches a limit at 10^-2. In contrast
% to that, the eoc is increasing with a decreasing tolerance until it
% reaches the value of 2.

end