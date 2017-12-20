% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% DTPC Simulation using MATLAB
% Programmer: SeyedHedayat Hosseini
% Date: December, 2015
% Matlab Version: R2014b
% ******************************************************* %

function [Sum_Outage,Outage_probability,Throughput,P,Gamma]= DTPC(P_bar,Gamma_hat,eta_vector,Noise,initial_power,H,show_plot)
%This function simulate DTPC algorithm

iteration=300;
NU=length(H(1,:));

P(1,:)=initial_power;
Gamma(1,:)=SINR(H,initial_power,Noise);

R_i_th=sqrt(eta_vector(1,:)./Gamma_hat(1,:));

%approach #1
for i=2:iteration
    R_i=P(i-1,:)./Gamma(i-1,:);
    for j=1:NU
        if(R_i(1,j)<R_i_th(1,j))   % DTPC Uses OPC Algorithm
            P(i,j)=min(P_bar(1,j) , eta_vector(1,j)*Gamma(i-1,j)/P(i-1,j));         
        else               %DTPC Uses TPC Algorithm
            P(i,j)=min(P_bar(1,j) , Gamma_hat(1,j)/Gamma(i-1,j)*P(i-1,j)); 
        end
    end
  
    Gamma(i,:)=SINR(H,P(i,:),Noise);
    if(abs(P(i,:) - P(i-1,:))<=0.000001)
        iteration=i;
        break;
    end
end


%approach #2
%for i=2:iteration
%    P(i,:)=min(P_bar(1,:) ,  max((Gamma_hat(1,:).*P(i-1,:)./Gamma(i-1,:)) , eta_vector(1,:).*Gamma(i-1,:)./P(i-1,:)));
  
%    Gamma(i,:)=SINR(H,P(i,:),Noise);

%end

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
    figure(2);

    for i=1:NU
        plot(1:iteration,P(:,i)), grid on, grid minor;
        title('DTPC Power');    
        xlabel('Iteration');
        ylabel('Powers');
        hold on;
    end

    figure(3);

    for i=1:NU
    

   
        plot(1:iteration,Gamma(:,i)),grid on, grid minor;
        title('DTPC SINR');    
        xlabel('Iteration');
        ylabel('SINR');
        hold on;
    end


end
end



