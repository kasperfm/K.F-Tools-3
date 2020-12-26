unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, INIFiles, ShellAPI,
  ExtCtrls, StdCtrls, winsock, MMSystem, registry, math, urlmon, ShlObj, ComObj;

type
  TMainForm = class(TForm)
    Menu: TPopupMenu;
    Afslut1: TMenuItem;
    Hjlp1: TMenuItem;
    Om1: TMenuItem;
    Internet1: TMenuItem;
    VersionsHistorie1: TMenuItem;
    Hjlp2: TMenuItem;
    Vrktjer1: TMenuItem;
    Editor1: TMenuItem;
    Billedkonverter1: TMenuItem;
    ekstkryptering1: TMenuItem;
    System1: TMenuItem;
    ilfjnyhardware1: TMenuItem;
    Lscomputeren1: TMenuItem;
    Systeminformation1: TMenuItem;
    Uptime1: TMenuItem;
    Genveje1: TMenuItem;
    VisSkjulskjultefiler: TMenuItem;
    ilfjFjernprogrammer1: TMenuItem;
    IEIndstillinger: TMenuItem;
    Egenskaberforskrm1: TMenuItem;
    Kontrolpanel1: TMenuItem;
    StatUpdater: TTimer;
    mpapirkurven1: TMenuItem;
    VislokalIP1: TMenuItem;
    Googlesgning1: TMenuItem;
    NetRadio1: TMenuItem;
    Minimeralt1: TMenuItem;
    Hurtignoter1: TMenuItem;
    BatteristatusBrbar1: TMenuItem;
    Indstillinger1: TMenuItem;
    bnCDDrev1: TMenuItem;
    LukCDDrev1: TMenuItem;
    CDDrev1: TMenuItem;
    ThreadTimer: TTimer;
    Temp: TMemo;
    LicenseTemplate: TMemo;
    RestartAppNeededTimer: TTimer;
    idsindstillietnedlukning1: TMenuItem;
    Minegenveje1: TMenuItem;
    Alarm1: TMenuItem;
    Favoritter1: TMenuItem;
    Visfiler1: TMenuItem;
    Skjulfiler1: TMenuItem;
    GreenFireCheck: TTimer;
    ilfldigebagrundsbilleder1: TMenuItem;
    RandomWallpaperChangerTimer: TTimer;
    TrayIcon: TTrayIcon;
    procedure Afslut1Click(Sender: TObject);
    procedure Om1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VersionsHistorie1Click(Sender: TObject);
    procedure Editor1Click(Sender: TObject);
    procedure ilfjFjernprogrammer1Click(Sender: TObject);
    procedure ilfjnyhardware1Click(Sender: TObject);
    procedure Egenskaberforskrm1Click(Sender: TObject);
    procedure Kontrolpanel1Click(Sender: TObject);
    procedure mpapirkurven1Click(Sender: TObject);
    procedure Uptime1Click(Sender: TObject);
    procedure StatUpdaterTimer(Sender: TObject);
    procedure VislokalIP1Click(Sender: TObject);
    procedure Googlesgning1Click(Sender: TObject);
    procedure NetRadio1Click(Sender: TObject);
    procedure Minimeralt1Click(Sender: TObject);
    procedure Hurtignoter1Click(Sender: TObject);
    procedure BatteristatusBrbar1Click(Sender: TObject);
    procedure Indstillinger1Click(Sender: TObject);
    procedure bnCDDrev1Click(Sender: TObject);
    procedure LukCDDrev1Click(Sender: TObject);
    procedure Lscomputeren1Click(Sender: TObject);
    procedure RestartAppNeededTimerTimer(Sender: TObject);
    procedure ekstkryptering1Click(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
    procedure EgneGenvejeClick(Sender: TObject; AMenu: TMenuItem;
      AFileName: String);
    procedure idsindstillietnedlukning1Click(Sender: TObject);
    procedure IEIndstillingerClick(Sender: TObject);
    procedure Alarm1Click(Sender: TObject);
    procedure Systeminformation1Click(Sender: TObject);
    procedure FavoritesClick(Sender: TObject; AMenu: TMenuItem;
      AFileName: String);
    procedure Visfiler1Click(Sender: TObject);
    procedure Skjulfiler1Click(Sender: TObject);
    procedure Billedkonverter1Click(Sender: TObject);
    procedure Hjlp2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GreenFireCheckTimer(Sender: TObject);
    procedure TrayIconBalloonClick(Sender: TObject);
    procedure ilfldigebagrundsbilleder1Click(Sender: TObject);
    procedure RandomWallpaperChangerTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm      : TMainForm;
  Handle        : HWND;
  WinDir        : string;
  Trans         : integer = 255;
  HdDrev        : char;
  Advanceret    : boolean = true;
  NoteFil       : string  = 'noter.txt';
  StatusBeskeder: boolean = true;
  CurUptime     : string;
  WallChangeTimer: integer;
  WallpaperFolder: string;
  BalloonTip    : integer;

const
  Version       : string  = '3.0 (OpenSource)';
  ConfFil       : string  = 'settings.ini';

implementation

uses
  About, Versions, Editor, GoogleSearch, HurtigNoter,
  Indstillinger, FilKryptering,
  Alarm, ShowLocalIp,
  Uptime, BatteryPowerStatus, RandomWallpaper;

{$R *.dfm}




// Tømmer Papirkurven
procedure EmptyRecycleBin;
const 
  SHERB_NOCONFIRMATION = $00000001; 
  SHERB_NOPROGRESSUI = $00000002; 
  SHERB_NOSOUND = $00000004; 
type 
  TSHEmptyRecycleBin = function(Wnd: HWND; 
                                pszRootPath: PChar; 
                                dwFlags: DWORD): HRESULT;  stdcall; 
var 
  SHEmptyRecycleBin: TSHEmptyRecycleBin; 
  LibHandle: THandle; 
begin
  if MessageDlg('Vil du slette alle filer i papirkurven?', mtConfirmation, [mbYes, mbNo ], 0 ) = mrYes then
    begin
LibHandle := LoadLibrary(PChar('Shell32.dll'));
  if LibHandle <> 0 then @SHEmptyRecycleBin :=
      GetProcAddress(LibHandle, 'SHEmptyRecycleBinA')
  else
  begin
    MessageDlg('Failed to load Shell32.dll.', mtError, [mbOK], 0);
    Exit; 
  end;

  if @SHEmptyRecycleBin <> nil then
    SHEmptyRecycleBin(Application.Handle, 
                      nil,
                      SHERB_NOCONFIRMATION or SHERB_NOPROGRESSUI or SHERB_NOSOUND);
  FreeLibrary(LibHandle); @SHEmptyRecycleBin := nil;
    end
      else
end;

// Get battery power on laptops
function BatteryPower: string;
var
  SysPowerStatus: TSystemPowerStatus;
begin
  GetSystemPowerStatus(SysPowerStatus);
  result:=Format('%d', [SysPowerStatus.BatteryLifePercent]);
end;

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
  Result := PWideChar(IntToStr(d)+' Dage '+IntToStr(h)+' Timer '+IntToStr(m)+' Minutter ');
end;

// Viser uptime i en dialogboks.
procedure UpTime;
begin
  ShowMessage(Pchar(GetUpTime));
end;

// Finder stien til windows mappen.
function GetWinDir: PChar;
var
  Buffer: Array [0..255] of Char;
begin
  GetWindowsDirectory(Buffer, Length(Buffer));
  Result:=Buffer;
end;

// Slukker computeren.
procedure Shutdown;
begin
  ExitWindowsEx(ewx_shutdown,0);
end;

// Execute file.
procedure RunProgram(fil:PChar);
begin
  ShellExecute(handle,'open',pchar(fil),nil,nil,sw_shownormal);
end;

// Restart the application.
procedure RestartApp;
var
  FullAppPath: PWideChar;
begin
  FullAppPath:=Pchar(Application.ExeName);
  Application.MainForm.Hide;
  WinExec(PAnsiChar(FullAppPath), SW_SHOW);
  Application.Terminate;
end;

// Download en fil fra internettet.
function DownloadFile(SourceFile, DestFile: Pchar): Boolean;
begin
  try
    Result := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0, nil) = 0;
  except
    Result := False;
  end;
