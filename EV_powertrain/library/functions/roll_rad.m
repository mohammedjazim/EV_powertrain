function rolling_radius = roll_rad(tyre_width, sidewall_height, rim_radius)
rolling_radius = ((tyre_width*(sidewall_height/100)) + (rim_radius/2) * 25.4)/1000;
end