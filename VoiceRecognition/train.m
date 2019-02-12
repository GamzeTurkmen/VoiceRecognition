function code = train(traindir, n)
% Ses Tan�ma: E�itim A�amas�
%
% Giri�:
% traindir: dize ad� / dizin yolu t�m tren ses dosyalar�n� i�erir
% n: traindirdeki tren dosyalar�n�n say�s�
%
% ��kt�:
% kod: e�itimli VQ kod kitaplar�, i-inci konu�mac� i�in kod {i}
%
% Not:Traindirdeki% ses dosyalar�n�n olmas� gerekiyor:
% s1.wav, s2.wav, ..., sn.wav
k = 16;                         % gerekli merkez say�s�
for i=1:n                       % Her konu�mac� i�in bir VQ kod kitab� e�itimi
    file = sprintf('%ss%d.wav', traindir, i);           
    disp(file);
   
    [s, fs] = audioread(file);
    
    v = mfcc(s, fs);            % MFCC hesapla
%     x=2;
%     w= demo(x,k,n);
    code{i} = vqCodeBook(v, k);      % E�itim VQ kitapl���n� olu�tur
    % demos for HMM 
d=3;
[x, model] = hmmRnd(d, k, n);
%%
z = hmmViterbi(x,model);
%%
[alpha,llh] = hmmFilter(x,model);
%%
[gamma,alpha,beta,c] = hmmSmoother(x,model);
%%
[model, llh] = hmmEm(x,k);
plot(llh)

end
