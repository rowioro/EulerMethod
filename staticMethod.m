function fc = find_fc(R1, R2, C1, C2, RL)

i=0;
fstart = 1e3;
d=0.00001;

f1=@(f) (abs((1/(R1*R2*C1*C2))/((1i*2*pi*f)^2 + (1i*2*pi*f) * ((1/(R1*C1)) + (1/(R2*C1)) + (1/(R2*C2)))+(1/(R1*R2*C1*C2)))) - 0.7017);

%pierwsza pochodna powyzszej funkcji
f2=@(f) (-(8191999999999999*sign(- 4*pi^2*f^2 + pi*f*187500i + 8191999999999999/8388608)*(pi*187500i - 8*f*pi^2))/(8388608*abs(- 4*f^2*pi^2 + f*pi*187500i + 8191999999999999/8388608)^2));

Xp=fstart;
Xn=Xp-(f1(Xp)/f2(Xp));
FXn=(abs((1/(R1*R2*C1*C2))/((1i*2*pi*Xn)^2 + (1i*2*pi*Xn) * ((1/(R1*C1)) + (1/(R2*C1)) + (1/(R2*C2)))+(1/(R1*R2*C1*C2)))) - 0.7017);
i=i+1;
disp(i);
format long, disp(Xn);
format long, disp(FXn);

while (abs(FXn) > d)
    Xp=Xn;
    Xn=Xp-(f1(Xp)/f2(Xp));
    FXn=(abs((1/(R1*R2*C1*C2))/((1i*2*pi*Xn)^2 + (1i*2*pi*Xn) * ((1/(R1*C1)) + (1/(R2*C1)) + (1/(R2*C2)))+(1/(R1*R2*C1*C2)))) - 0.7017);
    i=i+1;
    disp(i);
    format long, disp(Xn);
    format long, disp(FXn);
end
    
    
    






