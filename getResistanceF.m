function getResistanceF(x, y, Y)
% Section 11 - Group 3
% Changed 4/24
% Input the desired x,y,Y values and the Xval,Yval, and Zval info which
% should all be standard for any current supplied

% Returns the resistances needed to produce those values

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

Ans{1}.color = 'Red';
Ans{2}.color = 'Green';
Ans{3}.color = 'Blue';
Ans{4}.color = 'White';

%% Solve;


% XYZ of the AM bulb
   %CHANGE THESE TEST VALUES ARE THE DESIRED XYZ VALUES
Xtest = (x/y) * Y;
Ytest = Y;
Ztest = (Y/y)*(1-x-y);

%disp(Xval(1) * LED{1}.var + Xval(2) * LED{2}.var + Xval(3) * LED{3}.var + Xval(4) * LED{4}.var);

    %%Define fxns for fsolve
    %% Non linear solver 1
%{
myfun = @(var)  [Xtest - (Xval(1)*var(1) + Xval(2)*var(2) + Xval(3)*var(3) + Xval(4)*var(4));
    Ytest - (Yval(1)*var(1) + Yval(2)*var(2) + Yval(3)*var(3) + Yval(4)*var(4));
    Ztest - (Zval(1)*var(1) + Zval(2)*var(2) + Zval(3)*var(3) + Zval(4)*var(4))];  

xnot = [1,1,1,1];


[Results,Fvalues] = fsolve(myfun,xnot);
%}
    
    %% Non Linear Solver 2
% Upper and lower bounds  for built in resistances of 0-1000

%{/
%Red = .0125 - .075 
%Green = .0055 - .06
%Blue/White = .007 - .077

% Upper and Lower bounds for no built in resistance .001 - 1000
%Red = .015 - 15000 
%Green = .006 - 6000
%Blue/White = .0077 - 7714.3



C = [Xval; Yval; Zval];
D = [Xtest;Ytest;Ztest];
options.Algorithm = 'interior-point';
Results = lsqlin(C,D,[],[],[],[],[0;0;0;0],[.075;.06;.077;.077],[],options);

%}

% Results = [R, G, B, W]
disp(Results);
Ans{1}.current = Results(1)*.7;
Ans{2}.current = Results(2)*.7;
Ans{3}.current = Results(3)*.7;
Ans{4}.current = Results(4)*.7;


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
    
    Ans{iLED}.resistance = (vSupply - vLed)/ Ans{iLED}.current;
    
    
end

%% Built in resistance
%{/

Ans{1}.resistance = Ans{1}.resistance - 200;
Ans{2}.resistance = Ans{2}.resistance -100;
Ans{3}.resistance = Ans{3}.resistance -100;
Ans{4}.resistance = Ans{4}.resistance -100;
%}

for iLED = 1:4
    
    disp(['Resistance that should be supplied to LED:',Ans{iLED}.color,' is ',...
       num2str( Ans{iLED}.resistance ), ' ohms.' ]);
end
%resistances = [Ans.resistance{1}, Ans.resistance{2}, Ans.resistance{3}, Ans.resistance{4}];