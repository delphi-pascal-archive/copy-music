object Copy_Form: TCopy_Form
  Left = 209
  Top = 243
  BorderIcons = [biMinimize]
  BorderStyle = bsSingle
  Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' ...'
  ClientHeight = 122
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_TEK: TLabel
    Left = 8
    Top = 8
    Width = 91
    Height = 13
    Caption = #1050#1086#1087#1080#1088#1091#1077#1090#1089#1103' '#1092#1072#1081#1083':'
    Transparent = True
  end
  object lbl_ALL: TLabel
    Left = 8
    Top = 48
    Width = 70
    Height = 13
    Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1085#1086':'
    Transparent = True
  end
  object pb_TEK: TGauge
    Left = 8
    Top = 24
    Width = 490
    Height = 20
    ForeColor = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Progress = 0
  end
  object pb_TOTAL: TGauge
    Left = 8
    Top = 64
    Width = 490
    Height = 20
    ForeColor = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Progress = 0
  end
  object lbl_name: TLabel
    Left = 102
    Top = 8
    Width = 51
    Height = 13
    Caption = 'lbl_name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object bt_CANCEL: TButton
    Left = 216
    Top = 91
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    TabOrder = 0
    OnClick = bt_CANCELClick
  end
end
