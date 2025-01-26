%GKTstud3 

clc, clf, clear

%Antoine constants for degC, mmHg, log10
A1=7.02447; B1=1161.00; C1=224; %acetone
A2=7.87863; B2=1473.11; C2=230; %methanol

P=760; %mmHg %total pressure

%kokpkt
Tb1=B1./(A1-log10(P))-C1;
Tb2=B2./(A2-log10(P))-C2;

%Calculate the boiling point of the two components
Tstart=(Tb1+Tb2)./2; %temperature at which to start the search


%antoine
Pv1=10.^(A1-(B1./(Tstart+C1)));
Pv2=10.^(A2-(B2./(Tstart+C2)));

x1=0:0.01:1;
x2=(1-x1);

%Wilson parameters
w12=0.65675;
w21=0.77204;

%activity coefficients at x1
gamma1=exp(-log(x1+w12.*x2)+x2.*(w12./(x1+w12.*x2)-w21./(x2+w21.*x1)));
gamma2=exp(-log(x2+w21.*x1)-x1.*(w12./(x1+w12.*x2)-w21./(x2+w21.*x1)));
 
%use fsolve function to find bubble point temperature (Tb) for all the values of the x1 vector (through loop or graphical solution)

%find_Tb is a function we need to create that will check if a certain value of T satisfies  y1+y2-1=0
%current value of x1 and other constants are passed to find_Tb

%Tb=fsolve(@(T)find_Tb(T,x1,gamma1,gamma2,A1,B1,C1,A2,B2,C2,P),Tstart);
%plot dew and bubble point vs temperature and x vs y (operating line)

for i=1:length(x1)
Tb(i)=fsolve(@(T)find_Tb(T,x1(i),gamma1(i),gamma2(i),A1,B1,C1,A2,B2,C2,P),Tstart);

y1(i)=gamma1(i).*(10.^(A1-(B1./(Tb(i)+C1)))).*x1(i)./P;
end
 y2=1-y1;

 plot(x1,Tb,y1,Tb)



