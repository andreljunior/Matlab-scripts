function [x,n] = expseq(n0,n1,n2)
% gera x(n) = a^n ; n real
%--------------------------------------
% [x,n] = expseq(n0,n1,n2)
%
n0 = input('Insira o deslocamento: ');
n1 = 0+n0;
n2 = 10;
n = [n1:n2]; x = (0.9).^n;
plot(n(:),x(:), 'o') %uma alternativa para o uso do stem
title('LABORATÓRIO DE DSP-Sequência Exponencial');
grid;
xlabel ('n');
ylabel('Sinal Gerado');
