% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% DTPC Simulation using MATLAB
% Programmer: SeyedHedayat Hosseini
% Date: December, 2015
% Matlab Version: R2014b
% ************* MAIN SCRIPT ************* %

clc;
clear all ;
show=1;
dontshow=0;


BG_Noise = 10^(-10);
NU=6;

initial_power=ones(1,NU).*(rand(1,NU)*10^-3);
P_bar=ones(1,NU)*10^-3;
%Gamma_hat=ones(1,NU)*10^-4;
eta_vector=ones(1,NU)*10^-4;
gamahat_vector=ones(1,NU)*0.02;

D=Distance_Generator(NU,show);
H=PathGain_Generator(D,0.09,-3);
    
[P_DTPC,Gamma_DTPC]= DTPC(P_bar,gamahat_vector,eta_vector,BG_Noise,initial_power,H,show);
%[P_my,Gamma_my]= my_f(gamahat_vector,eta_vector,BG_Noise,initial_power,H,show);
   % initial_power= Power_to_reach_feasibility( NU,H,Gamma_hat,BG_Noise );
   
  