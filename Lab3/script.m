clear all
close all

Gmonth = load('./gmonths.mat');

data250W = importdata('250Wm2.mat');
data500W = importdata('500Wm2.mat');
data750W = importdata('750Wm2.mat');
data1000W = importdata('1000Wm2.mat');


% figure
% hold on 
% plot(data1000W(:, 1), data1000W(:, 2), 'r-x');
% plot(data750W(:, 1), data750W(:, 2), 'r-x');
% plot(data500W(:, 1), data500W(:, 2), 'r-x');
% plot(data250W(:, 1), data250W(:, 2), 'r-x');
% hold off


% Building the power curves
for i = 1 : size(data1000W)
    power_1000(i) = data1000W(i, 1) * data1000W(i, 2);
end

for i = 1 : size(data750W)
    power_750(i) = data750W(i, 1) * data750W(i, 2);
end

for i = 1 : size(data500W)
    power_500(i) = data500W(i, 1) * data500W(i, 2);
end

for i = 1 : size(data250W)
    power_250(i) = data250W(i, 1) * data250W(i, 2);
end


% figure
% plot(data1000W(:, 1), power_1000(:), 'r-x'); 
% figure
% plot(data750W(:, 1), power_750(:), 'r-x');
% figure
% plot(data500W(:, 1), power_500(:),  'r-x');
% figure
% plot(data250W(:, 1), power_250(:),  'r-x');


MPP_1000 = max(power_1000);
index_1000 = find(power_1000 == MPP_1000);
V_1000 = data1000W(index_1000, 1);
I_1000 = MPP_1000 / V_1000;

MPP_750 = max(power_750);
index_750 = find(power_750 == MPP_750);
V_750 = data750W(index_750, 1);
I_750 = MPP_750 / V_750;

MPP_500 = max(power_500);
index_500 = find(power_500 == MPP_500);
V_500 = data500W(index_500, 1);
I_500 = MPP_500 / V_500;

MPP_250 = max(power_250);
index_250 = find(power_250 == MPP_250);
V_250 = data250W(index_250, 1);
I_250 = MPP_250 / V_250;

G = [250; 500; 750; 1000];
V = [V_250; V_500; V_750; V_1000];
I = [I_250; I_500; I_750; I_1000];


% Digitized curve (from Datasheet of PVCell DC-DC Converter), 
% Input Voltage(V) v. Efficiency(%)
PV_DCDC_voltage = importdata('PV_DCDC_voltage.mat');                 
PV_DCDC_efficiency = importdata('PV_DCDC_efficiency.mat');     


% Digitized curve (from Datasheet of battery DC-DC Converter), 
% Load Current (A) v. Efficiency(%)
battery_DCDC_current = importdata('battery_DCDC_current.mat');
battery_DCDC_efficiency = importdata('battery_DCDC_efficiency.mat');

% figure
% semilogx(battery_DCDC_current, battery_DCDC_efficiency);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Digitized Curve 1C (from Datasheet of battery),
% SoC (0-100%) v. battery Voltage(V)
npoints = 11;
SOC = linspace(0, 1, npoints);

battery_1C = importdata('battery_curve_1C.mat');
battery_1C_interp_y = interp1(battery_1C(:, 1), battery_1C(:, 2), SOC);
battery_1C_interp(:, 2) = battery_1C_interp_y;
battery_1C_interp(1, 2) = battery_1C(1, 2);
battery_1C_interp(npoints, 2) = battery_1C(length(battery_1C(:, 1)), 2);

% Digitized Curve 0.5C (from Datasheet of battery),
% SoC (0-100%) v. battery Voltage(V)
battery_05C = importdata('battery_curve_05C.mat');
battery_05C_interp_y = interp1(battery_05C(:, 1), battery_05C(:, 2), SOC);
battery_05C_interp(:, 2) = battery_05C_interp_y;
battery_05C_interp(npoints, 2) = battery_05C(length(battery_05C(:, 1)), 2);

% figure 
% plot(SOC, battery_05C_interp(:, 2), '-o');
% hold on
% grid on
% plot(SOC, battery_1C_interp(:, 2), '-o');
% legend('1C', '0.5C')
% hold off

% Computing Voc and R
nominal_capacity = 3.2;
currentCurve_1 = 1 * nominal_capacity;
currentCurve_2 = 0.5 * nominal_capacity;
R = (battery_05C_interp(:, 2) - battery_1C_interp(:, 2)) ./ (currentCurve_1 - currentCurve_2);
Voc = battery_1C_interp(:, 2) + R * currentCurve_1;

% figure 
% plot(SOC, Voc, '-o');
% xlabel('SOC');
% ylabel('Voc (V)');
% grid on
% 
% figure 
% plot(SOC, R, '-o');
% xlabel('SOC');
% ylabel('R (\omega)');
% grid on

% R vs SoC fitting

% Linear model Poly6:
%      f(x) = p1*x^6 + p2*x^5 + p3*x^4 + p4*x^3 + p5*x^2 + 
%                     p6*x + p7
% Coefficients (with 95% confidence bounds):
%        p1 =      -37.22  (-53.43, -21.02)
%        p2 =       124.1  (75.36, 172.9)
%        p3 =      -160.7  (-216.2, -105.3)
%        p4 =       101.6  (72.07, 131.1)
%        p5 =      -31.99  (-39.28, -24.7)
%        p6 =       4.332  (3.634, 5.031)
%        p7 =     0.05868  (0.04001, 0.07735)
% f(u) = p1_R*u^6 + p2_R*u^5 + p3_R*u^4 + p4_R*u^3 + p5_R*u^2 + p6_R*u + p7_R

p1_R = -37.22;
p2_R = 124.1;
p3_R = -160.7;
p4_R = 101.6;
p5_R = -31.99;
p6_R = 4.332;
p7_R = 0.05868;

% Voc vs SoC fitting

% Linear model Poly6:
%      f(x) = p1*x^6 + p2*x^5 + p3*x^4 + p4*x^3 + p5*x^2 + 
%                     p6*x + p7
% Coefficients (with 95% confidence bounds):
%        p1 =      -143.6  (-219.5, -67.81)
%        p2 =         504  (275.9, 732.2)
%        p3 =      -692.3  (-951.8, -432.7)
%        p4 =       471.7  (333.6, 609.8)
%        p5 =      -165.2  (-199.3, -131.1)
%        p6 =       29.02  (25.75, 32.29)
%        p7 =      0.2082  (0.1208, 0.2956)
% f(u) = p1_Voc*u^6 + p2_Voc*u^5 + p3_Voc*u^4 + p4_Voc*u^3 + p5_Voc*u^2 + p6_Voc*u + p7_Voc

p1_Voc = -143.6;
p2_Voc = 504;
p3_Voc = -692.3;
p4_Voc = 471.7;
p5_Voc = -165.2;
p6_Voc = 29.02;
p7_Voc = 0.2082;



