clear all;
close all;

fp1 = fopen("efficiencies_1PV_1batt_600s.txt", "w");


% 1 PV, 1 batt
fprintf(fp1, "1 PV, 1 batt\n\n");
data = importdata('efficiencies_serial_600s_1PV_1_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp1,"Serial execution - 600s period:\n");
fprintf(fp1, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp1, "PV efficiency: %f\n\n", efficiencyPV);