{
                - Versions Historie -
  Denne form indeholder en liste over alle de ændringer der
  bliver lavet fra version til version. (Fra 3.0 og op)
  
  Elsker sådan en funktion :-)
}

unit Versions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, main;

type
  TVerHistForm = class(TForm)
    Versions: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VerHistForm: TVerHistForm;

implementation

{$R *.dfm}

procedure TVerHistForm.FormShow(Sender: TObject);
begin
  AlphaBlendValue:=Main.Trans;
  
  if FileExists('changelog.txt') then
    Versions.Lines.LoadFromFile('changelog.txt');
end;

end.
