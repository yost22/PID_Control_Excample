%% Sample PID Control
% Author: Mark Yost
% Last edited 1/7/2018
% Email: yost772@gmail.com

%% Analysis of sample control system

clear all
close all;

G=tf([1.158, 0.3542, 0.00387],[1, 0.7504, 0.9355, 0.00946, 0.00419]);
step(G)

zeta=[0.04, 0.35];
wn=0.28;
%To make steady state error from a step input zero, we just need an
%intergral term, the value isn't important but shouldn't make the rest of
%the process difficult. 
Ti=2;
for Td=[0,0.1,2.5,4]
    sysC=tf([Td,1,Ti],[1,0]);
    figure;
    rlocus(sysC*G);
    sgrid(zeta,wn)
end

%Choose Td=1, 
Td=4;
K=0.101;
sysC=tf([Td,1,Ti],[1,0]);
figure;
sys_PID=K*sysC*G;
sysYR=feedback(K*sysC*G,1);
step(sysYR)
damp(sysYR)

