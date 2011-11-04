function p06experiment( )
% Numerical Mathematics for Engineers II
% Homework 3
% Programming exercise 6
% Group: nm2-103
% Members: Ana Kosareva, Sophia Kohle, Till Rohrmann
%
%

epsi = 0.001;
n = [50,200,300,500];
cstring='rgbc';
errors = zeros(4,length(n));

for i=1:length(n)
    xh = 0:1/(2*n(i)):1;
    xhShishkin = p06shishkin(n(i),4*epsi*log(2*n(i)));
    
    ua = p06solve(epsi,xh,'+');
    ub = p06solve(epsi,xh,'0');
    uc = p06solve(epsi,xh,'-');
    ud = p06solve(epsi,xhShishkin,'0');
    
    errors(1,i) = p06plot(epsi,xh,ua);
    errors(2,i) = p06plot(epsi,xh,ub);
    errors(3,i) = p06plot(epsi,xh,uc);
    errors(4,i) = p06plot(epsi,xhShishkin,ud);
    
    subplot(2,2,1);
    hold on
    plot(xh,ua,cstring(mod(i,4)+1));
    hold off
    subplot(2,2,2);
    hold on
    plot(xh,ub,cstring(mod(i,4)+1));
    hold off
    subplot(2,2,3);
    hold on
    plot(xh,uc,cstring(mod(i,4)+1));
    hold off
    subplot(2,2,4);
    hold on
    plot(xhShishkin,ud,cstring(mod(i,4)+1));
    hold off
    
end

subplot(2,2,1);
hold on
legend('n=50','n=200','n=300','n=500','Location','NorthWest');
title(['Uniform grid; Forward difference operator; Errors:(', num2str(errors(1,:)),')']);
hold off
subplot(2,2,2);
hold on
legend('n=50','n=200','n=300','n=500','Location','NorthWest');
title(['Uniform grid; Central difference operator; Errors:(', num2str(errors(2,:)),')']);
hold off
subplot(2,2,3);
hold on
legend('n=50','n=200','n=300','n=500','Location','NorthWest');
title(['Uniform grid: Backward difference operator; Errors:(', num2str(errors(3,:)), ')']);
hold off
subplot(2,2,4);
hold on
legend('n=50','n=200','n=300','n=500','Location','NorthWest');
title(['Non-uniform Shishkin grid; Central difference operator; Errors:(', num2str(errors(4,:)), ')']);
hold off




end

