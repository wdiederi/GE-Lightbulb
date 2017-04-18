function spectralPower =SPD(powerData, wavelength, LED, current)
% John Craig
% Takes the current (amps) specified, the wavelength (nm) and optionally the LED and returns either the
% total spectral power distribution or that one channel.  Also looks into
% the reference chart.


if nargin<1
    powerData = xlsread('GE_Lighting_AlignProjectData', 'LED Spectra');
    current = .7;
    wavelength = 400;
    LED = 'wavelength';
elseif nargin < 2
    current = .7;
    wavelength = 400;
    LED = 'wavelength';
elseif nargin < 3
    current = .7;
    LED = 'wavelength';
elseif nargin < 4
        current = .7;
end

if wavelength <400 || wavelength > 700
    disp('Wavelength out of range');
    wavelength = 400;
end
    

%% read data

%xlsread(filename,sheet,xlRange)
% file = 'GE_Lighting_AlignProjectData
% sheet = 'LED Spectra'
% Wavelength (400-700) -RED - GREEN - BLUE - White
%powerData = xlsread('GE_Lighting_AlignProjectData', 'LED Spectra');

row = floor( (wavelength-400)  /5)+1; % Converts the wavelength to the right row

if strcmpi(LED, 'white')
    col = 5;
elseif strcmpi(LED, 'blue')
    col = 4;
elseif strcmpi(LED, 'green')
    col = 3;
 
elseif strcmpi(LED, 'red') 
    col = 2;
else
    col = 1;
end

%% Return

referencePower = powerData(row,col);
spectralPower = (current/.7)*referencePower;
