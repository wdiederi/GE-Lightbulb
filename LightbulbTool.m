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

% Last Modified by GUIDE v2.5 25-Apr-2017 20:21:53

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


GElightbulbF(handles);


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
        handles.redSlider.Value = 46.8667;
        handles.greenSlider.Value = 9.9533;
        handles.blueSlider.Value = 36.5713;
        handles.whiteSlider.Value = 23.724;
        handles.redText.String = 46.86;
        handles.greenText.String = 9.95;
        handles.blueText.String = 36.57;
        handles.whiteText.String = 23.72;
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
handles.redSlider.Value = resRstr;
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
handles.greenSlider.Value = resGstr;
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
handles.whiteSlider.Value = resWstr;
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
handles.blueSlider.Value = resBstr;
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
