function rolling_resistance = rolling_resist (Drag_coeff, Mass, vehicle_velocity, Frontal_area, Coeff_of_friction ,  Air_density,gravitational_acceleration, road_gradient)
rolling_resistance = (Coeff_of_friction * Mass * gravitational_acceleration) + (0.5 * Drag_coeff  * Air_density * Frontal_area * (vehicle_velocity).^2) + (Mass * gravitational_acceleration * sin(road_gradient));

end

