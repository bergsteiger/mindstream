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
  object memMain: TMemo
    Left = 0
    Top = 0
    Width = 438
    Height = 377
    Align = alTop
    Lines.Strings = (
      'Line 1'
      'Line 2'
      'Line 3'
      'Line 4'
      'Line 5'
      'Line 6'
      'Line 7')
    TabOrder = 0
    ExplicitLeft = -11
  end
  object btnDoIt: TButton
    Left = 88
    Top = 392
    Width = 241
    Height = 37
    Caption = 'DoIt'
    TabOrder = 1
    OnClick = btnDoItClick
  end
end
