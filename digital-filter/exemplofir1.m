%carregamento do pacote necessario
pkg load signal

%definição frequência de amostragem 
Fs = 2000;

%definição de 1 período dividido em 1/Fs unidades
t = 0:1/Fs:1-1/Fs;

%geração de um sinal (ruido branco)
x = 0.25 * randn (2, 44100);
%se vc retira os % as linhas de baixo produzem o som
%player = audioplayer (x, 44100, 8);
%play (player); 


%visualização do sinal em frequência
N = length(x);
xdft = fft(x);
xdft = xdft(1:N/2+1);
psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);

%aqui ele  define o eixo horizontal
%vi em alguns lugares chamarem isso de normalização
%No lab 5 nós tambem fizemos isso de "normalizar" mas eu
%confesso que nao entendi como funciona 
freq = 0:Fs/length(x):Fs/2;

%plotagem do sinal em frequência
figure(1)
plot(freq,10*log10(psdx)) %nao entendi como a pessoa fez essa plotagem...
grid on
title('Periodogram Using FFT')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

%criação do filtro fir
Fs = length(x);
Fnyq = Fs/2;
fc = 1000;
fdev = 20;
hc = fir1(41,fc/Fs);

%filtragem do sinal
f_filt = filter( hc, 1, x );

%fft do sinal filtrado
%essa parte eu peguei de um dos exemplos passados
%problema é que eu nao entendi o que a pessoa fez. Só copiei
N = length(f_filt);
xdft = fft(f_filt);
xdft = xdft(1:N/2+1);
psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:Fs/length(x):Fs/2;

%plotagem da fft do sinal filtrado
figure(2);
plot( freq,10*log10(psdx) );
title("filtered fft");

%plotagem da resposta em frequência do filtro 
figure(3);
freqz(fir1(41,0.5));

%tentei tocar este novo sinal filtrado mas ele não produz som
player = audioplayer (f_filt, 44100, 8);
play (player); 

%o grande problema, é que esse filtro nao retira os sinais com 
%frequencia acima da fcorte que eu defini
%como nao entendi bem todo o processo, tenho certeza que fiz algo errado...