function loss = avg_conduction_loss(Rds, duty_cycle, operating_current)
%AVG_CONDUCTION_LOSS Summary of this function goes here
%   Detailed explanation goes here
loss = Rds*duty_cycle*operating_current*operating_current;
end

