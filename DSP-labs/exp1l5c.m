
wp=0.2*pi;
ws=0.3*pi;
tr_width=ws-wp;
M=ceil(11*pi/tr_width)+1;
n=[0:1:M-1];
wc=(ws+wp)/2;
hd=ideal_lp(wc,M);

w_black=(blackman(M));
h=hd.*w_black';

[db,mag,pha,w]=freqz_m(h,[1]);

delta_w=2*pi/1000;
Rp=-(min(db(1:1:wp/delta_w+1)))
As=-round(max(db(ws/delta_w+1:1:501)))

subplot(2,2,1);stem(n,hd);title ('Ideal impulse response');axis([0 M-1 -0.1 0.3]);
subplot(2,2,2);stem(n,w_black);title ('Blackman Window');axis([0 M-1 0 1.1]);
subplot(2,2,3);stem(n,h);title ('Actual impulse response');axis([0 M-1 -0.1 0.3]);
subplot(2,2,4);plot(w/pi,db);title ('Magnitude response in dB');axis([0 1 -100 10]);
