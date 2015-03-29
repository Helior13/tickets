object fmPlug: TfmPlug
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1088#1080#1093#1086#1076
  ClientHeight = 264
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    330
    264)
  PixelsPerInch = 96
  TextHeight = 13
  object lbAutoName: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 10
    Width = 324
    Height = 25
    Margins.Top = 10
    Align = alTop
    Alignment = taCenter
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1072#1074#1090#1086#1084#1072#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 236
  end
  object lbDate: TLabel
    Left = 66
    Top = 102
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object lbComment: TLabel
    Left = 25
    Top = 147
    Width = 67
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edPlug: TLabeledEdit
    Left = 96
    Top = 57
    Width = 145
    Height = 21
    EditLabel.Width = 38
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1088#1080#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    ParentFont = False
    TabOrder = 1
    Text = '2000'
  end
  object btnOK: TButton
    Left = 56
    Top = 215
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 200
    Top = 215
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object dtDate: TDateTimePicker
    Left = 96
    Top = 97
    Width = 145
    Height = 21
    Date = 41775.000000000000000000
    Time = 41775.000000000000000000
    DateFormat = dfLong
    TabOrder = 3
  end
  object mmComment: TMemo
    Left = 98
    Top = 144
    Width = 143
    Height = 49
    TabOrder = 4
  end
end