end;

procedure RunCplApplet(Applet: Pchar);
var
  handle: hwnd;
begin
  ShellExecute(handle,'open',Pchar('control.exe'),Applet,nil,sw_shownormal);
end;


// Funktion til åbning af cd skuffe.
procedure OpenCd(AOpen: Boolean);
const
    DoPlay : array[Boolean] of string = ('Set cdaudio door closed wait', 'Set cdaudio door open wait');
var
   MyError       : LongInt;
   MyErrorString : array[0..MAXERRORLENGTH - 1] of char;
begin
   MyError := mciSendString(pChar(DoPlay[AOpen]), nil, 0, 0);
   if MyError <> 0 then
   begin
     MciGetErrorString(MyError,MyErrorString,MAXERRORLENGTH - 1);
     Showmessage(MyErrorString);
     Exit;
   end;
end;

// Låser computeren.
procedure LockDesktop;
begin
  Keybd_event(VK_LWIN, 0, 0, 0);
  Keybd_event(Byte('L'), 0, 0, 0);
  Keybd_event(Byte('L'), 0, KEYEVENTF_KEYUP, 0);
  Keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0);
end;

// Skift windows skrivebord baggrundsbillede.
procedure ChangeWallpaper(aFile: String);
const
  CLSID_ActiveDesktop: TGUID = '{75048700-EF1F-11D0-9888-006097DEACF9}';
