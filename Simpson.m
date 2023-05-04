function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
if length(x) ~= length(y)
    error('the inputs are different lengths')
end
if any(diff(diff(x))) ~= 0
    error('x values must be equally spaced')
end
n = length(x) - 1;
if mod(n,2) == 1
    warning('the trap rule will be used for the last interval')
end

stepsize = (x(end) - x(1))/n;
I = y(1) + 4*sum(y(2:2:end - 1)) + 2*sum(y(3:2:end-2)) + y(end);
if mod(n,2) == 1
    I = I + (y(end - 1) + y(end))*stepsize/2;
end
I = I*stepsize/3;
end