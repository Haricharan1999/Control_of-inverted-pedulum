clc;close all;clear all;
 
 A=[0 1 0 0;
   4.905 0 0 0;
    0 0 0 1; 
    -2.4525 0 0 0];
 B= [0;-0.2; 0; 0.5];
 Q=[10 0 0 0;
     0 100 0 0;
     0 0 5 0;
     0 0 0 1];
 R=0.001;
% initialize starting angle of the pendulum
 thetai=-50;

 k=lqr(A,B,Q,R);

sim("inveerted.slx")

% plotting of curves
t = ans.simX.time;
theta = ans.simX.Data(:,1);
thetad=ans.simX.Data(:,2);
x=ans.simX.Data(:,3);
xd=ans.simX.Data(:,4);

subplot(2,2,1)
plot(t,theta)
xlabel('Time');
ylabel('Theta');
grid on;

subplot(2,2,2)
plot(t,thetad)
xlabel('Time');
ylabel('Angular velocity');
grid on;

subplot(2,2,3)
plot(t,x)
xlabel('Time');
ylabel('Displacement');
grid on;

subplot(2,2,4)
plot(t,xd)
xlabel('Time');
ylabel('Linear velocity');
grid on;
