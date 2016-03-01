object l3LeakObjectsForm: Tl3LeakObjectsForm
  Left = 261
  Top = 297
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1085#1077#1086#1089#1074#1086#1073#1086#1078#1076#1077#1085#1085#1099#1093' '#1088#1077#1089#1091#1088#1089#1086#1074
  ClientHeight = 279
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object spMemo: TSplitter
    Left = 0
    Top = 110
    Width = 437
    Height = 2
    Cursor = crVSplit
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    ExplicitWidth = 356
  end
  object pnButtons: TPanel
    Left = 0
    Top = 252
    Width = 437
    Height = 27
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      437
      27)
    object btOk: TButton
      Left = 304
      Top = 5
      Width = 60
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btHelp: TButton
      Left = 368
      Top = 5
      Width = 60
      Height = 20
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Anchors = [akRight, akBottom]
      Caption = '&Help'
      TabOrder = 1
    end
  end
  object pnHeader: TPanel
    Left = 0
    Top = 0
    Width = 437
    Height = 20
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
  end
  object memGeneral: TMemo
    Left = 0
    Top = 20
    Width = 437
    Height = 90
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    TabOrder = 2
  end
  object memClasses: TMemo
    Left = 0
    Top = 112
    Width = 437
    Height = 140
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    TabOrder = 3
  end
end
