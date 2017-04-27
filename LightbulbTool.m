function varargout = LightbulbTool(varargin)

% TESTING  4/18/17 @ 8:28
% UPDATE LAST MODIFIED
% modified April 18 2018 by Danny
% Changed the string values for the AM and PM setting to have only 2
% decimals. Also began to make the xValue and yValue talk, but did not
% finish.

% WE NEED TO ADD PM RESISTANCE VALUES TO THE "settingPopup" CALLBACK


% LIGHTBULBTOOL MATLAB code for LightbulbTool.fig
%      LIGHTBULBTOOL, by itself, creates a new LIGHTBULBTOOL or raises the existing
%      singleton*.
%
%      H = LIGHTBULBTOOL returns the handle to a new LIGHTBULBTOOL or the handle to
%      the existing singleton*.
%
%      LIGHTBULBTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIGHTBULBTOOL.M with the given input arguments.
%
%      LIGHTBULBTOOL('Property','Value',...) creates a new LIGHTBULBTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LightbulbTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LightbulbTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LightbulbTool

% Last Modified by GUIDE v2.5 26-Apr-2017 22:38:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LightbulbTool_OpeningFcn, ...
                   'gui_OutputFcn',  @LightbulbTool_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before LightbulbTool is made visible.
function LightbulbTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LightbulbTool (see VARARGIN)

% Choose default command line output for LightbulbTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LightbulbTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% execute initial function
GElightbulbF(handles);

handles.capResistanceButton.Value = 1;

%% SAVE AM color data to GUI elements
% update x and y sliders and text boxes
handles.xValue.String = '0.31';
handles.yValue.String = '0.30';
handles.xSlider.Value = .313;
handles.ySlider.Value = .298;
handles.YValue.String = '1.318';

% update color text boxes
handles.redText.String = '302.47';
handles.greenText.String = '0.13';
handles.blueText.String = '190.92';
handles.whiteText.String = '0.35';

% update color sliders
handles.redSlider.Value = 302.47;
handles.greenSlider.Value = 0.13;
handles.blueSlider.Value = 190.92;
handles.whiteSlider.Value = 0.35;

% update current text boxes
handles.redCurrentText.String = '20.9';
handles.greenCurrentText.String = '42';
handles.blueCurrentText.String = '18.6';
handles.whiteCurrentText.String = '53.8';


%% SAVE AM color data to Listbox UserData
% update x and y sliders and text boxes
handles.saveColorListbox.UserData.xValue{1} = handles.xValue.String;
handles.saveColorListbox.UserData.yValue{1} = handles.yValue.String;
handles.saveColorListbox.UserData.xSlider{1} = handles.xSlider.Value;
handles.saveColorListbox.UserData.ySlider{1} = handles.ySlider.Value;
handles.saveColorListbox.UserData.YValue{1} = handles.YValue.String;

% update color text boxes
handles.saveColorListbox.UserData.redText{1} = handles.redText.String;
handles.saveColorListbox.UserData.greenText{1} = handles.greenText.String;
handles.saveColorListbox.UserData.blueText{1} = handles.blueText.String;
handles.saveColorListbox.UserData.whiteText{1} = handles.whiteText.String;

% update color sliders
handles.saveColorListbox.UserData.redSlider{1} = handles.redSlider.Value;
handles.saveColorListbox.UserData.greenSlider{1} = handles.greenSlider.Value;
handles.saveColorListbox.UserData.blueSlider{1} = handles.blueSlider.Value;
handles.saveColorListbox.UserData.whiteSlider{1} = handles.whiteSlider.Value;

% update current text boxes
handles.saveColorListbox.UserData.redCurrentText{1} = handles.redCurrentText.String;
handles.saveColorListbox.UserData.greenCurrentText{1} = handles.greenCurrentText.String;
handles.saveColorListbox.UserData.blueCurrentText{1} = handles.blueCurrentText.String;
handles.saveColorListbox.UserData.whiteCurrentText{1} = handles.whiteCurrentText.String;


