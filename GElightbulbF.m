function GElightbulbF(handles)
%% GE_Lightbulb3.m

% modified April 18, 2017,
% John changed the initial resistance values

% This function returns the color for a certain resistance setting.
% Eng. 10122
% Section 11 Group 3


% Idea: Run the code once at the start of the gui.  Create global variables
% for Xval Yval and Zval.  Just modify those so you don't have to do the
% integration over and over.  It should be a lot less processing intensive.
% Or we can just get rid of the integration altogether, but I think we
% should do it once in the code just so they see how it was done.

%% read GE tables
powerData = xlsread('GE_Lighting_AlignProjectData', 'LED Spectra');
colorMatchData = xlsread('GE_Lighting_AlignProjectData', 'Color Matching Functions');

%% Set LED Parameters
% Resistance values for each bulb
LED{1}.color = 'Red';
LED{2}.color = 'Green';
LED{3}.color = 'Blue';
LED{4}.color = 'White';

% This resistances will be varied by the potentiometer
% 0-100 in ohms
% Resistances for I = .7 = 15,6,7.71,7.71

%Whiteish = .51,.099,.7,100

% Am Bulb = 46.8667, 9.9533, 36.5713, 23.724

LED{1}.resistance = handles.redSlider.Value; %red
LED{2}.resistance = handles.greenSlider.Value; %green
LED{3}.resistance = handles.blueSlider.Value; %blue
LED{4}.resistance = handles.whiteSlider.Value; %white

%Add the initial resistance of the circuit
LED{1}.resistance = LED{1}.resistance + 200;
LED{2}.resistance = LED{2}.resistance +100;
LED{3}.resistance = LED{3}.resistance +100;
LED{4}.resistance = LED{4}.resistance +100;

%% Ohm's Law
vSupply = 24; %The voltage of the power sourc

for iLED = 1:4 
    
    switch iLED
        case 1
            vLed = 13.5;
        case 2
            vLed = 19.8;
        case 3
            vLed = 18.6;
        case 4
            vLed = 18.6;
        otherwise 
            vLed = 24;
    end
    
    
    LED{iLED}.current = (vSupply - vLed)/ LED{iLED}.resistance;
    
    %Resistance Value Variables::::
    LED{iLED}.var = LED{iLED}.current/.7;

    disp(['Current supplied to LED:',LED{iLED}.color,' is ',...
       num2str( LED{iLED}.current ), ' amps.' ]);
end

%% Compute XYZ color space Coordinates

% Takes the structure array we have and computes the integral for the different color
% matching values


% This is just the integral of the values for wavelengths between 400-700;
deltaWavelength = 5;
Xval = zeros(1,4);
Yval = zeros(1,4);
Zval = zeros(1,4);
Xtotal = zeros(1,4);
Ytotal = zeros(1,4);
Ztotal = zeros(1,4);

for iLed = 1:4
    
    % For each color
    
    for iLambda = 400: deltaWavelength : 700
        % For each wavelength
        
       
        row = ((iLambda-400)/5) +1;
        
        SPD = powerData(row, iLed+1);
            
        
        
        xbar = colorMatchData(row,2);
        ybar = colorMatchData(row,3);
        zbar = colorMatchData(row,4);
        
        %disp(X)
        Xval(iLed) = Xval(iLed) + ( SPD * xbar * deltaWavelength);
        Yval(iLed) = Yval(iLed) + ( SPD *ybar * deltaWavelength);
        Zval(iLed) = Zval(iLed) + ( SPD *zbar * deltaWavelength);
        
    end
    
    % Multiplies the reference Xval by the variable
    Xtotal(iLed) = Xval(iLed) *   LED{iLed}.var    ;
    Ytotal(iLed) = Yval(iLed) *   LED{iLed}.var    ;
    Ztotal(iLed) = Zval(iLed) *   LED{iLed}.var    ;
    
    
end

% Sums the totals for each of the LED's
X = sum(Xtotal);
Y = sum(Ytotal);
Z = sum(Ztotal);


%% Compute Color coordinates of x and y

x = (X) / (X+Y+Z);
y = (Y)/ (X+Y+Z);

%% Show Gui Values
handles.xValue.String = double2str(x);
handles.yValue.String = double2str(y);
%handles.YValue.String = double2str(Y);

%% Display CIE Graph

disp('The color coordinates for the inputed resistance values are: ');
disp([ 'x= ', num2str(x), '; y= ', num2str(y),'; Y= ', num2str(Y) ] );

plotCIE(handles, x, y);