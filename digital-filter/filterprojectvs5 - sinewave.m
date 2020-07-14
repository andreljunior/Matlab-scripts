%carregamento de pacotes
pkg load signal

%leitura, captura de dados e toque do arquivo de audio
[x, fs] = audioread('slidewhistle.wav');
%info = audioinfo('slidewhistle.wav');
player = audioplayer(x,fs);
play(player)

%definição dos eixos de frequência
freq = 0:fs/length(x):fs/2;
freqn = (0:fs/length(x):fs/2)*(1/(fs/2));

N = length(x);
xdft1 = fft(x);
xdft1 = xdft1(1:N/2+1);
psdx1 = (1/(fs*N)) * abs(xdft1).^2;
psdx1(2:end-1) = 2*psdx1(2:end-1);

%plotagem do sinal original
figure(1)
subplot(2,1,1); %primeiro na frequência comum
plot(freq,10*log10(psdx1)); grid on; title('Periodogram Using FFT'); xlabel('Frequency (Hz)'); ylabel('Power/Frequency (dB/Hz)');
subplot(2,1,2); %agora no eixo de frequência normalizado
plot(freqn,10*log10(psdx1)); grid on; title('Periodogram Normalized'); xlabel('Frequency(w)'); ylabel('Power/Frequency (dB/w)');

pause(2);

%definição da frequência de corte normalizada
wc = 0.2;

%criação e plotagem da resposta em frequência do filtro fir
hn = fir1(70,wc);
figure(2); freqz(hn); title('Resposta em frequência do filtro');

pause(2);

%filtragem do sinal
f_filt = filter(hn, 1, x );

N = length(f_filt);
xdft2 = fft(f_filt);
xdft2 = xdft2(1:N/2+1);
psdx2 = (1/(fs*N)) * abs(xdft2).^2;
psdx2(2:end-1) = 2*psdx2(2:end-1);

%plotagem do sinal filtrado
figure(3);
subplot(2,1,1);
plot(freq,10*log10(psdx2)); title("Filtered FFT"); grid on;
subplot(2,1,2);
plot(freqn,10*log10(psdx2)); title("Filtered FFT (normalized)"); grid on;

figure(4)
subplot(2,1,1); %agora no eixo de frequência normalizado
plot(freqn,10*log10(psdx1)); grid on; title('Sinal Original'); xlabel('Frequency(w)'); ylabel('Power/Frequency (dB/w)');
subplot(2,1,2);
plot(freqn,10*log10(psdx2)); title("Sinal Filtrado"); grid on;

pause(5);

player = audioplayer(f_filt,44100,8);
play(player)