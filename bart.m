% Periodogram averaging, also known as Bartlett's method
% rectangular, Bartlett, Hamming, and Blackman windows
function P_bart=bart(signal,K,n)
P_bart = 0;
ind = 1;
L = floor(length(signal)/K);
win = ones(1,L); %rectanguler
for frame = 1:K
    if ind+L-1 <= length(signal)
        P_peri = abs(fft(signal(ind:ind+L-1).*win,n)).^2/L/K;
        P_bart = P_bart + P_peri;
        ind = ind + L;
    end
end
end