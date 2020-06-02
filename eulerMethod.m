clear all

close all

clc

%% Definicja stalych

C1=3.2e-8;

C2=3.2e-8;

R1=1000;

R2=1000;

RL=1000;

%% Definicja funkcji

funcU1=@(t,u1,u2) (1/C1*(((E-u1)/R1)-((u1-u2)/R2)));

funcU2=@(t,u1,u2) (1/C2*(((u1-u2)/R2)-(u2/RL)));

%% Parametry symulacji

h=0.000007;

t=0:h:0.001;

%% Symulacja

for q=1:7

uT= [0];

uJ= [0];

switch q

case 1

E=1;

funcU1=@(t,u1,u2) (1/C1*(((E-u1)/R1)-((u1-u2)/R2)));

funcU2=@(t,u1,u2) (1/C2*(((u1-u2)/R2)-(u2/RL)));

for e=2:length(t)

uT(e) = uT(e-1) + h*funcU1(t(e-1), uT(e-1),uJ(e-1));

uJ(e) = uJ(e-1) + h*funcU2(t(e-1), uT(e-1),uJ(e-1));

end

figure(q)

plot(t,[uT; uJ])

legend('u2','u1')

title('Wykres przebiegów dla E=1')

case 2

f=50;

E=@(t) sin(2*pi*f*t);

funcU1=@(t,u1,u2) (1/C1*(((E(t)-u1)/R1)-((u1-u2)/R2)));

funcU2=@(t,u1,u2) (1/C2*(((u1-u2)/R2)-(u2/RL)));

for e=2:length(t)

uT(e) = uT(e-1) + h*funcU1(t(e-1), uT(e-1),uJ(e-1));

uJ(e) = uJ(e-1) + h*funcU2(t(e-1), uT(e-1),uJ(e-1));

end

figure(q)

plot(t,[uT;uJ])

legend('u2','u1')

title('Wykres przebiegów dla E = sin(2*pi*f*t), dla f = 50');

case 3

f=500;

E=@(t) sin(2*pi*f*t);

funcU1=@(t,u1,u2) (1/C1*(((E(t)-u1)/R1)-((u1-u2)/R2)));

funcU2=@(t,u1,u2) (1/C2*(((u1-u2)/R2)-(u2/RL)));

for e=2:length(t)

uT(e) = uT(e-1) + h*funcU1(t(e-1), uT(e-1),uJ(e-1));

uJ(e) = uJ(e-1) + h*funcU2(t(e-1), uT(e-1),uJ(e-1));

end

figure(q)

plot(t,[uT;uJ])

legend('u2','u1')

title('Wykres przebiegów dla E = sin(2*pi*f*t), dla f = 500');

case 4

f=1800;

E=@(t) sin(2*pi*f*t);

funcU1=@(t,u1,u2) (1/C1*(((E(t)-u1)/R1)-((u1-u2)/R2)));

funcU2=@(t,u1,u2) (1/C2*(((u1-u2)/R2)-(u2/RL)));

for e=2:length(t)

uT(e) = uT(e-1) + h*funcU1(t(e-1), uT(e-1),uJ(e-1));

uJ(e) = uJ(e-1) + h*funcU2(t(e-1), uT(e-1),uJ(e-1));

end

figure(q)

plot(t,[uT;uJ])

legend('u2','u1')

title('Wykres przebiegów dla E = sin(2*pi*f*t), dla f = 1800');

case 5

f=10000;

E=@(t) sin(2*pi*f*t);

funcU1=@(t,u1,u2) (1/C1*(((E(t)-u1)/R1)-((u1-u2)/R2)));

funcU2=@(t,u1,u2) (1/C2*(((u1-u2)/R2)-(u2/RL)));

for e=2:length(t)

uT(e) = uT(e-1) + h*funcU1(t(e-1), uT(e-1),uJ(e-1));

uJ(e) = uJ(e-1) + h*funcU2(t(e-1), uT(e-1),uJ(e-1));

end

figure(q)

plot(t,[uT;uJ])

legend('u2','u1')

title('Wykres przebiegów dla E = sin(2*pi*f*t), dla f = 10000');

case 6

f=20000;

E=@(t) sin(2*pi*f*t);

funcU1=@(t,u1,u2) (1/C1*(((E(t)-u1)/R1)-((u1-u2)/R2)));

funcU2=@(t,u1,u2) (1/C2*(((u1-u2)/R2)-(u2/RL)));

for e=2:length(t)

uT(e) = uT(e-1) + h*funcU1(t(e-1), uT(e-1),uJ(e-1));

uJ(e) = uJ(e-1) + h*funcU2(t(e-1), uT(e-1),uJ(e-1));

end

figure(q)

plot(t,[uT;uJ])

legend('u2','u1')

title('Wykres przebiegów dla E = sin(2*pi*f*t), dla f = 20000');

case 7

f=1/0.0004;

E=@(t) round(1/2*cos(2*pi*t*f)+1/2);

funcU1=@(t,u1,u2) (1/C1*(((E(t)-u1)/R1)-((u1-u2)/R2)));

funcU2=@(t,u1,u2) (1/C2*(((u1-u2)/R2)-(u2/RL)));

for e=2:length(t)

uT(e) = uT(e-1) + h*funcU1(t(e-1), uT(e-1),uJ(e-1));

uJ(e) = uJ(e-1) + h*funcU2(t(e-1), uT(e-1),uJ(e-1));

end

figure(q)

plot(t,[uT;uJ])

legend('u2','u1')

title('Wykres przebiegów dla  E = round(1/2*cos(2*pi*t*(1/f))+1/2, dla T = 0.4ms');

end

end