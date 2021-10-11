unit copy_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Gauges;

type
  TCopy_Form = class(TForm)
    lbl_TEK: TLabel;
    lbl_ALL: TLabel;
    bt_CANCEL: TButton;
    pb_TEK: TGauge;
    pb_TOTAL: TGauge;
    lbl_name: TLabel;
    procedure bt_CANCELClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Copy_Form: TCopy_Form;

implementation

uses main;

{$R *.dfm}

procedure TCopy_Form.bt_CANCELClick(Sender: TObject);
begin
  MainForm.STOPED_COPY := True;
  Close;
end;

procedure TCopy_Form.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then bt_CANCEL.Click ;
end;

end.
