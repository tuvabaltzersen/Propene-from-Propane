%Sorel

clear all
P=760; %mmHg
q= 0.8; 
zfa=0.35;   % total conc. of A in the inflow
xfa=0.3063; % conc. of A in the liquid inflow
xd=0.9;
xw=0.1;     % component x in the bottom part of the column 
F=250;      % feed kmol/h
R=3;        % reflux ratio

%Antoine constants (for mmHg, celcius, 10log)
%Ant_a=[6.90565 1211.033 220.790];
A1=6.90565;
B1=1211.033;
C1=220.790;
%Ant_b=[6.95464 1344.800 219.482];
A2=6.95464;
B2=1344.800;
C3=219.482;

gamma1=1;
gamma2=2;


% balances over column
D=F*(zfa-xw)/(xd-xw);
W=F-D; %

% balances over condenser
L=R*D;
V=D*(R+1);

l=L+q*F; % L-streck
v=V-(1-q)*F; % V-streck

%reboiler
y0=5/3-5/(3+4.5*xw); % 
xr=(v/l)*y0+(W/l)*xw;         % components balance reboiler (r) = tray closest to the reboiler

% Stripper part   The step to the feed bottom:
x(1)=xr;
i=0;

while x<xfa
    i=i+1;
    y(i)=5/3-5/(3+4.5*x(i));
    x(i+1)=(v/l)*y(i)+(W/l)*xw;  % Components balance over the stripper part (from bottom up)
end

m=i+1; % trays in the stripper section

% Rectifier
while y(i)<xd
    x(i+1)=(V/L)*y(i)+(1/L)*(W*xw-F*zfa);   %Component balance over rectifier
    i=i+1;
    y(i)=5/3-5/(3+4.5*x(i)); % Phase equilibrium connection
end

%heat demand reboiler
%Calculation of the temperature in the reboiler (Bubblepoint) (HINT Bubbelpunkt i flash från S3)
TK=95.5+273;
% The temperature needs to be put in Kelvin!!

% Composition out of reboiler
x1=y0;              % Component A, mole fractions Vstreck
x2=1-y0;            % Component B, mole fractions Vstreck

% Calculation of enthalpies in gas phase
aAg=0.69381e5;
bAg=0.6752e1;
cAg=0.13199;
aBg=0.31596e5;
bBg=0.15841e2;
cBg=0.15429;

HA=aAg+bAg*TK+cAg*TK^2; % TK needs to be in Kelvin
HB=aBg+bBg*TK+cBg*TK^2; % TK needs to be in Kelvin
Hblandningg=x1*HA+x2*HB; % enthalpy of the mixture [kJ/kmol] 

%Enthalpy liquid phase (see the gas phase calculations above)
aAv=0.19534e5;
bAv=0.63711e2;
cAv=0.12206;
aBv=-0.12588e5;
bBv=0.14150e2;
cBv=0.23130;

hA=aAv+bAv*TK+cAv*TK^2;
hB=aBv+bBv*TK+cBv*TK^2;
hblandningv=HA*xw+HB*(1-xw); %kJ/kmol 

Q_reboiler=v*Hblandningg/3600;        % convert the enthalpies into [kW] 

disp(['överförd effekt' num2str(round(Q_reboiler)),'kW'])
disp(['bottnar nedre del' num2str(m)])
disp(['bottnar övre del' num2str(i-m)])
disp(['bottnar totalt' num2str(i)])

figure(1);
plot(1:i,y,'r');
hold on
plot(1:i,x,'b');
legend('y1','x1');
ylabel('x1,y1');
xlabel('Botten nr (Räknat från återkokaren)');

%Minimum reflux ratio

yfa=5/3-5/(3+4.5*xfa);
Rmin=(xd-yfa)/(yfa-xfa);            % (LV)min = Rmin/(Rmin+1)
disp(['Minsta återflödesförhålland:',num2str(Rmin)])



