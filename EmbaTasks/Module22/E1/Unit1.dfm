object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 443
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 49
    Align = alTop
    TabOrder = 0
    object btnDetermineYoungest: TButton
      Left = 182
      Top = 13
      Width = 315
      Height = 25
      Caption = 'Determine youngest'
      TabOrder = 0
      OnClick = btnDetermineYoungestClick
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 49
    Width = 706
    Height = 394
    Align = alClient
    Caption = 'pnlMain'
    TabOrder = 1
    ExplicitTop = 73
    ExplicitHeight = 370
    object sgdMy: TStringGrid
      Left = 1
      Top = 1
      Width = 704
      Height = 392
      Align = alClient
      Color = clMoneyGreen
      ColCount = 4
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
      TabOrder = 0
      ExplicitHeight = 368
    end
  end
end
