clear all; close all; clc;

T = 0.01;
x1 = -1:T:1;
y1 = -sqrt(1 - x1.^2);
x2 = 1-T:-T:-1;
y2 = sqrt(1 - x2.^2);
x = [x1, x2]; y = [y1, y2];
z = (0:1:length(x)-1) / (length(x)-1);

n = 1000;
randomNumbers = 2*rand(2,n)-1;
randomNumbers3d = zeros(3,n);
randomNumbers3d(1:2,:) = randomNumbers;

figure(1);
hold on;
plot([-1 1],[1 1],'k-','linewidth',1.5);
plot([1 1],[1 -1],'k-','linewidth',1.5);
plot([1 -1],[-1 -1],'k-','linewidth',1.5);
plot([-1 -1],[-1 1],'k-','linewidth',1.5);
for i=1:n
    if ( randomNumbers(1,i)^2 + randomNumbers(2,i)^2 <= 1 )
        plot(randomNumbers(1,i), randomNumbers(2,i), 'k.');
        randomNumbers3d(3,i) = 1;
    else
        plot(randomNumbers(1,i), randomNumbers(2,i), 'k.');
        randomNumbers3d(3,i) = 0;
    end
end
hold off;
grid on; axis equal; axis([-1.2 1.2 -1.2 1.2]);
xlabel('x_1'); ylabel('x_2');
set(gca, 'gridlinestyle', '--');

figure(2);
plot(x, y, 'k-','linewidth',1.5);
hold on;
plot([-1 1],[1 1],'k-','linewidth',1.5);
plot([1 1],[1 -1],'k-','linewidth',1.5);
plot([1 -1],[-1 -1],'k-','linewidth',1.5);
plot([-1 -1],[-1 1],'k-','linewidth',1.5);
for i=1:n
    if ( randomNumbers(1,i)^2 + randomNumbers(2,i)^2 <= 1 )
        plot(randomNumbers(1,i), randomNumbers(2,i), 'k.');
        randomNumbers3d(3,i) = 1;
    else
        plot(randomNumbers(1,i), randomNumbers(2,i), 'k.');
        randomNumbers3d(3,i) = 0;
    end
end
hold off;
grid on; axis equal; axis([-1.2 1.2 -1.2 1.2]);
xlabel('x_1'); ylabel('x_2');
set(gca, 'gridlinestyle', '--');

figure(3);
plot(x, y, 'k-','linewidth',1.5);
hold on;
plot([-1 1],[1 1],'k-','linewidth',1.5);
plot([1 1],[1 -1],'k-','linewidth',1.5);
plot([1 -1],[-1 -1],'k-','linewidth',1.5);
plot([-1 -1],[-1 1],'k-','linewidth',1.5);
for i=1:n
    if ( randomNumbers(1,i)^2 + randomNumbers(2,i)^2 <= 1 )
        plot(randomNumbers(1,i), randomNumbers(2,i), 'r.');
        randomNumbers3d(3,i) = 1;
    else
        plot(randomNumbers(1,i), randomNumbers(2,i), 'b.');
        randomNumbers3d(3,i) = 0;
    end
end
hold off;
grid on; axis equal; axis([-1.2 1.2 -1.2 1.2]);
xlabel('x_1'); ylabel('x_2');
set(gca, 'gridlinestyle', '--');

figure(4);
hold on;
for i=1:n
    if ( randomNumbers3d(3,i) == 1 )
        plot3(randomNumbers3d(1,i), randomNumbers3d(2,i), randomNumbers3d(3,i), 'r.');
    else
        plot3(randomNumbers3d(1,i), randomNumbers3d(2,i), randomNumbers3d(3,i), 'b.');
    end
end
hold off;
% plot3(randomNumbers3d(1,:), randomNumbers3d(2,:), randomNumbers3d(3,:), 'k.');
grid on;
view([-34 36]);
xlabel('x_1'); ylabel('x_2');
set(gca, 'gridlinestyle', '--');
%% animation
figure(5);
hold on; grid on; view([-34 36]);
for i=1:length(x)
    plot3(x(i), y(i), z(i), 'k.');
    pause(0.02);
end
hold off;