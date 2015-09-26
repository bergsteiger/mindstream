object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 408
  ClientWidth = 438
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
    Top = 352
    Width = 241
    Height = 37
    Caption = 'DoIt'
    TabOrder = 0
    OnClick = btnDoItClick
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 438
    Height = 336
    Align = alTop
    Caption = 'pnlMain'
    TabOrder = 1
    object memMain: TMemo
      Left = 1
      Top = 1
      Width = 436
      Height = 334
      Align = alClient
      Lines.Strings = (
        'Smith'
        'Johnson'
        'Williams'
        'Brown'
        'Jones'
        'Miller'
        'Davis'
        'Garcia'
        'Rodriguez'
        'Wilson')
      TabOrder = 0
    end
  end
end
