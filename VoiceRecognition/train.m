function code = train(traindir, n)
% Ses Tanýma: Eðitim Aþamasý
%
% Giriþ:
% traindir: dize adý / dizin yolu tüm tren ses dosyalarýný içerir
% n: traindirdeki tren dosyalarýnýn sayýsý
%
% Çýktý:
% kod: eðitimli VQ kod kitaplarý, i-inci konuþmacý için kod {i}
%
% Not:Traindirdeki% ses dosyalarýnýn olmasý gerekiyor:
% s1.wav, s2.wav, ..., sn.wav
k = 16;                         % gerekli merkez sayýsý
for i=1:n                       % Her konuþmacý için bir VQ kod kitabý eðitimi
    file = sprintf('%ss%d.wav', traindir, i);           
    disp(file);
   
    [s, fs] = audioread(file);
    
    v = mfcc(s, fs);            % MFCC hesapla
%     x=2;
%     w= demo(x,k,n);
    code{i} = vqCodeBook(v, k);      % Eðitim VQ kitaplýðýný oluþtur
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
