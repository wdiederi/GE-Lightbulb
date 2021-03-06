function getXYZvalF(handles)
%Created 4/11/2017 by John
%% Last modified 
    %4/18/2017 by John
    %-added native resistance
    % added call to plot
%% PURPOSE:
%Allow you to solve for the xyY values w/o having to do the integration
%% NEED:
%Appdata with Xval, Yval, and Zval reference colormatched powers.
%Desired resistance values.
%% Output
% x, y, Y color spectrum values.


%% Calculation

%% Set Variables
% takes the form [R  , G  , B  , W]
Xval = [1.9318,  0.2192,  1.2017,  1.1688];
Yval = [0.8465,  1.0417,  0.1895,  1.1652];
Zval = [0.0003,  0.2143,  6.4264,  0.7231];
Xtotal = zeros(1,4);
Ytotal = zeros(1,4);
Ztotal = zeros(1,4);

%% Get resistance values from gui

LED{1}.resistance = handles.redSlider.Value; %red
LED{2}.resistance = handles.greenSlider.Value; %green
LED{3}.resistance = handles.blueSlider.Value; %blue
LED{4}.resistance = handles.whiteSlider.Value; %white

% Add the native resistance in the circuit

LED{1}.resistance = LED{1}.resistance +200;
LED{2}.resistance = LED{2}.resistance +100;
LED{3}.resistance = LED{3}.resistance +100;
LED{4}.resistance = LED{4}.resistance +100;
 
 %% Ohm's Law
vSupply = 24; %The voltage of the power sourc

for iLED = 1:4 
    
    switch iLED
        case 1
            vLed = 11.3;
        case 2
            vLed = 16.30;
        case 3
            vLed = 15.63;
        case 4
            vLed = 15.48;
        otherwise 
            vLed = 24;
    end
    
    
    LED{iLED}.current = (vSupply - vLed)/ LED{iLED}.resistance;
    
    %Resistance Value Variables::::
    LED{iLED}.var = LED{iLED}.current/.7;
    
    %{
    disp(['Current supplied to LED:',LED{iLED}.color,' is ',...
       num2str( LED{iLED}.current ), ' amps.' ]);
    %}
    
    %% Sum the color fxn
    Xtotal(iLED) = Xval(iLED) *   LED{iLED}.var    ;
    Ytotal(iLED) = Yval(iLED) *   LED{iLED}.var    ;
    Ztotal(iLED) = Zval(iLED) *   LED{iLED}.var    ;
end

%% Compute color coordinates X Y Z
% Sums the totals for each of the LED's
X = sum(Xtotal);
Y = sum(Ytotal);
Z = sum(Ztotal);

%% Compute Color coordinates of x,y,Y

x = (X) / (X+Y+Z);
y = (Y)/ (X+Y+Z);

%% Display & Change values.

disp('The color coordinates for the inputed resistance values are: ');
disp([ 'x= ', num2str(x), '; y= ', num2str(y),'; Y= ', num2str(Y) ] );
handles.xValue.String = num2str(round(x, 2));
handles.yValue.String = num2str(round(y, 2));
handles.YValue.String = num2str(round(Y, 3));

%% Plot

redrawCIE(handles, x, y);

%% Show Current Values in GUI

handles.redCurrentText.String = round(1000* LED{1}.current, 1);
handles.greenCurrentText.String = round(1000*LED{2}.current, 1);
handles.blueCurrentText.String = round(1000*LED{3}.current, 1);
handles.whiteCurrentText.String = round(1000*LED{4}.current, 1);

end