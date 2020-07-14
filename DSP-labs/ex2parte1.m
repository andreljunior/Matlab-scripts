
% Não funcionou
n = -1:3; x = 1:5;
k = 0:500; w = (pi/500)*k;
X = x .* (exp(-j*pi/500)) .^ (n'*k);

realX = real(X);imagX = imag(X);
magX = abs(X);angX = angle(X);

subplot(2,2,1);plot(k/500,magX);grid
xlabel('Frequency in pi units');ylabel('Magnitude');title('Magnitude Part');
subplot(2,2,3);plot(k/500,angX);grid
xlabel('Frequency in pi units');ylabel('Radians');title('Radians Part');

subplot(2,2,2);plot(k/500,realX);grid
xlabel('Frequency in pi units');ylabel('Real');title('Real Part');
subplot(2,2,4);plot(k/500,imagX);grid
xlabel('Frequency in pi units');ylabel('Imaginary');title('Imaginary Part');