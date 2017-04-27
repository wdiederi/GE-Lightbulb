function getResistanceF(handles)
%Last Modified 4/24
% Takes the x, y, Y values and outputs the needed current values. to get as
% close as possible to the Y value after getting the x, and y.
%
% Will also only take the x, and y values, and then prioritize the highest
% Y value.
%

%% Accept multiple input types

%Define values of handles
xtest = handles.xSlider.Value;
ytest = handles.ySlider.Value;

Ytest = 3;

%% AM
%{
x = .313;
y = .298;
Y = 1.3177;
%}

%% PM
%{
x = .521;
y = .413;
Y = .5124;
%}

Xval = [1.9318,  0.2192,  1.2017,  1.1688];
Yval = [0.8465,  1.0417,  0.1895,  1.1652];
Zval = [0.0003,  0.2143,  6.4264,  0.7231];

%% Define some variables

LEDans{1}.color = 'Red';
LEDans{2}.color = 'Green';
LEDans{3}.color = 'Blue';
LEDans{4}.color = 'White';



%% Loop through different Y values to find x and y vals which are relatively close

C = [Xval; Yval; Zval]; % Used in later calculations
options.Algorithm = 'interior-point';
options.Display = 'none';  % Used with the linear solver

wh = waitbar(0,'Calculating Resistances...');
Yrange = 0:.001:Ytest;
numAnswers =0;
for iY = 1:length(Yrange)
    waitbar(iY/length(Yrange),wh);
    
    
    % Convert xyY to XYZ
    Xtest = (xtest/ytest) * Yrange(iY);
    Ztest = (Yrange(iY)/ytest)*(1-xtest-ytest);
    
    D = [Xtest; Yrange(iY) ;Ztest]; % Switches out the desired Y value
    
    %[0;0;0;0] - Max resistance of inf
    %[0.0125;0.006;.007;.007] - max resistance of 1000
    
    % Within 10,000 ohms
    Results = lsqlin(C,D,[],[],[],[],[0.0125;0.006;.007;.007],[.075;.06;.077;.077],[],options);
    
    newXYZ = C*Results;
    newx = newXYZ(1)/(sum(newXYZ));  % Put the found answers back into the eqn.
    newy = newXYZ(2)/(sum(newXYZ));  % Then convert the XYZ into xyY
    newY = newXYZ(2);
    
    
    % Test to see if the result is relatively close
    
    if abs(xtest-newx) <.001 && abs(ytest-newy) <.001
        %.0001 is the limit for how close it should be.
        
        %disp([ 'x= ', num2str(newx), '; y= ', num2str(newy),'; Y= ', num2str(Y(iY)) ]);
        %disp(Results);
        numAnswers = numAnswers+1;
        %disp(numAnswers);
        answers{numAnswers,1} = newx; 
        answers{numAnswers,2} = newy;
        answers{numAnswers,3} = newY;
        answers{numAnswers,4} = Results; %Stores the succesful values of Y
    
    end
    
    %disp(newx);
end
close(wh);

if numAnswers == 0
    hmessage = msgbox('Resistance values could not be found for this color','Error','error');
    
    return
end

AnswersYvalues = cell2mat(answers(:,3));
%Answers(3) has the valid values of Y
AnswerError = abs( AnswersYvalues -Ytest);  % converts the array into one that just continues the difference
for it = 1: length(AnswersYvalues)
    if AnswerError(it) == min(AnswerError) % Tests to see if it is the one with the closest Y value
        itCorrect = it;
    end
end
%itCorrect = 75;
%disp(['The closest Y value is ', num2str(Y(itCorrect))]);

xcorrect = answers{itCorrect,1};
ycorrect = answers{itCorrect,2};
Ycorrect = answers{itCorrect,3};
ResultsCorrect = answers{itCorrect, 4};

disp([ 'x= ', num2str(xcorrect), '; y= ', num2str(ycorrect),'; Y= ', num2str(Ycorrect) ]);






%% Convert the corresponding Results vector into resistance
% the results vector houses the correct proportions of current that each
% Led should receive

LEDans{1}.current = ResultsCorrect(1)*.7;
LEDans{2}.current = ResultsCorrect(2)*.7;
LEDans{3}.current = ResultsCorrect(3)*.7;
LEDans{4}.current = ResultsCorrect(4)*.7;


%% Reverse Ohm's Law
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
    
    LEDans{iLED}.resistance = (vSupply - vLed)/ LEDans{iLED}.current;
    
    
end

%% Built in resistance


LEDans{1}.resistance = LEDans{1}.resistance - 200;
LEDans{2}.resistance = LEDans{2}.resistance -100;
LEDans{3}.resistance = LEDans{3}.resistance -100;
LEDans{4}.resistance = LEDans{4}.resistance -100;

%{
for iLED = 1:4
    
    disp(['Resistance that should be supplied to LED:',LEDans{iLED}.color,' is ',...
       num2str( LEDans{iLED}.resistance ), ' ohms.' ]);
end
%}

%% Display resistances in pop-up box

hmessage = msgbox({'Resistance values found!',...
    ['Red Resistance: ',num2str(round(LEDans{1}.resistance, 2)), ' Ohms.'],...
    ['Green Resistance: ',num2str(round(LEDans{2}.resistance, 2)), ' Ohms.'],...
    ['Blue Resistance: ',num2str(round(LEDans{3}.resistance, 2)), ' Ohms.'],...
    ['White Resistance: ',num2str(round(LEDans{4}.resistance, 2)), ' Ohms.']},...
    'Resistances');

% make visual modifications to message box
hmessage.CurrentAxes.Children.FontSize = 16;
hmessage.Position = [500 250 300 150];

%% Change gui resistance values

% change text box Strings
handles.redText.String = num2str(round(LEDans{1}.resistance, 2));
handles.greenText.String = num2str(round(LEDans{2}.resistance, 2));
handles.blueText.String = num2str(round(LEDans{3}.resistance, 2));
handles.whiteText.String = num2str(round(LEDans{4}.resistance, 2));

% change redSlider
if LEDans{1}.resistance <= 1000
    handles.redSlider.Value = LEDans{1}.resistance;
else
    handles.redSlider.Value = 1000;
end

% change greenSlider
if LEDans{2}.resistance <= 1000
    handles.greenSlider.Value = LEDans{2}.resistance;
else
    handles.greenSlider.Value = 1000;
end

% change blueSlider
if LEDans{3}.resistance <= 1000
    handles.blueSlider.Value = LEDans{3}.resistance;
else
    handles.blueSlider.Value = 1000;
end

% change whiteSlider
if LEDans{4}.resistance <= 1000
    handles.whiteSlider.Value = LEDans{4}.resistance;
else
    handles.whiteSlider.Value = 1000;
end

% display Y value
handles.YValue.String = num2str(round(Ycorrect, 3));

%% Display Current Values

handles.redCurrentText.String = round(LEDans{1}.current, 4);
handles.greenCurrentText.String = round(LEDans{2}.current, 4);
handles.blueCurrentText.String = round(LEDans{3}.current, 4);
handles.whiteCurrentText.String = round(LEDans{4}.current, 4);