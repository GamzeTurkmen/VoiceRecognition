function d = distance(x, y)
%�ki matrisin s�tunlar� aras�nda %  �ift Y�nl� Euclid mesafeleri
%
% Giri�:
% x, y: Her s�tunu bir vekt�r verisi olan iki matris.
%
% ��kt�:
% d: ��e d (i, j) iki aras�ndaki Euclidean uzakl��� olacak
% s�tun vekt�rleri X (:, i) ve Y (:, j)
%
% Not:
%�ki vekt�r X ve Y aras�ndaki Euclidean D mesafesi:
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