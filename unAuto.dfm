object fmAuto: TfmAuto
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1040#1074#1090#1086#1084#1072#1090
  ClientHeight = 255
  ClientWidth = 370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmAuto
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbDate: TLabel
    Left = 12
    Top = 108
    Width = 120
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1085#1103#1090#1080#1103' '#1087#1086#1082#1072#1079#1072#1085#1080#1081
  end
  object lbComment: TLabel
    Left = 63
    Top = 147
    Width = 67
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object lbCounter: TLabel
    Left = 26
    Top = 67
    Width = 104
    Height = 13
    Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1089#1095#1077#1090#1095#1080#1082#1072
  end
  object edAuto_name: TLabeledEdit
    Left = 136
    Top = 24
    Width = 186
    Height = 21
    EditLabel.Width = 124
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1072#1074#1090#1086#1084#1072#1090#1072
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object mmComment: TMemo
    Left = 136
    Top = 144
    Width = 186
    Height = 41
    TabOrder = 4
  end
  object dtDate: TDateTimePicker
    Left = 136
    Top = 104
    Width = 186
    Height = 21
    Date = 41779.000000000000000000
    Time = 41779.000000000000000000
    DateFormat = dfLong
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 231
    Top = 208
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object btnOK: TButton
    Left = 63
    Top = 208
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
  object edCounter: TEdit
    Left = 136
    Top = 64
    Width = 186
    Height = 21
    TabOrder = 1
  end
end
