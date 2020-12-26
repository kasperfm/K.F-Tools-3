unit EditorSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, inifiles, Main;

type
  TEditorSettingsForm = class(TForm)
    SaveBtn: TBitBtn;
    BaggrundFarve: TColorBox;
    Label1: TLabel;
    SkriftFarve: TColorBox;
    Label2: TLabel;
    procedure SaveBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorSettingsForm: TEditorSettingsForm;
  ConfigFile: TINIFile;
  PathToINIFile: String;

implementation

{$R *.dfm}

procedure TEditorSettingsForm.SaveBtnClick(Sender: TObject);
Begin
  PathToINIFile:=IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)))+'settings.ini';
  ConfigFile:=TINIFile.Create(PathToINIFile);
  ConfigFile.WriteString('Editor', 'BaggrundsFarve', ColorToString(BaggrundFarve.Selected));
  ConfigFile.WriteString('Editor', 'SkriftFarve', ColorToString(SkriftFarve.Selected));
  ConfigFile.Free;
  Close;
end;

procedure TEditorSettingsForm.FormShow(Sender: TObject);
begin
  PathToINIFile:=IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)))+Main.ConfFil;
  ConfigFile := TINIFile.Create(PathToINIFile);

  AlphaBlendValue:=main.Trans;
  BaggrundFarve.Selected:=StringToColor(ConfigFile.ReadString('Editor', 'BaggrundsFarve', 'clWhite'));
  SkriftFarve.Selected:=StringToColor(ConfigFile.ReadString('Editor', 'SkriftFarve', 'clBlack'));

  ConfigFile.Free;
end;

end.
