function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
[m,n] = size(A);
if m~=n
    error('Matrix is not a square');
end
U = A;
L = eye(n);
P = eye(n);
for k = 1:n-1
    [~,piv_row] = max(abs(U(k:n,k)));
    piv_row = piv_row + k - 1;
    
    U([k,piv_row],k:n) = U([piv_row,k],k:n);
    P([k,piv_row],:) = P([piv_row,k],:);
    if k >= 2
        L([k,piv_row],1:k-1) = L([piv_row,k],1:k-1);
    end
    L(k+1:n,k) = U(k+1:n,k) / U(k,k);
    U(k+1:n,k:n) = U(k+1:n,k:n) - L(k+1:n,k)*U(k,k:n);
end


end