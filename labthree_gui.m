function varargout = labthree_gui(varargin)
% LABTHREE_GUI MATLAB code for labthree_gui.fig
%      LABTHREE_GUI, by itself, creates a new LABTHREE_GUI or raises the existing
%      singleton*.
%
%      H = LABTHREE_GUI returns the handle to a new LABTHREE_GUI or the handle to
%      the existing singleton*.
%
%      LABTHREE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LABTHREE_GUI.M with the given input arguments.
%
%      LABTHREE_GUI('Property','Value',...) creates a new LABTHREE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before labthree_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to labthree_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help labthree_gui

% Last Modified by GUIDE v2.5 12-Jun-2017 18:48:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @labthree_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @labthree_gui_OutputFcn, ...
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


% --- Executes just before labthree_gui is made visible.
function labthree_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to labthree_gui (see VARARGIN)

% Choose default command line output for labthree_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes labthree_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = labthree_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orgim img2
[path, user_cancel]=imgetfile();
if user_cancel
    msgbox(sprintf('Error Occured'),'Error','Error');
    return;
end
orgim=imread(path);
orgim=im2double(orgim);
img2=orgim;
global activewindow
activewindow = orgim;
set(handles.brightnesslevel,'String','0');
set(handles.brightness_control,'Value',1);
axes(handles.opwindow);
imshow(orgim);


% --- Executes on button press in bw.
function bw_Callback(hObject, eventdata, handles)
% hObject    handle to bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orgim
img_bw=im2bw(orgim);
global activewindow
activewindow=img_bw;
set(handles.brightnesslevel,'String','0');
set(handles.brightness_control,'Value',1);
axes(handles.opwindow);
imshow(img_bw);


% --- Executes on button press in negative.
function negative_Callback(hObject, eventdata, handles)
% hObject    handle to negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orgim
img_negative=1-orgim;
axes(handles.opwindow);
global activewindow
activewindow=img_negative;
set(handles.brightnesslevel,'String','0');
set(handles.brightness_control,'Value',1);
axes(handles.opwindow);
imshow(img_negative);


% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global orgim
img_grayscale=rgb2gray(orgim);
global activewindow
activewindow=img_grayscale;
set(handles.brightnesslevel,'String','0');
set(handles.brightness_control,'Value',1);
axes(handles.opwindow);
imshow(img_grayscale);


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img2
global activewindow
activewindow=img2;
set(handles.brightnesslevel,'String','0');
set(handles.brightness_control,'Value',1);
axes(handles.opwindow);
imshow(img2);


% --- Executes on slider movement.
function brightness_control_Callback(hObject, eventdata, handles)
% hObject    handle to brightness_control (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global activewindow
val=get(hObject,'Value')-1;
set(handles.brightnesslevel,'String',num2str(val));
imbright= activewindow+val;
axes(handles.opwindow);
imshow(imbright);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function brightness_control_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightness_control (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
