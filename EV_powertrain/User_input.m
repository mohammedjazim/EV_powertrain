clear;
clc;
addpath 'library\functions'
flag = 0;
while(flag == 0)
a = input(['Enter the drive cycle- 1  ,  2  , 3:']);

if a == 1   
       drivecycle = readmatrix('data\drivecycle\drivecycle1.xlsx');   
flag = 1;
elseif a == 2
       drivecycle = readmatrix('data\drivecycle\drivecycle2.xlsx');
flag = 1;
elseif a == 3
       drivecycle = readmatrix('data\drivecycle\drivecycle3.xlsx'); 
flag = 1;
else
    fprintf('Enter the drive cycle-1  , 2  , 3:');
    flag = 0;
end
end
     speed_kmph = drivecycle(:,2);

data = readmatrix('data\vehicle\Vehicle_data.xlsx');
flag1 = 0;
while(flag1 == 0)
b = input('Enter the type of vehilce: SUV-1, Sedan-2, Minivan-3: ');

if b == 1
    Mass = data(1,2);
    Drag_coeff = data(1,3);
    Frontal_area = data(1,4);
    flag1 = 1;
elseif b == 2
    Mass = data(2,2);
    Drag_coeff = data(2,3);
    Frontal_area = data(2,4);
    flag1 = 1;
elseif b == 3
    Mass = data(3,2);
    Drag_coeff = data(3,3);
    Frontal_area = data(3,4);
    flag1 = 1;
else
    fprintf('Enter the type of vehilce: SUV-1, Sedan-2, Minivan-3:');
    flag1 = 0;
end
end

   tyre                = readmatrix("data\tyre\tyresize.xlsx");
   tyre_width          = tyre(:,1);
   sidewall_height     = tyre(:,2);
   rim_radius          = tyre(:,3);
  

flag2 = 0;
while (flag2 == 0)
    c = input('enter the tyre specification: 1-185/55R16, 2-185/55R17, 3-185/50R18 : ');
if c == 1
    rolling_radius = roll_rad(tyre_width(1),sidewall_height(1), rim_radius(1));
    flag2 = 1;
elseif c == 2
    rolling_radius = roll_rad(tyre_width(2),sidewall_height(2), rim_radius(2));
    flag2 = 1;
elseif c == 3
    rolling_radius = roll_rad(tyre_width(3),sidewall_height(3), rim_radius(3));
    flag2 = 1;
else
    fprintf("enter the tyre specification: 1-185/55R16, 2-185/55R17, 3-185/50R18 : ");
    flag2 = 0;
end
end

    Coeff_of_friction          = .5; 
     vehicle_velocity          = velocity_conversion(speed_kmph,rolling_radius);
       Air_density             = 1.225; 
  gravitational_acceleration   = 9.81; 
      road_gradient            = 10; 


rolling_resistance = rolling_resist(Coeff_of_friction, Mass, vehicle_velocity, Frontal_area, Drag_coeff, Air_density, gravitational_acceleration, road_gradient);
display(rolling_resistance);

torque = torque(Coeff_of_friction, Mass, vehicle_velocity, Frontal_area, Drag_coeff, Air_density, gravitational_acceleration, road_gradient, rolling_radius);
display(torque);

speed_rad_per_sec = velocity_conversion(vehicle_velocity, rolling_radius);
display(speed_rad_per_sec);

speed_vs_torque = plot(speed_rad_per_sec, torque, "r");
xlabel("Speed");
yyaxis right;
ylabel('Torque');
hold on
speed_vs_rolling_resistance = plot(speed_rad_per_sec, rolling_resistance, 'b');
xlabel("Speed (rad/s)");
yyaxis left;
ylabel("Rolling resistance (N)");
legend('Torque', 'Rolling Resistance', 'Location', 'Northeast');

run('data\Motor\motor_specification.m')




