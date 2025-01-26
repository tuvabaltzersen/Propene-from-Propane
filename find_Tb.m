%find Tb

function res = find_Tb(T,x1,gamma1,gamma2,A1,B1,C1,A2,B2,C2,P)

y1=(gamma1*10.^(A1-(B1/(T+C1)))*x1)/P;
y2=(gamma2*10.^(A2-(B2/(T+C2)))*(1-x1))/P;


%Use T,x1,gamma1,gamma2,A1,B1,C1,A2,B2,C2,P to calculate y1 and y2

res=y1+y2-1;
end
