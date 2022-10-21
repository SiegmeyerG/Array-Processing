t=1:0.01:10;
x=2*sin(2*pi*t)+sin(10*2*pi*t);
X=fft(x,1024);%fft
plot(1:1024,fftshift(X));