%% SAVE PM color data to Listbox UserData
% update x and y sliders and text boxes
handles.saveColorListbox.UserData.xValue{2} = '0.52';
handles.saveColorListbox.UserData.yValue{2} = '0.41';
handles.saveColorListbox.UserData.xSlider{2} = .521;
handles.saveColorListbox.UserData.ySlider{2} = .413;
handles.saveColorListbox.UserData.YValue{2} = '0.512';

% update color text boxes
handles.saveColorListbox.UserData.redText{2} = '0.36';
handles.saveColorListbox.UserData.greenText{2} = '8.68';
handles.saveColorListbox.UserData.blueText{2} = '1406357.53';
handles.saveColorListbox.UserData.whiteText{2} = '426.45';

% update color sliders
handles.saveColorListbox.UserData.redSlider{2} = 0.36;
handles.saveColorListbox.UserData.greenSlider{2} = 8.68;
handles.saveColorListbox.UserData.blueSlider{2} = 1000;
handles.saveColorListbox.UserData.whiteSlider{2} = 426.45;

% update current text boxes
handles.saveColorListbox.UserData.redCurrentText{2} = '52.4';
handles.saveColorListbox.UserData.greenCurrentText{2} = '38.6';
handles.saveColorListbox.UserData.blueCurrentText{2} = '0';
handles.saveColorListbox.UserData.whiteCurrentText{2} = '10.3';


% --- Outputs from this function are returned to the command line.
function varargout = LightbulbTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function redSlider_Callback(hObject, eventdata, handles)
% hObject    handle to redSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.settingPopup.Value = 3;
resR = handles.redSlider.Value;
handles.redText.String = num2str(round(resR, 2));
getXYZvalF(handles);


% --- Executes during object creation, after setting all properties.
function redSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function greenSlider_Callback(hObject, eventdata, handles)
% hObject    handle to greenSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.settingPopup.Value = 3;
resG = handles.greenSlider.Value;
handles.greenText.String = num2str(round(resG, 2));
getXYZvalF(handles);

% --- Executes during object creation, after setting all properties.
function greenSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to greenSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function blueSlider_Callback(hObject, eventdata, handles)
% hObject    handle to blueSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.settingPopup.Value = 3;
resB = handles.blueSlider.Value;
handles.blueText.String = num2str(round(resB, 2));
getXYZvalF(handles);

% --- Executes during object creation, after setting all properties.
function blueSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blueSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function whiteSlider_Callback(hObject, eventdata, handles)
% hObject    handle to whiteSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.settingPopup.Value = 3;
resW = handles.whiteSlider.Value;
handles.whiteText.String = num2str(round(resW, 2));
getXYZvalF(handles);

% --- Executes during object creation, after setting all properties.
function whiteSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to whiteSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in settingPopup.
function settingPopup_Callback(hObject, eventdata, handles)
% hObject    handle to settingPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns settingPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from settingPopup
switch handles.settingPopup.Value
    
    case 1 % AM SETTING
        % values on resistor, not total resistance
        handles.redSlider.Value = 202.74;
        handles.greenSlider.Value = 0;
        handles.blueSlider.Value = 163.41;
        handles.whiteSlider.Value = 0.19;
        handles.redText.String = 202.74;
        handles.greenText.String = 0;
        handles.blueText.String = 163.41;
        handles.whiteText.String = 0.19;
        % WE NEED TO UPDATE THE GRAPH AS WELL
        
        
    case 2 % PM SETTING
        % THESE VALUES ARE NOT CORRECT
        % JUST ARBITRARY VALUES SO THE PROGRAM RUNS
        % STILL NEED TO FIND THESE VALUES
        handles.redSlider.Value = 46.8667;
        handles.greenSlider.Value = 9.9533;
        handles.blueSlider.Value = 36.5713;
        handles.whiteSlider.Value = 23.724;
        handles.redText.String = 46.87;
        handles.greenText.String = 9.95;
        handles.blueText.String = 36.57;
        handles.whiteText.String = 23.72;
        % WE NEED TO UPDATE THE GRAPH AS WELL
        
end

getXYZvalF(handles);

% --- Executes during object creation, after setting all properties.
function settingPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to settingPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttonCalculate.
function buttonCalculate_Callback(hObject, eventdata, handles)
% hObject    handle to buttonCalculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

