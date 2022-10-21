function P_beam=Beamformer_DoA(X,M,Delta,n)
P_beam = [];
Rx = X*X';
delat = 2*pi*Delta;
sita = linspace(-90,90,(1/n)*180+1);
a = [];
for i=1:M
    a = [a;exp(1i*delat*sin(sita/180*pi)*(i-1))];
end
for i = 1:(1/n)*180+1
    P_beam = [P_beam a(:,i)'*Rx*a(:,i)/(a(:,i)'*a(:,i))];
end
end