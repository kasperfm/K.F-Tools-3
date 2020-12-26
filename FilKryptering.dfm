object EncDecForm: TEncDecForm
  Left = 192
  Top = 107
  AlphaBlend = True
  BorderStyle = bsToolWindow
  Caption = 'Fil kryp-/dekryptering'
  ClientHeight = 201
  ClientWidth = 184
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 8
    Top = 144
    Width = 161
    Height = 17
    ForeColor = clTeal
    Progress = 0
  end
  object Label1: TLabel
    Left = 16
    Top = 184
    Width = 143
    Height = 13
    Caption = 'Koden m'#229' kun v'#230're tal !'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object OpenFile: TButton
    Left = 8
    Top = 112
    Width = 161
    Height = 25
    Caption = '&Krypter/Dekrypter'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = OpenFileClick
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 56
    Width = 161
    Height = 17
    Caption = 'Krypter'
    Checked = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 8
    Top = 80
    Width = 161
    Height = 17
    Caption = 'Dekrypter'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object KryptKey: TLabeledEdit
    Left = 8
    Top = 24
    Width = 161
    Height = 21
    Hint = 'Hvis der ikke skrives nogen kode er den som standard: 39'
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = 'Krypteringsn'#248'lge'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    Left = 192
    Top = 64
  end
  object SaveDialog1: TSaveDialog
    Left = 224
    Top = 64
  end
end
