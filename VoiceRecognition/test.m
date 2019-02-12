function test(testdir, n, code)
% Ses Tanýma: Test Aþamasý
%
% Giriþ:
% testdir: dizinin dize adý tüm test ses dosyalarýný içerir
% n: test dizisindeki test dosyalarýnýn sayýsý
% kod: tüm eðitimli hoparlörlerin kod kitaplarý
%
% Not:Testdirdeki% ses dosyalarýnýn olmasý gerekiyor:
% s1.wav, s2.wav, ..., sn.wav
%
% Örnek:
% >> test ('C: \ data \ test \', 7, kod);

for k=1:n                       % Her bir konuþmacýnýn test ses dosyasýný oku
    file = sprintf('%ss%d.wav', testdir, k);
    [s, fs] = audioread(file);      
        
    v = mfcc(s, fs);            % MFFC hesapla
   
    distmin = inf;
    k1 = 0;

    for l = 1:length(code)      % eðitimli her kod kitabý için  çarpýklýk hesapla
        d = distance(v, code{l}); 
        dist = sum(min(d,[],2)) / size(d,1);
      
        if dist < distmin
            distmin = dist;
            kl = l;
        end      
    end
%     d=3;
% [x, model] = hmmRnd(d, k, n);
% %%
% z = hmmViterbi(x,model);
% %%
% [alpha,llh] = hmmFilter(x,model);
% %%
% [gamma,alpha,beta,c] = hmmSmoother(x,model);
% %%
% [model, llh] = hmmEm(x,k);
% plot(llh)

end

    msg = sprintf('%d. Konuþmacý  %d. konuþmacý ile eþleþti', k, kl);
    disp(msg);
%     if kl<6
%         ms = sprintf('istanbul');
%     elseif (5<kl)&&(kl<12)
%         ms = sprintf('deney');
%     elseif (11<kl)&&(kl<18)
%         ms = sprintf('kelime');
%     elseif (17<kl)&&(kl<24)
%         ms = sprintf('mektup');
%     elseif (23<kl)&&(kl<31)
%         ms = sprintf('resim');
%     elseif (30<kl)&&(kl<37)
%         ms = sprintf('ses');
%     else
%         ms = sprintf('yeni');
%     end
% 
%    disp(ms);
        
end