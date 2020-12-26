unit FilKryptering;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Gauges, FileCtrl, main, ImgList;

type
  TEncDecForm = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Gauge1: TGauge;
    OpenFile: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    KryptKey: TLabeledEdit;
    Label1: TLabel;
    procedure OpenFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EncDecForm: TEncDecForm;
  Key: integer;

implementation

{$R *.dfm}

procedure TEncDecForm.OpenFileClick(Sender: TObject);
var
  filetoopen, filetowriteto : string;
  file1, file2 : tfilestream;
  buff, readbuff : char;
  dummy1 : integer;
begin
  if KryptKey.Text='' then
    Key:=39 else
      key:=StrToInt(KryptKey.Text);
    
  opendialog1.Filter := 'All files|*.*';

  if radiobutton1.Checked = true then
    gauge1.Progress :=0
      else
        gauge1.Progress :=Gauge1.MaxValue;

  if opendialog1.Execute then
    begin
      filetoopen := opendialog1.FileName;
      savedialog1.Filter :='All Files|*.*';

      if savedialog1.Execute then
        begin
          filetowriteto := savedialog1.FileName;
          file1 :=tfilestream.Create(filetoopen,fmopenread);
          file2 := tfilestream.Create(filetowriteto,fmopenwrite or fmcreate or fmsharedenywrite);
          gauge1.MaxValue :=file1.Size;

          for dummy1 := 0 to file1.Size -1 do
            begin
              file1.Read(buff,sizeof(buff));

              if radiobutton1.Checked = true then
                readbuff := char(pchar(buff)+ Key)
                  else
                    readbuff :=char(pchar(buff) - Key);

              file2.Write(readbuff,sizeof(readbuff));
              if radiobutton1.Checked = true then
                gauge1.Progress :=gauge1.Progress + 1
                  else
                    gauge1.Progress := gauge1.Progress -1;
            end;
          end;

          file1.Free;
          file2.Free;
    end;
end;

procedure TEncDecForm.FormCreate(Sender: TObject);
begin
  AlphaBlendValue:=Main.Trans;
end;

end.
