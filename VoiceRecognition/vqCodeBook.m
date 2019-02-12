function codebk = vqCodeBook(d, k)
% VQLBG Linde-Buzo-Gray algoritmasý kullanýlarak vektör niceleme
%
% Giriþler:
% d, eðitim verileri vektörlerini (sütun baþýna bir tane) içerir
% k, gerekli merkez sayýsýdýr
%
% Çýktýlar:
% c, sonuç VQ kod çizelgesini içerir (her bir sentroid için bir tane olan k sütunlarý)

e = 0.0001;                                % bölme parametresi
codebk = mean(d, 2);                        % kod kitabý
distortion = int32(inf);             
numOfCentroids = int32(log2(k));            % Kod kelimelerinin sayýsý

for i=1:numOfCentroids
    codebk = [codebk*(1+e), codebk*(1-e)];  % bölme
    while(1==1)
        dis = distance(d, codebk);            % Her bir kod kelimesine her bir noktanýn mesafesi
        [m,ind] = min(dis, [], 2);          % en yakýn merkez için 'd' puan noktalarýnýn haritalnmasý
        t = 0;
        lim = 2^i;
        for j=1:lim
            codebk(:, j) = mean(d(:, ind==j), 2);    % daha iyi ortalama deðerlere ulaþmak için merkezleri güncellemek
            x = distance(d(:, ind==j), codebk(:, j));  % Komþuluk vektörlerini oluþturma
            len = length(x);                         % merkezlerin uzunlugu
            for q = 1:len
                t = t + x(q);
            end
        end
        if (((distortion - t)/t) < e)       % Bozulma döngülerinin kýrýlmasý
            break;
        else
            distortion = t;
        end
    end
end