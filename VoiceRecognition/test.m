function test(testdir, n, code)
% Ses Tan�ma: Test A�amas�
%
% Giri�:
% testdir: dizinin dize ad� t�m test ses dosyalar�n� i�erir
% n: test dizisindeki test dosyalar�n�n say�s�
% kod: t�m e�itimli hoparl�rlerin kod kitaplar�
%
% Not:Testdirdeki% ses dosyalar�n�n olmas� gerekiyor:
% s1.wav, s2.wav, ..., sn.wav
%
% �rnek:
% >> test ('C: \ data \ test \', 7, kod);

for k=1:n                       % Her bir konu�mac�n�n test ses dosyas�n� oku
    file = sprintf('%ss%d.wav', testdir, k);
    [s, fs] = audioread(file);      
        
    v = mfcc(s, fs);            % MFFC hesapla
   
    distmin = inf;
    k1 = 0;

    for l = 1:length(code)      % e�itimli her kod kitab� i�in  �arp�kl�k hesapla
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

    msg = sprintf('%d. Konu�mac�  %d. konu�mac� ile e�le�ti', k, kl);
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