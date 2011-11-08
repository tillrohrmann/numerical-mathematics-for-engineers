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
titles={'Uniform grid, forward difference operator';'Uniform grid, central difference operator';'Uniform grid, backward differencen operator';'Shishkin grid, central difference operator'};
differentialOperators=['+','0','-','0'];
grids=[0,0,0,1];

for c=1:length(grids)
    if(c > 1)
        figure();
    end
    for i=1:length(n)
        if(grids(c))
            xh = p06shishkin(n(i),4*epsi*log(2*n(i)));
        else
            xh =  0:1/(2*n(i)):1;
        end
        
        uh = p06solve(epsi,xh,differentialOperators(c));

        subplot(2,2,i);
        error = p06plot(epsi,xh,uh);
        title(strcat(titles(c),',n=',num2str(n(i)),',error=',num2str(error)));
    end
end

end

