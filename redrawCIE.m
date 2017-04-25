function redrawCIE(handles, x, y)
% this function plots an xy value on the existing CIE spectrum in the GUI

% Section 11, Group 3

%% Retrieve Data

CIE = handles.axesCIE.UserData.CIE;
alphaArray = handles.axesCIE.UserData.alphaArray;
hDot = handles.axesCIE.UserData.hDot;


%% Make Calculations

% THIS MAY BE FAULTY
% finds the x and y positions relative to the array size
xpos = round((x / .735) * size(CIE, 2));
ypos = round((1 - y / .835) * size(CIE, 1));

%{
% test display
disp(' ')
disp('~ INFO ~')
disp(['x/width: ', num2str((x / .74))])
disp(['y/height: ', num2str((y / .835))])
disp(['x: ', num2str(x)])
disp(['y: ', num2str(y)])
disp(['xpos: ', num2str(xpos)])
disp(['ypos: ', num2str(ypos)])
disp(['size(CIE): ', num2str(size(CIE))])
disp(['CIE(ypos, xpos, :): ', num2str(CIE(ypos, xpos, :))])
%}


%% Redraw Plots 

% checks if the position is valid
if alphaArray(ypos, xpos) > 0   % this is possibly faulty
    
    % sets popup selector to 'Custom' in the GUI
    handles.settingPopup.Value = 3;
    
    % update the plot to redraw the locator circle
    delete(hDot)    % first, delete the old circle
    hDot = plot(handles.axesCIE, x, y, 'ko', 'LineWidth', 1.5);   % next, redraw the circle
    handles.axesCIE.UserData.hDot = hDot;   % last, save the handles of the new circle
    
    % update the single-color plot...
    % selects the correct axes on the GUI
    axes(handles.axesColor)
    
    % shows image with various options
    imshow(CIE(ypos, xpos, :), 'InitialMagnification', 'fit', 'Parent', handles.axesColor);
    
    % HERE, ADD FUNCTIONALITY WITH THE NONLINEAR SOLVER
    
else
    
    disp('Invalid Location')
    
end