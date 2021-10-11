program CopyMusic;

uses
  Forms,
  main in 'main.pas' {MainForm},
  copy_f in 'copy_f.pas' {Copy_Form},
  about_f in 'about_f.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Копирование музыки';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TCopy_Form, Copy_Form);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