getResistanceF(handles);


function redText_Callback(hObject, eventdata, handles)
% hObject    handle to redText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of redText as text
%        str2double(get(hObject,'String')) returns contents of redText as a double
handles.settingPopup.Value = 3;
resRstr = handles.redText.String;
handles.redSlider.Value = str2double(resRstr);
getXYZvalF(handles);


% --- Executes during object creation, after setting all properties.
function redText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function greenText_Callback(hObject, eventdata, handles)
% hObject    handle to greenText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of greenText as text
%        str2double(get(hObject,'String')) returns contents of greenText as a double
handles.settingPopup.Value = 3;
resGstr = handles.greenText.String;
handles.greenSlider.Value = str2double(resGstr);
getXYZvalF(handles);

% --- Executes during object creation, after setting all properties.
function greenText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to greenText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function whiteText_Callback(hObject, eventdata, handles)
% hObject    handle to whiteText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of whiteText as text
%        str2double(get(hObject,'String')) returns contents of whiteText as a double
handles.settingPopup.Value = 3;
resWstr = handles.whiteText.String;
handles.whiteSlider.Value = str2double(resWstr);
getXYZvalF(handles);

% --- Executes during object creation, after setting all properties.
function whiteText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to whiteText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blueText_Callback(hObject, eventdata, handles)
% hObject    handle to blueText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blueText as text
%        str2double(get(hObject,'String')) returns contents of blueText as a double
handles.settingPopup.Value = 3;
resBstr = handles.blueText.String;
handles.blueSlider.Value = str2double(resBstr);
getXYZvalF(handles);

% --- Executes during object creation, after setting all properties.
function blueText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blueText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xValue_Callback(hObject, eventdata, handles)
% hObject    handle to xValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xValue as text
%        str2double(get(hObject,'String')) returns contents of xValue as a double

handles.settingPopup.Value = 3;
handles.xSlider.Value = str2double(handles.xValue.String);
redrawCIE(handles, handles.xSlider.Value, handles.ySlider.Value)



% --- Executes during object creation, after setting all properties.
function xValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function yValue_Callback(hObject, eventdata, handles)
% hObject    handle to yValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yValue as text
%        str2double(get(hObject,'String')) returns contents of yValue as a double

handles.settingPopup.Value = 3;
handles.ySlider.Value = str2double(handles.yValue.String);
redrawCIE(handles, handles.xSlider.Value, handles.ySlider.Value)



% --- Executes during object creation, after setting all properties.
function yValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function ySlider_Callback(hObject, eventdata, handles)
% hObject    handle to ySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.settingPopup.Value = 3;
handles.yValue.String = num2str(round(handles.ySlider.Value, 2));
redrawCIE(handles, handles.xSlider.Value, handles.ySlider.Value)

% --- Executes during object creation, after setting all properties.
function ySlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function xSlider_Callback(hObject, eventdata, handles)
% hObject    handle to xSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.settingPopup.Value = 3;
handles.xValue.String = num2str(round(handles.xSlider.Value, 2));
redrawCIE(handles, handles.xSlider.Value, handles.ySlider.Value)


% --- Executes during object creation, after setting all properties.
function xSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in saveColorListbox.
function saveColorListbox_Callback(hObject, eventdata, handles)
% hObject    handle to saveColorListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns saveColorListbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from saveColorListbox

% gather data and abbreviated references
pos = handles.saveColorListbox.Value;
data = handles.saveColorListbox.UserData;

% update x and y sliders and text boxes
handles.xValue.String = data.xValue{pos};
handles.yValue.String = data.yValue{pos};
handles.xSlider.Value = data.xSlider{pos};
handles.ySlider.Value = data.ySlider{pos};
handles.YValue.String = data.YValue{pos};

% update color text boxes
handles.redText.String = data.redText{pos};
handles.greenText.String = data.greenText{pos};
handles.blueText.String = data.blueText{pos};
handles.whiteText.String = data.whiteText{pos};

% update color sliders
handles.redSlider.Value = data.redSlider{pos};
handles.greenSlider.Value = data.greenSlider{pos};
handles.blueSlider.Value = data.blueSlider{pos};
handles.whiteSlider.Value = data.whiteSlider{pos};

