object MainForm: TMainForm
  Left = 219
  Top = 135
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Copy Music'
  ClientHeight = 205
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object sts_BAR: TStatusBar
    Left = 0
    Top = 186
    Width = 529
    Height = 19
    Panels = <
      item
        Width = 150
      end>
  end
  object g_box: TGroupBox
    Left = 8
    Top = 0
    Width = 513
    Height = 177
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 132
      Height = 16
      Caption = #1060#1072#1081#1083' '#1087#1083#1077#1081'-'#1083#1080#1089#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 196
      Height = 16
      Caption = #1050#1072#1090#1072#1083#1086#1075' '#1076#1083#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bt_PLAY_LIST: TSpeedButton
      Left = 472
      Top = 40
      Width = 25
      Height = 25
      Caption = '...'
      OnClick = bt_PLAY_LISTClick
    end
    object bt_FOLDER_COPY: TSpeedButton
      Left = 472
      Top = 96
      Width = 25
      Height = 25
      Caption = '...'
      OnClick = bt_FOLDER_COPYClick
    end
    object txt_PLAY_LIST: TEdit
      Left = 8
      Top = 39
      Width = 457
      Height = 24
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnChange = txt_PLAY_LISTChange
    end
    object txt_FOLDER_COPY: TEdit
      Left = 10
      Top = 96
      Width = 455
      Height = 26
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnChange = txt_FOLDER_COPYChange
    end
    object bt_EXIT_: TButton
      Left = 392
      Top = 136
      Width = 105
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 2
      OnClick = bt_EXIT_Click
    end
    object bt_COPY_: TButton
      Left = 272
      Top = 136
      Width = 113
      Height = 25
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      Enabled = False
      TabOrder = 3
      OnClick = bt_COPY_Click
    end
  end
  object XP: TXPManifest
    Left = 112
    Top = 128
  end
  object MainMenu: TMainMenu
    Images = img_LIST
    Left = 80
    Top = 128
    object mnu_FILE: TMenuItem
      Caption = #1060#1072#1081#1083
      object mnu_OPEN_FILE: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1083#1077#1081'-'#1083#1080#1089#1090
        OnClick = mnu_OPEN_FILEClick
      end
      object mnu_FOLDER_COPY: TMenuItem
        Caption = #1050#1072#1090#1072#1083#1086#1075' '#1076#1083#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103
        OnClick = mnu_FOLDER_COPYClick
      end
      object mnu_1: TMenuItem
        Caption = '-'
      end
      object mnu_COPY: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
        Enabled = False
        OnClick = mnu_COPYClick
      end
      object mnu_2: TMenuItem
        Caption = '-'
      end
      object mnu_EXIT: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = mnu_EXITClick
      end
    end
    object mnu_HELP: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object mnu_HELP_ME: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1082#1072
      end
      object mnu_3: TMenuItem
        Caption = '-'
      end
      object mnu_ABOUT: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077' ...'
        OnClick = mnu_ABOUTClick
      end
    end
  end
  object img_LIST: TImageList
    Height = 19
    Width = 19
    Left = 48
    Top = 128
  end
  object Open_PLAY_LIST: TOpenDialog
    DefaultExt = '*.m3u'
    Filter = #1055#1083#1077#1081'-'#1083#1080#1089#1090'  (*.m3u)|*.m3u|'#1055#1083#1077#1081'-'#1083#1080#1089#1090'  (*.pls)|*.pls'
    Left = 16
    Top = 128
  end
end
