function Grafica_31(X1, Y1, Y2, Y3, titulo, YLABEL)
%  X1:  vector of x data
%  Y1:  vector of y data
%  Y2:  vector of y data
%  Y3:  vector of y data

% Create figure
figure1 = figure;

% Create subplot
subplot1 = subplot(3,1,1,'Parent',figure1);
hold(subplot1,'on');

% Create plot
plot(X1,Y1,'Parent',subplot1);


% Create ylabel
ylabel(YLABEL(1),'FontName','Google Sans');

box(subplot1,'on');
grid(subplot1,'on');
% Set the remaining axes properties
set(subplot1,'FontName','Google Sans','FontSize',8);
% Create title
title(titulo,'FontSize',11,'FontName','Google Sans');

% Create subplot
subplot2 = subplot(3,1,2,'Parent',figure1);
hold(subplot2,'on');

% Create plot
plot(X1,Y2,'Parent',subplot2);


% Create ylabel
ylabel(YLABEL(2),'FontName','Google Sans');

box(subplot2,'on');
grid(subplot2,'on');
% Set the remaining axes properties
set(subplot2,'FontName','Google Sans','FontSize',8);


% Create subplot
subplot3 = subplot(3,1,3,'Parent',figure1);
hold(subplot3,'on');

% Create plot
plot(X1,Y3,'Parent',subplot3);


% Create xlabel
xlabel('Tiempo (s)','FontName','Google Sans');

% Create ylabel
ylabel(YLABEL(3),'FontName','Google Sans');

box(subplot3,'on');
grid(subplot3,'on');
% Set the remaining axes properties
set(subplot3,'FontName','Google Sans','FontSize',8);


