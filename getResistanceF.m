function getResistanceF(x, y, Y, Xval,Yval,Zval)
% Section 11 - Group 3
% TESTING
% Input the desired x,y,Y values and the Xval,Yval, and Zval info which
% should all be standard for any current supplied
% I'm making a change to make sure this works testing again
% Returns the resistances needed to produce those values

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

myfun = @(var)  [Xtest - (Xval(1)*var(1) + Xval(2)*var(2) + Xval(3)*var(3) + Xval(4)*var(4));
    Ytest - (Yval(1)*var(1) + Yval(2)*var(2) + Yval(3)*var(3) + Yval(4)*var(4));
    Ztest - (Zval(1)*var(1) + Zval(2)*var(2) + Zval(3)*var(3) + Zval(4)*var(4))];  

xnot = [1,1,1,1];

%disp(myfun(xnot));
[Results,Fvalues] = fsolve(myfun,xnot);
% Results = [R, G, B, W]
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
    
    disp(['Resistance that should be supplied to LED:',Ans{iLED}.color,' is ',...
       num2str( Ans{iLED}.resistance ), ' ohms.' ]);
end
%resistances = [Ans.resistance{1}, Ans.resistance{2}, Ans.resistance{3}, Ans.resistance{4}];