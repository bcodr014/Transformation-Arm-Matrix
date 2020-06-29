syms axis; %Number of axes in Robot
syms theta1 theta2 theta3 theta4 theta5 theta6; 
syms d1 d2 d3 d4 d5 d6;
syms a1 a2 a3 a4 a5 a6;

% Uncomment any of the given robots to calculate the homogeneous tranformation matrix 
% % microbot alpha 2 
% axis = 5;
% theta1 = 0;
% theta2 = 0;
% theta3 = 0;
% theta4 = -pi/2;
% theta5 = 0;
% theta6 = 0;
% 
% alpha1 = -pi/2;
% alpha2 = 0;
% alpha3 = 0;
% alpha4 = -pi/2;
% alpha5 = 0;
% alpha6 = 0;
% 
% d1 = 215.9; 
% d2 = 0; 
% d3 = 0; 
% d4 = 0; 
% d5 = 129.5;
% d6 = 0;
% 
% a1 = 0; 
% a2 = 177.8; 
% a3 = 177.8; 
% a4 = 0; 
% a5 = 0;
% a6 = 0;

%RINO XR3
% axis = 5;
% theta1 = 0;
% theta2 = -pi/2;
% theta3 = pi/2;
% theta4 = 0;
% theta5 = -pi/2;
% theta6 = 0;
% 
% alpha1 = -pi/2;
% alpha2 = 0;
% alpha3 = 0;
% alpha4 = -pi/2;
% alpha5 = 0;
% alpha6 = 0;
% 
% d1 = 26.04;
% d2 = 0;
% d3 = 0;
% d4=0;
% d5 = 16.83;
% d6 = 0;
% 
% a1 = 0;
% a2 = 22.86;
% a3 = 22.86;
% a4 = 0.95;
% a5 = 0;
% a6 = 0;

% %ADEPT ONE
axis = 4;
theta1 = 0;
theta2 = 0;
theta3 = 100;
theta4 = pi/2;
theta5 = 0;
theta6 = 0;

alpha1 = pi;
alpha2 = 0;
alpha3 = 0;
alpha4 = 0;
alpha5 = 0;
alpha6 = 0;

d1 = 877; 
d2 = 0; 
d3 = 0; 
d4 = 0; 
d5 = 200;
d6 = 0;

a1 = 425; 
a2 = 375; 
a3 = 0; 
a4 = 0; 
a5 = 0;
a6 = 0;

% %INTELLEDEX 660
%  axis = 6;
% theta1 = pi/2;
% theta2 = -pi/2;
% theta3 = pi/2;
% theta4 = 0;
% theta5 = pi/2;
% theta6 = 0;
% % 
% alpha1 = pi/2;
% alpha2 = pi/2;
% alpha3 = 0;
% alpha4 = 0;
% alpha5 = pi/2;
% alpha6 = 0;
% % 
% d1 = 373.4; 
% d2 = 0; 
% d3 = 0; 
% d4 = 0; 
% d5 = 0;
% d6 = 228.6;
% % 
% a1 = 0; 
% a2 = 0; 
% a3 = 304.8; 
% a4 = 304.8; 
% a5 = 0;
% a6 = 0;

T = cell(axis,1);


theta = [theta1 theta2 theta3 theta4 theta5 theta6];
alpha = [alpha1 alpha2 alpha3 alpha4 alpha5 alpha6];
d = [d1 d2 d3 d4 d5 d6];
a = [a1 a2 a3 a4 a5 a6];
n=[theta; alpha; d; a];

n=transpose(n);


for i=1:axis
    T{i} = [cos(n(i,1)) -cos(n(i,2))*sin(n(i,1)) sin(n(i,2))*sin(n(i,1)) n(i,4)*cos(n(i,1)); sin(n(i,1)) cos(n(i,2))*cos(n(i,1)) -sin(n(i,2))*cos(n(i,1)) n(i,4)*sin(n(i,1)); 0 sin(n(i,2)) cos(n(i,2)) n(i,3); 0 0 0 1];
end
celldisp(T)
T_final = T{1,1};
for j = 2:axis
    T_final= T_final*T{j,1};%*T{axis,1}*T{axis,1}*T{axis,1}
end
T_final