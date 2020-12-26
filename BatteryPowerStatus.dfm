object BatteryForm: TBatteryForm
  Left = 193
  Top = 107
  BorderStyle = bsToolWindow
  Caption = 'Batteri tilbage'
  ClientHeight = 85
  ClientWidth = 179
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
  object BatStatus: TLabel
    Left = 8
    Top = 8
    Width = 56
    Height = 13
    Caption = '#Batteri#'
  end
  object Button1: TButton
    Left = 96
    Top = 56
    Width = 75
    Height = 25
    Caption = '&Ok'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar: TProgressBar
    Left = 8
    Top = 24
    Width = 161
    Height = 16
    TabOrder = 1
  end
end
