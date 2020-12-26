unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TSplashForm = class(TForm)
    LoadingLabel: TLabel;
    Logo: TImage;
    CloseTimer: TTimer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CloseTimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.dfm}


// Fortæller vinduet hvornår det må lukke.
procedure TSplashForm.FormActivate(Sender: TObject);
begin
ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TSplashForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canclose:= not CloseTimer.Enabled;
end;

// Stopper timeren.
procedure TSplashForm.CloseTimerTimer(Sender: TObject);
begin
  CloseTimer.Enabled:=false;
end;

end.
