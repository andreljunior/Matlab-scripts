
ws1 = 0.3 * pi; wp1 = 0.4 * pi;
wp2 = 0.6 * pi; ws2 = 0.7 * pi;
As = 60;

tr_width = min((wp1-ws1),(ws2-wp2));
M = ceil(11*pi/tr_width) + 1
n = [0:1:M-1];
wc1 = (ws1+wp1)/2;wc2 = (ws2+wp2)/2;

hd = ideal_lp(wc2,M) - ideal_lp(wc1,M);
w_bla = (blackman(M))';
h = hd .* w_bla;

[db,mag,pha,w] = freqz_m(h,[1]);
delta_w = 2*pi/1000;

Rp = -min(db(wp1/delta_w+1:1:wp2/delta_w))
As = -round(max(db(ws2/delta_w+1:1:501)))

subplot(2,2,1); stem(n,hd);title('Ideal Impulse Response');axis([0 M-1 -0.4 0.5]);xlabel('n');ylabel('hd(n)');
subplot(2,2,2); stem(n,w_bla); title('Blackman Window');axis([0 M-1 0 1.1]);xlabel('n'); ylabel('w(n)');
subplot(2,2,3);stem(n,h);title('Actual impulse response');axis([0 M-1 -0.4 0.5]);xlabel('n'); ylabel('h(n)');
subplot(2,2,4);plot(w/pi,db);title ('Magnitude response in dB');axis([0 1 -100 10]);xlabel('Frequency in pi units'); ylabel('db');