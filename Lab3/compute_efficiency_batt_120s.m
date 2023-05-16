clear all;
close all;

fp1 = fopen("efficiencies_1PV_1batt_120s.txt", "w");
fp2 = fopen("efficiencies_1PV_2batt_120s.txt", "w");
fp3 = fopen("efficiencies_2PV_1batt_120s.txt", "w");
fp4 = fopen("efficiencies_2PV_2batt_120s.txt", "w");


% 1 PV, 1 batt
fprintf(fp1, "1 PV, 1 batt\n\n");
data = importdata('efficiencies_serial_120s_1PV_1_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp1,"Serial execution - 120s period:\n");
fprintf(fp1, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp1, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_parallel_120s_1PV_1_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp1, "Parallel execution, 120s period:\n");
fprintf(fp1, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp1, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_custom1_120s_1PV_1_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp1, "Custom 1 execution, 120s period:\n");
fprintf(fp1, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp1, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_custom2_120s_1PV_1_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp1, "Custom 2 execution, 120s period:\n");
fprintf(fp1, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp1, "PV efficiency: %f\n\n", efficiencyPV);





% 1 PV, 2 batt
fprintf(fp2, "1 PV, 2 batt\n\n");
data = importdata('efficiencies_serial_120s_1PV_2_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp2,"Serial execution - 120s period:\n");
fprintf(fp2, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp2, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_parallel_120s_1PV_2_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp2, "Parallel execution, 120s period:\n");
fprintf(fp2, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp2, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_custom1_120s_1PV_2_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp2, "Custom 1 execution, 120s period:\n");
fprintf(fp2, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp2, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_custom2_120s_1PV_2_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp2, "Custom 2 execution, 120s period:\n");
fprintf(fp2, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp2, "PV efficiency: %f\n\n", efficiencyPV);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% 2 PV, 1 batt
fprintf(fp3, "2 PV, 1 batt\n\n");
data = importdata('efficiencies_serial_120s_2PV_1_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp3, "Serial execution - 120s period:\n");
fprintf(fp3, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp3, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_parallel_120s_2PV_1_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp3, "Parallel execution, 120s period:\n");
fprintf(fp3, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp3, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_custom1_120s_2PV_1_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp3, "Custom 1 execution, 120s period:\n");
fprintf(fp3, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp3, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_custom2_120s_2PV_1_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp3, "Custom 2 execution, 120s period:\n");
fprintf(fp3, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp3, "PV efficiency: %f\n\n", efficiencyPV);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% 2 PV, 1 batt
fprintf(fp4, "2 PV, 2 batt\n\n");
data = importdata('efficiencies_serial_120s_2PV_2_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp4, "Serial execution - 120s period:\n");
fprintf(fp4, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp4, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_parallel_120s_2PV_2_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp4, "Parallel execution, 120s period:\n");
fprintf(fp4, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp4, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_custom1_120s_2PV_2_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp4, "Custom 1 execution, 120s period:\n");
fprintf(fp4, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp4, "PV efficiency: %f\n\n", efficiencyPV);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data = importdata('efficiencies_custom2_120s_2PV_2_batt.mat');
efficiencyBattery = get(data, 2);
efficiencyBattery = mean(efficiencyBattery.Values);
efficiencyPV = get(data, 1);
efficiencyPV = mean(efficiencyPV.Values);

fprintf(fp4, "Custom 2 execution, 120s period:\n");
fprintf(fp4, "Battery efficiency: %f\n", efficiencyBattery);
fprintf(fp4, "PV efficiency: %f\n\n", efficiencyPV);

 
fclose(fp1);
fclose(fp2);
fclose(fp3);
fclose(fp4);



