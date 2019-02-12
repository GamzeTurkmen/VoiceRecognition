function d = distance(x, y)
%Ýki matrisin sütunlarý arasýnda %  Çift Yönlü Euclid mesafeleri
%
% Giriþ:
% x, y: Her sütunu bir vektör verisi olan iki matris.
%
% Çýktý:
% d: Öðe d (i, j) iki arasýndaki Euclidean uzaklýðý olacak
% sütun vektörleri X (:, i) ve Y (:, j)
%
% Not:
%Ýki vektör X ve Y arasýndaki Euclidean D mesafesi:
% D = toplam ((x-y). ^ 2). ^ 0.5

[M, N] = size(x);
[M2, P] = size(y); 

if (M ~= M2)
    error('Matrix dimensions do not match.')
end

d = zeros(N, P);

if (N < P)
    copies = zeros(1,P);
    for n = 1:N
        d(n,:) = sum((x(:, n+copies) - y) .^2, 1);
    end
else
    copies = zeros(1,N);
    for p = 1:P
        d(:,p) = sum((x - y(:, p+copies)) .^2, 1)';
    end
end

d = d.^0.5;