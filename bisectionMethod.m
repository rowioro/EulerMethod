%clear all
%close all
%clc

function fc = find_fc(R1, R2, C1, C2, RL)
%FIND_FC Summary of this function goes here
%   Detailed explanation goes here


%find_fc(1000, 1000, 3.2e-8, 3.2e-8, 1000)

%C1=3.2e-8;
%C2=3.2e-8;
%R1=1000;
%R2=1000;
%RL=1000;

i=0;
fstart = 1e3;
fstop = 2e3;
d=0.00001;

f1=@(f) (abs((1/(R1*R2*C1*C2))/((1i*2*pi*f)^2 + (1i*2*pi*f) * ((1/(R1*C1)) + (1/(R2*C1)) + (1/(R2*C2)))+(1/(R1*R2*C1*C2)))) - 0.7017);

f=fstart:1:fstop;

for e=1:length(f)
    wykres(e) = f1(f(e));
end

%Mozna narysowac wykres funkcji
plot(f,wykres)
title('Metoda Bisekcji');
grid on;

fa=f1(fstart);
fb=f1(fstop);

if fa*fb<0
    x=(fstart+fstop)/2;
    i=i+1;
    disp(i);
end 

fx=f1(x);    
format long, disp(x);
format long, disp(fx);

while (abs(fx) > d)
    
    if fx*fb<0
        fa=fx;
        fstart=x;
        x=(fstart+fstop)/2; 
        fx=f1(x);
        i=i+1;
        disp(i);
        format long, disp(x);
    end
    if fx*fa<0
        fb=fx;
        fstop=x;
        x=(fstart+fstop)/2;
        fx=f1(x);
        i=i+1;
        disp(i);
        format long, disp(x);
    end

end

    
end

