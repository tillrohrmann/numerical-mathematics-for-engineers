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
ni = np -nb;
nt = size(t,2);
dt = size(t,1);

[sb, mapping] = sort(b);
[sb,iMapping] = sort(mapping);

vSh = zeros(dt*nt,1);
vMh = zeros(dt*nt,1);
rowIndices = zeros(dt*nt,1);
columnIndices = zeros(dt*nt,1);

% sDh = java.util.HashSet();

fh = zeros(np,1);

counter = 1;
for i=1:nt
    [elS, elM, elfh] = p11getLoc(p(:,t(:,i)),c,f);
    for j=1:dt
        index = iMapping(t(j,i));
%         index = t(j,i);
%         if(b(index))
%            fh(index) = g(p(:,index));
%            sDh.add(index);
%         else
          if index <= ni
            fh(index) = fh(index) + elfh(j);
            rowIndices(counter:counter+dt-1,:) = zeros(4,1)+index;
            columnIndices(counter:counter+dt-1,:) = iMapping(t(:,i));
            %columnIndices(counter:counter+dt-1,:) = t(:,i);
            vSh(counter:counter+dt-1,:) =elS(j,:)';
            vMh(counter:counter+dt-1,:) = elM(j,:)';
            counter = counter +dt;
        end
    end
end

S = sparse(rowIndices(1:counter-1,1),columnIndices(1:counter-1,1),vSh(1:counter-1),np,np);
M = sparse(rowIndices(1:counter-1,1),columnIndices(1:counter-1,1),vMh(1:counter-1),np,np);

% B = zeros(sDh.size(),1);
% 
% it = sDh.iterator();
% counter = 1;
% while(it.hasNext())
%     B(counter) = it.next();
%     counter = counter+1;
% end
% 
% D = sparse(B,B,ones(size(B,1),1),np,np);

for i = ni+1:np
 fh(i) = g(p(:,mapping(i)));  
end

D = sparse((ni+1:np)',(ni+1:np)',ones(np-ni,1),np,np);

