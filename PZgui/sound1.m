function varargout = sound1(varargin)
% SOUND1 MATLAB code for sound1.fig
%      SOUND1, by itself, creates a new SOUND1 or raises the existing
%      singleton*.
%
%      H = SOUND1 returns the handle to a new SOUND1 or the handle to
%      the existing singleton*.
%
%      SOUND1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOUND1.M with the given input arguments.
%
%      SOUND1('Property','Value',...) creates a new SOUND1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sound1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sound1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sound1

% Last Modified by GUIDE v2.5 15-Mar-2018 21:08:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sound1_OpeningFcn, ...
                   'gui_OutputFcn',  @sound1_OutputFcn, ...
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


% --- Executes just before sound1 is made visible.
function sound1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sound1 (see VARARGIN)

% Choose default command line output for sound1
handles.output = hObject;

set(handles.sound,'Enable','off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sound1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sound1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in sound.
function sound_Callback(hObject, eventdata, handles)
% hObject    handle to sound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
flag = get(handles.sound,'Value');
 while (flag)
set(handles.Filter,'Enable','off');
recorder = audiorecorder(44100,16,1);
set(handles.sound,'string','Stop...');
record(recorder);
pause(.07);
myRecording = getaudiodata(recorder);

%filter voice
b = getappdata(0,'num_g')
a = getappdata(0,'den_g')
myRecording_filtered = filter(b,a,myRecording);
%plot voice
axes(handles.axes4);
plot (myRecording)
%plot voice after filter 
axes(handles.axes2)
plot(myRecording_filtered);

flag = get(handles.sound,'value');
if flag==0
    set(handles.Filter,'Enable','on');
    set(handles.sound,'string','Start...');
end
end


% --- Executes on button press in Filter.
function Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 unit_circle
set(handles.sound,'Enable','on');