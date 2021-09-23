

clc
clear all
close all

% Fixed Parameters
theta47= 155;   
theta24=40;
theta46=140;

d_nm=2*(1.5/4.1);
a_b=6.2*(1.5/4.1);
c_b=0.7*(1.5/4.1);
o4o6=2.6*(1.5/4.1);
d6=2.2*(1.5/4.1);

d47=1.9*(1.5/4.1);
d_h7=4.2*(1.5/4.1);
d_g4=3.3*(1.5/4.1);
d_gh=1*(1.5/4.1);

d_lm=1.1 *(1.5/4.1);        
d_4n=2.4*(1.5/4.1);
d_7l=2.4*(1.5/4.1);

d24=2.5*(1.5/4.1);
ao4=0.8*(1.5/4.1);
aA=2.6*(1.5/4.1);
o2o4=2.5*(1.5/4.1);
Ao4=2.6*(1.5/4.1);

d_fd=1.7*(1.5/4.1);
b=0.8*(1.5/4.1);
d46=2.6*(1.5/4.1);
b_f=0.8*(1.5/4.1);
d_d6=2.1*(1.5/4.1);

FD=1.7*(1.5/4.1);
FB=2.8*(1.5/4.1);
BC=0.6*(1.5/4.1);
DC=1.2*(1.5/4.1);
 d1=0.9512;
d3=0.9878;
d4=0.3658;

t=0:0.1:10;
sf=3.6*(1.5/4.1);
si=2.5*(1.5/4.1);
s=si+(sf-si)*(t./10-(1/(2*pi)).*sin(2*pi*t/10));
figure(1)
plot(t,s)
grid on
title('s(t)')
us=diff(s);
us=[0 us];
as=diff(s,2);
as=[0 0 as] ;

figure(2)
plot(t,us)
grid on
%title ('s''(t)')
figure(3)
plot(t,as)
grid on

A=2*d1*d3*cosd(40);
B=2*d1*d3*sind(40);
C=d1^2+d3^2-s.^2;

theta3=2*atan2d((-B-sqrt(B.^2-C.^2+A.^2)),(C-A)); 
theta2=atan2d((d1*sind(40)+d3*sind(theta3)),(d1*cosd(40)+d3*cosd(theta3)));

%loop 2 slider
A_extra=2*Ao4*aA*cosd(theta3);
B_extra=2*Ao4*aA*sind(theta3);
C_extra=aA^2+Ao4^2-ao4^2;

theta4=2*atan2d((-B-sqrt(B.^2-C.^2+A.^2)),(C-A))+196.2518; %we added sth
u_theta4=diff(theta4);
u_theta4=[0 u_theta4];
a_theta4=diff(theta4,2);
a_theta4=[0 0 a_theta4];

figure(4)
plot(t,theta4)
grid on
u_theta4=diff(theta4);
u_theta4=[0 u_theta4];
a_theta4=diff(theta4,2);
a_theta4=[0 0 a_theta4];
figure(5)
plot(t,u_theta4)
grid on
figure(6)
plot(t,a_theta4)
grid on
figure(7) 
plot(t,theta2)
grid on
u_theta2=diff(theta2);
u_theta2=[0  u_theta2];
a_theta2=diff(theta2,2);
a_theta2=[0  0 a_theta2];
figure(8)
plot(t,u_theta2)
grid on
figure(9)
plot(t,a_theta2)
grid on
%First Six Bar

%Loop 1 
A11=(-2*d_fd*b*cosd(theta4+pi/2)-2*d_fd*b_f*cosd(theta4)-2*d_fd*d46*cosd(theta46)); 
B11=(-2*d_fd*b*sind(theta4+90)-2*d_fd*b_f*sind(theta4)-2*d_fd*d46*sind(theta46));
C11=d46.^2+b_f.^2+b.^2+d_fd.^2 +2*b*d46*cosd(theta4+90-theta46)+2*b_f*d46*cosd(theta4-theta46)-d_d6^2;

thetafd=2*atan2d((-B11+sqrt(A11.^2+B11.^2-C11.^2)),(C11-A11));
theta6=atan2d(b*sind(theta4+90)+b_f*sind(theta4)+d_fd*sind(thetafd)-d46*sind(theta46),b*cosd(theta4+90)+b_f*cosd(theta4)+d_fd*cosd(thetafd)-d46*cosd(theta46));
figure(10)
plot(thetafd,t)
grid on
u_thetafd=diff(thetafd);
u_thetafd=[0  u_thetafd];
a_thetafd=diff(thetafd,2);
a_thetafd=[0 0  a_thetafd];
figure(11)
plot(t,u_thetafd)
grid on
figure(12)
plot(t,a_thetafd)
grid on
figure(13)
plot(t,theta6)
grid on
u_theta6=diff(theta6);
u_theta6=[0 u_theta6];
a_theta6=diff(theta6,2);
a_theta6=[0  0 a_theta6];
figure(14)
plot(t,u_theta6)
grid on
figure(15)
plot(t,a_theta6)
grid on
%loop 2

