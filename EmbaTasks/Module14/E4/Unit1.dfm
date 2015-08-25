object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 441
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
    Top = 392
    Width = 241
    Height = 37
    Caption = 'DoIt'
    TabOrder = 0
    OnClick = btnDoItClick
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 438
    Height = 41
    Align = alTop
    TabOrder = 1
  end
  object pnlMain: TPanel
    Left = 0
    Top = 41
    Width = 438
    Height = 336
    Align = alTop
    Caption = 'pnlMain'
    TabOrder = 2
    object memMain: TMemo
      Left = 1
      Top = 1
      Width = 436
      Height = 377
      Align = alTop
      Lines.Strings = (
        'qweqweqweqweqweqwqwe'
        'qweqweqweqwe'
        'qweqweqweqweqw'
        'qweqweqweqweqweqweqwe'
        'qweqweqweqweqweqweqweqweqweqwe'
        'qweqweqweqweqweqweqwe'
        'qweqweqweqweqw'
        'qweqweqweqwe'
        'qweqweqweqweqweqweqwe')
      TabOrder = 0
    end
  end
end
