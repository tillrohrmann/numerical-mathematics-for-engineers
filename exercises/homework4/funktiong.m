function [z] = funktiong(x,y)
for i=1:length(x)
    if(x(i)==0)
        z(i)=sin(pi*y(i));
    else
        z(i)=0;
    end
end
end