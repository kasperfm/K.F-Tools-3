{
                   - About Dialog -
  Denne dialogboks indeholder information om K.F tools og
  skaberen af det samt navnene på beta testerne og
  information om hvordan udvikleren kan kontaktes.
}

unit About;

interface

uses
  ShareMem, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, main, jpeg;


type
  TAboutForm = class(TForm)
    Icon: TImage;
    Titel: TLabel;
    VerLabel: TLabel;
    Credits: TMemo;
    KontaktLabel: TLabel;
    OKBtn: TButton;
    CompileDate: TLabel;
    KFSLogo: TImage;
    procedure OKBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IconDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;
                                                                    
implementation

{$R *.dfm}

// Finder ud af hvornår programmet er kompileret.
function GetCompiledDate : Pchar;
begin
  result := PChar(DateTimeToStr(FileDateToDateTime(Fileage(Application.ExeName))));
end;

// Lukker vinduet.
procedure TAboutForm.OKBtnClick(Sender: TObject);
begin
  Close;
end;

// Sætter variabler.
procedure TAboutForm.FormShow(Sender: TObject);
begin
  AlphaBlendValue:=Main.Trans;
  VerLabel.Caption:='Version: '+Main.Version;
  CompileDate.Caption:='Kompileret den: '+GetCompiledDate;
end;

procedure TAboutForm.IconDblClick(Sender: TObject);
begin
  ShowMessage('At leve er mere end bare at holde sig i live...'+#10+
              'Keep your head up, and keep coding!    // Neo');
end;

end.
