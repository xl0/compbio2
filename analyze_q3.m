function alanyze_q3()


color_map = zeros(150,3);
color_map(50:150,:) = jet(101);


% from 50 to 150 with step 10;
n = 1;
for p = [50:10:150]
    filename=sprintf('q3_%d.out', p);
    results(p) =importdata(filename);
end

results_no_p = importdata('q3_0.out');


figure(); hold on;
plot(results_no_p.data(:,1), results_no_p.data(:,2), 'g');

plot(results(50).data(1:3000,1), results(50).data(1:3000,3), 'b')

title('Q3.1: S1? concentration with P = 0 and 50');
legend('S1? with P=0', 'S1? with P=50', 'Location', 'SouthEast');
xlabel('Time');
ylabel('S1? Units');

start_pos = floor(length(results(end).data) * 3 / 4);

n = 1;
for p = [50:10:150]
    steady_state_s1(n) = mean(results(p).data(start_pos:end, 3));
    steady_state_s1_std(n) = std(results(p).data(start_pos:end, 3));

    P_num(n) = p;
    n = n + 1;
end

figure(); hold on;

plot(P_num, steady_state_s1, 'r');
plot(P_num, steady_state_s1_std * (max (steady_state_s1) / max(steady_state_s1_std)), 'g');
legend('S1?', 'S1? fluctuations');
title('Q3.2: S1? at steady state, and std(S1?) around steady state');
xlabel('P concentration');
ylabel('S1? at SS / fluctuations (A.U.)');


figure(); hold on;

colormap(color_map);
colorbar;
for p = [50:10:150]
    plot(results(p).data(:,1), results(p).data(:,3), 'color', ...
        color_map(p,:));    
end

title('Q3.3: S1? concentration');
xlabel('Time');
ylabel('S1?')


end


