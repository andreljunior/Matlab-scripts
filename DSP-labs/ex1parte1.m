w = [0:1:500]*pi/500;
X = exp(j*w)./(exp(j*w) - 0.5*ones(1,501));

realX = real(X);imagX = imag(X);
magX = abs(X);angX = angle(X);

subplot(2,2,1);plot(w/pi,magX);grid
xlabel('Frequency in pi units');ylabel('Magnitude');title('Magnitude Part');
subplot(2,2,3);plot(w/pi,angX);grid
xlabel('Frequency in pi units');ylabel('Radians');title('Radians Part');

subplot(2,2,2);plot(w/pi,realX);grid
xlabel('Frequency in pi units');ylabel('Real');title('Real Part');
subplot(2,2,4);plot(w/pi,imagX);grid
xlabel('Frequency in pi units');ylabel('Imaginary');title('Imaginary Part');
