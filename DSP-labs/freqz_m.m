function [db,mag,pha,w]=freqz_m(b,a)
[H,w]=freqz(b,a,1000,'whole');
H=(H(1:1:501))';
w=(w(1:1:501))';
mag=abs(H);
db=20*log10((mag+eps)/max(mag));
pha=angle(H);
%db=absolute magnitude computed over 0 to pi radians
%pha=phase response computed over 0 to pi radians
%w=501 frequency samples between 0 to pi radians
%b=numerator polynomial of H(z) (for FIR: b=h)
%a=denominator polynomial of H(z) (for FIR: a=[1])
