%Sorel

clear all
P=760; %mmHg
q= ;   
zfa=;   % total conc. of A in the inflow
xfa=; % conc. of A in the liquid inflow
xd=;      %component x in the beginin of the column
xw=;     % component x in the bottom part of the column 
F=;      % feed kmol/h
R=;        % reflux ratio

%Antoine constants (for mmHg, celcius, 10log)
%Ant_a=[A1 B1 C1];
A1=;
B1=;
C1=;
%Ant_b=[A2 B2 C2];
A2=;
B2=;
C3=;

gamma1=;
gamma2=;


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
%Calculation of the temperature in the reboiler (Bubblepoint) kelvin
TK=;


% Composition out of reboiler
x1=y0;              % Component A, mole fractions Vstreck
x2=1-y0;            % Component B, mole fractions Vstreck

% Calculation of enthalpies in gas phase
aAg=;
bAg=;
cAg;
aBg=;
bBg=;
cBg=;

HA=aAg+bAg*TK+cAg*TK^2; % TK needs to be in Kelvin
HB=aBg+bBg*TK+cBg*TK^2; % TK needs to be in Kelvin
Hmixg=x1*HA+x2*HB; % enthalpy of the mixture [kJ/kmol] 

%Enthalpy liquid phase 
aAv=;
bAv=;
cAv=;
aBv=;
bBv=;
cBv=;

hA=aAv+bAv*TK+cAv*TK^2;
hB=aBv+bBv*TK+cBv*TK^2;
hmixv=HA*xw+HB*(1-xw); %kJ/kmol 

Q_reboiler=v*Hmixg/3600;        % convert the enthalpies into [kW] 

disp(['transmitted power' num2str(round(Q_reboiler)),'kW'])
disp(['trays bottom part' num2str(m)])
disp(['trays upper part' num2str(i-m)])
disp(['trays tot' num2str(i)])

figure(1);
plot(1:i,y,'r');
hold on
plot(1:i,x,'b');
legend('y1','x1');
ylabel('x1,y1');
xlabel('trays nr (calc. from reboiler)');

%Minimum reflux ratio

yfa=5/3-5/(3+4.5*xfa);
Rmin=(xd-yfa)/(yfa-xfa);            % (LV)min = Rmin/(Rmin+1)
disp(['Min reflux ratio:',num2str(Rmin)])



