close all;

document = '/Users/joelschnitter/thesis_scripts/rve_Auswertung/results_rve_analysis.xls';
rawdata = xlsread(document,1);

x_values = rawdata(: ,1); %x
y_values = rawdata(: ,2); %y
size = x_values.*y_values; %x*y

%all results post- island removal
va_pore = rawdata(:, 6);
va_cb = rawdata(:, 7);
va_am = rawdata(:, 8);

active_surface = rawdata(: ,end);

%make charts with material fractions
title_1 = 'representative volume element (x direction)';
title_2 = 'representative volume element (y direction)';
xlabel_1 ='section edge length (x-direction) (\mum)';
xlabel_2 ='section edge length (y-direction) (\mum)';

plot_matfractions(x_values, va_pore, va_am, va_cb, title_1, xlabel_1);
plot_matfractions(y_values, va_pore, va_am, va_cb, title_2, xlabel_2);

%make chart with surface area
title_3 = 'representative volume element (surface)'
x_label_3 = 'total surface area (\mum^2)'

plot_matfractions(size, va_pore, va_am, va_cb, title_3, x_label_3);

function plot_matfractions(x_values, va_pore, va_am, va_cb, chart_title, chart_xlabel)
%returns chart of three material fractions vs section edge length
%parameters: section edge len, data for pore, am, cb, title of the chart
%and xlabel. important to feed in that order or the legend will be wrong

scatter(x_values, va_pore,'black', "diamond") %pore
title(chart_title)
xlabel(chart_xlabel)
ylabel('fraction (%)')
hold on
scatter(x_values, va_am, 'blue', "diamond")% active material
scatter(x_values, va_cb, 'red', "diamond")% carbon black
hold off

legend('pore fraction', 'AM fraction', 'carbon black fraction', 'Location', 'northwest');


ax = gca;
export_name = [chart_title, '.jpg']
exportgraphics(ax, export_name,'Resolution',700);
end

%TODO tomorrow!
function plot_single_val(x_val, y_val, chart_title, chart_x_label)
end
