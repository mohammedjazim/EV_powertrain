
function Torque = torque (Coeff_of_friction, Mass, vehicle_velocity, Frontal_area, Drag_coeff, Air_density, gravitational_acceleration, road_gradient, rolling_radius)
Torque = ((Coeff_of_friction * Mass * gravitational_acceleration) + (0.5 * Drag_coeff * Air_density * Frontal_area * (vehicle_velocity).^2) + (Mass * gravitational_acceleration * sin(road_gradient))) .* rolling_radius;

end

