% Amir kabir University of Technology (Tehran Polytechnic)
% Computer & Information Technology Engineering Department
% Resource Allocation in Wireless Networks
% DTPC Simulation using MATLAB
% Programmer: SeyedHedayat Hosseini
% Date: December, 2015
% Matlab Version: R2014b
% ******************************************************* %

function [ D ] = Distance_Generator(NU,show_plot)
%Distance between the users uniformly distributed in 500*500 square
%area and the base station is located in (250,250)
%x=rand(1,NU).*500;
%y=rand(1,NU).*500;

x=[208.6335   24.8272  451.3581  472.3936  245.4320  244.6263];
y=[168.8597  450.0269  184.6234   55.6014  390.1260  194.8694];


D = zeros(1,NU);

for i=1:NU
   D(1,i) = (((x(1,i) - 250)^2) + ((y(1,i) - 250)^2))^(0.5);
end

if (show_plot)
    figure(1);
    plot(x(1,:),y(1,:),'rO ');
    for i=1:NU
        text(x(1,i),y(1,i)+15,int2str(i));
    end
    hold on;
    plot(250,250,'B* '),grid on, grid minor;
    title('Users & Base Stations');
    legend('Users','Base Stations');
    xlabel('X');
    ylabel('Y');
end


end