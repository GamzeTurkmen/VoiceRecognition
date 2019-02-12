function c = mfcc(s, fs)
% MFCC Bir sinyalin mel frekanslar�n�n cepstrum katsay�lar�n� (MFCC)
% hesaplama
%
% Giri�ler:
% s: konu�ma sinyali
% fs: Hz cinsinden �rnekleme oran�
%
% ��kt�lar:
% c: MFCC ��k���, her s�tun bir konu�ma �er�evesi i�in MFCC'leri i�erir
N = 192;                        % �er�eve boyutu
M = 100;                        % �er�eve aras� mesafe
len = length(s);
numberOfFrames = 1 + floor((len - N)/double(M));
mat = zeros(N, numberOfFrames); % �er�evelerin vekt�r olarak ifade edilmesi

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

filterBankMat = melFilterBank(20, N, fs);                %  filtre bankas� i�in matris olu�turma
nby2 = 1+floor(N/2);
ms = filterBankMat*abs(freqDomMat(1:nby2,:)).^2; % mel spectrum
c = dct(log(ms));                                % mel-frequency keptsrum katsay�lar�
c(1,:) = [];       %  keptsral katsay�lar� tutma
