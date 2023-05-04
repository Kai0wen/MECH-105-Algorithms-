function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
[sy, sortOrder] = sort(y);
sx = x(sortOrder)
a = length(sx);
if length(sx)~=length(sy)
    error('the amount of x values does not match the amount of y values');
end
q1i = floor(a/4)+1;
q3i = floor(3*a/4)+1;
q1 = sy(q1i);
q3 = sy(q3i);
IQR = q3 - q1;
%this next part removes outliers
outlier = (sy < (q1 - IQR*1.5) | sy > (q3 + IQR*1.5));
fY = sy(~outlier);
fX = sx(~outlier);
%   Compute the linear regression based on inputs:

n = length(fX);
xmean = mean(fX);
ymean = mean(fY);
sxx = sum((fX - xmean).^2);
sxy = sum((fX - xmean).*(fY - ymean));
slope = sxy/sxx;
intercept = ymean - slope*xmean;

regline = slope*fX + intercept;
SSres = sum((fY - regline).^2);
SStot = sum((fY - ymean).^2);
Rsquared = 1 - SSres/SStot;
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
end
