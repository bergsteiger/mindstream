object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 392
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    631
    392)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 47
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 16
    Top = 78
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 104
    Top = 18
    Width = 513
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Text = 'Edit1'
  end
  object CompileLog: TMemo
    Left = 16
    Top = 140
    Width = 249
    Height = 236
    Anchors = [akLeft, akTop, akBottom]
    Lines.Strings = (
      'CompileLog')
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object RunLog: TMemo
    Left = 280
    Top = 140
    Width = 337
    Height = 236
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'RunLog')
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object Run: TButton
    Left = 16
    Top = 109
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 6
    OnClick = RunClick
  end
end
