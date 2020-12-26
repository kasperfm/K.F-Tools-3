unit Uptime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, main, ExtCtrls;

type
  TUptimeForm = class(TForm)
    Label1: TLabel;
    TimeLabel: TLabel;
    OkBtn: TButton;
    UptimeUpdateTimer: TTimer;
    procedure OkBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UptimeUpdateTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UptimeForm: TUptimeForm;

implementation

{$R *.dfm}

// Viser hvor lang tid computeren har været tændt.
function GetUptime: PWideChar;
const
  ticksperday: integer = 1000 * 60 * 60 * 24;
  ticksperhour: integer = 1000 * 60 * 60;
  ticksperminute: integer = 1000 * 60;
var
  t: longword;
  d, h, m: integer;
begin
  t := GetTickCount64;
  d := t div ticksperday;
  dec(t, d * ticksperday);
  h := t div ticksperhour;
  dec(t, h * ticksperhour);
  m := t div ticksperminute;
  dec(t, m * ticksperminute);
  Result := PWideChar(IntToStr(d)+' Dage '+IntToStr(h)+' Timer '+IntToStr(m)+' Minutter');
end;


procedure TUptimeForm.OkBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TUptimeForm.FormShow(Sender: TObject);
begin
  TimeLabel.Caption:=GetUptime;
end;

procedure TUptimeForm.FormActivate(Sender: TObject);
begin
  TimeLabel.Caption:=GetUptime;
end;

procedure TUptimeForm.UptimeUpdateTimerTimer(Sender: TObject);
begin
  TimeLabel.Caption:=GetUptime;
end;

end.
