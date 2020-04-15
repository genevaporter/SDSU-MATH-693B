% Geneva Porter, Math 693B, Spring 2020
% Homework 5, Strikwerda problem 7.3.3
%
% Apply the Peaceman-Rachford method to the hyperbolic equation:
%   u_t + u_x + 2u_y = 0
%
% with: 
%   -1 <= x <= 1
%   -1 <= y <= 1
%    0 <= t <= 1
%
% Specify the exact solution:
%   u(t,x,y) = u0(x-t, y-2t)
% along the sides with y = 0 and x = 0.
%
% Apply the extrapolation conditions:
%   u_{L,m}^{n+1} = u_{L-1,m}^{n}
%   u_{l,M}^{n+1} = u_{l, M-1}^{n}
% along x_L = 1 and y_M = 1
%
% Use initial boundary data:
%   u0(x,y) = { (1-2|x|)(1-2|y|)  if |x| <= 0.5 and |y| <= 0.5
%             { 0                 otherwise