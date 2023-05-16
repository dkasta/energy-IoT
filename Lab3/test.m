parallel_exec
sim('simulation_singlePV_doubleBatt.slx');

save('efficiencies_custom2_60s_1PV_2_batt.mat', 'EFFICIENCY:1', 'Efficiency:1');