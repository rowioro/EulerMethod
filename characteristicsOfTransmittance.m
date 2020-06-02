%clear all
%close all
%clc

function fc = plot_g(R1, R2, C1, C2, RL, fstart, fstop)
%FIND_FC Summary of this function goes here
%   Detailed explanation goes here


%plot_g(1e3, 1e3, 3.2e-6, 3.2e-6, 1, 1e6)

C1=0.032e-6;
C2=0.032e-6;
R1=1000;
R2=1000;

fstart = 1;
fstop = 1e6;

f1=@(f) 20*log(abs((1/(R1*R2*C1*C2))/((1i*2*pi*f)^2 + (1i*2*pi*f) * ((1/(R1*C1)) + (1/(R2*C1)) + (1/(R2*C2)))+(1/(R1*R2*C1*C2)))));


f=fstart:1:fstop;

%Mo?na narysowa? wykres funkcji
for e=1:length(f)
    wykres(e) = f1(f(e));
end
semilogx(f,wykres)
title('Charakterystyka transmitancji');
ylabel('G(s)');
xlabel('f [Hz]');
grid on;
end

