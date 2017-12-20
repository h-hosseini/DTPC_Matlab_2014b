% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% DTPC Simulation using MATLAB
% Programmer: SeyedHedayat Hosseini
% Date: December, 2015
% Matlab Version: R2014b
% ******************************************************* %

function [Sum_Outage,Outage_probability,Throughput,P,Gamma]= Unconstrained_TPC(Gamma_hat,Noise,initial_power,H,show_plot)
%This function simulate Costrained TPC algorithm

iteration=500;
NU=length(H(1,:));

P(1,:)=initial_power;
Gamma(1,:)=SINR(H,initial_power,Noise);



for i=2:iteration
    P(i,:)=Gamma_hat(1,:)./Gamma(i-1,:).*P(i-1,:);
    Gamma(i,:)=SINR(H,P(i,:),Noise);
    if(abs(P(i,:) - P(i-1,:))<=0.000001)
        iteration=i;
        break;
    end
end

Outage_probability=0;
Throughput=0;
Sum_Outage=0;
for j=1:NU
    if ((Gamma_hat(1,j)-Gamma(i,j))>10^-4)
        Sum_Outage=Sum_Outage+1;
    end
    Throughput=Throughput+Gamma(i,j);
end
Outage_probability=Sum_Outage/NU;


if (show_plot)
    figure(6);
    for i=1:NU
        plot(1:iteration,P(:,i)), grid on, grid minor;
        %legend('User1','User2','User3','User4','User5','User6');
        title('TPC Power');
        xlabel('Users');
        ylabel('Powers');
        hold on;
        
    end

    figure(7);
    for i=1:NU
        plot(1:iteration,Gamma(:,i)), grid on, grid minor;
        title('TPC SINR');
        xlabel('Users');
        ylabel('SINR');
        hold on;
    end
end

end



