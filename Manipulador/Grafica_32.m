function Grafica_32(X1, X2, Y1, Y2, Y3, Y4, Y5, Y6, titulo, YLABEL, LEGEND)
%  X1:  vector of x data
%  X2:  vector of x data
%  Y1:  vector of y data
%  Y2:  vector of y data
%  Y3:  vector of y data
%  Y4:  vector of y data
%  Y5:  vector of y data
%  Y6:  vector of y data

% Create figure
figure1 = figure;

% Create subplot
subplot1 = subplot(3,1,1,'Parent',figure1);
hold(subplot1,'on');

% Create plot
plot(X1,Y1,'Parent',subplot1,'DisplayName',LEGEND(1));

% Create plot
plot(X2,Y2,'Parent',subplot1,'DisplayName',LEGEND(2));


% Create ylabel
ylabel(YLABEL(1),'FontName','Google Sans');

box(subplot1,'on');
grid(subplot1,'on');
% Set the remaining axes properties
set(subplot1,'FontName','Google Sans','FontSize',8);
% Create title
title(titulo,'FontSize',11,'FontName','Google Sans');
% Create legend
legend1 = legend(subplot1,'show');
set(legend1,'FontSize',8);

% Create subplot
subplot2 = subplot(3,1,2,'Parent',figure1);
hold(subplot2,'on');

% Create plot
plot(X1,Y3,'Parent',subplot2,'DisplayName',LEGEND(1));

% Create plot
plot(X2,Y4,'Parent',subplot2,'DisplayName',LEGEND(2));

% Create ylabel
ylabel(YLABEL(2),'FontName','Google Sans');

box(subplot2,'on');
grid(subplot2,'on');
% Set the remaining axes properties
set(subplot2,'FontName','Google Sans','FontSize',8);
% Create legend
legend2 = legend(subplot2,'show');
set(legend2,'FontSize',8);

% Create subplot
subplot3 = subplot(3,1,3,'Parent',figure1);
hold(subplot3,'on');

% Create plot
plot(X1,Y5,'Parent',subplot3,'DisplayName',LEGEND(1));

% Create plot
plot(X2,Y6,'Parent',subplot3,'DisplayName',LEGEND(2));

% Create xlabel
xlabel('Tiempo (s)','FontName','Google Sans');

% Create ylabel
ylabel(YLABEL(3),'FontName','Google Sans');

box(subplot3,'on');
grid(subplot3,'on');
% Set the remaining axes properties
set(subplot3,'FontName','Google Sans','FontSize',8);
% Create legend
legend3 = legend(subplot3,'show');
set(legend3,'FontSize',8);

