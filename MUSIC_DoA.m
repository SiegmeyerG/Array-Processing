%this is the MUSIC algorithms for DoA estimation
% X : received signal
% M: number of antennas
% Delta: distance between antenna in wavelength
% n: resolution for Power plot
function P_MUSIC = MUSIC_DoA(X,M,N,Delta,n)
P_MUSIC = [];
Rx = X*X';
[v,d] = eig(Rx);
[~,ind] = sort(diag(d));
delat = 2*pi*Delta;
sita = linspace(-90,90,(1/n)*180+1);
a = [];
for i=1:M %array response vector
    a = [a;exp(1i*delat*sin(sita/180*pi)*(i-1))];
end
for i = 1:(1/n)*180+1  
    temp = 0;
    for j=1:M-N
    temp = temp+(a(:,i)'*v(:,ind(j))*v(:,ind(j))'*a(:,i)/(a(:,i)'*a(:,i)));
    end
    P_MUSIC = [P_MUSIC 1/temp];
end
end