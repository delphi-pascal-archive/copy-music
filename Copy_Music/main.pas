unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, XPMan, StdCtrls, Menus, ImgList, ShellAPI, Buttons,
  ShlObj, IniFiles;

type
  TMainForm = class(TForm)
    XP: TXPManifest;
    sts_BAR: TStatusBar;
    g_box: TGroupBox;
    MainMenu: TMainMenu;
    mnu_FILE: TMenuItem;
    mnu_HELP: TMenuItem;
    mnu_HELP_ME: TMenuItem;
    mnu_3: TMenuItem;
    mnu_ABOUT: TMenuItem;
    mnu_OPEN_FILE: TMenuItem;
    mnu_FOLDER_COPY: TMenuItem;
    mnu_1: TMenuItem;
    mnu_COPY: TMenuItem;
    mnu_2: TMenuItem;
    mnu_EXIT: TMenuItem;
    img_LIST: TImageList;
    Open_PLAY_LIST: TOpenDialog;
    Label1: TLabel;
    txt_PLAY_LIST: TEdit;
    Label2: TLabel;
    txt_FOLDER_COPY: TEdit;
    bt_PLAY_LIST: TSpeedButton;
    bt_FOLDER_COPY: TSpeedButton;
    bt_EXIT_: TButton;
    bt_COPY_: TButton;
    procedure PROVERKA ;
    procedure GetNamePlayListM3U (FileName: string);
    procedure GetNamePlayListPLS (FileName: string);
    procedure CopyFileWithProgress(Source, Destination: string);
    procedure mnu_EXITClick(Sender: TObject);
    procedure bt_PLAY_LISTClick(Sender: TObject);
    procedure mnu_OPEN_FILEClick(Sender: TObject);
    procedure mnu_FOLDER_COPYClick(Sender: TObject);
    procedure bt_EXIT_Click(Sender: TObject);
    procedure mnu_COPYClick(Sender: TObject);
    procedure txt_PLAY_LISTChange(Sender: TObject);
    procedure txt_FOLDER_COPYChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bt_FOLDER_COPYClick(Sender: TObject);
    procedure bt_COPY_Click(Sender: TObject);
    procedure mnu_ABOUTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    STOPED_COPY : Boolean;
  end;

var
  MainForm: TMainForm;
  PLAY_LIST: TStringList;
  INI: TIniFile;

implementation

uses copy_f, about_f;

{$R *.dfm}

procedure TMainForm.CopyFileWithProgress(Source, Destination: string);
var 
  FromF, ToF: file of byte; 
  Buffer: array[0..4096] of char; 
  NumRead: integer;
  FileLength: longint;
begin
  AssignFile(FromF, Source);
  reset(FromF);
  AssignFile(ToF, Destination);
  rewrite(ToF);
  FileLength := FileSize(FromF);
  Copy_Form.lbl_name.Caption := ExtractFileName(Source);
  with Copy_Form.pb_TEK do
  begin
    MinValue  := 0;
    MaxValue  := FileLength;
    while FileLength > 0 do
    begin
      BlockRead(FromF, Buffer[0], SizeOf(Buffer), NumRead);
      FileLength := FileLength - NumRead;
      BlockWrite(ToF, Buffer[0], NumRead);
      MinValue := MinValue + 1;
      Application.ProcessMessages;
      Progress := Progress + NumRead; 
    end; 
    CloseFile(FromF); 
    CloseFile(ToF); 
  end; 
end;

procedure TMainForm.PROVERKA ;
begin
  if (Length(txt_PLAY_LIST.Text)=0) or (Length(txt_FOLDER_COPY.Text)=0) then
  begin
     bt_COPY_.Enabled := False;
     mnu_COPY.Enabled := False;
  end
  else
  begin
     bt_COPY_.Enabled := True;
     mnu_COPY.Enabled := True;
  end;
end;

procedure TMainForm.GetNamePlayListM3U (FileName: string);  // получение списка из плей-листа
var
  ts : TStrings;
  i  : integer;
begin
  ts := TStringList.Create;
  ts.LoadFromFile(FileName);
  PLAY_LIST.Clear ;
  for i:=0 to ts.Count-1 do
  begin
    if copy (ts.Strings [i],0,1) <> '#' then
    begin
      Application.ProcessMessages ;
      if FileExists (ts.Strings [i]) then
      begin
        PLAY_LIST.Add(ts.Strings [i]);
      end;
    end;
  end;
  sts_BAR.Panels [0].Text := 'Найдено файлов: ' + IntToStr(PLAY_LIST.Count);
  ts.Free ;
