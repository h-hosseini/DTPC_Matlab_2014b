% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% DTPC Simulation using MATLAB
% Programmer: SeyedHedayat Hosseini
% Date: December, 2015
% Matlab Version: R2014b
% ******************************************************* %

function [Gamma] = SINR(H , P , noise)

NU=length(H(1,:));
Gamma=zeros(1,NU);

% Generate the SINR of users
for i = 1:NU
    temp = 0;
    for j = 1:NU %Interference imposed to user i from others at BS
         if(i~= j)
             temp = temp + H(1,j)*P(j);
         end
    end
    temp = temp + noise; %Total interference imposed to user i at BS
    Gamma(1,i) = (P(i)*H(i))/(temp);
end
end