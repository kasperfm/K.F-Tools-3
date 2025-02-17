object IndstillingerForm: TIndstillingerForm
  Left = 304
  Top = 190
  AlphaBlend = True
  BorderStyle = bsToolWindow
  Caption = 'Indstillinger'
  ClientHeight = 415
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Indstillinger: TGroupBox
    Left = 8
    Top = 8
    Width = 257
    Height = 361
    Caption = 'Indstillinger for K.F Tools'
    TabOrder = 0
    object AlphaLabel: TLabel
      Left = 8
      Top = 304
      Width = 104
      Height = 13
      Caption = 'Gennemsigtighed:'
    end
    object Label1: TLabel
      Left = 232
      Top = 344
      Width = 19
      Height = 13
      Caption = 'Min'
      Transparent = True
    end
    object Label2: TLabel
      Left = 8
      Top = 344
      Width = 23
      Height = 13
      Caption = 'Max'
    end
    object Label3: TLabel
      Left = 8
      Top = 192
      Width = 139
      Height = 13
      Caption = 'Harddiskstatus for drev:'
    end
    object Label4: TLabel
      Left = 8
      Top = 136
      Width = 111
      Height = 13
      Caption = 'Statusbesked type:'
    end
    object AlphaBlendBar: TTrackBar
      Left = 8
      Top = 320
      Width = 241
      Height = 21
      Max = 255
      Min = 25
      Position = 150
      TabOrder = 0
      TickStyle = tsNone
    end
    object AutoStart: TCheckBox
      Left = 8
      Top = 24
      Width = 241
      Height = 17
      Caption = 'Start samtidig med Windows.'
      TabOrder = 1
    end
    object NotePath: TLabeledEdit
      Left = 8
      Top = 264
      Width = 241
      Height = 21
      EditLabel.Width = 110
      EditLabel.Height = 13
      EditLabel.Caption = 'Filnavn for "Noter":'
      TabOrder = 2
      Text = 'noter.txt'
    end
    object AutoRadio: TCheckBox
      Left = 8
      Top = 48
      Width = 241
      Height = 17
      Caption = 'Start NetRadio ved program start.'
      TabOrder = 3
    end
    object Advanceret: TCheckBox
      Left = 8
      Top = 72
      Width = 233
      Height = 17
      Caption = 'Advanceret tilstand.'
      TabOrder = 4
    end
    object Harddisk: TDriveComboBox
      Left = 8
      Top = 208
      Width = 241
      Height = 19
      TabOrder = 5
    end
    object MineGenvejeBtn: TBitBtn
      Left = 8
      Top = 96
      Width = 241
      Height = 25
      Caption = #197'bn mappen "Mine genveje"'
      Glyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000101
        0100020202000303030004040400050505000606060007070700080808000909
        09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
        1100121212001313130014141400151515001616160017171700181818001919
        19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
        2100222222002323230024242400252525002626260027272700282828002929
        29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
        3100323232003333330034343400353535003636360037373700383838003939
        39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
        4100424242004343430044444400454545004646460047474700484848004949
        49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005C4B
        5C007A3F7A009F2E9F00C21DC200E60CE600F604F600FB01FB00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00FE00
        FE00FE00FE00FE01FE00FD01FD00FC03FC00FA05FA00F708F700F30DF300ED14
        ED00E41FE400D630D600C347C300B25EB200A86DA8009C7D9C00968796009191
        9100929292009393930094949400959595009696960097979700989898009999
        99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
        A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
        A900AAAAAA00ABABAB00ACACAC00B0B2B200B4B7B700B8BCBC00BFC7C800C5D1
        D100CBD8D900CFDEDF00D5E5E500DAEAEA00DAEFF000D9F2F500D8F5F800D6F5
        F900D6F6FA00D0F5FA00CDF5FA00C9F4FA00C3F3F900BDF2F800B8F2F900B1F3
        F900AAF3FA00A0F4FB0098F5FC0092F7FD008EF7FD008BF7FD0089F6FD0087F4
        FD0084F3FD0083F1FD0080EEFC007DEBFC007BE9FB0078E6FB0074E2FA0073DF
        FA0071DCF9006CDAF90067D6F90063D2F80061D1F8005ECFF8005CCDF70059CB
        F70056C8F70053C6F6004FC2F20048BCED0041B5E4003BAFDF0035A9D80030A4
        D4002A9FD000269BCD002297C9001D91C4001A8EC200168ABE000F83B9000B7F
        B600097DB400087CB300077AB2000679B0000477AE000376AE000375AD000275
        AD000274AC000274AC000274AC000274AC000274AC000274AC000274AC000274
        AC000274AC000274AC000274AC000274AC000274AC000273AB0058F2F2F2F2F2
        F2F2F2F2F2F2F2585858F2E7DED5DCDCDCDCDCDCDCDCE4E85858F2E0E5D2DBDB
        DBDBDBDBDBDBE3C0F258F2D9F2C4D7D7D7D7D7D6D7D7E2C0F258F2D7E9D2CFD3
        D3D3D3D3D3D3E1C0EA58F2D3E2DFC4D0D0D0D0D0D0D0E0C0C0F2F2D0D8E8BAC0
        C0C0C0C0C0C0D2BABEF2F2CDCDE9F2F2F2F2F2F2F2F2F2F2F2F2F2CBCACACBCA
        CACBCACBCACAFF585858F2BAC8C8C8C7C7C8C7C7C8C7FF58585858F2BAC6C6C6
        F2F2F2F2F2F2585858585858F2F2F2F258585858585858585858585858585858
        58585858585858585858}
      TabOrder = 6
    end
    object BalloonType: TComboBox
      Left = 8
      Top = 152
      Width = 241
      Height = 21
      TabOrder = 7
      Text = 'Harddiskstatus'
      Items.Strings = (
        'Harddiskstatus'
        'Uptime')
    end
  end
  object GemBtn: TBitBtn
    Left = 104
    Top = 384
    Width = 161
    Height = 25
    Hint = 'Gem indstillingerne'
    Caption = '&Gem indstillinger'
    Glyph.Data = {
      76030000424D7603000000000000360000002800000011000000100000000100
      1800000000004003000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000C06860B05850A05050A05050
      A050509048509048409048408040408038408038407038407038300000000000
      0000000000D06870F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0
      505050A04030A04030A0383070384000000000000000000000D07070FF98A0F0
      8880E08080705850404030907870F0E0E0F0E8E0908070A04030A04040A04030
      80384000000000000000000000D07870FFA0A0F09090F0888070585000000040
      4030F0D8D0F0E0D0807860B04840B04840A04040804040000000000000000000
      00D07880FFA8B0FFA0A0F09090705850705850705850705850706050806860C0
      5850B05050B0484080404000000000000000000000E08080FFB0B0FFB0B0FFA0
      A0F09090F08880E08080E07880D07070D06870C06060C05850B0505090484000
      000000000000000000E08890FFB8C0FFB8B0D06060C06050C05850C05040B050
      30B04830A04020A03810C06060C0585090484000000000000000000000E09090
      FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
      10C0606090485000000000000000000000E098A0FFC0C0D07070FFFFFFFFFFFF
      FFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A04020D06860A050500000000000
      0000000000F0A0A0FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0
      F0E8E0F0D8D0B04830D07070A0505000000000000000000000F0A8A0FFC0C0E0
      8080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B05030E07880
      A0505000000000000000000000F0B0B0FFC0C0F08890FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF8F0F0F0F0C05040603030B05850000000000000000000
      00F0B0B0FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F8F0C05850B05860B0586000000000000000000000F0B8B0F0B8B0F0B0B0F0B0
      B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D07880D07870D0707000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = GemBtnClick
  end
  object CloseBtn: TBitBtn
    Left = 8
    Top = 384
    Width = 75
    Height = 25
    Caption = '&Luk'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF01014E00006000
      006500006000004FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF01014E00008400008E00008E00008F00008C000088000081010154FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF01016300009600009700009B00009F00
      00A000009D00009700008F000088000062FF00FFFF00FFFF00FFFF00FF01015D
      0101A308089E9999D46868D00000AC0000AE0000A94848B8B7B7E32727A50000
      8C010152FF00FFFF00FFFF00FF03039D0000AB2828A3DEDED2FEFEFF6464D400
      00B34646C0E7E7ECFFFFF75E5EB700009A020287FF00FFFF00FFFF00FF0505B0
      0303B90000C24C4CA7E6E6D9FCFCFF9E9EE6E8E9F4FFFFF17575B90606B10101
      AB0202A0FF00FFFF00FFFF00FF0808BB0707C80505D10000C85353B6F2F2EDFF
      FFFFFFFFFC7575C90000BE0101C30303B80303ACFF00FFFF00FFFF00FF0C0CC9
      0D0DD80B0BDC0000D63C3DCEEEEFEDFFFFFFFFFFFD5858DB0000CA0303CB0606
      C50606B8FF00FFFF00FFFF00FF1414D81717EA0B0BF14343DBE4E4EAFDFDF5BA
      BAD4EAEAE8FEFEFF6363E50303D70A0ACF0A0AC3FF00FFFF00FFFF00FF1A1AE4
      2222FB3F3FE9DCDCE5FDFDEE7373C50303D75151B0E3E3D6FFFFFE6161E50808
      DB0F0FCAFF00FFFF00FFFF00FF1515EC3232FF5252EDB3B3C27777CA0000EA00
      00EC0000E85252B4ADADB04D4DE11818ED0F0FAEFF00FFFF00FFFF00FFFF00FF
      2A2AFB5353FF6868EF5757F93838FF2525FD2929FF3838FC4242EB3232FF1F1F
      E9FF00FFFF00FFFF00FFFF00FFFF00FF0C0DF53535FD6E6EFF9191FF9393FF84
      84FF7676FF6767FF5151FF2F2FFBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF2D2DFC6363FE8787FF9292FF7676FF5353FF2C2CF0FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 2
    OnClick = CloseBtnClick
  end
end
