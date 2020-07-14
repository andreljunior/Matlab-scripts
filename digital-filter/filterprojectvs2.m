%leitura, captura de dados e toque do arquivo de audio
pkg load signal

[x, fs] = audioread('musiccut.wav');
info = audioinfo('slidewhistle.wav');
player = audioplayer(x,fs);
play(player)

figure(4)
plot(abs(x))

N = length(x);
xdft = fft(x);
xdft = xdft(1:N/2+1);
psdx = (1/(fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:fs/length(x):fs/2;

figure(1)
plot(freq,10*log10(psdx))
grid on
title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

fs = length(x);
Fnyq = fs/2;
fc = 500;
fdev = 20;
%[b,a]=butter(8, [900/Fs,1100/Fs]);
hc = fir1(20,fc/fs);
f_filt = filter( hc, 1, x );

N = length(f_filt);
xdft = fft(f_filt);
xdft = xdft(1:N/2+1);
psdx = (1/(fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:fs/length(x):fs/2;

figure(2);
plot( freq,10*log10(psdx) );
title("filtered fft");

figure(3);
freqz(fir1(41,0.5));

pause(15)

player = audioplayer(f_filt,44100,8);
play(player)