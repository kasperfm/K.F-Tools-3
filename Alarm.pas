unit Alarm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, main, MPlayer, Spin, IniFiles, DateUtils;

type
  TAlarmForm = class(TForm)
    Klokken: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Taeller: TTimer;
    Ur: TTimer;
    MediaPlayer1: TMediaPlayer;
    Timer: TSpinEdit;
    Min: TSpinEdit;
    GroupBox1: TGroupBox;
    LydStiEdit: TEdit;
    LydBtn: TButton;
    OpenDialog: TOpenDialog;
    Besked: TEdit;
    StopPlayBtn: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    procedure UrTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TaellerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure LydBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerChange(Sender: TObject);
    procedure MinChange(Sender: TObject);
    procedure StopPlayBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlarmForm: TAlarmForm;
  Tidspunkt: string;

  ConfigFile: TINIFile;
  PathToINIFile: String;
  LydFil: string;
  AlarmOn: boolean;

implementation

{$R *.dfm}

// Opdatere label'en med uret.
procedure TAlarmForm.UrTimer(Sender: TObject);
begin
  Klokken.Caption:='Klokken er nu: '+TimeToStr(GetTime);
end;

// Aktivere timeren.
procedure TAlarmForm.BitBtn1Click(Sender: TObject);
begin
  Taeller.Enabled:=true;
end;

// Selve alarm funktionen. Den laver først 3 bip,
// og så vises beskeden.
procedure TAlarmForm.TaellerTimer(Sender: TObject);
begin
  Tidspunkt:=Timer.Text+':'+Min.Text+':'+'00';
  if Tidspunkt=TimeToStr(GetTime) then
    begin
      Taeller.Enabled:=false;
      MediaPlayer1.FileName:=LydFil;
      MediaPlayer1.Open;
      MediaPlayer1.Play;
      ShowMessage(Besked.Text);
    end;
end;

// Læser variabler fra MainForm og config fil.
procedure TAlarmForm.FormCreate(Sender: TObject);
begin
  AlphaBlendValue:=Main.Trans;
  PathToINIFile:=IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)))+Main.ConfFil;
  ConfigFile:=TINIFile.Create(PathToINIFile);

  LydFil:=ConfigFile.ReadString('Alarm', 'Lyd', (IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)))+'ring.wav'));
  LydStiEdit.Text:=LydFil;
  Besked.Text:=ConfigFile.ReadString('Alarm', 'Besked', '');
  Timer.Value:=ConfigFile.ReadInteger('Alarm', 'Timer', 00);
  Min.Value:=ConfigFile.ReadInteger('Alarm', 'Min', 00);
  AlarmOn:=ConfigFile.ReadBool('Alarm', 'Tændt', false);
end;

// Stopper tælleren.
procedure TAlarmForm.BitBtn2Click(Sender: TObject);
begin
  Taeller.Enabled:=false;
end;

procedure TAlarmForm.LydBtnClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    begin
      LydFil:=OpenDialog.FileName;
      ConfigFile.WriteString('Alarm', 'Lyd', LydFil);
      MediaPlayer1.FileName:=Lydfil;
    end;
  LydStiEdit.Text:=LydFil;
end;

procedure TAlarmForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ConfigFile.WriteString('Alarm', 'Lyd', LydFil);
  ConfigFile.WriteString('Alarm', 'Besked', Besked.Text);
  ConfigFile.WriteString('Alarm', 'Tidspunkt', Tidspunkt);
  ConfigFile.WriteBool('Alarm', 'Tændt', AlarmOn);
  ConfigFile.WriteInteger('Alarm', 'Timer', Timer.Value);
  ConfigFile.WriteInteger('Alarm', 'Min', Min.Value);
end;

procedure TAlarmForm.TimerChange(Sender: TObject);
begin
  Tidspunkt:=Timer.Text+':'+Min.Text+':'+'00';
end;

procedure TAlarmForm.MinChange(Sender: TObject);
begin
  Tidspunkt:=Timer.Text+':'+Min.Text+':'+'00';
end;

procedure TAlarmForm.StopPlayBtnClick(Sender: TObject);
begin
  MediaPlayer1.Stop;
end;

end.
