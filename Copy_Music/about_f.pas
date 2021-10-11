unit about_f;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellApi;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    lbl_MAIL: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure lbl_MAILClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.lbl_MAILClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'mailto:soft205@mail.ru', nil, nil, SW_SHOW);
end;

end.
 
