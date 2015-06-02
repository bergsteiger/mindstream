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
  object lbS: TLabel
    Left = 8
    Top = 128
    Width = 14
    Height = 13
    Caption = 'lbS'
  end
  object lbP: TLabel
    Left = 8
    Top = 109
    Width = 14
    Height = 13
    Caption = 'lbP'
  end
  object DoIt: TButton
    Left = 8
    Top = 147
    Width = 75
    Height = 25
    Caption = 'DoIt'
    TabOrder = 0
    OnClick = DoItClick
  end
  object v1x: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'v1x'
  end
  object v2x: TEdit
    Left = 8
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'v2x'
  end
  object v3x: TEdit
    Left = 8
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'v1x'
  end
  object v1y: TEdit
    Left = 144
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'v1y'
  end
  object v3y: TEdit
    Left = 144
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'v1y'
  end
  object v2y: TEdit
    Left = 144
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'v2y'
  end
end
