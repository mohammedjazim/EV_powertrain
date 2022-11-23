function [velocity, speed_rad_per_sec]  = velocity_conversion(v, x9) 
velocity = v * 5/18;
speed_rad_per_sec  = (v*5/18)/x9;
end
