 [speech,fs,nbits]= wavread('kelime.wav');

Fs = 10000 ; % Hz.
 
 t = 0 : 1 / Fs : 1 ; 

 x = sin(2*pi*1000*t) ; % 1000 Hz lik sinusoidal sinyal 

 wavwrite( x , Fs , 8 , ' sinus_1000Hz ' ) ; % ses dosyasýna yazma 

 dlmwrite( ' sinus_1000Hz.txt ' , x ) ; % text dosyasýna yazma 

 [ x , Fs ] = wavread( ' sinus_1000Hz ' ) ; % ses dosyasýndan okuma 

 x = dlmread( ' sinus_1000Hz.txt ' ) ; % text dosyasýndan okuma 
 sound( x , Fs )