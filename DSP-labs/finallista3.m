%Definições
imp = impseq1(0,-20,100);
step = stepseq1(0,-20,100);
n = [-20:100];

%a
a = filter([0.25],[1,-0.75],imp);
%b
b = filter([0.5],[1,-0.5],imp);
%c
c = filter([0.05],[1,-0.95],imp);
%d
d = filter([0.25],[1,-0.75],step);
%e
e = filter([0.05],[1,-0.95],step);

%Plotagem
subplot(3,3,1); stem(n,a); xlabel('Tempo discreto (n)'); ylabel('Amplitude'); title('Letra a');
subplot(3,3,2); stem(n,b); xlabel('Tempo discreto (n)'); ylabel('Amplitude'); title('Letra b');
subplot(3,3,3); stem(n,c); xlabel('Tempo discreto (n)'); ylabel('Amplitude'); title('Letra c');
subplot(3,3,4); stem(n,d); xlabel('Tempo discreto (n)'); ylabel('Amplitude'); title('Letra d');
subplot(3,3,5); stem(n,e); xlabel('Tempo discreto (n)'); ylabel('Amplitude'); title('Letra e');