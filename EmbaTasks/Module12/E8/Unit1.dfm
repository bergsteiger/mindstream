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
    Width = 43
    Height = 19
    Caption = 'Result'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtMain: TEdit
    Left = 33
    Top = 16
    Width = 209
    Height = 21
    TabOrder = 0
    Text = 'Enter word here'
  end
  object btnMain: TButton
    Left = 70
    Top = 88
    Width = 134
    Height = 25
    Caption = 'Get new word'
    TabOrder = 1
    OnClick = btnMainClick
  end
end
