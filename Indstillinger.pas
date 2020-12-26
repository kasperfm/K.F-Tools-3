unit Indstillinger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, inifiles, StdCtrls, Buttons, ComCtrls, main,
  ExtCtrls, FileCtrl, registry, ShlObj, ActiveX, ComObj, shellapi;

type
  TIndstillingerForm = class(TForm)
    Indstillinger: TGroupBox;
    AlphaBlendBar: TTrackBar;
    AlphaLabel: TLabel;
    GemBtn: TBitBtn;
    AutoStart: TCheckBox;
    NotePath: TLabeledEdit;
    AutoRadio: TCheckBox;
    Advanceret: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Harddisk: TDriveComboBox;
    Label3: TLabel;
    MineGenvejeBtn: TBitBtn;
    CloseBtn: TBitBtn;
    Label4: TLabel;
    BalloonType: TComboBox;
    procedure GemBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IndstillingerForm: TIndstillingerForm;
  ConfigFile: TINIFile;
  PathToINIFile: String;
  Advanced: boolean;
  Reg: TRegistry;

implementation

uses GenstartProgram;

{$R *.dfm}

// Finder diverse system mapper.
{
CSIDL_DESKTOP for WINDOWS\Desktop
CSIDL_DESKTOPDIRECTORY for WINDOWS\Desktop
CSIDL_FONTS for WINDOWS\FONTS
CSIDL_NETHOOD for WINDOWS\NetHood
CSIDL_PERSONAL for X:\My Documents
CSIDL_PROGRAMS for WINDOWS\StartMenu\Programs
CSIDL_RECENT for WINDOWS\Recent
CSIDL_SENDTO for WINDOWS\SendTo
CSIDL_STARTMENU for WINDOWS\Start Menu
CSIDL_STARTUP for WINDOWS\Start Menu\Programs\StartUp
CSIDL_TEMPLATES for WINDOWS\ShellNew
}
function GetSystemPath(Folder: Integer): string;
var
  PIDL: PItemIDList;
  Path: LPSTR;
  AMalloc: IMalloc;
begin
  Path := PAnsiChar(StrAlloc(MAX_PATH));
  SHGetSpecialFolderLocation(Application.Handle, Folder, PIDL);
  if SHGetPathFromIDList(PIDL, PWideChar(Path)) then
    Result := Path;
  SHGetMalloc(AMalloc);
  AMalloc.Free(PIDL);
  StrDispose(Path);
end;

// Laver en genvej til en fil.
procedure CreateLink(Target, Args, WorkDir, ShortCutName: String);
var
  IObj: IUnknown;
  Link: IShellLink;
  IPFile: IPersistFile;
  TargetW: WideString;
begin
  IObj := CreateComObject(CLSID_ShellLink);
  Link := IObj as IShellLink;
  IPFile := IObj as IPersistFile;

  with Link do
  begin
    SetPath(PChar(Target));
    SetArguments(PChar(Args));
    SetShowCmd(SW_SHOWMINIMIZED);
    SetWorkingDirectory(PChar(WorkDir));
  end;
  TargetW := ShortCutName;
  IPFile.Save(PWChar(TargetW), False);
end;



procedure TIndstillingerForm.GemBtnClick(Sender: TObject);
begin
  ConfigFile.WriteInteger('Main', 'AlphaBlend', AlphaBlendBar.Position);
  ConfigFile.WriteBool('Main', 'AutoStart', AutoStart.Checked);
  ConfigFile.WriteBool('Radio', 'Auto', AutoRadio.Checked);
  ConfigFile.WriteBool('Main', 'Advanceret', Advanceret.Checked);
  ConfigFile.WriteString('TrayStatusMessage', 'HarddiskStatus', Harddisk.Drive);
  ConfigFile.WriteString('Noter', 'NoteFil', NotePath.Text);


  if BalloonType.ItemIndex=0 then
    Configfile.WriteInteger('TrayStatusMessage', 'BalloonTip', 1) else
    Configfile.WriteInteger('TrayStatusMessage', 'BalloonTip', 1);

  if BalloonType.ItemIndex=1 then
    Configfile.WriteInteger('TrayStatusMessage', 'BalloonTip', 2) else
    Configfile.WriteInteger('TrayStatusMessage', 'BalloonTip', 1);

  if AutoStart.Checked=true then
    begin
      if FileExists('kf_tools3.exe') then
          CreateLink(IncludeTrailingBackslash(ExtractFilePath(ParamStr(0))+'kf_tools3.exe'), '', IncludeTrailingBackslash(ExtractFilePath(ParamStr(0))), GetSystemPath(CSIDL_STARTUP)+'\K.F Tools 3.lnk');
    end
       else
    begin
      DeleteFile(GetSystemPath(CSIDL_STARTUP)+'\K.F Tools 3.lnk');
    end;

  ConfigFile.Free;
  Close;
  RestartProg.ShowModal;
end;

procedure TIndstillingerForm.FormShow(Sender: TObject);
begin
  PathToINIFile:=IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)))+Main.ConfFil;
  ConfigFile   :=TINIFile.Create(PathToINIFile);

  if ConfigFile.ReadBool('Main', 'AutoStart', false)=true then
    AutoStart.Checked:=true else AutoStart.Checked:=false;

  AlphaBlendBar.Position:= ConfigFile.ReadInteger('Main', 'AlphaBlend', 255);
  AutoStart.Checked     := ConfigFile.ReadBool('Main', 'AutoStart', false);
  NotePath.Text         := ConfigFile.ReadString('Noter', 'NoteFil', 'noter.txt');
  AutoRadio.Checked     := ConfigFile.ReadBool('Radio', 'Auto', false);
  Advanceret.Checked    := ConfigFile.ReadBool('Main', 'Advanceret', true);
  Harddisk.Drive        := ConfigFile.ReadString('TrayStatusMessage', 'HarddiskStatus', 'c')[1];
  BalloonType.ItemIndex := Configfile.ReadInteger('TrayStatusMessage', 'BalloonTip', 0)-1;
end;

procedure TIndstillingerForm.CloseBtnClick(Sender: TObject);
begin
  ConfigFile.Free;
  Close;
end;

procedure TIndstillingerForm.FormCreate(Sender: TObject);
begin
  AlphaBlendValue:=Main.Trans;

  if AlphaBlendValue<=75 then
    AlphaBlendValue:=200;
end;

end.
