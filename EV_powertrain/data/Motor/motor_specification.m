 motor_parameter = readmatrix('data\Motor\ac_25_motor_spec.xlsx');

        voltage     = motor_parameter(1,2);
         Current    = motor_parameter(2,2);
        Max_speed   = motor_parameter(3,2);
 

  Input_pwr  = readmatrix('data\Motor\ac_25_motor_spec.xlsx', 'Sheet', 2);
 Input_power = Input_pwr(2:end,2:end);
  Motor_Eff  = readmatrix('data\Motor\ac_25_motor_spec.xlsx', 'Sheet', 3);
 Efficiency  = Motor_Eff(2:end,2:end);

      Torque_map    = Input_pwr(1,2:end);
      Speed_map     = Input_pwr(2:end,1);
      Speed_map     = transpose(Speed_map);
 
Value_inputpower    = interp2(Torque_map, Speed_map, Input_power, torque, speed_rad_per_sec); 
Value_efficiency    = interp2(Torque_map, Speed_map, Efficiency, torque, speed_rad_per_sec);
 
    Ouput_power     = outpower( torque, speed_rad_per_sec);
     Heat_loss      = heatloss(Ouput_power, Value_efficiency);
  Angular_velocity  = (2*pi.*Max_speed)/60;
     Torque_out     = trqout(Value_inputpower, Angular_velocity); 
 
 
     figure
     contourf(Torque_map, Speed_map, Efficiency); 
     legend;