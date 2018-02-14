tspan = [0 500];
y_0 = [500 ; 500 ; 500 ; 500];

[t,y] = ode45(@(t,y) twf(t,y), tspan, y_0);

plot(t,y(:,1),'-o',t,y(:,2),'-.',t,y(:,3),'-',t,y(:,4),'o');

function dy = twf(t,y)
dy = zeros(2,1); % a column vector
% Reaction function to solve kinetics of tryptophan production dynamics
% y(1) --> mRNA, y(2) --> tryptophan
% kinetic reaction rate parameters kf and delta
K_s = 1e-2; % gene transcription rate
k_d = 2e-4; % mRNA degradation rate
alpha = 1e-3; % tryp production effective kinetic constant
k_loss = 5e-2; % tryptophan loss (protein production / degradation ....)
k_on = 1e-4; % tryp-trypR binding
k_off = 1e-2; % tryp-trypR dissociation
Ng = 2;
dy(1) = K_s*Ng*(1-y(4)/200) - k_d*y(1); % y(1) --> mRNA
dy(2) = alpha*y(1) - k_loss*y(2) - k_on*y(2)*y(3) + k_off*y(4); % y(2) --> tryptophan (tryp)
dy(3) = -k_on*y(2)*y(3) + k_off*y(4); % y(3) --> trypR (repressor)
dy(4) = k_on*y(2)*y(3) - k_off*y(4); % y(4) --> tryp-trypR complex
end