object QuickNotesForm: TQuickNotesForm
  Left = 211
  Top = 147
  Width = 333
  Height = 258
  AlphaBlend = True
  BorderStyle = bsSizeToolWin
  Caption = 'Noter'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Noter: TMemo
    Left = 0
    Top = 0
    Width = 325
    Height = 231
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyUp = NoterKeyUp
  end
end
