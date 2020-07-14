pkg load signal

%leitura, captura de dados e toque do arquivo de audio
[y,fs] = audioread('musiccut.wav');
info = audioinfo('slidewhistle.wav');
player = audioplayer(y,fs);
play(player)


N = length(y);

%plotagem do sinal original
figure(1); plot(y); title('Sinal Original'); xlabel('Amostras no tempo'); ylabel('Amplitude')

fnyq = fs/2;
f = (0:fs/N:fnyq);
X = abs(fft(y));
fn = (0:fs/N:fnyq)*(1/fnyq);

%plotagem do sinal original em frequência
figure(2); 
subplot(2,1,1); plot(f(1:N/2),X(1:N/2)); title('Sinal em frequência');
%plotagem do sinal orginal em frequência normalizada
subplot(2,1,2); plot(fn(1:N/2),X(1:N/2)); title('Sinal em frequência normalizada');

%criação e plotagem da resposta em frequência do filtro fir
hn = fir1(50,0.15);
figure(3); freqz(hn); title('Resposta em frequência do filtro')

filt_sig = filter(hn,1,y);
S = abs(fft(filt_sig));
figure(4); 
subplot(2,1,1); plot(fn(1:N/2),S(1:N/2)); title('Sinal Filtrado')
subplot(2,1,2); plot(fn(1:N/2),X(1:N/2)); title('Sinal Original');

pause(15)

player = audioplayer(filt_sig,44100,8);
play(player)

