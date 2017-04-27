function redrawCIE(handles, x, y)
% this function plots an xy value on the existing CIE spectrum in the GUI

% Section 11, Group 3

%% Retrieve Data

CIE = handles.axesCIE.UserData.CIE;
alphaArray = handles.axesCIE.UserData.alphaArray;
hDot = handles.axesCIE.UserData.hDot;


%% Make Calculations

% finds the x and y positions relative to the array size
xpos = round((x / .735) * size(CIE, 2));
ypos = round((1 - y / .835) * size(CIE, 1));


%% Redraw Plots 

% checks if the position is valid
if alphaArray(ypos, xpos) > 0
    
    % update the plot to redraw the locator circle
    delete(hDot)    % first, delete the old circle
    hDot = plot(handles.axesCIE, x, y, 'ko', 'LineWidth', 1.5);   % next, redraw the circle
    handles.axesCIE.UserData.hDot = hDot;   % last, save the handles of the new circle
    
    % update the single-color plot...
    % selects the correct axes on the GUI
    axes(handles.axesColor)
    
    % shows image with various options
    imshow(CIE(ypos, xpos, :), 'InitialMagnification', 'fit', 'Parent', handles.axesColor);
    axis(handles.axesColor, 'off')  % turns off the axes for this graph
    
    % update x and y sliders on GUI
    handles.xSlider.Value = x;
    handles.ySlider.Value = y;
    handles.xValue.String = num2str(round(x, 2));
    handles.yValue.String = num2str(round(y, 2));
    
else
    
    msgbox('Invalid Location','Error','error')
    
end