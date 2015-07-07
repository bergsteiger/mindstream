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
    Left = 16
    Top = 113
    Width = 38
    Height = 13
    Caption = 'lbResult'
  end
  object Plus: TButton
    Left = 160
    Top = 8
    Width = 75
    Height = 25
    Caption = '+'
    TabOrder = 0
    OnClick = PlusClick
  end
  object Minus: TButton
    Left = 160
    Top = 39
    Width = 75
    Height = 25
    Caption = '-'
    TabOrder = 1
    OnClick = MinusClick
  end
  object Mul: TButton
    Left = 160
    Top = 70
    Width = 75
    Height = 25
    Caption = '*'
    TabOrder = 2
    OnClick = MulClick
  end
  object Divide: TButton
    Left = 160
    Top = 101
    Width = 75
    Height = 25
    Caption = '/'
    TabOrder = 3
    OnClick = DivideClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 8
    Top = 41
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit2'
  end
end
