function plotCIE(handles, x, y)
% this function initializes the CIE spectrum

% Section 11, Group 3

%% Set Parameters

% read CIE image
CIE = imread('CIExy1931.png');


%% Find Alpha Data

% find transparent alpha data
alphaArray = CIE(:, :, 1) + CIE(:, :, 2) + CIE(:, :, 3);


%% Plot CIE Spectrum

% selects the correct axes on the GUI
axes(handles.axesCIE)
hax = handles.axesCIE;      % saves handles of current axes

% shows image with various options
CIE_image = imshow(CIE, 'InitialMagnification', 'fit', 'Parent', hax, 'XData', [0, .735], 'YData', [.835, 0]);
axis(handles.axesCIE, 'on')  % turns on the axes for this graph
set(hax, 'Ydir', 'Normal')              % resets the orientation of the Y axis can be 'reverse' or 'Normal'
alpha(hax, alphaArray)   % this selects the portion of the image to keep transparent (invisible)
hold on


%% Save UserData

% saves variables to user data of the CIE axes, to be access by other functions
hax.UserData = struct('CIE', CIE, 'alphaArray', alphaArray, 'hDot', []);


%% Draw Add-Ons to Plots

redrawCIE(handles, x, y)
hold off


%% Assign Mouseclick Callback Function

% when a user clicks the image, this function executes
CIE_image.ButtonDownFcn = @findClick;

% saves 'handles' as user data to the image object
CIE_image.UserData = struct('handles', handles);

% callback function goes here
% this executes when the mouse is clicked on the image
function findClick(src, ~)

% retrieves 'handles' and 'alphaArray' as saved in user data
handles = src.UserData.handles;
CIE = handles.axesCIE.UserData.CIE;
alphaArray = handles.axesCIE.UserData.alphaArray;
hDot = handles.axesCIE.UserData.hDot;

% finds the current position of the mouse
clickPoint = get(handles.axesCIE, 'CurrentPoint');
xClick = clickPoint(1, 1);  % x coordinate of the mouse click
yClick = clickPoint(1, 2);  % y coordinate of the mouse click

% SOMETHING HERE NEEDS TO BE FIXED
% finds the x and y positions of the click relative to the image
xpos = round((xClick / .735) * 1014);
ypos = round((1 - yClick / .835) * 894);


% checks if the position is valid
if alphaArray(ypos, xpos) > 0
    
    % changes x and y sliders and text in the GUI
    handles.xSlider.Value = round(xClick, 2);
    handles.ySlider.Value = round(yClick, 2);
    handles.xValue.String = round(xClick, 2);
    handles.yValue.String = round(yClick, 2);
    
    % sets popup selector to 'Custom' in the GUI
    handles.settingPopup.Value = 3;
    
    redrawCIE(handles, xClick, yClick)
    
else
    
    disp('Invalid Location')
    
end

% WE NEED TO IMPLEMENT THE CHANGE OF THE RESISTANCE SLIDERS.
% CONVERT THE XCLICK AND YCLICK TO RESISTANCE VALUES AND THEN MAKE THE
% SLIDERS THESE SAME VALUES.