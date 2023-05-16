clear all
close all


fig1 = importdata('figure1.mat');

load_tot_current = get(fig1, 1);
load_tot_power = get(fig1, 2);
load_tot_current = (load_tot_current.Values);
load_tot_power = (load_tot_power.Values);

f1 = figure;
hold on
xlim([0 190])
plot(load_tot_current,'LineWidth', 1.5);
plot(load_tot_power,'LineWidth', 1.5);
xlabel('Time (s)')

grid on
legend('load tot current','load tot power', 'Location', 'southoutside');

exportgraphics(f1, 'figure1.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig2 = importdata('figure2.mat');

air_period = get(fig2, 1);
mem_ctr_period = get(fig2, 2);
methane_period = get(fig2, 3);
mic_period = get(fig2, 4);
temp_period = get(fig2, 5);
transmitted_period = get(fig2, 6);

air_period = (air_period.Values);
mem_ctr_period = (mem_ctr_period.Values);
methane_period = (methane_period.Values);
mic_period = (mic_period.Values);
temp_period = (temp_period.Values);
transmitted_period = (transmitted_period.Values);

f2 = figure;
hold on
xlim([0 190])

plot(air_period,'LineWidth', 1.5);
plot(mem_ctr_period,'LineWidth', 1.5);
plot(methane_period,'LineWidth', 1.5);
plot(mic_period,'LineWidth', 1.5);
plot(temp_period,'LineWidth', 1.5);
plot(transmitted_period,'LineWidth', 1.5);

xlabel('Time (s)')

grid on
legend('air period', 'mem ctr period', 'methane period', 'mic period', 'temp period', 'transmitted period', 'Location', 'southoutside');

exportgraphics(f2, 'figure2.jpg');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig3 = importdata('figure3.mat');
battery_SOC = get(fig3, 1);
battery_voltage = get(fig3, 2);
battery_SOC = (battery_SOC.Values);
battery_voltage = (battery_voltage.Values);

f3 = figure;

hold on
plot(battery_SOC,'LineWidth', 1.5);
plot(battery_voltage,'LineWidth', 1.5);
xlabel('Time (s)')
xlim ([0 520000])

grid on

legend('battery SOC','battery voltage', 'Location', 'southoutside');

exportgraphics(f3, 'figure3.jpg');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PV_tot_power = importdata('figure4.mat');

f4 = figure;

hold on
plot(PV_tot_power,'LineWidth', 1.5);
xlabel('Time (s)')
xlim ([0 520000])

grid on

legend('PV tot power', 'Location', 'southoutside');

exportgraphics(f4, 'figure4.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fig5 = importdata('figure5.mat');
PV_DCDC_current = get(fig5, 1);
PV_current = get(fig5, 2);
battery_current = get(fig5, 3);

PV_DCDC_current = (PV_DCDC_current.Values);
PV_current = (PV_current.Values);
battery_current = (battery_current.Values);

f5 = figure;

hold on
plot(PV_current, 'LineWidth', 1.5);
plot(battery_current,'LineWidth', 1.5);
plot(PV_DCDC_current, 'LineWidth', 1.5);


xlabel('Time (s)')
xlim ([0 520000])
grid on

legend('PV current', 'battery current','PV DCDC current', 'Location', 'southoutside');

exportgraphics(f5, 'figure5.jpg');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig6 = importdata('figure6.mat');

load_tot_current = get(fig6, 1);
load_tot_power = get(fig6, 2);
load_tot_current = (load_tot_current.Values);
load_tot_power = (load_tot_power.Values);

f6 = figure;
hold on
xlim([0 190])
plot(load_tot_current,'LineWidth', 1.5);
plot(load_tot_power,'LineWidth', 1.5);
xlabel('Time (s)')

grid on
legend('load tot current','load tot power', 'Location', 'southoutside');

exportgraphics(f6, 'figure6.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig7 = importdata('figure7.mat');

air_period = get(fig7, 1);
mem_ctr_period = get(fig7, 2);
methane_period = get(fig7, 3);
mic_period = get(fig7, 4);
temp_period = get(fig7, 5);
transmitted_period = get(fig7, 6);

air_period = (air_period.Values);
mem_ctr_period = (mem_ctr_period.Values);
methane_period = (methane_period.Values);
mic_period = (mic_period.Values);
temp_period = (temp_period.Values);
transmitted_period = (transmitted_period.Values);

f7 = figure;
hold on
xlim([0 190])

plot(air_period,'LineWidth', 1.5);
plot(mem_ctr_period,'LineWidth', 1.5);
plot(methane_period,'LineWidth', 1.5);
plot(mic_period,'LineWidth', 1.5);
plot(temp_period,'LineWidth', 1.5);
plot(transmitted_period,'LineWidth', 1.5);

xlabel('Time (s)')

grid on
legend('air period', 'mem ctr period', 'methane period', 'mic period', 'temp period', 'transmitted period', 'Location', 'southoutside');

exportgraphics(f7, 'figure7.jpg');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig8 = importdata('figure8.mat');
battery_SOC = get(fig8, 1);
battery_voltage = get(fig8, 2);
battery_SOC = (battery_SOC.Values);
battery_voltage = (battery_voltage.Values);

f8 = figure;

hold on
plot(battery_SOC,'LineWidth', 1.5);
plot(battery_voltage,'LineWidth', 1.5);
xlabel('Time (s)')
xlim ([0 520000])

grid on

legend('battery SOC','battery voltage', 'Location', 'southoutside');

exportgraphics(f8, 'figure8.jpg');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PV_tot_power = importdata('figure9.mat');

f9 = figure;

hold on
plot(PV_tot_power,'LineWidth', 1.5);
xlabel('Time (s)')
xlim ([0 520000])

grid on

legend('PV tot power', 'Location', 'southoutside');

exportgraphics(f9, 'figure9.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fig10 = importdata('figure5.mat');
PV_DCDC_current = get(fig10, 1);
PV_current = get(fig10, 2);
battery_current = get(fig10, 3);

PV_DCDC_current = (PV_DCDC_current.Values);
PV_current = (PV_current.Values);
battery_current = (battery_current.Values);

f10 = figure;

hold on
plot(PV_current, 'LineWidth', 1.5);
plot(battery_current,'LineWidth', 1.5);
plot(PV_DCDC_current, 'LineWidth', 1.5);


xlabel('Time (s)')
xlim ([0 520000])
grid on

legend('PV current', 'battery current','PV DCDC current', 'Location', 'southoutside');

exportgraphics(f10, 'figure10.jpg');





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig11 = importdata('figure11.mat');

load_tot_current = get(fig11, 1);
load_tot_power = get(fig11, 2);
load_tot_current = (load_tot_current.Values);
load_tot_power = (load_tot_power.Values);

f11 = figure;
hold on
xlim([0 190])
plot(load_tot_current,'LineWidth', 1.5);
plot(load_tot_power,'LineWidth', 1.5);
xlabel('Time (s)')

grid on
legend('load tot current','load tot power', 'Location', 'southoutside');

exportgraphics(f11, 'figure11.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig12 = importdata('figure12.mat');

air_period = get(fig12, 1);
mem_ctr_period = get(fig12, 2);
methane_period = get(fig12, 3);
mic_period = get(fig12, 4);
temp_period = get(fig12, 5);
transmitted_period = get(fig12, 6);

air_period = (air_period.Values);
mem_ctr_period = (mem_ctr_period.Values);
methane_period = (methane_period.Values);
mic_period = (mic_period.Values);
temp_period = (temp_period.Values);
transmitted_period = (transmitted_period.Values);

f12 = figure;
hold on
xlim([0 190])

plot(air_period,'LineWidth', 1.5);
plot(mem_ctr_period,'LineWidth', 1.5);
plot(methane_period,'LineWidth', 1.5);
plot(mic_period,'LineWidth', 1.5);
plot(temp_period,'LineWidth', 1.5);
plot(transmitted_period,'LineWidth', 1.5);

xlabel('Time (s)')

grid on
legend('air period', 'mem ctr period', 'methane period', 'mic period', 'temp period', 'transmitted period', 'Location', 'southoutside');

exportgraphics(f12, 'figure12.jpg');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig13 = importdata('figure8.mat');
battery_SOC = get(fig13, 1);
battery_voltage = get(fig13, 2);
battery_SOC = (battery_SOC.Values);
battery_voltage = (battery_voltage.Values);

f13 = figure;

hold on
plot(battery_SOC,'LineWidth', 1.5);
plot(battery_voltage,'LineWidth', 1.5);
xlabel('Time (s)')
xlim ([0 520000])

grid on

legend('battery SOC','battery voltage', 'Location', 'southoutside');

exportgraphics(f13, 'figure13.jpg');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PV_tot_power = importdata('figure9.mat');

f14 = figure;

hold on
plot(PV_tot_power,'LineWidth', 1.5);
xlabel('Time (s)')
xlim ([0 520000])

grid on

legend('PV tot power', 'Location', 'southoutside');

exportgraphics(f14, 'figure14.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fig15 = importdata('figure10.mat');
PV_DCDC_current = get(fig15, 1);
PV_current = get(fig15, 2);
battery_current = get(fig15, 3);

PV_DCDC_current = (PV_DCDC_current.Values);
PV_current = (PV_current.Values);
battery_current = (battery_current.Values);

f15 = figure;

hold on
plot(PV_current, 'LineWidth', 1.5);
plot(battery_current,'LineWidth', 1.5);
plot(PV_DCDC_current, 'LineWidth', 1.5);


xlabel('Time (s)')
xlim ([0 3100000])
grid on

legend('PV current', 'battery current','PV DCDC current', 'Location', 'southoutside');

exportgraphics(f15, 'figure15.jpg');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig16 = importdata('figure16.mat');
battery_SOC = get(fig16, 1);
battery_voltage = get(fig16, 2);
battery_SOC = (battery_SOC.Values);
battery_voltage = (battery_voltage.Values);

f16 = figure;

hold on
plot(battery_SOC,'LineWidth', 1.5);
plot(battery_voltage,'LineWidth', 1.5);
xlabel('Time (s)')
xlim ([0 3100000])

grid on

legend('battery SOC','battery voltage', 'Location', 'southoutside');

exportgraphics(f16, 'figure16.jpg');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fig17 = importdata('figure17.mat');
PV_DCDC_current = get(fig17, 1);
PV_current = get(fig17, 2);
battery_current = get(fig17, 3);

PV_DCDC_current = (PV_DCDC_current.Values);
PV_current = (PV_current.Values);
battery_current = (battery_current.Values);

f17 = figure;

hold on
plot(PV_current, 'LineWidth', 1.5);
plot(battery_current,'LineWidth', 1.5);
plot(PV_DCDC_current, 'LineWidth', 1.5);


xlabel('Time (s)')
xlim ([0 3100000])

grid on

legend('PV current', 'battery current','PV DCDC current', 'Location', 'southoutside');

exportgraphics(f17, 'figure17.jpg');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PV_tot_power = importdata('figure18.mat');

f18 = figure;

hold on
plot(PV_tot_power,'LineWidth', 1.5);
xlabel('Time (s)')
xlim ([0 3050000])

grid on

legend('PV tot power', 'Location', 'southoutside');

exportgraphics(f18, 'figure18.jpg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


singlePV_singleBatt_custom2_120s = importdata('singlePV_singleBatt_custom2_120s.mat');
singlePV_doubleBatt_custom2_120s = importdata('singlePV_doubleBatt_custom2_120s.mat');
doublePV_singleBatt_custom2_120s = importdata('doublePV_singleBatt_custom2_120s.mat');
doublePV_doubleBatt_custom2_120s = importdata('doublePV_doubleBatt_custom2_120s.mat');

f = figure;
hold on
plot(singlePV_singleBatt_custom2_120s);
plot(singlePV_doubleBatt_custom2_120s);
plot(doublePV_singleBatt_custom2_120s);
plot(doublePV_doubleBatt_custom2_120s);
grid on
xlabel('Time (s)')
ylabel('SoC')
ylim([0.4 1])
legend('1 PV 1 battery','1 PV 2 batteries', '2 PVs 1 battery', '2 PVs 2 batteries');

exportgraphics(f, 'figure19.jpg');



