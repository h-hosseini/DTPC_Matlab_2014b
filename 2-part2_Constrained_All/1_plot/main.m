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

P_bar=ones(1,NU)*10^-3;
%Gamma_hat=ones(1,NU)*10^-4;
eta_vector=ones(1,NU)*10^-4;

gamahat_vector=ones(1,NU)*0.2;
   
initial_power=ones(1,NU).*(rand(1,NU)*10^-3);
D=Distance_Generator(NU,show);
H=PathGain_Generator(D,0.09,-3);

   
[Sum_Out_DTPC,Out_prob_DTPC,Throughput_DTPC,P_DTPC,Gamma_DTPC]= DTPC(P_bar,gamahat_vector,eta_vector,BG_Noise,initial_power,H,show);
[Sum_Out_OPC,Out_prob_OPC,Throughput_OPC,P_OPC,Gamma_OPC]= Constrained_OPC(P_bar,gamahat_vector,eta_vector,BG_Noise,initial_power,H,show); 
[Sum_Out_TPC,Out_prob_TPC,Throughput_TPC,P_TPC,Gamma_TPC]= Constrained_TPC(P_bar,gamahat_vector,BG_Noise,initial_power,H,show);

        
        
    
       
