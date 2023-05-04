function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
if nargin < 3
    error("Not enough inputs");
end
if nargin < 4
    es = .0001;
end
if nargin < 5
    maxit = 200;
end
i = 1;
xn = 0;
er = 1;
xold = 0;
while(er>es && i<maxit)
    xold = xn;
    xn = xu - (xl-xu)*func(xu)/(func(xl)-func(xu));
    if xn > 0
        xu = xn;
    else
        xl = xn;
    end
    if xn ~= 0 
        er = abs(xn-xold)/xn*100;
    else
        er = 0;
    end
    i = i+1;
end
root = xn;
fx = func(root);
ea = er;
iter = i;