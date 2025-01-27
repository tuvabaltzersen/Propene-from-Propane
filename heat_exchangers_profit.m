% heat exchangers
clear all

% data needed
mc=; %[kg/s] cold flow
cpc=;          %[J/(kgK)] cold flow heat capacity
Tcin=;               %[C] cold flow inlet temperature
Tcout=;             %[C] cold flow outlet temperature

mh=;                %[kg/s] hot flow
cph=;         %[J/(kgK)] hot flow heat capacity
Thin=;               %[C] hot flow inlet temperature

A=;               %[m2] area heat exchanger
U=;                %[W/(m2K)]  heat transfer coefficient
Ka=;                %[SEK/(m2 r)]  cost of heat exchanger
beta=;       %[SEK/Wh] steam cost
tdrift=;           %[h/ r] operation time in a year


% Calculate capacity coefficients Cmin and Cmax

Cmin=cpc.*mc;
Cmax=cph.*mh;

B=1-(Cmin./Cmax);
C=Cmin/Cmax;
NTU=U.*A./Cmin;


profit=fsolve(@(NTU)(((1-C*exp(-B*NTU)-(C*B*exp(-B*NTU)*(1-exp(-B*NTU))))/(1-C*exp(-B*NTU))^2)-Ka/(U.*(Thin-Tcin).*tdrift.*beta)),NTU);




