object l3LeakObjectsForm: Tl3LeakObjectsForm
  Left = 261
  Top = 297
  Width = 453
  Height = 318
  Caption = '—татистика неосвобожденных ресурсов'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object spMemo: TSplitter
    Left = 0
    Top = 137
    Width = 445
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object pnButtons: TPanel
    Left = 0
    Top = 252
    Width = 445
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btOk: TButton
      Left = 279
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btHelp: TButton
      Left = 359
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Help'
      TabOrder = 1
    end
  end
  object pnHeader: TPanel
    Left = 0
    Top = 0
    Width = 445
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
  end
  object memGeneral: TMemo
    Left = 0
    Top = 25
    Width = 445
    Height = 112
    Align = alTop
    TabOrder = 2
  end
  object memClasses: TMemo
    Left = 0
    Top = 140
    Width = 445
    Height = 112
    Align = alClient
    TabOrder = 3
  end
end
