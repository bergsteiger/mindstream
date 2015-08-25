object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 236
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblAnswer: TLabel
    Left = 160
    Top = 8
    Width = 53
    Height = 19
    Caption = 'Answer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtFirstNum: TEdit
    Left = 32
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '0'
  end
  object edtSecondNum: TEdit
    Left = 232
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '20'
  end
  object edtGuess: TEdit
    Left = 126
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnGuess: TButton
    Left = 126
    Top = 165
    Width = 121
    Height = 25
    Caption = 'Guess number'
    TabOrder = 3
    OnClick = btnGuessClick
  end
  object btnPeep: TButton
    Left = 126
    Top = 198
    Width = 121
    Height = 25
    Caption = 'Peep chosen number'
    TabOrder = 4
    OnClick = btnPeepClick
  end
  object btnRandomize: TButton
    Left = 126
    Top = 85
    Width = 121
    Height = 25
    Caption = 'Chose number'
    TabOrder = 5
    OnClick = btnRandomizeClick
  end
end