var
  hObj: IUnknown;
  ADesktop: IActiveDesktop;
  str: string;
  wstr: PWideChar;
begin
  hObj     := CreateComObject(CLSID_ActiveDesktop);
  ADesktop := hObj as IActiveDesktop;
  wstr := AllocMem(MAX_PATH);
  try
    StringToWideChar(aFile, wstr, MAX_PATH);
    ADesktop.SetWallpaper(wstr, 0);
    ADesktop.ApplyChanges(AD_APPLY_ALL or AD_APPLY_FORCE);
  finally
    FreeMem(wstr);
  end;
end;

// Indeksere filerne i en mappe og lister dem i MappeListBox.
procedure FileSearch(const PathName, FileName : string);
var Rec  : TSearchRec;
    Path : string;
begin
  Path := IncludeTrailingBackslash(PathName);
    if FindFirst (Path + FileName, faAnyFile - faDirectory, Rec) = 0
        then
      try
        repeat
          RandomWallpaper.RandomWallpaperForm.MappeListBox.Items.Add(Path + Rec.Name);
        until FindNext(Rec) <> 0;
      finally
        FindClose(Rec);
    end;
end;

// Afslutter programmet.
procedure TMainForm.Afslut1Click(Sender: TObject);
begin
  if MessageDlg('Er du sikker på du vil afslutte?', mtConfirmation, [mbYes, mbNo ], 0 ) = mrYes then
    begin
      StatUpdater.Enabled:=false;
      ConfigFile.Free;
      RandomWallpaper.IniFile.Free;
      Alarm.AlarmForm.MediaPlayer1.Free;
      Application.Terminate;
    end
      else
end;

// Viser About formen.
procedure TMainForm.Om1Click(Sender: TObject);
begin
  AboutForm.Show;
end;

// Alle de ting K.F Tools 3 gør når det starter.
procedure TMainForm.FormCreate(Sender: TObject);
var
  s:String;
  t:Integer;
begin
  ShowWindow(Application.Handle, SW_HIDE);

  // Skriver standard variabler.
  MainForm.Caption:='K.F Tools '+Version;
  TrayIcon.Hint:='K.F Tools '+Version;
  TrayIcon.BalloonTitle:='K.F Tools '+Version;
  SetLength(winDir, 255);
  GetWindowsDirectory(PChar(WinDir), MAX_PATH);


      if ParamStr(1)='/cmd' then
        begin
          if ParamStr(2)='uptime' then
            MainForm.Uptime1.Click;
          if ParamStr(2)='lås' then
            MainForm.Lscomputeren1.Click;
          if ParamStr(2)='showip' then
            MainForm.VislokalIP1.Click;
          if ParamStr(2)='cd_open' then
            MainForm.CDDrev1.Items[0].Click;
          if ParamStr(2)='cd_close' then
            MainForm.CDDrev1.Items[1].Click;
        end;

