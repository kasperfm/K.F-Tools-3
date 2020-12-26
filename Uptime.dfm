object UptimeForm: TUptimeForm
  Left = 235
  Top = 167
  BorderStyle = bsToolWindow
  Caption = 'Uptime'
  ClientHeight = 53
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 45
    Height = 13
    Caption = 'Uptime:'
  end
  object TimeLabel: TLabel
    Left = 56
    Top = 8
    Width = 12
    Height = 13
    Caption = '...'
  end
  object OkBtn: TButton
    Left = 304
    Top = 24
    Width = 75
    Height = 25
    Caption = '&Ok'
    TabOrder = 0
    OnClick = OkBtnClick
  end
  object UptimeUpdateTimer: TTimer
    OnTimer = UptimeUpdateTimerTimer
    Left = 248
    Top = 16
  end
end
