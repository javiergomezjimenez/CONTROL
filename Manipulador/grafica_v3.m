function grafica(X1, YMatrix1,Ytitle, Legend, Y1, Y2title, Legend2, titulo)
aux=0;
% Create figure
figure1 = figure;

% Create axes
if size(Y1)~=size(YMatrix1)
    aux=1;
    axes1 = axes('Parent',figure1, ...
    'Position',[0.13 0.539163669783424 0.775 0.341162790697674]);
elseif 0 < sum(Y1~=YMatrix1)
    aux=1;
    axes1 = axes('Parent',figure1, ...
    'Position',[0.13 0.539163669783424 0.775 0.341162790697674]);
else
    axes1 = axes('Parent',figure1);
end

hold(axes1,'on');

% Set the remaining axes properties
set(axes1,'FontName','Google Sans','FontSize',8);

% Create multiple lines using matrix input to plot
i=1;
plot1 = plot(X1,YMatrix1,'Parent',axes1);
switch min(size(YMatrix1))
    case 2   
        set(plot1(1),'Color',[0 0 1]);
        i=2;
        legend (Legend);
    case 3
        set(plot1(1),'Color',[0 0 1]);
        set(plot1(2),'Color',[0 1 0]);
        i=3;
        legend (Legend);
    case 4
        set(plot1(1),'Color',[0 0 1]);
        set(plot1(2),'Color',[0 1 0]);
        set(plot1(3),'Color',[1 1 0]);
        i=4;
        legend (Legend);
    case 5
        set(plot1(1),'Color',[0 0 1]);
        set(plot1(2),'Color',[0 1 0]);
        set(plot1(3),'Color',[1 1 0]);
        set(plot1(4),'Color',[1 0 1]);
        i=5;
        legend (Legend);
end
set(plot1(i),'LineWidth',1,'Color',[1 0 0]);

% Create xlabel
xlabel('Muestras','FontSize',10);

% Create title
title(titulo,'FontSize',12,...
    'FontName','Google Sans');

% Create ylabel
ylabel(Ytitle,'FontSize',10,'FontName','Google Sans');

box(axes1,'on');
grid(axes1,'on');



if aux==1
    % Create subplot
    subplot1 = subplot(2,1,2,'Parent',figure1);
    hold(subplot1,'on');

    % Set the remaining axes properties
    set(subplot1,'FontName','Google Sans','FontSize',8);

    % Create multiple lines using matrix input to plot
    i=1;
    plot2 = plot(X1,Y1,'Parent',subplot1,'MarkerSize',5);
    switch min(size(Y1))
        case 2   
            set(plot2(1),'Color',[0 0 1]);
            i=2;
            legend (Legend2);
        case 3
            set(plot2(1),'Color',[0 0 1]);
            set(plot2(2),'Color',[0 1 0]);
            i=3;
            legend (Legend2);
        case 4
            set(plot2(1),'Color',[0 0 1]);
            set(plot2(2),'Color',[0 1 0]);
            set(plot2(3),'Color',[1 1 0]);
            i=4;
            legend (Legend2);
    end
    set(plot2(i),'LineWidth',1,'Color',[1 0 0]);

    % Create xlabel
    xlabel('Muestras','FontSize',10,'FontName','Google Sans');

    % Create ylabel
    ylabel(Y2title,'FontSize',10,'FontName','Google Sans');

    box(subplot1,'on');
    grid(subplot1,'on');
end
end
