unit GoogleSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, shellapi, main;

type
  TWebFind = class(TForm)
    Sogeord: TLabeledEdit;
    SogBtn: TBitBtn;
    TopLabel: TLabel;
    ComboBox1: TComboBox;
    procedure SogBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebFind: TWebFind;

implementation

{$R *.dfm}

procedure TWebFind.SogBtnClick(Sender: TObject);
var
  Sog: string;
  Sog2: string;
begin
  if ComboBox1.ItemIndex = 0 then
    begin
      sog:='http://www.google.dk/search?hl=da&q=';
      ShellExecute(handle,'open',PChar(sog+Sogeord.Text),nil,nil,sw_shownormal);
    end
  else
  if ComboBox1.ItemIndex = 1 then
    begin
      sog:='http://search.jubii.dk/cgi-bin/pursuit?query=';
      sog2:='&cat=loc';
      ShellExecute(handle,'open',PChar(sog+Sogeord.text+sog2),nil,nil,sw_shownormal);
    end
  else
  if ComboBox1.ItemIndex = 2 then
    begin
      sog:='http://www.altavista.com/web/results?itag=wrx&q=';
      sog2:='&kgs=1&kls=0';
      ShellExecute(handle,'open',PChar(sog+Sogeord.text+sog2),nil,nil,sw_shownormal);
    end
  else
  if ComboBox1.ItemIndex = 3 then
    begin
      sog:='http://www.alltheweb.com/search?cat=web&cs=utf8&q=';
      sog2:='&rys=0&_sb_lang=pref';
      ShellExecute(handle,'open',PChar(sog+Sogeord.text+sog2),nil,nil,sw_shownormal);
    end
  else
  if ComboBox1.ItemIndex = 4 then
    begin
      sog:='http://search.yahoo.com/search?p=';
      sog2:='&sm=Yahoo%21+Search&fr=FP-tab-web-t&toggle=1';
      ShellExecute(handle,'open',PChar(sog+Sogeord.Text+sog2),nil,nil,sw_shownormal);
    end
  else
  if ComboBox1.ItemIndex = 5then
    begin
      sog:='http://www.eniro.dk/query?q=';
      sog2:='&what=dk&stq=0';
      ShellExecute(handle,'open',PChar(sog+Sogeord.Text+sog2),nil,nil,sw_shownormal);
    end
  else
  ShowMessage('Du har ikke valgt nogen søgemaskine!');
end;

procedure TWebFind.FormCreate(Sender: TObject);
begin
  AlphaBlendValue:=Main.Trans;
end;

end.
