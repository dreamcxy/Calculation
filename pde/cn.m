function [] = cn(J)
% J means the number of grid points
clear all;
miu = 0.4 
T = 1; % System size
deltax = 1/J; % Space step
deltat = miu*(deltax^2); % Time step
tstep = ceil(T/deltat); % Number of steps
%Set initial and boundary conditions
