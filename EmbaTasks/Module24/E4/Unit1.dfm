object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 125
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 552
    Height = 75
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 89
    object lbl1: TLabel
      Left = 168
      Top = 24
      Width = 50
      Height = 13
      Caption = 'FileName :'
    end
    object lblResult: TLabel
      Left = 206
      Top = 50
      Width = 112
      Height = 13
      Caption = 'The result will be here :'
    end
    object edtFileName: TEdit
      Left = 224
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'file.txt'
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 75
    Width = 552
    Height = 50
    Align = alBottom
    Caption = 'pnlBottom'
    TabOrder = 1
    ExplicitTop = 112
    object btnDoIt: TButton
      Left = 118
      Top = 11
      Width = 315
      Height = 25
      Caption = 'DoIt'
      TabOrder = 0
      OnClick = btnDoItClick
    end
  end
end
