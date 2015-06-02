object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = #1059#1095#1077#1090' '#1073#1080#1083#1077#1090#1086#1074
  ClientHeight = 500
  ClientWidth = 800
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    800
    500)
  PixelsPerInch = 96
  TextHeight = 13
  object lbDate: TLabel
    Left = 433
    Top = 12
    Width = 211
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1055#1077#1088#1080#1086#1076' '#1089'                                                   '#1087#1086
    ExplicitLeft = 501
  end
  object dtDateBegin: TDateTimePicker
    Left = 485
    Top = 8
    Width = 139
    Height = 21
    Anchors = [akTop, akRight]
    Date = 41775.000000000000000000
    Time = 41775.000000000000000000
    DateFormat = dfLong
    TabOrder = 1
    OnCloseUp = dtDateBeginCloseUp
  end
  object dtDateEnd: TDateTimePicker
    Left = 652
    Top = 8
    Width = 140
    Height = 21
    Anchors = [akTop, akRight]
    Date = 41775.000000000000000000
    Time = 41775.000000000000000000
    DateFormat = dfLong
    TabOrder = 2
    OnCloseUp = dtDateEndCloseUp
  end
  object pnButtons: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 200
    Height = 494
    Align = alLeft
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 3
    object imgLogo: TImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 190
      Height = 40
      Align = alTop
      Proportional = True
      ExplicitLeft = 8
      ExplicitTop = 0
    end
    object pnOperator: TPanel
      Left = 0
      Top = 46
      Width = 196
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Caption = #1054#1087#1077#1088#1072#1090#1086#1088
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = pnChooseTab
    end
    object pnAdmin: TPanel
      Tag = 1
      Left = 0
      Top = 87
      Width = 196
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = pnChooseTab
    end
    object pnLog: TPanel
      Tag = 4
      Left = 0
      Top = 210
      Width = 196
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Caption = #1046#1091#1088#1085#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = pnChooseTab
    end
    object pnUsers: TPanel
      Tag = 3
      Left = 0
      Top = 169
      Width = 196
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = pnChooseTab
    end
    object pnAutomat: TPanel
      Tag = 2
      Left = 0
      Top = 128
      Width = 196
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Caption = #1040#1074#1090#1086#1084#1072#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      OnClick = pnChooseTab
    end
    object pnSettings: TPanel
      Tag = 5
      Left = 0
      Top = 251
      Width = 196
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      OnClick = pnChooseTab
    end
  end
  object nbTabs: TNotebook
    AlignWithMargins = True
    Left = 209
    Top = 35
    Width = 588
    Height = 462
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnClick = nbTabsClick
    object TPage
      Left = 0
      Top = 0
      Caption = 'pOperator'
      object sgOperator: TStringGrid
        Tag = 4
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 582
        Height = 459
        Margins.Bottom = 0
        Align = alClient
        ColCount = 4
        Ctl3D = True
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
        ParentCtl3D = False
        PopupMenu = PopupMenu
        TabOrder = 0
        OnDblClick = sgOperatorDblClick
        OnDrawCell = sgDrawCell
        OnExit = sgOperatorExit
        OnKeyPress = sgOperatorKeyPress
        ColWidths = (
          30
          200
          60
          350)
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'pAdmin'
      object sgAdmin: TStringGrid
        Tag = 9
        AlignWithMargins = True
        Left = 3
        Top = 27
        Width = 582
        Height = 435
        Margins.Bottom = 0
        Align = alClient
        ColCount = 9
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        ParentFont = False
        TabOrder = 0
        OnDblClick = sgAdminDblClick
        OnDrawCell = sgAdminDrawCell
        OnExit = sgAdminExit
        ColWidths = (
          30
          200
          106
          120
          105
          100
          110
          110
          60)
      end
      object tbAdmin: TToolBar
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 582
        Height = 21
        Margins.Bottom = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object btnExcelExp: TSpeedButton
          Left = 0
          Top = 0
          Width = 23
          Height = 22
          Hint = #1069#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' Excel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            080000000000000100000000000000000000000100000000000000000000F4F1
            E800FBFAF600ECE6D600C98C3600CBDACC0098988E006D9B7000D8A25300D7D7
            CB00FFCF5600C5C0B20096C69A00CDCDC100D5B286001F773C00C7C7BB00C3C3
            B700BFBFB300BBBBAF00B9B9AD009BB09C00B27A4100B7B7AB00B5B5A900AFAF
            A300F2EEE400FFD66B0060A86400F9F7F200EAE3D200FEFEFE00BA7F3900F0EC
            DF008BBD90005C7E600028683200E0D1B400E8BE79009FB3A100A8A8A000E5EC
            E5001E703900D4D4C300D6E2D6001A5E350085A98700F8D37900C58D4F009A9A
            8F00BC803C008DC49300D1AE8400F6F4ED00E7E0CD00EEE9DB001E6F3A0058A0
            610055985E00D4983700EDAF2F003B88470022713B00FFD0590099998F00D198
            45003F924800529E5800DCDCD000D8D8CC00D2D2C60058A25B00277D3A00CACA
            BE00C8C8BC00C6C6BA00D0AE8B00C2C2B6001E683B00BEBEB200AAAAA100F6C2
            4A0035894200B4B4A80048975200B0B0A400ACACA00070A574009C9C9000FFFF
            FF0091C496008EC29300C99C6A00E8E0CD00DFE9DF001B633600D0CDBF00FFD6
            6C0065AC6A00CFDDCF0099998E00C0D1C000C4BDB000D9B89300FDFCFB000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000058314064
            0606060664403158000000002859595959595959591F68500000000056595959
            59592E2A2D230219000000005559220F385F22424E271D180000000053595922
            435A473E075E351400000000175959630C4748246535014F0000000013592933
            625257393D2C1A110000000012595B1C5429053A3A15214A000000004D591F68
            021D35011A21370D000000004B4C164C1D35011A2137034600000000495C3C04
            34011A2137031E090000673020323B51410E3637031E5D440000262F1B3F0A0A
            61082503666666660000673020323B51410E361E0B592B0000000000455C3C04
            34031E5D602B0000000000004A4C164C10101010100000000000}
          ParentFont = False
          OnClick = btnExcelExpClick
        end
        object btnPrint: TSpeedButton
          Left = 23
          Top = 0
          Width = 23
          Height = 22
          Hint = #1055#1077#1095#1072#1090#1100
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFB8B8AA9F9F8D9F9F8D9F9F8D9F9F8D9F9F8D9F9F8D9F9F8D946C3BA064
            26DBC0A5FFFFFFFFFFFFF2F2F2E5E5E5E5E5E5AAAA99FFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFDFEFEFDFDFDFBB87C3DFFC12CB37738D0B79BF2F2F2959595838383
            838383787878E5E5E5E58743E5B38EC1B49599752FA9671CAF6A1FB67A36DDA1
            37FFCE51AA6D2C99836C989898C5BDBDC5BABA59595959595959595959595959
            5959D7A142FFE088FFD362FFCF56FFCF56FFCF56FFD974BA7E3AA1A1A1C4C1C1
            B8B0B06F6C6C968A8A958888968787968787AF7C47C68740C68740A76724DDAD
            5BFFE290D1914BAA9377AAAAAAB8B8B8A5A5A52020206054545A4D4D5A4D4D5A
            4D4D5A4D4D5A4D4D5A4D4DC5863CFFE599D2964CC1A685AAAAAABDBDBDCECECE
            BEBEBE3131315C55554D44444D44444D44444D44444D44444D4444AA7941C488
            3C95DC58BEB3B3BDBDBDD0D0D0C0C0C0C9C9C9444444676666494646403C3C3F
            3B3B3F3B3B3F3B3B3F3B3B484444444444BBB1B1AFAAAAD0D0D0E2E2E2BABABA
            DADADA5858587676766666665F5F5F5251514443433C3B3B3736364A49495858
            58BFBABAB2B0B0E2E2E2F1F1F1BCBCBCE8E8E86868688383837D7D7D7D7D7D7D
            7D7D7D7D7D7D7D7D7C7C7C808080686868E4E4E4BBBBBBF1F1F1FDFDFDCACACA
            B9B9B97474747575757575757575757575757575757575757575757575757474
            74B9B9B9CACACAFDFDFDFFFFFFFFFFFFFFFFFFD5D5C4FAFAF4F5F5EDF2F2EAEE
            EEE2E8E8D9E6E6D5E5E5D4F2F2E1D5D5C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFD7D7C6FAFAF2F2F2EAEEEEE2E8E8D9E6E6D5B5B5A4B5B5A4B5B5A4B7B7
            A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D9C8F8F8F0EEEEE2E8E8D9E6
            E6D5E5E5D4C7C7B6FFFFFFD9D9C8F2F2EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFDBDBCAFBFBEFF5F5E5F3F3E2F2F2E1F2F2E1D3D3C2DBDBCAF2F2ECFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5D8DCDCCCDCDCCCDCDCCCDC
            DCCCDCDCCCDCDCCCF2F2EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btnPrintClick
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'pAutomats'
      object sgAutomats: TStringGrid
        Tag = 5
        AlignWithMargins = True
        Left = 3
        Top = 27
        Width = 582
        Height = 435
        Margins.Bottom = 0
        Align = alClient
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goRowSelect]
        ParentFont = False
        TabOrder = 0
        OnDblClick = btnEditAutoClick
        OnDrawCell = sgDrawCell
        ColWidths = (
          30
          200
          60
          70
          300)
        RowHeights = (
          24
          24)
      end
      object tbAuto: TToolBar
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 582
        Height = 21
        Margins.Bottom = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnExit = tbAutoExit
        object btnAddAuto: TSpeedButton
          Left = 0
          Top = 0
          Width = 23
          Height = 22
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1074#1090#1086#1084#1072#1090
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FF64B89C64B89CFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF64B89C98
            EEC998EEC964B89CFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FF64B89C5EE1A35EE1A364B89CFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF64B89C63
            E5A863E5A864B89CFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FF64B89C64B89C64B89C64B89C67E9AD67E9AD64B89C64B89C64B89C64B8
            9CFB00FFFB00FFFB00FFFB00FFFB00FF64B89CA7F6D5A7F6D5A7F6D5A7F6D56D
            EDB26DEDB2A7F6D5A7F6D5A7F6D5A7F6D564B89CFB00FFFB00FFFB00FFFB00FF
            64B89C72F2B872F2B872F2B872F2B872F2B872F2B872F2B872F2B872F2B872F2
            B864B89CFB00FFFB00FFFB00FFFB00FFFB00FF64B89C64B89C64B89C64B89C76
            F6BD76F6BD64B89C64B89C64B89C64B89CFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FF64B89C7BFAC27BFAC264B89CFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF64B89C7E
            FDC57EFDC564B89CFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FF64B89C81FFC881FFC864B89CFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF64
            B89C64B89CFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF}
          OnClick = btnAddAutoClick
        end
        object btnEditAuto: TSpeedButton
          Left = 23
          Top = 0
          Width = 23
          Height = 22
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FF7E7E7EBABABABABABABABABAFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            BABABABABABAE0E0E0E0E0E0BA945DFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFBABABAE0E0E0E0E0E0BA945DF9D79BBA
            945DFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            BABABAE0E0E0BA945DF6D199F4C57FF6D199BA945DFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFBA945DF0C894ECBA79ECBA79EC
            BA79F0C894BA945DFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFBA945DEABF8FE5AF73E5AF73E5AF73EABF8FBA945DFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFBA945DE5B98CDF
            A76FDFA76FDFA76FE5B98C5654B0FB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFBA945DE9BE8FE4AE73E4AE735654B07859F65654
            B0FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFBA
            945DF9D79B5654B05345DC5345DC5654B0FB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FF5654B07859F67859F65654B0FB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FF5654B05654B0FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF}
          OnClick = btnEditAutoClick
        end
        object btnDeleteAuto: TSpeedButton
          Left = 46
          Top = 0
          Width = 23
          Height = 22
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1072#1074#1090#1086#1084#1072#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF6464B86464B8FB00FFFB
            00FFFB00FFFB00FF6464B86464B8FB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FF6464B89898EE9898EE6464B8FB00FFFB00FF6464B89898EE9898EE6464
            B8FB00FFFB00FFFB00FFFB00FFFB00FFFB00FF6464B86060E36060E39C9CF164
            64B86464B89C9CF16060E36060E36464B8FB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FF6464B86666E86666E8A1A1F3A1A1F36666E86666E86464B8FB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF6464B86D6DED6D
            6DED6D6DED6D6DED6464B8FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FF6464B87373F37373F37373F37373F36464B8FB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF6464B8B0B0FB7979F879
            79F87979F87979F8B0B0FB6464B8FB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FF6464B8B3B3FD7E7EFC7E7EFC6464B86464B87E7EFC7E7EFCB3B3FD6464
            B8FB00FFFB00FFFB00FFFB00FFFB00FFFB00FF6464B88181FF8181FF6464B8FB
            00FFFB00FF6464B88181FF8181FF6464B8FB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FF6464B86464B8FB00FFFB00FFFB00FFFB00FF6464B86464B8FB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF}
          ParentFont = False
          OnClick = btnDeleteAutoClick
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'pUsers'
      object tbUsers: TToolBar
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 582
        Height = 21
        Margins.Bottom = 0
        Caption = 'tbAuto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object btnAddUser: TSpeedButton
          Left = 0
          Top = 0
          Width = 23
          Height = 22
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FF64B89C64B89CFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF64B89C98
            EEC998EEC964B89CFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FF64B89C5EE1A35EE1A364B89CFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF64B89C63
            E5A863E5A864B89CFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FF64B89C64B89C64B89C64B89C67E9AD67E9AD64B89C64B89C64B89C64B8
            9CFB00FFFB00FFFB00FFFB00FFFB00FF64B89CA7F6D5A7F6D5A7F6D5A7F6D56D
            EDB26DEDB2A7F6D5A7F6D5A7F6D5A7F6D564B89CFB00FFFB00FFFB00FFFB00FF
            64B89C72F2B872F2B872F2B872F2B872F2B872F2B872F2B872F2B872F2B872F2
            B864B89CFB00FFFB00FFFB00FFFB00FFFB00FF64B89C64B89C64B89C64B89C76
            F6BD76F6BD64B89C64B89C64B89C64B89CFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FF64B89C7BFAC27BFAC264B89CFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF64B89C7E
            FDC57EFDC564B89CFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FF64B89C81FFC881FFC864B89CFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF64
            B89C64B89CFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF}
          OnClick = btnAddUserClick
        end
        object btnEditUsers: TSpeedButton
          Left = 23
          Top = 0
          Width = 23
          Height = 22
          Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FF7E7E7EBABABABABABABABABAFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            BABABABABABAE0E0E0E0E0E0BA945DFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFBABABAE0E0E0E0E0E0BA945DF9D79BBA
            945DFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            BABABAE0E0E0BA945DF6D199F4C57FF6D199BA945DFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFBA945DF0C894ECBA79ECBA79EC
            BA79F0C894BA945DFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFBA945DEABF8FE5AF73E5AF73E5AF73EABF8FBA945DFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFBA945DE5B98CDF
            A76FDFA76FDFA76FE5B98C5654B0FB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFBA945DE9BE8FE4AE73E4AE735654B07859F65654
            B0FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFBA
            945DF9D79B5654B05345DC5345DC5654B0FB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FF5654B07859F67859F65654B0FB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FF5654B05654B0FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB
            00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF}
          OnClick = btnEditUsersClick
        end
        object btnChangePass: TSpeedButton
          Left = 46
          Top = 0
          Width = 23
          Height = 22
          Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FB00FFFB00FF
            FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FF37A3CA37A3CA37A3CA37A3CA37
            A3CA37A3CA37A3CA37A3CA37A3CA37A3CAFB00FFFB00FFFB00FFFB00FFFB00FF
            37A3CAC1FFFFC1FFFFC1FFFFC1FFFFC1FFFFC1FFFFC1FFFFC1FFFFC1FFFFC1FF
            FF37A3CAFB00FFFB00FFFB00FFFB00FF37A3CABAFCFE74F8FD74F8FD74F8FD74
            F8FD74F8FD74F8FD74F8FD74F8FDBAFCFE37A3CAFB00FFFB00FFFB00FFFB00FF
            37A3CAAEF6FC5CECF95CECF95CECF95CECF95CECF95CECF95CECF95CECF9AEF6
            FC37A3CAFB00FFFB00FFFB00FFFB00FF37A3CAA2F0FB45E1F645E1F645E1F645
            E1F645E1F645E1F645E1F645E1F6A2F0FB37A3CAFB00FFFB00FFFB00FFFB00FF
            37A3CA9BECF936D9F336D9F336D9F336D9F336D9F336D9F336D9F336D9F39BEC
            F937A3CAFB00FFFB00FFFB00FFFB00FF37A3CAA2F0FB44E0F644E0F644E0F644
            E0F644E0F644E0F644E0F644E0F6A2F0FB37A3CAFB00FFFB00FFFB00FFFB00FF
            37A3CAC1FFFFC1FFFFC1FFFFC1FFFFC1FFFFC1FFFFC1FFFFC1FFFFC1FFFFC1FF
            FF37A3CAFB00FFFB00FFFB00FFFB00FFFB00FF37A3CA37A3CA37A3CA37A3CA37
            A3CA37A3CA37A3CA37A3CA37A3CA37A3CAFB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFB1AAA49D7565B1AAA4FB00FFFB00FFFB00FFFB00FFB1AAA49D7565B1AA
            A4FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFB1AAA4B99A8DB1AAA4FB00FFFB
            00FFFB00FFFB00FFB1AAA4B99A8DB1AAA4FB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFB1AAA4E0CEC4B1AAA4FB00FFFB00FFFB00FFFB00FFB1AAA4E0CEC4B1AA
            A4FB00FFFB00FFFB00FFFB00FFFB00FFFB00FFB1AAA4FDF5EEFDF5EEB1AAA4B1
            AAA4B1AAA4B1AAA4FDF5EEFDF5EEB1AAA4FB00FFFB00FFFB00FFFB00FFFB00FF
            FB00FFFB00FFB1AAA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1AAA4FB00
            FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFFB00FFB1AAA4B1AAA4B1
            AAA4B1AAA4B1AAA4B1AAA4FB00FFFB00FFFB00FFFB00FFFB00FF}
          OnClick = btnChangePassClick
        end
      end
      object sgUsers: TStringGrid
        Tag = 4
        AlignWithMargins = True
        Left = 3
        Top = 27
        Width = 582
        Height = 435
        Margins.Bottom = 0
        Align = alClient
        ColCount = 4
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 1
        OnDblClick = btnEditUsersClick
        OnDrawCell = sgDrawCell
        OnExit = sgUsersExit
        ColWidths = (
          30
          200
          105
          100)
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'pLog'
      object sgLog: TStringGrid
        Tag = 6
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 582
        Height = 459
        Margins.Bottom = 0
        Align = alClient
        ColCount = 6
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        OnDrawCell = sgDrawCell
        OnExit = sgLogExit
        ColWidths = (
          200
          200
          60
          90
          139
          300)
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'pSettings'
      object gbOrg: TGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 3
        Width = 568
        Height = 131
        Margins.Left = 10
        Margins.Right = 10
        Align = alTop
        Caption = #1051#1086#1075#1086#1090#1080#1087'  '#1080' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        TabOrder = 0
        DesignSize = (
          568
          131)
        object lbLogo: TLabel
          Left = 24
          Top = 88
          Width = 345
          Height = 13
          Caption = #1056#1077#1082#1086#1084#1077#1085#1076#1091#1077#1084#1086#1077' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077' '#1082#1072#1088#1090#1080#1085#1082#1080' 190'#1093'40, '#1092#1086#1088#1084#1072#1090' BMP '#1080#1083#1080' PNG'
        end
        object edOrgName: TLabeledEdit
          Left = 140
          Top = 34
          Width = 397
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 115
          EditLabel.Height = 13
          EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
          LabelPosition = lpLeft
          TabOrder = 0
          OnChange = edOrgNameChange
          OnExit = SaveSettings
        end
        object btnGetLogo: TButton
          Left = 440
          Top = 83
          Width = 99
          Height = 25
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1083#1086#1075#1086
          TabOrder = 1
          OnClick = btnGetLogoClick
        end
      end
      object gbStorage: TGroupBox
        AlignWithMargins = True
        Left = 10
        Top = 140
        Width = 568
        Height = 322
        Margins.Left = 10
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alTop
        Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086' '#1085#1077#1076#1086#1089#1090#1072#1090#1082#1077' '#1073#1080#1083#1077#1090#1086#1074
        TabOrder = 1
        object edQuantity: TLabeledEdit
          Left = 224
          Top = 34
          Width = 73
          Height = 21
          EditLabel.Width = 192
          EditLabel.Height = 13
          EditLabel.Caption = #1059#1074#1077#1076#1086#1084#1080#1090#1100' '#1082#1086#1075#1076#1072' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1084#1077#1085#1100#1096#1077
          LabelPosition = lpLeft
          TabOrder = 0
          OnExit = SaveSettings
        end
        object cbEmail: TCheckBox
          Left = 24
          Top = 67
          Width = 129
          Height = 17
          Caption = #1059#1074#1077#1076#1086#1084#1080#1090#1100' '#1087#1086' E-mail'
          TabOrder = 1
          OnClick = cbEmailClick
        end
        object edReceiver: TLabeledEdit
          Left = 192
          Top = 92
          Width = 281
          Height = 21
          EditLabel.Width = 164
          EditLabel.Height = 13
          EditLabel.Caption = #1040#1076#1088#1077#1089' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
          LabelPosition = lpLeft
          TabOrder = 2
          OnExit = SaveSettings
        end
        object edSender: TLabeledEdit
          Left = 192
          Top = 136
          Width = 281
          Height = 21
          EditLabel.Width = 162
          EditLabel.Height = 13
          EditLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
          LabelPosition = lpLeft
          TabOrder = 3
          OnExit = SaveSettings
        end
        object edSMTP: TLabeledEdit
          Left = 192
          Top = 217
          Width = 281
          Height = 21
          EditLabel.Width = 104
          EditLabel.Height = 13
          EditLabel.Caption = #1040#1076#1088#1077#1089' SMTP '#1089#1077#1088#1074#1077#1088#1072
          LabelPosition = lpLeft
          TabOrder = 5
          OnExit = SaveSettings
        end
        object edPass: TLabeledEdit
          Left = 192
          Top = 177
          Width = 281
          Height = 21
          EditLabel.Width = 106
          EditLabel.Height = 13
          EditLabel.Caption = #1055#1072#1088#1086#1083#1100' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
          LabelPosition = lpLeft
          PasswordChar = '*'
          TabOrder = 4
          OnExit = SaveSettings
        end
        object edPort: TLabeledEdit
          Left = 192
          Top = 258
          Width = 73
          Height = 21
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = #1053#1086#1084#1077#1088' '#1087#1086#1088#1090#1072
          LabelPosition = lpLeft
          TabOrder = 6
          OnExit = SaveSettings
        end
      end
    end
  end
  object cbMonth: TComboBox
    Left = 209
    Top = 8
    Width = 128
    Height = 21
    Style = csDropDownList
    TabOrder = 4
    OnChange = cbMonthChange
    Items.Strings = (
      #1071#1085#1074#1072#1088#1100
      #1060#1077#1074#1088#1072#1083#1100
      #1052#1072#1088#1090
      #1040#1087#1088#1077#1083#1100
      #1052#1072#1081
      #1048#1102#1085#1100
      #1048#1102#1083#1100
      #1040#1074#1075#1091#1089#1090
      #1057#1077#1085#1090#1103#1073#1088#1100
      #1054#1082#1090#1103#1073#1088#1100
      #1053#1086#1103#1073#1088#1100
      #1044#1077#1082#1072#1073#1088#1100)
  end
  object bsOperator: TBindSourceDB
    DataSet = DM.FDOperatorQuery
    ScopeMappings = <>
    Left = 16
    Top = 56
  end
  object PopupMenu: TPopupMenu
    Left = 16
    Top = 448
    object NCounter: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1089#1095#1077#1090#1095#1080#1082#1072
      OnClick = NCounterClick
    end
    object NPlug: TMenuItem
      Caption = #1055#1088#1080#1093#1086#1076' '#1073#1080#1083#1077#1090#1086#1074
      OnClick = sgOperatorDblClick
    end
    object NFixCounter: TMenuItem
      Caption = #1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1089#1095#1077#1090#1095#1080#1082#1072
      OnClick = NFixCounterClick
    end
  end
  object BindingsL: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 12
    Top = 405
    object LinkOperator: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bsOperator
      GridControl = sgOperator
      Columns = <
        item
          MemberName = 'ID'
          Width = 30
        end
        item
          MemberName = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 200
        end
        item
          MemberName = #1054#1089#1090#1072#1090#1086#1082
          Width = 60
        end
        item
          MemberName = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          Width = 350
        end>
    end
    object LinkAutomats: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bsAutomats
      GridControl = sgAutomats
      Columns = <
        item
          MemberName = 'ID'
          Width = 30
        end
        item
          MemberName = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 200
        end
        item
          MemberName = #1057#1095#1077#1090#1095#1080#1082
          Width = 60
        end
        item
          MemberName = #1044#1072#1090#1072
          Width = 70
        end
        item
          MemberName = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          Width = 300
        end>
    end
    object LinkAdmin: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bsAdmin
      GridControl = sgAdmin
      Columns = <
        item
          MemberName = 'ID'
          Width = 30
        end
        item
          MemberName = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 200
        end
        item
          MemberName = #1057#1095#1077#1090#1095#1080#1082' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
          Width = 106
        end
        item
          MemberName = #1042#1089#1090#1072#1074#1083#1077#1085#1086' '#1079#1072' '#1087#1077#1088#1080#1086#1076
          Width = 120
        end
        item
          MemberName = #1042#1099#1076#1072#1085#1086' '#1079#1072' '#1087#1077#1088#1080#1086#1076
          Width = 105
        end
        item
          MemberName = #1057#1095#1077#1090#1095#1080#1082' '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
          Width = 100
        end
        item
          MemberName = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072
          Width = 110
        end
        item
          MemberName = #1042#1099#1088#1091#1095#1082#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076
          Width = 110
        end
        item
          MemberName = #1062#1077#1085#1072' '#1079#1072' 1'
          Width = 60
        end>
    end
    object LinkUsers: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bsUsers
      GridControl = sgUsers
      Columns = <
        item
          MemberName = 'ID'
          Width = 30
        end
        item
          MemberName = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          Width = 200
        end
        item
          MemberName = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          Width = 105
        end
        item
          MemberName = #1059#1088#1086#1074#1077#1085#1100' '#1076#1086#1089#1090#1091#1087#1072
          Width = 100
        end>
    end
    object LinkLog: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = bsLog
      GridControl = sgLog
      Columns = <
        item
          MemberName = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          Width = 200
        end
        item
          MemberName = #1040#1074#1090#1086#1084#1072#1090
          Width = 200
        end
        item
          MemberName = #1041#1080#1083#1077#1090#1099
          Width = 60
        end
        item
          MemberName = #1044#1072#1090#1072' '#1076#1074#1080#1078#1077#1085#1080#1103
          Width = 90
        end
        item
          MemberName = #1044#1072#1090#1072' '#1088#1077#1072#1083#1100#1085#1072#1103
          Width = 90
        end
        item
          MemberName = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          Width = 300
        end>
    end
    object LinkControlToField1: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsSettings
      FieldName = 'org_name'
      Control = edOrgName
      Track = True
    end
    object LinkControlToField3: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsSettings
      FieldName = 'receiver'
      Control = edReceiver
      Track = True
    end
    object LinkControlToField4: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsSettings
      FieldName = 'sender'
      Control = edSender
      Track = True
    end
    object LinkControlToField5: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsSettings
      FieldName = 'pass'
      Control = edPass
      Track = True
    end
    object LinkControlToField6: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsSettings
      FieldName = 'smtp'
      Control = edSMTP
      Track = True
    end
    object LinkControlToField7: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsSettings
      FieldName = 'port'
      Control = edPort
      Track = True
    end
    object LinkControlToField8: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsSettings
      FieldName = 'quantity'
      Control = edQuantity
      Track = True
    end
    object LinkControlToField9: TLinkControlToField
      Category = 'Quick Bindings'
      DataSource = bsSettings
      FieldName = 'alert'
      Control = cbEmail
      Track = True
    end
  end
  object bsAutomats: TBindSourceDB
    DataSet = DM.FDAutomatsQuery
    ScopeMappings = <>
    Left = 16
    Top = 136
  end
  object bsAdmin: TBindSourceDB
    DataSet = DM.FDAdminQuery
    ScopeMappings = <>
    Left = 16
    Top = 96
  end
  object bsUsers: TBindSourceDB
    DataSet = DM.FDUsersQuery
    ScopeMappings = <>
    Left = 16
    Top = 176
  end
  object bsLog: TBindSourceDB
    DataSet = DM.FDLogQuery
    ScopeMappings = <>
    Left = 16
    Top = 224
  end
  object bsSettings: TBindSourceDB
    DataSet = DM.FDSettings
    ScopeMappings = <>
    Left = 16
    Top = 280
  end
  object OpenLogoDlg: TOpenPictureDialog
    Filter = 
      'All (*.png;*.bmp)|*.gif;*.jpg;*.jpeg;*.png;*.bmp|Portable Networ' +
      'k Graphics (*.png)|*.png|Bitmaps (*.bmp)|*.bmp'
    Left = 59
    Top = 451
  end
end
