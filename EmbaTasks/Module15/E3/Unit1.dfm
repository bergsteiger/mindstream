object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 293
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnDoIt: TButton
    Left = 88
    Top = 240
    Width = 241
    Height = 37
    Caption = 'DoIt'
    TabOrder = 0
    OnClick = btnDoItClick
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 217
    Align = alTop
    TabOrder = 1
    object memFirst: TMemo
      Left = 0
      Top = 0
      Width = 137
      Height = 217
      Lines.Strings = (
        'Book'
        'Table'
        'Desk'
        'Home'
        'Mouse'
        'Cat'
        'Dog')
      TabOrder = 0
    end
    object memSecond: TMemo
      Left = 136
      Top = 0
      Width = 137
      Height = 217
      Lines.Strings = (
        'Book'
        'Home'
        'Project'
        'Cat'
        'Group'
        'Dog'
        'Phone')
      TabOrder = 1
    end
    object memResult: TMemo
      Left = 272
      Top = 0
      Width = 137
      Height = 217
      TabOrder = 2
    end
  end
end
