unit BatteryPowerStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, main, ComCtrls;

type
  TBatteryForm = class(TForm)
    BatStatus: TLabel;
    Button1: TButton;
    ProgressBar: TProgressBar;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BatteryForm: TBatteryForm;

implementation

{$R *.dfm}

// Get battery power on laptops
function BatteryPower: string;
var
  SysPowerStatus: TSystemPowerStatus;
begin
  GetSystemPowerStatus(SysPowerStatus);
  result:=Format('%d', [SysPowerStatus.BatteryLifePercent]);
end;

procedure TBatteryForm.FormActivate(Sender: TObject);
var
  battery: integer;
begin
  Battery:=StrToInT(BatteryPower);

  BatStatus.Caption:='Batteri tilbage: '+IntToStr(Battery)+'%';
  ProgressBar.Position:=battery;
end;

procedure TBatteryForm.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
