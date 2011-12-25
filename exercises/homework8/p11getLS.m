function [ S,M,D,fh ] = p11getLS( p,e,t,c,f,g )
% Numerical mathematics for engineers II
% Homework 8
% Programming exercise 11
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
% 
% Matlab

b = p11getBoundDOFs(p,e);
np = size(p,2);
nb = sum(b);
nt = size(t,2);
dt = size(t,1);

sDh = java.util.HashSet();

vSh = zeros(dt*nt,3);
vMh = zeros(dt*nt,3);

fh = zeros(np,1);

counter = 1;
for i=1:nt
    [elS, elM, elfh] = p11getLoc(p(:,t(:,i)),c,f);
    for j=1:dt
        index = t(j,i);
        if(b(index))
           fh(index) = g(p(:,index));
           sDh.add(index);
        else
            fh(index) = fh(index) + elfh(j);
            vSh(counter:counter+dt-1,:) = [ones(4,1)*index,t(:,i),elS(j,:)'];
            vMh(counter:counter+dt-1,:) = [ones(4,1)*index,t(:,i),elM(j,:)'];
            counter = counter +dt;
        end
    end
end

S = sparse(vSh(1:counter-1,1),vSh(1:counter-1,2),vSh(1:counter-1,3),np,np);
M = sparse(vMh(1:counter-1,1),vMh(1:counter-1,2),vMh(1:counter-1,3),np,np);

B = zeros(sDh.size(),1);

it = sDh.iterator();
counter = 1;
while(it.hasNext())
    B(counter) = it.next();
    counter = counter+1;
end

D = sparse(B,B,ones(size(B,1),1),np,np);

