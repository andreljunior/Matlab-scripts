function [x,n]=impseq(n0,n1,n2)
%---------------------------------------
% Gera x(n) = delta(n); n1<= n <= n2
% Gera y(n)=x(n-n0)=delta(n-n0); n1<=n<=n2
%---------------------------------------
n=[n1:n2]; x=[n==0];            	% x(n)=1 somente para n=0
m=[n1:n2]; y=[(m+n0)==0];       	% y(n)=1 somente pata n=n0
subplot(2,1,1); stem(n,x);
title('Sequencia unitária Delta(n)'); xlabel('amostra [n]'); ylabel('amplitude [x]');
subplot(2,1,2); stem(m,y);
title('Sequencia unitária Delta(n-no)'); xlabel('amostra [n]'); ylabel('amplitude [y]');