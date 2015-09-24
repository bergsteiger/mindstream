object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 118
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
    Height = 118
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 118
      Top = 24
      Width = 50
      Height = 13
      Caption = 'FileName :'
    end
    object lblResult: TLabel
      Left = 222
      Top = 54
      Width = 105
      Height = 13
      Caption = 'The result will be here'
    end
    object btnStart: TButton
      Left = 118
      Top = 79
      Width = 315
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = btnStartClick
    end
    object edtFileName: TEdit
      Left = 192
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'file.txt'
    end
  end
end
