clear
clc

h = [1/10, 1/20, 1/40];
k = [1/10, 1/20, 1/40, 1/160];

e1 = exact(k(1), h(1)); % h=1/10, lambda=1 AND mu=10
e2 = exact(k(2), h(2)); % h=1/20, lambda=1
e3 = exact(k(3), h(2)); %h=1/20, mu=10
e4 = exact(k(3), h(3)); %h=1/40, lambda=1
e5 = exact(k(4), h(3)); %h=1/40, mu=10

s1 = cranknicolson(k(4), h(3), e5);
figure (3);
plotfigures(k(4), h(3), s1, 'h = 1/10, \lambda = 1 and \mu = 10');
figure(2)
plotfigures(k(4), h(3), e5, 'h = 1/10, \lambda = 1 and \mu = 10');