A12=cosd(theta4)*2*FB*DC+2*FD*DC*cosd(thetafd);
B12=sind(theta4)*2*FB*DC+2*FD*DC*sind(thetafd);
C12=FB^2+FD^2+DC^2-BC^2+2*FB*FD*cosd(theta4-thetafd);

thetaDC=2*atan2d((-B12+sqrt(A12.^2+B12.^2-C12.^2)),(C12-A12));
thetaBC=atan2d(FB*sind(theta4)+FD*sind(thetafd)+DC*sind(thetaDC),FB*cosd(theta4)+FD*cosd(thetafd)+DC*cosd(thetaDC));
u_thetaDC=diff(thetaDC);
u_thetaDC=[0 u_thetaDC];
a_thetaDC=diff(thetaDC,2);
a_thetaDC=[0 0 a_thetaDC];
u_thetaBC=diff(thetaBC);
u_thetaBC=[0 u_thetaBC];
a_thetaBC=diff(thetaBC,2);
a_thetaBC=[0 0 a_thetaBC];
figure(16)
plot(t,thetaDC)
grid on
figure(17)
plot(t,u_thetaDC)
grid on
figure(18)
plot(t,a_thetaDC)
grid on
figure(19)
plot(t,thetaBC)
grid on
figure(20)
plot(t,u_thetaBC)
grid on
figure(21)
plot(t,a_thetaBC)
grid on
% Second Six Bar loop 1 
A21=-2*d47*d_h7*cosd(theta47)-2*d_h7*d_g4*cosd(theta4+90);
B21=-2*d47*d_h7*sind(theta47)-2*d_h7*d_g4*sind(theta4+90);
C21=d47.^2+d_h7.^2+d_g4.^2-d_gh.^2+2*d47*d_g4*cosd(theta47-(theta4+90));

theta7=2*atan2d(-B21+sqrt(B21.^2+A21.^2-C21.^2),C21-A21);
thetagh=atan2d(d47*sind(theta47)+d_h7*sind(theta7)-d_g4*sind(theta4+90),d47*cosd(theta47)+d_h7*cosd(theta7)-d_g4*cosd(theta4+90));
u_theta7=diff(theta7);
u_theta7=[0 u_theta7];
a_theta7=diff(theta7,2);
a_theta7=[0 0 a_theta7];
u_thetagh=diff(thetagh);
u_thetagh=[0 u_thetagh];
a_thetagh=diff(thetagh,2);
a_thetagh=[0 0 a_thetagh];
figure(22)
plot(t,theta7)
grid on
figure(23)
plot(t,u_theta7)
grid on
figure(24)
plot(t,a_theta7)
grid on
figure(25)
plot(t,thetagh)
grid on
figure(26)
plot(t,u_thetagh)
grid on
figure(27)
plot(t,a_thetagh)
grid on
% second six bar loop 2
A22=-2*d47*d_lm*cosd(theta47)+2*d_7l*d_lm*cosd(theta7)-2*d_lm*d_4n*sind(theta4);
B22=-2*d47*d_lm*sind(theta47)+2*d_7l*d_lm*sind(theta7)-2*d_lm*d_4n*cosd(theta4);
C22=d47.^2+d_7l.^2+d_lm.^2+d_4n.^2-d_nm.^2-2*d47*d_7l*cosd(theta47-theta7)+2*d47*d_4n*sind(theta47-theta4)-2*d_4n*d_7l*sind(theta7-theta4);

thetalm=2*atan2d(-B22+sqrt(B22.^2+A22.^2-C22.^2),C22-A22);
thetanm=atan2d(d47*sind(theta47)+d_7l*sind(theta7)+d_lm*sind(thetalm)-d_4n*sind(theta4+90),d47*cosd(theta47)+d_7l*cosd(theta7)+d_lm*cosd(thetalm)-d_4n*cosd(theta4+90));
u_thetalm=diff(thetalm);
u_thetalm=[0 u_thetalm];
a_thetalm=diff(thetalm,2);
a_thetalm=[0 0 a_thetalm];
u_thetanm=diff(thetanm);
u_thetanm=[0 u_thetanm];
a_thetanm=diff(thetanm,2);
a_thetanm=[0 0 a_thetanm];
figure(28)
plot(t,thetalm)
grid on
figure(29)
plot(t,u_thetalm)
grid on
figure(30)
plot(t,a_thetalm)
grid on

figure(31)
plot(t,thetanm)
grid on
figure(32)
plot(t,u_thetanm)
grid on
figure(33)
plot(t,a_thetanm)
grid on
grid on

