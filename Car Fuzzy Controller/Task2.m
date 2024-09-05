clc
clear
close all

% Load the FLC
fis = readfis("Car_FIS.fis");

% Initialize velocity and position/angle
u = 0.05;
x = 3.8;
y = 0.5;
theta0 = 0;

% Initialize vectors that hold position values
X = [x];
Y = [y];

theta = theta0;
while sqrt((x-10)^2+(y-3.2)^2) > 0.15       % Check if the car has reached the target

    % Calculate new positions (new x & new y)
    x = x + u*cosd(theta);
    y = y + u*sin(theta);

    % Update position vectors
    X = [X ; x];
    Y = [Y ; y];

    % Calculate dv & dh
    if (x < 5)
        dv = y;
    elseif (x < 6)
        dv = y - 1;
    elseif (x < 7)
        dv = y - 2;
    elseif (x >= 7)
        dv = y - 3;
    end
    
    if (y < 1)
        dh = 5 - x;
    elseif (y < 2)
        dh = 6 - x;
    elseif (y < 3)
        dh = 7 - x;
    elseif (y >= 3)
        dh = 1 ;
    end
    
    % Normalize dv,dh for FLC inputs
    if dv < 0
        dv = 0;
    elseif dv > 1
        dv = 1;
    end
    
     if dh < 0
        dh = 0;
    elseif dh > 1
        dh = 1;
    end

    % Calculate d_theta using the FLC
    d_theta = evalfis(fis,[dv,dh,theta]);

    % Calculate new theta
    theta = theta + d_theta;

    % Make sure theta is in range [-180,180]
    if theta < -180 
        theat = theta + 360;
    end

    if theta > 180 
        theta = theta - 360;
    end

end
    
% Plot the trajectory of the car
plot(X,Y,'b')
hold on
plot([5,5],[0,1],'r',[5,6],[1,1],'r',[6,6],[1,2],'r',[6,7],[2,2],'r',[7,7],[2,3],'r',[7,10],[3,3],'r',10,3.2,'gx')
hold off

title("Car Trajectory (θ_0 = " + num2str(theta0) + ")")
xlabel('X')
ylabel('Y')
legend('Car','Obstacles','Location','northwest')