
function [y,ny] = conv_m(x,nx,h,nh)
%rotina de convolu��o modificada 
%para obter os limites da fun��o resultante
% [y,ny] - resultado da convolu��o
%[x,nx] - primeiro sinal
% [h,nh] - segundo sinal

nyb = min(nx(1),nh(1)); nye = max(nx(length(x)),nh(length(h)));
ny = [nyb:nye];
ny(1)
ny(length(ny))
y = conv(x,h); 