end;

procedure TMainForm.GetNamePlayListPLS (FileName: string);  // получение списка из плей-листа
var
  i  : integer;
  kol : integer;
begin
  INI := TIniFile.Create(FileName);
  kol := INI.ReadInteger('playlist','NumberOfEntries',0);
  PLAY_LIST.Clear ;
  for i:=1 to kol do
  begin
    PLAY_LIST.Add(INI.ReadString('playlist','File'+IntToStr(i),''));
  end;
  sts_BAR.Panels [0].Text := 'Найдено файлов: ' + IntToStr(PLAY_LIST.Count);
  INI.Free ;
end;

procedure TMainForm.mnu_EXITClick(Sender: TObject);
begin
  bt_EXIT_.Click ;
end;

procedure TMainForm.bt_PLAY_LISTClick(Sender: TObject);
begin
  if Open_PLAY_LIST.Execute then
  begin
    txt_PLAY_LIST.Text := Open_PLAY_LIST.FileName ;
    case Open_PLAY_LIST.FilterIndex of
      1: GetNamePlayListM3U (Open_PLAY_LIST.FileName);
      2: GetNamePlayListPLS (Open_PLAY_LIST.FileName);
    else ;
  end;
  end;
end;

procedure TMainForm.mnu_OPEN_FILEClick(Sender: TObject);
begin
  bt_PLAY_LIST.Click ;
end;

procedure TMainForm.mnu_FOLDER_COPYClick(Sender: TObject);
begin
  bt_FOLDER_COPY.Click ;
end;

procedure TMainForm.bt_EXIT_Click(Sender: TObject);
begin
  Application.Terminate ;
end;

procedure TMainForm.mnu_COPYClick(Sender: TObject);
begin
  bt_COPY_.Click ;
end;

procedure TMainForm.txt_PLAY_LISTChange(Sender: TObject);
begin
  PROVERKA;
end;

procedure TMainForm.txt_FOLDER_COPYChange(Sender: TObject);
begin
  PROVERKA;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  PLAY_LIST := TStringList.Create ;
  STOPED_COPY := False;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  PLAY_LIST.Free ;
end;

procedure TMainForm.bt_FOLDER_COPYClick(Sender: TObject);
var
  TitleName : string;
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath : array[0..MAX_PATH] of char;
begin
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  BrowseInfo.hwndOwner := MainForm.Handle;
  BrowseInfo.pszDisplayName := @DisplayName;
  TitleName := 'Выберите каталог для копирования ...';
  BrowseInfo.lpszTitle := PChar(TitleName);
  BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS + BIF_NEWDIALOGSTYLE;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  if lpItemId <> nil then
  begin
    SHGetPathFromIDList(lpItemID, TempPath);
    txt_FOLDER_COPY.Text := TempPath;
    GlobalFreePtr(lpItemID);
  end;
end;

procedure TMainForm.bt_COPY_Click(Sender: TObject);
var
  i : integer;
begin
  MainForm.Hide ;
  Copy_Form.Show ;
  Copy_Form.pb_TOTAL.MinValue := 0;
  Copy_Form.pb_TOTAL.Progress := 0;
  Copy_Form.pb_TOTAL.MaxValue := PLAY_LIST.Count ;
  STOPED_COPY := False;

  for i := 0 to PLAY_LIST.Count - 1 do
  begin
    if STOPED_COPY then
    begin
        Application.MessageBox('Копирование файлов отменено ...', '', 0);
        Copy_Form.Close ;
        MainForm.Show ;
        Exit;
    end
    else
    begin
      Copy_Form.pb_TEK.Progress := 0;
      CopyFileWithProgress(PLAY_LIST.Strings [i], txt_FOLDER_COPY.Text +
                              '\' + ExtractFileName (PLAY_LIST.Strings [i]));
      Copy_Form.pb_TOTAL.Progress := Copy_Form.pb_TOTAL.Progress + 1;
      Application.ProcessMessages ;
      Copy_Form.Update ;
    end;
  end;
  Application.MessageBox('Копирование файлов завершено ...', '', 0);
  MainForm.Show ;
end;

procedure TMainForm.mnu_ABOUTClick(Sender: TObject);
begin
  AboutBox.ShowModal ; 
end;

end.
