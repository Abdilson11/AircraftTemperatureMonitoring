%temp_monitor.m
%Task 2
clear
a = arduino;

function temp_monitor_f (a)

    % location of LEDs
    a = arduino;
    greenLED = 'D7';
    yellowLED = 'D6';
    redLED = 'D2';
    
    %loop for continuous monitoring
    while true
        %Read temperature
        temperature = readTemperature(a);
        
        %Control LEDs based on temperature
        if temperature >= 18 
            if temperature <= 24
            greenLEDState = 1;
            yellowLEDState = 0;
            redLEDState = 0;

            else
            greenLEDState = 0;
            yellowLEDState = 1;
            redLEDState = 0;

            end
        else
            greenLEDState = 0;
            yellowLEDState = 0;
            redLEDState = 1;
        end
        
        %Set LED states
        writeDigitalPin(a, greenLED, greenLEDState);
        writeDigitalPin(a, yellowLED, yellowLEDState);
        writeDigitalPin(a, redLED, redLEDState);
        
        %Pause for stability
        pause(0.3); % Adjust pause duration as needed
    end
end

function temp_monitor_f = readTemperature(a)
% Read voltage from A0
voltage = readVoltage(a, 'A0');
%convert to temperature
temperature = voltage./TC;
end

