function alanyze_q1()


import_100 = importdata('q1_100.out');
import_500 = importdata('q1_500.out');
import_1000 = importdata('q1_1000.out');

figure(); hold on;
plot(import_100.data(:,1), import_100.data(:,2), 'r');
plot(import_100.data(:,1), import_100.data(:,3), 'r--');


plot(import_500.data(:,1), import_500.data(:,2), 'g');
plot(import_500.data(:,1), import_500.data(:,3), 'g--');


plot(import_1000.data(:,1), import_1000.data(:,2), 'b');
plot(import_1000.data(:,1), import_1000.data(:,3), 'b--');

ylim([0, 5100]);

legend('100 S1', '100 S1?', '500 S1', '500 S1?', '1000 S1', '1000 S1?', ...
    'Location', 'SouthEast');

% Calculating the value for the SS.

start_pos = floor(length(import_100.data) * 9 / 10);
ss_100_s = mean(import_100.data(start_pos:end,2));


start_pos = floor(length(import_500.data) * 9 / 10);
ss_500_s = mean(import_500.data(start_pos:end,2));


start_pos = floor(length(import_1000.data) * 9 / 10);
ss_1000_s = mean(import_1000.data(start_pos:end,2));

txt(1) = {sprintf('K = 100 -> S1 = %.2f\n', ss_100_s)};
txt(2) = {sprintf('K = 500 -> S1 = %.2f\n', ss_500_s)};
txt(3) = {sprintf('K = 1000 -> S1 = %.2f\n', ss_1000_s)};

text(2000, 1000, txt, 'FontWeight', 'bold', 'LineWidth', 2, 'EdgeColor', 'black');

fprintf('K = 100 -> S1 = %.2f\n', ss_100_s);
fprintf('K = 500 -> S1 = %.2f\n', ss_500_s);
fprintf('K = 1000 -> S1 = %.2f\n', ss_1000_s);

title ('Question 1');

end