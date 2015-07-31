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
  object lblResult: TLabel
    Left = 116
    Top = 51
    Width = 9
    Height = 19
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtMain: TEdit
    Left = 16
    Top = 16
    Width = 209
    Height = 21
    TabOrder = 0
    Text = 'Enter words here'
  end
  object btnMain: TButton
    Left = 83
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Count '#39'abc'#39
    TabOrder = 1
    OnClick = btnMainClick
  end
end
