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

Outage_Probability=zeros(3,30);
Throughput=zeros(3,30); 

n_test=19; 
Outage_Probability=zeros(3,n_test);
Throughput=zeros(3,n_test);

for test=1:1:n_test
    gamahat_vector=ones(1,NU)*test*0.01;
   
    
    for repeat_test=1:1000 
        initial_power=ones(1,NU).*(rand(1,NU)*10^-3);
        D=Distance_Generator(NU,dontshow);
        H=PathGain_Generator(D,0.09,-3);

   
        % if (check_feasibility(SINR(H , initial_power , BG_Noise) ,NU,Gamma_hat,initial_power,P_bar ))
      
        [Sum_Out_DTPC,Out_prob_DTPC,Throughput_DTPC,P_DTPC,Gamma_DTPC]= DTPC(P_bar,gamahat_vector,eta_vector,BG_Noise,initial_power,H,dontshow);
        [Sum_Out_OPC,Out_prob_OPC,Throughput_OPC,P_OPC,Gamma_OPC]= Constrained_OPC(P_bar,gamahat_vector,eta_vector,BG_Noise,initial_power,H,dontshow); 
        [Sum_Out_TPC,Out_prob_TPC,Throughput_TPC,P_TPC,Gamma_TPC]= Constrained_TPC(P_bar,gamahat_vector,BG_Noise,initial_power,H,dontshow);

        Outage_Probability(1,test)=Outage_Probability(1,test)+Out_prob_TPC;
        Outage_Probability(2,test)=Outage_Probability(2,test)+Out_prob_OPC;
        Outage_Probability(3,test)=Outage_Probability(3,test)+Out_prob_DTPC;
        
        
    
        Throughput(1,test)=Throughput(1,test)+Throughput_TPC; 
        Throughput(2,test)=Throughput(2,test)+Throughput_OPC;
        Throughput(3,test)=Throughput(3,test)+Throughput_DTPC;

      %  else
      %      NU=NU-1;
      %      break;
       % end
    end
    Outage_Probability(:,test)=Outage_Probability(:,test)./repeat_test;
    Throughput(:,test)=Throughput(:,test)./repeat_test;
   step= test
end

figure(8);

 plot(0.01:0.01:test*0.01,Outage_Probability(1,:),'B--o'),grid on,grid minor;
 hold on;
 plot(0.01:0.01:test*0.01,Outage_Probability(2,:),'k-.d'),grid on,grid minor;
 hold on;
 plot(0.01:0.01:test*0.01,Outage_Probability(3,:),'R--^'),grid on,grid minor;
 legend('TPC','OPC','DTPC');
 title('Plot of Outage probability');
 xlabel('Target SINR');
 ylabel('Outage probability');


figure(9);

 
 plot(0.01:0.01:test*0.01,Outage_Probability(2,:),'k-.d'),grid on,grid minor;
 hold on;
 plot(0.01:0.01:test*0.01,Outage_Probability(3,:),'R--^'),grid on,grid minor;
 legend('OPC','DTPC');
 title('Plot of Outage probability');
 xlabel('Target SINR');
 ylabel('Outage probability');


 figure(10);

 plot(0.01:0.01:test*0.01,Throughput(1,:),'B--o'),grid on,grid minor;
 hold on;
 plot(0.01:0.01:test*0.01,Throughput(2,:),'k-.d'),grid on,grid minor;
 hold on;
 plot(0.01:0.01:test*0.01,Throughput(3,:),'R--^'),grid on,grid minor;
 legend('TPC','OPC','DTPC');
 title('Plot of Throughput(SINR)');
 xlabel('Target SINR');
 ylabel('Throughput(SINR)');
 %axis([0.01 0.3 0 12])

figure(11);

 plot(0.01:0.01:test*0.01,Throughput(1,:),'B--o'),grid on,grid minor;
 hold on;
 plot(0.01:0.01:test*0.01,Throughput(2,:),'k-.d'),grid on,grid minor;
 hold on;
 legend('TPC','OPC');
 title('Plot of Throughput(SINR)');
 xlabel('Target SINR');
 ylabel('Throughput(SINR)');
 %axis([0.01 0.3 0 12])

