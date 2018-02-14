tspan = [0 500];
y_0 = [500 ; 500];

[t,y] = ode45(@(t,y) twof(t,y), tspan, y_0);

plot(t,y(:,1),'-o',t,y(:,2),'-.');

function dy = twof(t,y)
dy = zeros(2,1); % a column vector
% Reaction function to solve kinetics of tryptophan production dynamics
% y(1) --> mRNA, y(2) --> tryptophan
% kinetic reaction rate parameters kf and delta
K_s = 1e-2; % gene transcription rate
k_d = 2e-4; % mRNA degradation rate
alpha = 1e-3; % tryp production effective kinetic constant
k_loss = 5e-2; % tryptophan loss (protein production / degradation ....)
Ng = 2;
dy(1) = K_s*Ng - k_d*y(1); % y(1) --> mRNA
dy(2) = alpha*y(1) - k_loss*y(2); % y(2) --> tryptophan (tryp)
end