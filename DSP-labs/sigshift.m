function[y,n] = sigshift(x,m,n0)
    x = input('Insira a série: ');
    m = input('Insira o intervalo: ');
    n0 = input('Insira o deslocamento: ');
    subplot(2,2,1:2);stem(m,x)
    n=m+n0;
    y=x;
    subplot(2,2,3:4);stem(n,y)
endfunction