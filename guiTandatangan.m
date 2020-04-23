function varargout = guiTandatangan(varargin)
% GUITANDATANGAN M-file for guiTandatangan.fig
%      GUITANDATANGAN, by itself, creates a new GUITANDATANGAN or raises the existing
%      singleton*.
%
%      H = GUITANDATANGAN returns the handle to a new GUITANDATANGAN or the handle to
%      the existing singleton*.
%
%      GUITANDATANGAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUITANDATANGAN.M with the given input arguments.
%
%      GUITANDATANGAN('Property','Value',...) creates a new GUITANDATANGAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiTandatangan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiTandatangan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiTandatangan

% Last Modified by GUIDE v2.5 23-Apr-2020 07:42:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiTandatangan_OpeningFcn, ...
                   'gui_OutputFcn',  @guiTandatangan_OutputFcn, ...
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


% --- Executes just before guiTandatangan is made visible.
function guiTandatangan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiTandatangan (see VARARGIN)

% Choose default command line output for guiTandatangan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiTandatangan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiTandatangan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ttd.
function ttd_Callback(hObject, eventdata, handles)
% hObject    handle to ttd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nama = get(handles.edtNama,'string');
jml = str2num(get(handles.edtJumlah,'string'));
batas = str2num(get(handles.edtBatas,'string'));
putar = str2num(get(handles.edtRotate,'string'));
for k = 1: jml
%     f =msgbox(strcat('tanda tangan',num2str(k)))
    [filename, pathname] = uigetfile({'*.jpg';'*.jpeg';'*.*'},'Select the Matlab')
    lokasi = strcat(pathname,filename);
    s2 = imread(lokasi);
    axes(handles.axes3)
    cs = imrotate(s2,putar);
    image(cs)
    axes(handles.axes3)
    b = imcrop(cs);
    c = imresize(b,[100 200]);
    dd(:,:,:,k) = c;
    axes(handles.axes1)
    imaqmontage(dd)
    cg = rgb2gray(c);
    cb = im2bw(cg,batas);
    cb1= 1-cb;
    axes(handles.axes2)
    imshow(cb1)
    data(:,k) = cb1(:)';
end
save(strcat(nama,'.mat'),'data')

function edtJumlah_Callback(hObject, eventdata, handles)
% hObject    handle to edtJumlah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtJumlah as text
%        str2double(get(hObject,'String')) returns contents of edtJumlah as a double


% --- Executes during object creation, after setting all properties.
function edtJumlah_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtJumlah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);



function edtBatas_Callback(hObject, eventdata, handles)
% hObject    handle to edtBatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtBatas as text
%        str2double(get(hObject,'String')) returns contents of edtBatas as a double


% --- Executes during object creation, after setting all properties.
function edtBatas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtBatas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtRotate_Callback(hObject, eventdata, handles)
% hObject    handle to edtRotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtRotate as text
%        str2double(get(hObject,'String')) returns contents of edtRotate as a double


% --- Executes during object creation, after setting all properties.
function edtRotate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtRotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edtNama_Callback(hObject, eventdata, handles)
% hObject    handle to edtNama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtNama as text
%        str2double(get(hObject,'String')) returns contents of edtNama as a double


% --- Executes during object creation, after setting all properties.
function edtNama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtNama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
