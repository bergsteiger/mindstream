object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 380
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pbxEx: TPaintBox
    Left = 0
    Top = 0
    Width = 445
    Height = 328
    Align = alClient
    ExplicitHeight = 273
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 328
    Width = 445
    Height = 52
    Align = alBottom
    TabOrder = 0
    object btnSnowMan: TButton
      Left = 152
      Top = 16
      Width = 137
      Height = 25
      Caption = 'Draw SnowMan'
      TabOrder = 0
      OnClick = btnSnowManClick
    end
  end
end
