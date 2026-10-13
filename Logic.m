clc;
clear;

% -------- TIME --------
t = 0:0.1:50;   % 50 seconds simulation

% -------- MODEL (SIMULATED DATA) --------

% Voltage model (slight fluctuation)
voltage = 2.5 + 0.05*sin(0.2*t);

% Current model (load variation)
current = 1 + 0.5*sin(0.5*t) + 0.2*randn(size(t));

% Temperature model (heating effect)
temp1 = 30 + 0.1*t + 0.5*sin(0.3*t);
temp2 = 31 + 0.08*t + 0.4*sin(0.25*t);
temp3 = 32 + 0.09*t + 0.3*sin(0.2*t);
temp4 = 31.5 + 0.07*t + 0.5*sin(0.35*t);

% IMU (orientation)
yaw   = 10*sin(0.2*t);
pitch = 5*sin(0.15*t);
roll  = 3*sin(0.25*t);

% Acceleration
ax = 0.5*sin(0.8*t);
ay = 0.3*sin(0.6*t);
az = 9.8 + 0.2*sin(0.5*t);

% TF-Luna distance
distance = 100 + 10*sin(0.1*t);

% -------- PLOTTING --------
figure;

% Voltage
subplot(4,2,1)
plot(t, voltage)
title('Voltage'); grid on

% Current
subplot(4,2,2)
plot(t, current)
title('Current'); grid on

% Temperature
subplot(4,2,3)
plot(t, temp1, t, temp2, t, temp3, t, temp4)
title('Temperature (4 Sensors)')
legend('T1','T2','T3','T4')
grid on

% Distance
subplot(4,2,4)
plot(t, distance)
title('Distance (TF-Luna)')
grid on

% Orientation
subplot(4,2,5)
plot(t, yaw, t, pitch, t, roll)
title('Orientation (Yaw, Pitch, Roll)')
legend('Yaw','Pitch','Roll')
grid on

% Acceleration
subplot(4,2,6)
plot(t, ax, t, ay, t, az)
title('Acceleration')
legend('Ax','Ay','Az')
grid on

% Combined System Behavior
subplot(4,2,[7 8])
plot(t, temp1, 'r', t, current*10, 'b', t, voltage*10, 'g')
title('System Interaction (Temp, Current, Voltage)')
legend('Temp','Current x10','Voltage x10')
grid on