%carregamento de pacotes
pkg load signal

%leitura, captura de dados e toque do arquivo de audio
[x, fs] = audioread('musiccut.wav');
%info = audioinfo('slidewhistle.wav');
%player = audioplayer(x,fs);
%play(player)

%definição dos eixos de frequência
freq = 0:fs/length(x):fs/2;
freqn = (0:fs/length(x):fs/2)*(1/(fs/2));

%cálculo fft do sinal
N = length(x);
xdft1 = fft(x);
xdft1 = xdft1(1:N/2+1);
psdx1 = (1/(fs*N)) * abs(xdft1).^2;
psdx1(2:end-1) = 2*psdx1(2:end-1);

pause(1);

%definição da frequência de corte normalizada
wc = 0.05;

%criação e plotagem da resposta em frequência do filtro fir
hn = fir1(50,wc);

pause(2);

%filtragem do sinal
f_filt = filter(hn, 1, x );

%representação em frequência do sinal filtrado
N = length(f_filt);
xdft2 = fft(f_filt);
xdft2 = xdft2(1:N/2+1);
psdx2 = (1/(fs*N)) * abs(xdft2).^2;
psdx2(2:end-1) = 2*psdx2(2:end-1);

%plotagem 
figure(1)
subplot(2,2,1); plot(x); title('Sinal original')
subplot(2,2,2); plot(freq,10*log10(psdx1)); grid on; title('FFT do sinal original'); xlabel('Frequency (Hz)'); ylabel('Power/Frequency (dB/Hz)');
subplot(2,2,3:4); plot(freqn,10*log10(psdx2)); title("FFT sinal filtrado"); grid on;

figure(2)
freqz(hn); title('Resposta em frequência do filtro');
%pause(5);

%player = audioplayer(f_filt,44100,8);
%play(player)
audiowrite('audiocut005fir50.wav',f_filt,44100)