% update plots
redrawCIE(handles, handles.xSlider.Value, handles.ySlider.Value)

% --- Executes during object creation, after setting all properties.
function saveColorListbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to saveColorListbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function saveColorText_Callback(hObject, eventdata, handles)
% hObject    handle to saveColorText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of saveColorText as text
%        str2double(get(hObject,'String')) returns contents of saveColorText as a double


% --- Executes during object creation, after setting all properties.
function saveColorText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to saveColorText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveColorButton.
function saveColorButton_Callback(hObject, eventdata, handles)
% hObject    handle to saveColorButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% add color name to String of Listbox
pos = size(handles.saveColorListbox.String, 1) + 1;
handles.saveColorListbox.String{pos} = handles.saveColorText.String;

% SAVE color data to UserData
% update x and y sliders and text boxes
handles.saveColorListbox.UserData.xValue{pos} = handles.xValue.String;
handles.saveColorListbox.UserData.yValue{pos} = handles.yValue.String;
handles.saveColorListbox.UserData.xSlider{pos} = handles.xSlider.Value;
handles.saveColorListbox.UserData.ySlider{pos} = handles.ySlider.Value;
handles.saveColorListbox.UserData.YValue{pos} = handles.YValue.String;

% update color text boxes
handles.saveColorListbox.UserData.redText{pos} = handles.redText.String;
handles.saveColorListbox.UserData.greenText{pos} = handles.greenText.String;
handles.saveColorListbox.UserData.blueText{pos} = handles.blueText.String;
handles.saveColorListbox.UserData.whiteText{pos} = handles.whiteText.String;

% update color sliders
handles.saveColorListbox.UserData.redSlider{pos} = handles.redSlider.Value;
handles.saveColorListbox.UserData.greenSlider{pos} = handles.greenSlider.Value;
handles.saveColorListbox.UserData.blueSlider{pos} = handles.blueSlider.Value;
handles.saveColorListbox.UserData.whiteSlider{pos} = handles.whiteSlider.Value;

% --- Executes on button press in deleteColorButton.
function deleteColorButton_Callback(hObject, eventdata, handles)
% hObject    handle to deleteColorButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% read data
%newString = handles.saveColorListbox.String;
pos = handles.saveColorListbox.Value;

% changes position of Listbox to prevent an out-of-bounds error
if handles.saveColorListbox.Value > 1
    handles.saveColorListbox.Value = handles.saveColorListbox.Value - 1;
end

% change list view
handles.saveColorListbox.String(pos) = [];

% change x and y sliders and text boxes
handles.saveColorListbox.UserData.xValue(pos) = [];
handles.saveColorListbox.UserData.yValue(pos) = [];
handles.saveColorListbox.UserData.xSlider(pos) = [];
handles.saveColorListbox.UserData.ySlider(pos) = [];
handles.saveColorListbox.UserData.YValue(pos) = [];

% change color text boxes
handles.saveColorListbox.UserData.redText(pos) = [];
handles.saveColorListbox.UserData.greenText(pos) = [];
handles.saveColorListbox.UserData.blueText(pos) = [];
handles.saveColorListbox.UserData.whiteText(pos) = [];

% change color sliders
handles.saveColorListbox.UserData.redSlider(pos) = [];
handles.saveColorListbox.UserData.greenSlider(pos) = [];
handles.saveColorListbox.UserData.blueSlider(pos) = [];
handles.saveColorListbox.UserData.whiteSlider(pos) = [];


% --- Executes on button press in capResistanceButton.
function capResistanceButton_Callback(hObject, eventdata, handles)
% hObject    handle to capResistanceButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of capResistanceButton
clc
if hObject.Value == 0
    disp(hObject.Value)
    handles.capResistanceText.String = 'Resistance is not capped';
    handles.capResistanceText.FontWeight = 'normal';
elseif hObject.Value == 1
    disp(hObject.Value)
    handles.capResistanceText.String = 'Resistance is capped at 1000 ohms';
    handles.capResistanceText.FontWeight = 'bold';
end
