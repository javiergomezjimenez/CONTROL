function q = CinematicaInversa(in)

x       = in(1);          % Posición cartesianas
y       = in(2);          % 
z       = in(3);          % 

q3 = asin(5*y);
q2 = acos((5*(4*x + 4*x*cos(q3) + (8*cos(q3) + 4*cos(q3)^2 - 100*x^2 + 29)^(1/2)))/(8*cos(q3) + 4*cos(q3)^2 + 29));
q1 = z - cos(q2)/2 - sin(q2)/5 - (cos(q3)*sin(q2))/5;

q = [q1;q2;q3];

end
