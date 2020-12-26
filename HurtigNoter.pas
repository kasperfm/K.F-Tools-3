{
                - Hurtig Noter -
  Denne funktion bruges til hurtigt at gemme notater,
  og hente dem frem igen uden at lede efter en fil først.
  Den gemmer selv teksten efter hvert tastetryk.
}

unit HurtigNoter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Main, StdCtrls;

type
  TQuickNotesForm = class(TForm)
    Noter: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure NoterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QuickNotesForm: TQuickNotesForm;

implementation

{$R *.dfm}

procedure TQuickNotesForm.FormActivate(Sender: TObject);
begin
  If FileExists(Main.NoteFil) then
    Noter.Lines.LoadFromFile(Main.NoteFil)
  else
    Noter.Lines.SaveToFile(Main.NoteFil);
end;

// Gemmer teksten hver gang der tastes noget nyt.
procedure TQuickNotesForm.NoterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Noter.Lines.SaveToFile(Main.NoteFil);
end;

procedure TQuickNotesForm.FormCreate(Sender: TObject);
begin
  AlphaBlendValue:=Main.Trans;
end;

end.
