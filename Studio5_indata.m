% Grundl ggande kemiteknik, studio vning 5� �
% V rmev xlare� �
clear all

% Givna data
mc=4; %[kg/s] Produktfl de (c=kalla fl det) product� �flow(c = cold flow)

cpc=2.4*10^3;          %[J/(kgK)] Produktfl dets v rmekapacitet product� � flow heat capacity
Tcin=20;               %[C] Produktfl dets temperatur in product� flow inlet temperature
Tcut=100;              %[C] Produktfl dets temperatur ut product� flow outlet temperature
mh=3.0;                %[kg/s] Kondensatfl de (h=varma fl det) condensate� � flow (h = hot flow)
cph=4.18*10^3;         %[J/(kgK)] Kondensatfl dets v rmekapacitet condensate� � flow heat capacity
Thin=90;               %[C] Kondensatfl dets temperatur in condensate� flow inlet temperature
Abef=25;               %[m2] Arean p den befintliga f rv rmaren area of� � � existing preheater
U=1500;                %[W/(m2K)] V rmegenomg ngstal overall� � heat transfer coefficient
Ka=600;                %[SEK/(m2 r)] Kostnad f r v rmev xlaren cost of� � � � heat exchanger
beta=0.10*10^-3;       %[SEK/Wh] Kostnad f r ngan cost of� �  steam
tdrift=4000;           %[h/ r] Driftstid p ett r operation� � �time in a year
A=25:0.1:100;

% Calculate capacity coefficients Cmin and Cmax
Cmin=cpc.*mc;
Cmax=cph.*mh;
%Calculate optimal area. (While-loop or fsolve)
B=1-(Cmin./Cmax);
C=Cmin/Cmax;
NTU=U.*A./Cmin;


profit=fsolve(@(NTU)(((1-C*exp(-B*NTU)-(C*B*exp(-B*NTU)*(1-exp(-B*NTU))))/(1-C*exp(-B*NTU))^2)-Ka/(U.*(Thin-Tcin).*tdrift.*beta)),NTU);

% Remember quotient rule for differentiating: D (f/g) = (f'g-fg')/g^2
% Calculate transferred heat in the new heat exchanger
%Calculate the fraction of reduced steam output (efficiency, output,
%effect?)
% Present the result


