%GKTstud3 

1 = acetone 2 = methanol
clear all;

%Wilson parameters
W12=0.65675;
W21=0.77204;

%Antoine constants for degC, mmHg, log10
A1=7.02447; B1=1161.00; C1=224; %acetone
A2=7.87863; B2=1473.11; C2=230; %methanol
%total pressure

P=760; %mmHg

%Calculate the boiling point of the two components
Tstart=...; %temperature at which to start the search
x1=?;

%activity coefficients at x1
gamma1=...;
gamma2=...;
 
%use fsolve function to find bubble point temperature (Tb) for all the values of
the x1 vector (through loop or graphical solution)
%find_Tb is a function we need to create that will check if a certain value of T
satisfies y1+y2-1=0
%current value of x1 and other constants are passed to find_Tb

Tb=fsolve(@(T)find_Tb(T,x1,gamma1,gamma2,A1,B1,C1,A2,B2,C2,P),Tstart);
%plot dew and bubble point vs temperature and x vs y (operating line)
