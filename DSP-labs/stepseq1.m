function [x,n]=stepseq(n0,n1,n2)
%---------------------------------------
% Gera x(n) = u(n); n1<= n <= n2
% Gera y(n)=x(n-n0)=u(n-n0); n1<=n<=n2
%---------------------------------------
n=[n1:n2]; x=[n>=0];           	% x(n)=1 somente para n>=0
m=[n1:n2]; y=[(m+n0)>=0];       	% y(n)=1 somente pata n>=n0

stem(m,y);
title('Sequencia degrau unitario u(n-no)'); xlabel('amostra [n]'); ylabel('amplitude [y]');