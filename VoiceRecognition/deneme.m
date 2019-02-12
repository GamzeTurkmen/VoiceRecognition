
code=train('C:\Users\Gamze\Desktop\dosya\data\train\', 16);
% n=7;
% traindir='C:\data\train\';
% k = 16;                         % gerekli merkez sayýsý
% for i=1:n                       % Her konuþmacý için bir VQ kod kitabý eðitimi
%     file = sprintf('%ss%d.wav', traindir, i);
%     disp(file);
%     
%     [s, fs] = audioread(file);
%     
%     v = mfcc(s, fs);            % MFCC hesapla
%     
%     
%     code{i} = vqCodeBook(v, k);      % Eðitim VQ kitaplýðýný oluþtur
% end
test('C:\Users\Gamze\Desktop\dosya\data\test\',2,code);
% Record your voice for 5 seconds.
% recObj = audiorecorder;
% disp('Start speaking.')
% 
% recordblocking(recObj, 5);
% disp('End of Recording.');
% 
% % Play back the recording.
% play(recObj);

% % Store data in double-precision array.
% myRecording = getaudiodata(recObj);
% 
% % Plot the waveform.
% plot(myRecording);
% % test(myRecording, code);
% 


