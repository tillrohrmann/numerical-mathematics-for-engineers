i = @(x) quad(x,0,1);
sb1 = @(x) pi^2*sin(pi*x).*(1/3*x.^2-1/3*x);
sb2 = @(x) pi^2*sin(pi*x).*(x.^4 - 2* x.^3+x.^2);
b1b1= @(x) (2/3*x-1/3).^2;
b1b2 = @(x) (2/3*x-1/3).*(4*x.^3-6*x.^2+2*x);
b2b2 = @(x) (4*x.^3-6*x.^2+2*x).^2;
b1 = @(x) 1/3*x.^2-1/3*x;
b2 = @(x) (x.^4 - 2*x.^3 + x.^2);