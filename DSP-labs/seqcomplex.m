
sigma = input('Digite o valor de sigma: ');
w = input('Digite o valor da frequencia: ');
N = input('Digite o comprimento da sequencia: ');
n = 0:(N-1); c = sigma+w*i; x= exp(c*n);
figure(1)
subplot(2,1,1); stem(n,real(x));
xlabel('n'); ylabel('Amplitude'); title('Parte Real');
subplot(2,1,2); stem(n, imag(x));
xlabel('n'); ylabel('Amplitude'); title('Parte Imaginaria');

figure(2)
subplot(2,1,1); stem(n, abs(x));
xlabel('n'); ylabel('Modulo');
subplot(2,1,2); stem(n,angle(x));
xlabel('n'); ylabel('Fase');