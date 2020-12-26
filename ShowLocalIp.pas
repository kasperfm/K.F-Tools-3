unit ShowLocalIp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, winsock;

type
  TLocalIpForm = class(TForm)
    OKBtn: TButton;
    IpEdit: TLabeledEdit;
    procedure OKBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LocalIpForm: TLocalIpForm;

implementation

// Finder din lokale IPv4 adresse
function GetLocalIP: string;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array [0..63] of Ansichar;
  i: Integer;
  GInitData: TWSADATA;
begin
  WSAStartup($101, GInitData);
  Result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe := GetHostByName(Buffer);
  if phe = nil then
    Exit;
  pptr := PaPInAddr(phe^.h_addr_list);
  i := 0;
  while pptr^[i] <> nil do
  begin
    Result := string(inet_ntoa(pptr^[i]^));
    Inc(i);
  end;
  WSACleanup;
end;


{$R *.dfm}

procedure TLocalIpForm.OKBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TLocalIpForm.FormActivate(Sender: TObject);
begin
  IpEdit.Text:=GetLocalIp;
end;

end.
