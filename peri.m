% periodogram
function P_peri = peri(signal, n)
P_peri = abs(fft(signal,n)).^2/length(signal);
end