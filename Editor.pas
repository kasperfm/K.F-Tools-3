unit Editor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ToolWin, ComCtrls, StdCtrls, Buttons, Inifiles, main;

type
  TEditorForm = class(TForm)
    Edit: TRichEdit;
    ToolBar: TToolBar;
    NewBtn: TSpeedButton;
    OpenBtn: TSpeedButton;
    SaveBtn: TSpeedButton;
    PrintBtn: TSpeedButton;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    UndoBtn: TSpeedButton;
    Space1: TToolButton;
    EditPopupMenu: TPopupMenu;
    Klip1: TMenuItem;
    Copier1: TMenuItem;
    Indst1: TMenuItem;
    Sletalt1: TMenuItem;
    procedure Afslut1Click(Sender: TObject);
    procedure NewBtnClick(Sender: TObject);
    procedure OpenBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure UndoBtnClick(Sender: TObject);
    procedure Klip1Click(Sender: TObject);
    procedure Copier1Click(Sender: TObject);
    procedure Indst1Click(Sender: TObject);
    procedure Sletalt1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorForm: TEditorForm;

implementation

uses EditorSettings;

{$R *.dfm}

// Lukker editoren.
procedure TEditorForm.Afslut1Click(Sender: TObject);
begin
  Close;
end;

// Funktionen til at oprette en ny fil.
procedure TEditorForm.NewBtnClick(Sender: TObject);
begin
  if MessageDlg( 'Er du sikker på du vil oprette et nyt dokument?' , mtConfirmation , [ mbYes , mbNo ] , 0 ) = mrYes then
    begin
      EditorForm.Edit.Clear;
      SaveDialog.FileName:='';
    end
      else
    begin
    // Ingenting
end;
end;

// Funktionen til at åbne filer.
procedure TEditorForm.OpenBtnClick(Sender: TObject);
begin
  If OpenDialog.Execute
  then
    EditorForm.Edit.Lines.LoadFromFile(OpenDialog.FileName);
end;

// Udskriver indholdet af edit boksen.
procedure TEditorForm.PrintBtnClick(Sender: TObject);
begin
  EditorForm.Edit.Print(OpenDialog.FileName);
end;

procedure TEditorForm.FormShow(Sender: TObject);
Var
  ConfigFile: TINIFile;
  PathToINIFile: String;
Begin
  PathToINIFile:=IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)))+Main.ConfFil;
  ConfigFile:=TINIFile.Create(PathToINIFile);

  EditorForm.Edit.Color := StringToColor(ConfigFile.ReadString('Editor', 'BaggrundsFarve', 'clWhite'));
  EditorForm.Edit.Font.Color := StringToColor(ConfigFile.ReadString('Editor', 'SkriftFarve', 'clBlack'));

  ConfigFile.Free;
end;

// Funktionen til at gemme den åbne fil.
procedure TEditorForm.SaveBtnClick(Sender: TObject);
begin
  if SaveDialog.Execute
  then
    EditorForm.Edit.Lines.SaveToFile(SaveDialog.FileName);
end;

// Undo funktion.
procedure TEditorForm.UndoBtnClick(Sender: TObject);
begin
  EditorForm.Edit.Undo;
end;

// Funktion til at klippe til udklipsholderen.
procedure TEditorForm.Klip1Click(Sender: TObject);
begin
  EditorForm.Edit.CutToClipboard;
end;

// Funktion til at kopiere til udklipsholderen.
procedure TEditorForm.Copier1Click(Sender: TObject);
begin
  EditorForm.Edit.CopyToClipboard;
end;

// Funktion til at indsætte fra udklipsholderen.
procedure TEditorForm.Indst1Click(Sender: TObject);
begin
  EditorForm.Edit.PasteFromClipboard;
end;

// Sletter alt tekst i boksen.
procedure TEditorForm.Sletalt1Click(Sender: TObject);
begin
  Edit.Lines.Clear;
end;

procedure TEditorForm.FormCreate(Sender: TObject);
begin
  AlphaBlendValue:=Main.Trans;
end;

end.
