object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 143
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtIn: TEdit
    Left = 16
    Top = 24
    Width = 425
    Height = 21
    TabOrder = 0
    Text = 'Smith 178 Sandler 183'
  end
  object edtOut: TEdit
    Left = 16
    Top = 51
    Width = 425
    Height = 21
    TabOrder = 1
    Text = 'edtIn'
  end
  object btnDoIt: TButton
    Left = 124
    Top = 104
    Width = 208
    Height = 25
    Caption = 'btnDoIt'
    TabOrder = 2
    OnClick = btnDoItClick
  end
end
