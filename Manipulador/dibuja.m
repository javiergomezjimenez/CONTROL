
% Las que vienen en color rojo son las de MFunction

%% Gr�fica que representa las posiciones q
figure(1);
subplot(3,1,1)
plot(t_RTB,q_RTB(:,1))
hold on;
plot(t_M, q_M(:,1))
grid;
ylabel("q1(�)")
title ("Posiciones");
legend ("P-Corke", "M-Function");
subplot(3,1,2);
plot(t_RTB,q_RTB(:,2))
hold on;
plot(t_M, q_M(:,2))
grid;
ylabel("q2(�)");
legend ("P-Corke", "M-Function");
subplot(3,1,3);
plot(t_RTB,q_RTB(:,3))
hold on;
plot(t_M, q_M(:,3))
grid;
xlabel("Tiempo (s)");
ylabel("q2(�)");
legend ("P-Corke", "M-Function");

%% Gr�fica que representa las velocidades q'
figure(2);
subplot(3,1,1)
plot(t_RTB,qd_RTB(:,1))
hold on;
plot(t_M, qd_M(:,1))
grid;
subplot(3,1,2);
plot(t_RTB,qd_RTB(:,2))
hold on;
plot(t_M, qd_M(:,2))
grid;
subplot(3,1,3);
plot(t_RTB,qd_RTB(:,3))
hold on;
plot(t_M, qd_M(:,3))
grid;

%% Gr�fica que representa las aceleraciones q''
figure(3);
subplot(3,1,1)
plot(t_RTB,qdd_RTB(:,1))
hold on;
plot(t_M, qdd_M(:,1))
grid;
subplot(3,1,2);
plot(t_RTB,qdd_RTB(:,2))
hold on;
plot(t_M, qdd_M(:,2))
grid;
subplot(3,1,3);
plot(t_RTB,qdd_RTB(:,3))
hold on;
plot(t_M, qdd_M(:,3))
grid;
