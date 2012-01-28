function [ xj, r2 ] = p14gmres( A, b, x0, maxit, tol )
% Numerical mathematics for engineers II
% Homework 11
% Programming exercise 14
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

N = size(A,1);
v = zeros(N,max(maxit+1,N));
r2 = sparse(maxit,1);

r0 = b - A*x0;
normR0 = norm(r0);
v(:,1) = r0/normR0;
Q=zeros(maxit+1,maxit+1);
Q(1,1) = 1;
R=zeros(maxit,maxit-1);
h = zeros(maxit,1);

for j = 1:maxit
    vtemp = A*v(:,j);
    for i=1:j
        h(i,1) = v(:,i)'*vtemp;
        vtemp = vtemp - h(i,1)*v(:,i);
    end
    beta = norm(vtemp);
    
    if beta ~= 0
        v(:,j+1) = vtemp/beta;
    end
    
    %minimizer
    tempR = Q(1:j,1:j)*h(1:j,1);
    alpha = tempR(end,1);
    rn = tempR(1:end-1,1);
    length = sqrt(alpha^2+beta^2);
    cosg = alpha/length;
    sing = beta/length;
    %R = [R,rn;zeros(1,j-1),length];
    R(1:j-1,j) = rn;
    R(j,j) = length;
    Q(j+1,1:j+1) = [-sing*Q(j,1:j),cosg];
    Q(j,1:j+1) = [cosg*Q(j,1:j),sing];
%     Q=[Q(1:end-1,:),zeros(j-1,1);...
%         cosg*Q(end,:),sing;...
%         -sing*Q(end,:),cosg];
    
    y = R(1:j,1:j)\Q(1:j,1)*normR0;
%     [Q, R] = qr(H(1:j+1,1:j));
%     y = R(1:j,1:j)\Q(1,1:j)'*normR0;
    
    xj = x0 + v(:,1:j)*y;
   
    r2(j) = norm(b-A*xj);
    
    if r2(j) < tol
        return
    end
end


end

