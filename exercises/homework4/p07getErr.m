function [e2,einf,eoc2,eocinf] = p07getErr(r,v1)

for p = 1:r
    f= @functionf;
    g= @functiong;
    
    [Lh,fh] = p07getLS((2^p)+1,[v1 0]', f, g);
    sigma = sqrt(v1^2+4*pi^2)/2;
    for i=1:2^p+1
        for j=1:2^p+1
            u(i*(2^p+1)+j)=1/sinh(sigma)*exp(v1*i/2)*sinh(sigma*(1-i))*sin(pi*j);
        end
        uh=Ln\fn;
        if(p~=1)
            ehprev=eh;
        end
        eh=uh-u;
        e2(p)= norm(eh,2);
        einf(p)=norm(eh,Inf);
        if(p==1)
            eoc2(p)=1;
            eocinf(p)=1;
        else
            eoc2(p)=(log((norm(eh)/(norm(ehprev)))/(log((1/(2^p+1))/(1/(2^(p-1)+1))));
            eocinf(p)=(log((norm(eh,Inf)/(norm(ehprev,Inf)))/(log((1/(2^p+1))/(1/(2^(p-1)+1))));
        end
    end
end

end
