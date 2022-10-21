% minvar
function P_mv = minvar(x,n)
R = x*x';
[v,d]=eig(R);
U = diag(inv(abs(d)+eps));
V = abs(fft(v,n)).^2;
P_mv = 10*log10(1)-10*log10(V*U);
end