function [x,n] = senoseq(n1,n2)
% gera x(n) = 3*seno(0,2*pi*n)
%--------------------------------------
% [x,n] = senoseq(n1,n2)
%
n1 = 0; n2 = 10;
n = [n1:n2]; x = 3*sin(0.2*pi*n-pi/6)+2*cos(0.5*pi*n+pi/2);
plot(n(:), x(:),'-'); %uma alternativa para o uso do stem
grid; xlabel ('Amostragem n');
ylabel ('x(n)');
title('Sequencia Senoidal');
