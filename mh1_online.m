clc;
clear all;
load('mh1-1.mat');
Fuzzy_Table=Fuzzy_Table;

Fuzzy_Table

eh=10;
el=-10;
ech=10;
ecl=-10;
uh=10;
ul=-10;
m=6;
n=6;
l=6;

ke=2*m/(eh-el);
e=m*rand(1);
E=round(ke*(e-(eh+el)/2));

if E>6 
E=6;
elseif E<-6
E=-6;
end

kec=2*n/(ech-ecl);
ec=n*rand(1);
EC=round(kec*(ec-(ech+ecl)/2));

if EC>6 
EC=6;
elseif EC<-6
EC=-6;
end

U=Fuzzy_Table (E+7,EC+7);
ku=(uh-ul)/(2*l);
u=ku*U+(uh+ul)/2;


u