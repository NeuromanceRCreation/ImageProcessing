%Title: GUI control elements used in Matlab.
%Develope By: Rabi Raj Khadka
%Date: 30/02/2074
%-------------------------------------------------------------------
function varargout = labfour(varargin)
% LABFOUR MATLAB code for labfour.fig
%      LABFOUR, by itself, creates a new LABFOUR or raises the existing
%      singleton*.
%
%      H = LABFOUR returns the handle to a new LABFOUR or the handle to
%      the existing singleton*.
%
%      LABFOUR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LABFOUR.M with the given input arguments.
%
%      LABFOUR('Property','Value',...) creates a new LABFOUR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before labfour_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to labfour_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help labfour

% Last Modified by GUIDE v2.5 20-Jun-2017 02:43:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @labfour_OpeningFcn, ...
                   'gui_OutputFcn',  @labfour_OutputFcn, ...
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


% --- Executes just before labfour is made visible.
function labfour_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to labfour (see VARARGIN)

% Choose default command line output for labfour
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes labfour wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = labfour_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

selectedvalue=get(handles.btngroupfaculty,'SelectedObject');
val=get(selectedvalue,'String');
set(handles.selectedvaluestring,'String',val);

%satellite=get(handles.chckbxsatellite,'Value');
%opticalfibre=get(handles.chckbxopticalfibre,'Value');
%antenna=get(handles.chckbxantenna,'Value');
%filterdesign=get(handles.chckbxfilterdesign,'Value');
%dsa=get(handles.chckbxdsa,'Value');
%isd=get(handles.chckbxisd,'Value');
%ippr=get(handles.chckbxippr,'Value');
%cod=get(handles.chckbxcod,'Value');

switch val
    case 'Electronics' 
        
        set(handles.chckbxdsa,'Enable','Off');
        set(handles.chckbxisd,'Enable','Off');
        set(handles.chckbxippr,'Enable','Off');
        set(handles.chckbxcod,'Enable','Off');
        set(handles.chckbxdsa,'Value',0);
        set(handles.chckbxisd,'Value',0);
        set(handles.chckbxippr,'Value',0);
        set(handles.chckbxcod,'Value',0);
        
        set(handles.chckbxfilterdesign,'Enable','On');
        set(handles.chckbxantenna,'Enable','On');
        set(handles.chckbxopticalfibre,'Enable','On');
        set(handles.chckbxsatellite,'Enable','On');
    case 'Computer'
        set(handles.chckbxdsa,'Enable','On');
        set(handles.chckbxisd,'Enable','On');
        set(handles.chckbxippr,'Enable','On');
        set(handles.chckbxcod,'Enable','On');
        
        
        set(handles.chckbxfilterdesign,'Enable','Off');
        set(handles.chckbxantenna,'Enable','Off');
        set(handles.chckbxopticalfibre,'Enable','Off');
        set(handles.chckbxsatellite,'Enable','Off');
        set(handles.chckbxsatellite,'Value',0);
        set(handles.chckbxopticalfibre,'Value',0);
        set(handles.chckbxantenna,'Value',0);
        set(handles.chckbxfilterdesign,'Value',0);
end








% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in chckbxdsa.
function chckbxdsa_Callback(hObject, eventdata, handles)
% hObject    handle to chckbxdsa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chckbxdsa


% --- Executes on button press in chckbxisd.
function chckbxisd_Callback(hObject, eventdata, handles)
% hObject    handle to chckbxisd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chckbxisd


% --- Executes on button press in chckbxippr.
function chckbxippr_Callback(hObject, eventdata, handles)
% hObject    handle to chckbxippr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chckbxippr


% --- Executes on button press in chckbxcod.
function chckbxcod_Callback(hObject, eventdata, handles)
% hObject    handle to chckbxcod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chckbxcod


% --- Executes on button press in chckbxsatellite.
function chckbxsatellite_Callback(hObject, eventdata, handles)
% hObject    handle to chckbxsatellite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chckbxsatellite


% --- Executes on button press in chckbxopticalfibre.
function chckbxopticalfibre_Callback(hObject, eventdata, handles)
% hObject    handle to chckbxopticalfibre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chckbxopticalfibre


% --- Executes on button press in chckbxantenna.
function chckbxantenna_Callback(hObject, eventdata, handles)
% hObject    handle to chckbxantenna (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chckbxantenna


% --- Executes on button press in chckbxfilterdesign.
function chckbxfilterdesign_Callback(hObject, eventdata, handles)
% hObject    handle to chckbxfilterdesign (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chckbxfilterdesign


% --- Executes when selected object is changed in btngroupfaculty.
function btngroupfaculty_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in btngroupfaculty 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectedvalue=get(handles.btngroupfaculty,'SelectedObject');
val=get(selectedvalue,'String');
set(handles.selectedvaluestring,'String',val);

switch val
    case 'Electronics' 
        
        set(handles.chckbxdsa,'Enable','Off');
        set(handles.chckbxisd,'Enable','Off');
        set(handles.chckbxippr,'Enable','Off');
        set(handles.chckbxcod,'Enable','Off');
        set(handles.chckbxdsa,'Value',0);
        set(handles.chckbxisd,'Value',0);
        set(handles.chckbxippr,'Value',0);
        set(handles.chckbxcod,'Value',0);
        
        set(handles.chckbxfilterdesign,'Enable','On');
        set(handles.chckbxantenna,'Enable','On');
        set(handles.chckbxopticalfibre,'Enable','On');
        set(handles.chckbxsatellite,'Enable','On');
    case 'Computer'
        set(handles.chckbxdsa,'Enable','On');
        set(handles.chckbxisd,'Enable','On');
        set(handles.chckbxippr,'Enable','On');
        set(handles.chckbxcod,'Enable','On');
        
        set(handles.chckbxfilterdesign,'Enable','Off');
        set(handles.chckbxantenna,'Enable','Off');
        set(handles.chckbxopticalfibre,'Enable','Off');
        set(handles.chckbxsatellite,'Enable','Off');
        set(handles.chckbxsatellite,'Value',0);
        set(handles.chckbxopticalfibre,'Value',0);
        set(handles.chckbxantenna,'Value',0);
        set(handles.chckbxfilterdesign,'Value',0);
end
