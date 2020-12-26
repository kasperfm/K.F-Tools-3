object LocalIpForm: TLocalIpForm
  Left = 370
  Top = 287
  BorderStyle = bsToolWindow
  Caption = 'IP Adresse'
  ClientHeight = 86
  ClientWidth = 199
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object OKBtn: TButton
    Left = 120
    Top = 56
    Width = 75
    Height = 25
    Caption = '&Ok'
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object IpEdit: TLabeledEdit
    Left = 8
    Top = 24
    Width = 185
    Height = 21
    EditLabel.Width = 145
    EditLabel.Height = 13
    EditLabel.Caption = 'Din netv'#230'rks ip adresse:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
end
