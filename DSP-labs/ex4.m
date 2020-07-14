b = [0.0181, 0.0543, 0.0543, 0.0181];
a = [1, -1.76, 1.1829, -0.2781];
m = 0: length(b)-1; l = 0:length(a)-1;
K = 500; k = 0:1:K;
w = pi*k/K;
num = b* exp(-j*m'*w);

den = a*exp(-j*l'*w);
H = num ./ den;
magH = abs(H); angH = angle(H);
subplot(2,2,1); plot(w/pi, magH); grid;
xlabel('frequency in pi units');ylabel('|H|');title('Magnitude Response');
subplot(2,2,2); plot(w/pi, angH); grid;
xlabel('frequency in pi units');ylabel('Phase in pi Radians');title('Phase Response');