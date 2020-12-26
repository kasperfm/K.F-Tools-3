{
                - NetRadio -
  Lige hvad enhver doven geek eller musik freak har brug for!
  Ægte netradio i høj kvalitet! :-)

  Damn det er en nice funktion ! ! !
  (og konkurrent til SpuKie.dk's "NetTools" :-P )
}
unit Radio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, WMPLib_TLB, StdCtrls, Buttons, ComCtrls, main, inifiles,
  ExtCtrls;

type
  TNetRadio = class(TForm)
    RadioSelect: TComboBox;
    PlayBtn: TBitBtn;
    StopBtn: TBitBtn;
    Player: WMPLib_TLB;
    Volume: TTrackBar;
    VolumeStatus: TProgressBar;
    LydstyrkeLabel: TLabel;
    BitRate: TLabel;
    InfoLabel1: TLabel;
    LabelHiderTimer: TTimer;
    procedure PlayBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure VolumeChange(Sender: TObject);
    procedure PlayerBuffering(ASender: TObject; Start: WordBool);
    procedure RadioSelectChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LabelHiderTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NetRadio: TNetRadio;
  ConfigFile: TINIFile;
  PathToINIFile: String;

implementation

{$R *.dfm}

// Afspiller den valgte station.
procedure TNetRadio.PlayBtnClick(Sender: TObject);
begin
  InfoLabel1.Visible:=true;
  if RadioSelect.ItemIndex = 0 then
    begin
      Player.URL:='http://www.dr.dk/netradio/metafiler/asx/DR_P1_128.asx';
    end
  else
  if RadioSelect.ItemIndex = 1 then
    begin
       Player.URL:='http://www.dr.dk/netradio/metafiler/asx/DR_P2_128.asx';
    end
  else
  if RadioSelect.ItemIndex = 2 then
    begin
       Player.URL:='http://www.dr.dk/netradio/metafiler/asx/DR_P3_128.asx';
    end
  else
  if RadioSelect.ItemIndex = 3 then
    begin
       Player.URL:='http://dix.media.webpartner.dk/voice128';
    end
  else
  if RadioSelect.ItemIndex = 4 then
    begin
       Player.URL:='http://100fm.dk/netradio/100fm_live.asx';
    end
  else
  if RadioSelect.ItemIndex = 5 then
    begin
       Player.URL:='http://www.dr.dk/netradio/metafiler/asx/DR_Boogie_128.asx';
    end
  else
  if RadioSelect.ItemIndex = 6 then
    begin
       Player.URL:='http://dix.media.webpartner.dk/radio2-96';
    end
  else
  if RadioSelect.ItemIndex = 7 then
    begin
       Player.URL:='mms://85.214.46.76/mmradio/live128.asf';
    end
  else ShowMessage('Du har ikke valgt noget radioprogram!');
  LabelHiderTimer.Enabled:=true;
end;

// Stopper radioen.
procedure TNetRadio.StopBtnClick(Sender: TObject);
begin
  Player.controls.stop;
  Player.close;
end;

procedure TNetRadio.VolumeChange(Sender: TObject);
begin
  Player.settings.volume:=Volume.Position;
  VolumeStatus.Position:=Volume.Position;
  Configfile.WriteInteger('Radio', 'Volume', Player.settings.volume);
end;

// Viser lydens bitrate.
procedure TNetRadio.PlayerBuffering(ASender: TObject; Start: WordBool);
begin
  BitRate.Caption:='Bit rate: '+IntToStr(Player.network.bitRate);
end;

// Gemmer favorit radioen.
procedure TNetRadio.RadioSelectChange(Sender: TObject);
begin
  ConfigFile.WriteInteger('Radio', 'Favorit', RadioSelect.ItemIndex);
end;

// Rydder op efter ini filen.
procedure TNetRadio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ConfigFile.Free;
end;

// Indstiller volumen når vinduet åbnes.
procedure TNetRadio.FormShow(Sender: TObject);
begin
  PathToINIFile:=IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)))+Main.ConfFil;
  ConfigFile:=TINIFile.Create(PathToINIFile);
  RadioSelect.ItemIndex:=ConfigFile.ReadInteger('Radio', 'Favorit', 2);

  AlphaBlendValue:=Main.Trans;
  Player.settings.volume:=ConfigFile.ReadInteger('Radio', 'Volume', 50);
  Volume.Position:=Player.settings.volume;
  VolumeStatus.Position:=Player.settings.volume;
end;

procedure TNetRadio.LabelHiderTimerTimer(Sender: TObject);
begin
  InfoLabel1.Visible:=false;
  LabelHiderTimer.Enabled:=false;
end;

end.
