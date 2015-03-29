object fmUsers: TfmUsers
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  ClientHeight = 183
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbName: TLabel
    Left = 19
    Top = 43
    Width = 93
    Height = 13
    Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  end
  object Label3: TLabel
    Left = 24
    Top = 85
    Width = 88
    Height = 13
    Caption = #1059#1088#1086#1074#1077#1085#1100' '#1076#1086#1089#1090#1091#1087#1072
  end
  object edUser: TEdit
    Left = 120
    Top = 40
    Width = 225
    Height = 21
    TabOrder = 0
  end
  object cbLevel: TComboBox
    Left = 120
    Top = 80
    Width = 225
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 1
    Text = #1053#1077#1090' '#1076#1086#1089#1090#1091#1087#1072
    Items.Strings = (
      #1053#1077#1090' '#1076#1086#1089#1090#1091#1087#1072
      #1054#1087#1077#1088#1072#1090#1086#1088
      #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088)
  end
  object btnCancel: TButton
    Left = 270
    Top = 136
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object btnOK: TButton
    Left = 88
    Top = 136
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
end
