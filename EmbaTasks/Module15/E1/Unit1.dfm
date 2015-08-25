object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 293
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnDoIt: TButton
    Left = 88
    Top = 240
    Width = 241
    Height = 37
    Caption = 'DoIt'
    TabOrder = 0
    OnClick = btnDoItClick
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 217
    Align = alTop
    TabOrder = 1
    object lblNumbers: TLabel
      Left = 47
      Top = 24
      Width = 42
      Height = 13
      Caption = 'Numbers'
    end
    object lblPositiveNumbers: TLabel
      Left = 163
      Top = 24
      Width = 82
      Height = 13
      Caption = 'Positive Numbers'
    end
    object lblNegativeNumbers: TLabel
      Left = 296
      Top = 24
      Width = 88
      Height = 13
      Caption = 'Negative Numbers'
    end
    object memNumbers: TMemo
      Left = 0
      Top = 56
      Width = 137
      Height = 161
      Lines.Strings = (
        '-5'
        '-4'
        '-3'
        '-2'
        '-1'
        '0'
        '1'
        '2'
        '3'
        '4'
        '5')
      TabOrder = 0
    end
    object memPositiveNumbers: TMemo
      Left = 136
      Top = 56
      Width = 137
      Height = 161
      TabOrder = 1
    end
    object memNegativeNumbers: TMemo
      Left = 272
      Top = 56
      Width = 137
      Height = 161
      TabOrder = 2
    end
  end
end