// Slår status beskeder fra serveren fra. Dette er ikke en public param.
  if ParamStr(1)='no_msg' then
    StatusBeskeder:=False;

  PathToINIFile:=IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)))+Main.ConfFil;
  ConfigFile:=TINIFile.Create(PathToINIFile);

// Læser info fra config filen.
  Trans:=ConfigFile.ReadInteger('Main', 'AlphaBlend', 255);
  Advanceret:=ConfigFile.ReadBool('Main', 'Advanceret', true);
  HdDrev:=ConfigFile.ReadString('TrayStatusMessage', 'HarddiskStatus', 'c')[1];
  NoteFil:=ConfigFile.ReadString('Noter', 'NoteFil', 'noter.txt');
  StatUpdater.Interval:=ConfigFile.ReadInteger('TrayStatusMessage', 'OpdateringsInterval', 5000);
  BalloonTip:=ConfigFile.ReadInteger('TrayStatusMessage', 'BalloonTip', 1);
  WallpaperFolder:=ConfigFile.ReadString('TilfældigeBaggrunde', 'Mappe', 'C:\');
  WallChangeTimer:=ConfigFile.ReadInteger('TilfældigeBaggrunde', 'Interval', 300000);


// Menu punkter der bliver fjernet når simpel tilstand er slået til.
  if Advanceret=false then
    begin
      MainForm.Menu.Items[0].Remove(IEIndstillinger);
      MainForm.Menu.Items[1].Remove(ilfjnyhardware1);
      MainForm.Menu.Items[1].Remove(Uptime1);
      MainForm.Menu.Items[1].Remove(VislokalIP1);
      MainForm.Menu.Items[1].Remove(Systeminformation1);
      MainForm.Menu.Items[2].Remove(ekstkryptering1);
      MainForm.Menu.Items[3].Remove(VisSkjulskjultefiler);
    end;

  CurUptime := GetUptime;
  StatUpdater.Enabled := true;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

// Viser versions historien for K.F Tools 3.
procedure TMainForm.VersionsHistorie1Click(Sender: TObject);
begin
  VerHistForm.ShowModal;
end;

// Viser tekst editioren.
procedure TMainForm.Editor1Click(Sender: TObject);
begin
  EditorForm.ShowModal;
end;

// Åbner Tilføj/Fjern programmer.
procedure TMainForm.ilfjFjernprogrammer1Click(Sender: TObject);
begin
  RunCplApplet('appwiz.cpl');
end;

// Åbner "Tilføj ny hardware"
procedure TMainForm.ilfjnyhardware1Click(Sender: TObject);
begin
  RunCplApplet('hdwwiz.cpl');
end;

// Viser egenskaber for skærm.
procedure TMainForm.Egenskaberforskrm1Click(Sender: TObject);
begin
  RunCplApplet('desk.cpl');
end;

// Åbner kontrolpanelet.
procedure TMainForm.Kontrolpanel1Click(Sender: TObject);
begin
  ShellExecute(handle,'open',Pchar('control.exe'),nil,nil,sw_shownormal);
end;

// Tømmer papirkurven.
procedure TMainForm.mpapirkurven1Click(Sender: TObject);
begin
  EmptyRecycleBin;
end;

// Viser computerens uptime i en dialogboks.
procedure TMainForm.Uptime1Click(Sender: TObject);
begin
  UptimeForm.ShowModal;
end;

// Opdatere visningen af computerens status i TrayHint.
procedure TMainForm.StatUpdaterTimer(Sender: TObject);
var
  total,ledig: double;
begin
  StatUpdater.Interval:=4500;
  StatUpdater.Interval:=ConfigFile.ReadInteger('TrayStatusMessage', 'OpdateringsInterval' , 4500);

  if BalloonTip = 1 then
    begin
      total := disksize(ord(HdDrev) - 64);
      ledig := diskfree(ord(HdDrev) - 64);
      ledig := ledig / 1024 / 1024;
      total := total / 1024 / 1024;

      TrayIcon.Hint:='- Harddisk-status -'+#10+
                  Format('Ledig plads på drev '+HdDrev+': %12.0n', [ledig]) + ' MB'+#10+
                  Format('Total plads på drev '+HdDrev+': %12.0n', [total]) + ' MB'+#10;
    end;

  if Balloontip = 2 then
    begin
      CurUptime:=GetUptime;
      TrayIcon.BalloonHint:=PChar('- Uptime -' +#10+ CurUptime);
    end;

  // Kode til Wallpaper Changer'en.
  WallpaperFolder :=ConfigFile.ReadString('TilfældigeBaggrunde', 'Mappe', 'C:\');
  WallChangeTimer :=ConfigFile.ReadInteger('TilfældigeBaggrunde', 'Interval', 300000);
  RandomWallpaperChangerTimer.Interval:=Main.WallChangeTimer;
  RandomWallpaper.RandomWallpaperForm.AktiveretCheckBox.Checked:=ConfigFile.ReadBool('TilfældigeBaggrunde', 'Tændt', true);
  FileSearch(Main.WallpaperFolder, '*.jpg');
  RandomWallpaperForm.SpinEdit1.Value:= Main.WallChangeTimer DIV 1000 DIV 60;
  RandomWallpaperForm.MappeLabel.Caption:=Main.WallpaperFolder;
  RandomWallpaperChangerTimer.Enabled:=ConfigFile.ReadBool('TilfældigeBaggrunde', 'Tændt', false);
  RandomWallpaper.RandomWallpaperForm.AktiveretCheckBox.Checked:=RandomWallpaperChangerTimer.Enabled;
end;

// Finder netværks IP adressen.
procedure TMainForm.VislokalIP1Click(Sender: TObject);
begin
  LocalIpForm.ShowModal;
end;

// Åbner WebSøgnings værktøjet.
procedure TMainForm.Googlesgning1Click(Sender: TObject);
begin
  WebFind.ShowModal;
end;

// Starter netradioen.
procedure TMainForm.NetRadio1Click(Sender: TObject);
begin
  // Denne funktion er fjernet pga. døde links.
end;

// Minimere alle åbne vinduer.
procedure TMainForm.Minimeralt1Click(Sender: TObject);
begin
  Keybd_event(VK_LWIN, 0, 0, 0);
  Keybd_event(Byte('M'), 0, 0, 0);
  Keybd_event(Byte('M'), 0, KEYEVENTF_KEYUP, 0);
  Keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0);
end;

// Åbner "hurtig-noter" vinduet.
procedure TMainForm.Hurtignoter1Click(Sender: TObject);
begin
  QuickNotesForm.ShowModal;
end;

// Viser hvor mange procent strøm der er tilbage på ens
// bærbare computer.
procedure TMainForm.BatteristatusBrbar1Click(Sender: TObject);
var
  battery: integer;
begin
  Battery:=StrToInT(BatteryPower);
  
  if battery=255 then
    ShowMessage('Dette er ikke en bærbar computer!')
  else
    BatteryForm.ShowModal;
end;

// Viser vinduet hvor brugeren kan ændre indstillinger.
procedure TMainForm.Indstillinger1Click(Sender: TObject);
begin
  IndstillingerForm.ShowModal;
end;

// Åbner CD-Drev's skuffen.
procedure TMainForm.bnCDDrev1Click(Sender: TObject);
begin
  OpenCD(True);
end;

// Lukker CD-Drev's skuffen.
procedure TMainForm.LukCDDrev1Click(Sender: TObject);
begin
  OpenCD(False);
end;

// Låser computeren ved hjælp af genvejstaster.
procedure TMainForm.Lscomputeren1Click(Sender: TObject);
begin
  LockDesktop;
end;

// Ryder op i diverse ting når programmet lukkes.
procedure TMainForm.RestartAppNeededTimerTimer(Sender: TObject);
begin
  RestartAppNeededTimer.Enabled:=false;
  RestartApp;
end;

// Viser fil-krypterings formen.
procedure TMainForm.ekstkryptering1Click(Sender: TObject);
begin
  EncDecForm.ShowModal;
end;

// Viser hdd-informations boks når der klikkes på ikonet.
procedure TMainForm.TrayIconClick(Sender: TObject);
begin
  TrayIcon.ShowBalloonHint;
end;

// Starter genvejen når der klikkes på den under "Mine Genveje"
procedure TMainForm.EgneGenvejeClick(Sender: TObject; AMenu: TMenuItem;
  AFileName: string);
var
  Fil: pchar;
begin
  Fil:=PChar(AFileName);
  ShellExecute(handle, 'open', fil, nil, nil, SW_SHOWNORMAL);
end;

// Åbner "Tids indstillet nedluknings" vindue.
procedure TMainForm.idsindstillietnedlukning1Click(Sender: TObject);
begin
  // Denne funktion er fjernet da den ikke virkede i Windows 10.
end;

// Viser Internet Indstillingerne.
procedure TMainForm.IEIndstillingerClick(Sender: TObject);
begin
  RunCplApplet('inetcpl.cpl');
end;

// Viser alarm vinduet.
procedure TMainForm.Alarm1Click(Sender: TObject);
begin
  AlarmForm.ShowModal;
end;

// Viser systeminformation.
procedure TMainForm.Systeminformation1Click(Sender: TObject);
begin
  RunCplApplet('sysdm.cpl');
end;

// Åbner genvejen til det element der er valgt i "Favoritter" menuen.
procedure TMainForm.FavoritesClick(Sender: TObject; AMenu: TMenuItem;
  AFileName: String);
var
  Fil: pchar;
begin
  Fil:=PChar(AFileName);
  ShellExecute(handle, 'open', fil, nil, nil, SW_SHOWNORMAL);
end;

// Viser skjulte filer.
procedure TMainForm.Visfiler1Click(Sender: TObject);
var
  Registry: TRegistry;
begin
  Registry:=TRegistry.Create;
  Registry.RootKey:=HKEY_CURRENT_USER;
  If Registry.OpenKey('Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',True) then
    begin
      Registry.WriteBool('Hidden', True);
      Registry.Free;
    end;
end;

// Skjuler skjulte filer.
procedure TMainForm.Skjulfiler1Click(Sender: TObject);
var
Registry: TRegistry;
begin
  Registry:=TRegistry.Create;
  Registry.RootKey:=HKEY_CURRENT_USER;
  If Registry.OpenKey('Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',True) then
    begin
    Registry.WriteBool('Hidden', False);
    Registry.Free;
 end;
end;

// Viser billedkonverterings værktøjet.
procedure TMainForm.Billedkonverter1Click(Sender: TObject);
begin
  // Denne funktion er fjernet, da det brugte bibliotek ikke længere er understøttet.
end;

// Viser manualen.
procedure TMainForm.Hjlp2Click(Sender: TObject);
begin
  ShellExecute(handle, 'open', 'manual.doc',nil, nil, SW_SHOWNORMAL);
end;

// Minimere programmet.
procedure TMainForm.FormActivate(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

// Licens tjek.
procedure TMainForm.GreenFireCheckTimer(Sender: TObject);
begin
  // Dette er fjernet, da programmet nu er opensource.
end;

procedure TMainForm.TrayIconBalloonClick(Sender: TObject);
var
  total,ledig: double;
begin
  if BalloonTip=1 then
    begin
      total := disksize(ord(HdDrev) - 64);
      ledig := diskfree(ord(HdDrev) - 64);
      ledig := ledig / 1024 / 1024;
      total := total / 1024 / 1024;

      TrayIcon.BalloonHint:='- Ledig diskplads -'+#10+
                  Format('Ledig plads på drev '+HdDrev+': %12.0n', [ledig]) + ' MB'+#10+
                  Format('Total plads på drev '+HdDrev+': %12.0n', [total]) + ' MB'+#10;
    end;

  if Balloontip=2 then
    begin
      CurUptime:=GetUptime;
      TrayIcon.BalloonHint:=PChar('- Uptime -'+#10+#13+CurUptime+' ');
    end;
end;

procedure TMainForm.ilfldigebagrundsbilleder1Click(Sender: TObject);
begin
  RandomWallpaperForm.ShowModal;
end;

// Skifter baggrund på skrivebordet i en tilfeældig rækkefølge.
procedure TMainForm.RandomWallpaperChangerTimerTimer(Sender: TObject);
var
  S: String;
begin
  Randomize;
  S := RandomWallpaper.RandomWallpaperForm.MappeListBox.Items.Strings[Random(RandomWallpaper.RandomWallpaperForm.MappeListBox.Items.Count - 1) + 1];
  Randomize;
  changeWallpaper(S);
end;

end.
