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
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object kph: TButton
    Left = 80
    Top = 8
    Width = 75
    Height = 25
    Caption = 'kph'
    TabOrder = 0
    OnClick = kphClick
  end
  object Edit1: TEdit
    Left = 16
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object mps: TButton
    Left = 168
    Top = 8
    Width = 75
    Height = 25
    Caption = 'mps'
    TabOrder = 2
    OnClick = mpsClick
  end
end
