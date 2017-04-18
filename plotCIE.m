function plotCIE(handles, x, y)
% this function plots an xy value on the CIE spectrum in the GUI

% Section 11, Group 3

%% Set Parameters

% read CIE image
CIE = imread('CIExy1931.png');


%% Find Alpha Data

% find transparent alpha data
alphaArray = CIE(:, :, 1) + CIE(:, :, 2) + CIE(:, :, 3);


%% Plot Original CIE Image

% selects the coreect axes on the GUI
axes(handles.axesCIE)
hax = handles.axesCIE;      % saves handles of current axes
title(hax, 'CIE Display')

% shows image with various options
CIE_image = imshow(CIE, 'InitialMagnification', 'fit', 'Parent', hax, 'XData', [0, .74], 'YData', [.835, 0]);
iptsetpref('ImshowAxesVisible', 'off')   % shows the coordinates like any normal axes
set(hax, 'Ydir', 'Normal')              % resets the orientation of the Y axis
alpha(hax, alphaArray)   % this selects the portion of the image to keep transparent (invisible)
hold on

% plots the circle on top of the CIE image
plot(hax, x, y, 'ko', 'LineWidth', 1.5)
hold off

%% Plot RGB Color on Seperate Graph

% finds the x and y positions relative to the array size
xpos = round((x / CIE_image.XData(2)) * size(CIE, 1));
ypos = round(((y / CIE_image.YData(1))) * size(CIE, 2));

% test display
disp(' ')
disp('~ INFO ~')
disp(['x/width: ', num2str((x / CIE_image.XData(2)))])
disp(['y/height: ', num2str((y / CIE_image.YData(1)))])
disp(['x: ', num2str(x)])
disp(['y: ', num2str(y)])
disp(['xpos: ', num2str(xpos)])
disp(['ypos: ', num2str(ypos)])
disp(['size(CIE): ', num2str(size(CIE))])
disp(['RGB: ', num2str(CIE(xpos, ypos, :))])


% selects the coreect axes on the GUI
axes(handles.axesColor)
haxCol = handles.axesColor;      % saves handles of current axes
title(haxCol, 'Color')

% shows image with various options
imshow(CIE(xpos, ypos, :), 'InitialMagnification', 'fit', 'Parent', haxCol);

%% Assign Mouseclick Callback Function

% when a user clicks the image, this function executes
CIE_image.ButtonDownFcn = @findClick;

% saves 'handles' as user data to the image object
CIE_image.UserData = handles;


% callback function goes here
% this executes when the mouse is clicked on the image
function findClick(src, ~)

% retrieves 'handles' as saved in user data
handles = src.UserData;

% finds the current position of the mouse
clickPoint = get(handles.axesCIE, 'CurrentPoint');
xClick = clickPoint(1, 1);  % x coordinate of the mouse click
yClick = clickPoint(1, 2);  % y coordinate of the mouse click

% sets popup selector to 'Custom' in the GUI
handles.settingPopup.Value = 1;

% changes x and y sliders and text in the GUI
handles.xSlider.Value = round(xClick, 2);
handles.ySlider.Value = round(yClick, 2);
handles.xValue.String = round(xClick, 2);
handles.yValue.String = round(yClick, 2);

% redraws the circle on top of the CIE image, using new x and y coordinates
plot(handles.axesCIE, xClick, yClick, 'ko', 'LineWidth', 1.5)

% reruns the plotCIE function, mostly to update the single color graph...
plotCIE(handles, xClick, yClick)

% WE NEED TO IMPLEMENT THE CHANGE OF THE RESISTANCE SLIDERS.
% CONVERT THE XCLICK AND YCLICK TO RESISTANCE VALUES AND THEN MAKE THE
% SLIDERS THESE SAME VALUES.