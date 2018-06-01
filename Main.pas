unit Main;

{$I cef.inc}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCEFWindowParent, uCEFChromiumWindow,
  Vcl.ExtCtrls, uCEFChromium, uCEFTypes, uCEFInterfaces;

type
  TMainForm = class(TForm)
    Chromium: TChromiumWindow;
    Init: TTimer;
    procedure InitTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    // You have to handle this two messages to call NotifyMoveOrResizeStarted or some page elements will be misaligned.
    procedure WMMove(var aMessage : TWMMove); message WM_MOVE;
    procedure WMMoving(var aMessage : TMessage); message WM_MOVING;
    // You also have to handle these two messages to set GlobalCEFApp.OsmodalLoop
    procedure WMEnterMenuLoop(var aMessage: TMessage); message WM_ENTERMENULOOP;
    procedure WMExitMenuLoop(var aMessage: TMessage); message WM_EXITMENULOOP;
  public
    { Public declarations }
  end;


var
  MainForm: TMainForm;

implementation

uses
  uCEFApplication;

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  if not(Chromium.CreateBrowser) then Init.Enabled := True;
end;

procedure TMainForm.InitTimer(Sender: TObject);
begin
              Init.Enabled := False;
  if not(Chromium.CreateBrowser) and not(Chromium.Initialized) then
    Init.Enabled := True;
    Chromium.loadURL('https://www.flashcardsalligator.com');
end;

    procedure TMainForm.WMMove(var aMessage : TWMMove);
begin
  inherited;
  if (Chromium <> nil) then Chromium.NotifyMoveOrResizeStarted;
end;

procedure TMainForm.WMMoving(var aMessage : TMessage);
begin
  inherited;

  if (Chromium <> nil) then Chromium.NotifyMoveOrResizeStarted;
end;

procedure TMainForm.WMEnterMenuLoop(var aMessage: TMessage);
begin
  inherited;

  if (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then GlobalCEFApp.OsmodalLoop := True;
end;

procedure TMainForm.WMExitMenuLoop(var aMessage: TMessage);
begin
  inherited;

  if (aMessage.wParam = 0) and (GlobalCEFApp <> nil) then GlobalCEFApp.OsmodalLoop := False;
end;

end.
