function [ value ] = kappa( B )

value = normest(B)/svds(B,1,0);


end

