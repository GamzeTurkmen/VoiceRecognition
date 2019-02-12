function c = mfcc(s, fs)
% MFCC Bir sinyalin mel frekanslarýnýn cepstrum katsayýlarýný (MFCC)
% hesaplama
%
% Giriþler:
% s: konuþma sinyali
% fs: Hz cinsinden örnekleme oraný
%
% Çýktýlar:
% c: MFCC çýkýþý, her sütun bir konuþma çerçevesi için MFCC'leri içerir
N = 192;                        % çerçeve boyutu
M = 100;                        % çerçeve arasý mesafe
len = length(s);
numberOfFrames = 1 + floor((len - N)/double(M));
mat = zeros(N, numberOfFrames); % çerçevelerin vektör olarak ifade edilmesi

for i=1:numberOfFrames
    index = 100*(i-1) + 1;
    for j=1:N
        mat(j,i) = s(index);
        index = index + 1;
    end
end

hamW = hamming(N);              % hamming pencereleme
afterWinMat = diag(hamW)*mat;   
freqDomMat = fft(afterWinMat);  % frekans domanininde fft alma

filterBankMat = melFilterBank(20, N, fs);                %  filtre bankasý için matris oluþturma
nby2 = 1+floor(N/2);
ms = filterBankMat*abs(freqDomMat(1:nby2,:)).^2; % mel spectrum
c = dct(log(ms));                                % mel-frequency keptsrum katsayýlarý
c(1,:) = [];       %  keptsral katsayýlarý tutma
