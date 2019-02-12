function codebk = vqCodeBook(d, k)
% VQLBG Linde-Buzo-Gray algoritmas� kullan�larak vekt�r niceleme
%
% Giri�ler:
% d, e�itim verileri vekt�rlerini (s�tun ba��na bir tane) i�erir
% k, gerekli merkez say�s�d�r
%
% ��kt�lar:
% c, sonu� VQ kod �izelgesini i�erir (her bir sentroid i�in bir tane olan k s�tunlar�)

e = 0.0001;                                % b�lme parametresi
codebk = mean(d, 2);                        % kod kitab�
distortion = int32(inf);             
numOfCentroids = int32(log2(k));            % Kod kelimelerinin say�s�

for i=1:numOfCentroids
    codebk = [codebk*(1+e), codebk*(1-e)];  % b�lme
    while(1==1)
        dis = distance(d, codebk);            % Her bir kod kelimesine her bir noktan�n mesafesi
        [m,ind] = min(dis, [], 2);          % en yak�n merkez i�in 'd' puan noktalar�n�n haritalnmas�
        t = 0;
        lim = 2^i;
        for j=1:lim
            codebk(:, j) = mean(d(:, ind==j), 2);    % daha iyi ortalama de�erlere ula�mak i�in merkezleri g�ncellemek
            x = distance(d(:, ind==j), codebk(:, j));  % Kom�uluk vekt�rlerini olu�turma
            len = length(x);                         % merkezlerin uzunlugu
            for q = 1:len
                t = t + x(q);
            end
        end
        if (((distortion - t)/t) < e)       % Bozulma d�ng�lerinin k�r�lmas�
            break;
        else
            distortion = t;
        end
    end
end