object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbResult: TLabel
    Left = 24
    Top = 13
    Width = 38
    Height = 13
    Caption = 'lbResult'
  end
  object DoIt: TButton
    Left = 160
    Top = 8
    Width = 75
    Height = 25
    Caption = 'DoIt'
    TabOrder = 0
    OnClick = DoItClick
  end
end
