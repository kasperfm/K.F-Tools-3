unit TimedShutdown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, main, Spin;

type
  TTimedShutdownForm = class(TForm)
    Timer1: TTimer;
    StartBtn: TBitBtn;
    StopBtn: TBitBtn;
    UrLabel: TLabel;
    Timer2: TTimer;
    Ur: TLabel;
    Status: TLabel;
    HandlingsType: TComboBox;
    Label1: TLabel;
    Timer: TSpinEdit;
    Min: TSpinEdit;
    TimerLabel: TLabel;
    Label3: TLabel;
    procedure Timer2Timer(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TimedShutdownForm: TTimedShutdownForm;

implementation

{$R *.dfm}

procedure TTimedShutdownForm.Timer2Timer(Sender: TObject);
begin
  Ur.Caption:=TimeToStr(GetTime);
end;

procedure TTimedShutdownForm.StartBtnClick(Sender: TObject);
begin
  Timer1.Enabled:=True;
  Status.Caption:='Tæller startet!';
end;

procedure TTimedShutdownForm.StopBtnClick(Sender: TObject);
begin
  Timer1.Enabled:=False;
  Status.Caption:='Tæller stoppet!';
end;

procedure TTimedShutdownForm.Timer1Timer(Sender: TObject);
var
  Tidspunkt: string;
begin
  Tidspunkt:=Timer.Text+':'+Min.Text+':'+'00';
  If Tidspunkt=TimeToStr(GetTime) then
    begin
      Timer1.Enabled:=false;

      if HandlingsType.ItemIndex=0 then
        begin
          Shutdown.ActionType:=aatShutdown;
          Shutdown.Execute;
        end;

      if HandlingsType.ItemIndex=1 then
        begin
          Shutdown.ActionType:=aatReboot;
          Shutdown.Execute;
        end;

      if HandlingsType.ItemIndex=2 then
        begin
          Shutdown.ActionType:=aatLogOff;
          Shutdown.Execute;
        end;

      if HandlingsType.ItemIndex=3 then
        begin
          Shutdown.ActionType:=aatSuspend;
          Shutdown.Execute;
        end;

      if HandlingsType.ItemIndex=4 then
        begin
          Shutdown.ActionType:=aatHibernate;
          Shutdown.Execute;
        end;
    end;

end;

// Indstiller AlphaBlend.
procedure TTimedShutdownForm.FormCreate(Sender: TObject);
begin
  AlphaBlendValue:=Main.Trans;
end;

end.
