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
      Width = 56
      Height = 13
      Caption = 'Enter time :'
    end
    object btnStart: TButton
      Left = 118
      Top = 79
      Width = 315
      Height = 25
      Caption = 'Start'
      TabOrder = 0
    end
    object edtTimeKeeper: TEdit
      Left = 192
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '0:1:30'
    end
  end
  object tmrMain: TTimer
    Left = 344
    Top = 16
  end
end
