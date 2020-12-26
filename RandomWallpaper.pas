unit RandomWallpaper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons, ShlObj, ComObj, Main, inifiles;

type
  TRandomWallpaperForm = class(TForm)
    MappeListBox: TListBox;
    Label1: TLabel;
    MappeLabel: TLabel;
    GemIndstillingerBtn: TBitBtn;
    VaelgMappeBtn: TBitBtn;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    AktiveretCheckBox: TCheckBox;
    procedure VaelgMappeBtnClick(Sender: TObject);
    procedure GemIndstillingerBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RandomWallpaperForm: TRandomWallpaperForm;
  IniFile : TIniFile;
  SettingsIni: String;

implementation

{$R *.dfm}

function BrowseCallbackProc(hwnd: HWND; uMsg: UINT; lParam: LPARAM; lpData: LPARAM): Integer; stdcall;
begin
  if (uMsg = BFFM_INITIALIZED) then
    SendMessage(hwnd, BFFM_SETSELECTION, 1, lpData);
  BrowseCallbackProc := 0;
end;

function GetFolderDialog(Handle: Integer; Caption: string; var strFolder: string): Boolean;
const
  BIF_STATUSTEXT           = $0004;
  BIF_NEWDIALOGSTYLE       = $0040;
  BIF_RETURNONLYFSDIRS     = $0080;
  BIF_SHAREABLE            = $0100;
  BIF_USENEWUI             = BIF_EDITBOX or BIF_NEWDIALOGSTYLE;

var
  BrowseInfo: TBrowseInfo;
  ItemIDList: PItemIDList;
  JtemIDList: PItemIDList;
  Path: PAnsiChar;
begin
  Result := False;
  Path := PAnsiChar(StrAlloc(MAX_PATH));
  SHGetSpecialFolderLocation(Handle, CSIDL_DRIVES, JtemIDList);
  with BrowseInfo do
  begin
    hwndOwner := GetActiveWindow;
    pidlRoot := JtemIDList;
    SHGetSpecialFolderLocation(hwndOwner, CSIDL_DRIVES, JtemIDList);

    { return display name of item selected }
    pszDisplayName := StrAlloc(MAX_PATH);

    { set the title of dialog }
    lpszTitle := PChar(Caption);//'Select the folder';
    { flags that control the return stuff }
    lpfn := @BrowseCallbackProc;
    { extra info that's passed back in callbacks }
    lParam := LongInt(PChar(strFolder));
  end;

  ItemIDList := SHBrowseForFolder(BrowseInfo);

  if (ItemIDList <> nil) then
    if SHGetPathFromIDList(ItemIDList, PWideChar(Path)) then
    begin
      strFolder := Path;
      Result := True
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

// Viser det vindue hvor du skal vælge hvilken mappe den skal lede
// efter baggrundsbilleder i.
procedure TRandomWallpaperForm.VaelgMappeBtnClick(Sender: TObject);
begin
  Main.WallpaperFolder := 'c:\';

  if GetFolderDialog(Application.Handle, 'Vælg en mappe', Main.WallpaperFolder) then
    begin
      FileSearch(Main.WallpaperFolder, '*.jpg');
      MappeLabel.Caption:=Main.WallpaperFolder;
    end;
end;

// Gemmer indstillingerne for RandomWallpaper funktionen.
procedure TRandomWallpaperForm.GemIndstillingerBtnClick(Sender: TObject);
begin
  Main.MainForm.RandomWallpaperChangerTimer.Interval:=StrToInt(SpinEdit1.Text)*60*1000;
  Main.WallChangeTimer:=StrToInt(SpinEdit1.Text)*60*1000;

  SettingsIni:=IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)))+'settings.ini';
  IniFile := TIniFile.create(SettingsIni);

  IniFile.WriteInteger('TilfældigeBaggrunde', 'Interval', Main.WallChangeTimer);
  IniFile.WriteString('TilfældigeBaggrunde', 'Mappe', Main.WallpaperFolder);
  IniFile.WriteBool('TilfældigeBaggrunde', 'Tændt', RandomWallpaper.RandomWallpaperForm.AktiveretCheckBox.Checked);
end;


end.
