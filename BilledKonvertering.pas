unit BilledKonvertering;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtDlgs, StdCtrls,
  ImageDLLLoader, ICOLoader, JPEGLoader, PNGLOader, HIPSLoader, BMPLoader, PCXLoader,
  LinarBitmap, ExtCtrls, FileUtils, Menus, Main, Buttons, ToolWin, ComCtrls;

type
  TBilledKonvertForm = class(TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    SaveDialog1: TSaveDialog;
    Image1: TImage;
    ToolBar1: TToolBar;
    AabenKnap: TBitBtn;
    GemKnap: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure AabenKnapClick(Sender: TObject);
    procedure GemKnapClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BilledKonvertForm: TBilledKonvertForm;

implementation

{$R *.dfm}

// Indlæser DLL fil og variabler.
procedure TBilledKonvertForm.FormCreate(Sender: TObject);
begin
  AlphaBlendValue:=Main.Trans;
  ImageDLLLoader.Default.FindDLLs(ProgramPath);
end;

// Åbner det valgte billede.
procedure TBilledKonvertForm.AabenKnapClick(Sender: TObject);
begin
  OpenPictureDialog1.Filter:='Alle billeder ('+BitmapLoaders.GetLoadFilter;
  if OpenPictureDialog1.Execute then
    with TLinearBitmap.Create do
      try
        Image1.Picture:=nil;
        LoadFromFile(OpenPictureDialog1.FileName);
        AssignToTBitmap(Image1.Picture.Bitmap);
        if Image1.Picture.Width < BilledKonvertForm.Width
          then Image1.Stretch:=false;
        if Image1.Picture.Height < BilledKonvertForm.Width
          then Image1.Stretch:=false;
      finally
        Free;
      end;
end;

// Gemmer billedet i det valgte format.
procedure TBilledKonvertForm.GemKnapClick(Sender: TObject);
begin
  SaveDialog1.Filter:=BitmapLoaders.GetSaveFilter;
  if SaveDialog1.Execute then
    with TLinearBitmap.Create do
      try
        GetFromTBitmap(Image1.Picture.Bitmap);
        // For at komprimere JPEG2000 filer til 5% af raw bitmap
        // størrelse, indstil:
        // ImageDLLLoader.Default.CompOptions:='rate=0.05';
        SaveToFile(SaveDialog1.FileName);
      finally
        Free;
      end;
end;

end.
