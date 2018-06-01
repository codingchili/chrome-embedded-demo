program DemoSPA;

uses
  Vcl.Forms,
  WinApi.Windows,
  uCEFApplication,
  Main in 'Main.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

{$SetPEFlags IMAGE_FILE_LARGE_ADDRESS_AWARE}

begin
GlobalCEFApp := TCefApplication.Create;
GlobalCEFApp.FlashEnabled := False;

  if GlobalCEFApp.StartMainProcess then
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      TStyleManager.TrySetStyle('Amakrits');
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
    end;
  GlobalCEFApp.Free;
end.
