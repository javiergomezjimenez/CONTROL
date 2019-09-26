function xyz = CinematicaDirecta(in)

q1       = in(1);           % Posición articular
q2       = in(2);           % 
q3       = in(3);

x = cos(q2)/5 - sin(q2)/2 + (cos(q2)*cos(q3))/5;
y = sin(q3)/5;
z = q1 + cos(q2)/2 + sin(q2)/5 + (cos(q3)*sin(q2))/5;
  
xyz=[x;y;z];



  