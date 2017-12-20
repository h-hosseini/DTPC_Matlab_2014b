% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% DTPC Simulation using MATLAB
% Programmer: SeyedHedayat Hosseini
% Date: December, 2015
% Matlab Version: R2014b
% ******************************************************* %

function [ H ] = PathGain_Generator( D,K,Alpha )
% Generate the path gain of users
% D is the distance matrix

L1=length(D(1,:));

H = zeros(1,L1);

for i=1:L1
   
   H(1,i) = K*D(1,i)^(Alpha);
    
end
end