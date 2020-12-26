unit GenstartProgram;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, main;

type
  TRestartProg = class(TForm)
    GenstartNuBtn: TButton;
    AnnullerBtn: TButton;
    Label1: TLabel;
    Billede: TImage;
    Label2: TLabel;
    TidLabel: TLabel;
    TidTilbage: TLabel;
    Restarttimer: TTimer;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure AnnullerBtnClick(Sender: TObject);
    procedure RestarttimerTimer(Sender: TObject);
    procedure GenstartNuBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RestartProg: TRestartProg;
  Tid: integer=10;

implementation

{$R *.dfm}

procedure RestartApp;
var
  FullAppPath: PAnsiChar;
begin
  FullAppPath:=PAnsiChar(Application.ExeName);
  Application.MainForm.Hide;
  WinExec(FullAppPath, SW_SHOW);
  Application.Terminate;
end;

procedure TRestartProg.AnnullerBtnClick(Sender: TObject);
begin
  RestartTimer.Enabled:=false;
  Close;
end;

procedure TRestartProg.RestarttimerTimer(Sender: TObject);
begin
  if Tid=0 then
    begin
      Restarttimer.Enabled:=False;
      RestartApp;
    end;

  tid:=tid-1;
  TidTilbage.Caption:=IntToStr(Tid);
end;

procedure TRestartProg.GenstartNuBtnClick(Sender: TObject);
begin
  Restarttimer.Enabled:=False;
  RestartApp;
end;

procedure TRestartProg.FormCreate(Sender: TObject);
begin
  AlphablendValue:=Main.Trans;
end;

procedure TRestartProg.FormShow(Sender: TObject);
begin
  RestartTimer.Enabled:=true;
end;

end.
