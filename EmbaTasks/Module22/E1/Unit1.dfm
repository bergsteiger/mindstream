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
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 73
    Align = alTop
    TabOrder = 0
    object lblHighest: TLabel
      Left = 21
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Highest :'
    end
    object lblLowlest: TLabel
      Left = 190
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Lowlest :'
    end
    object btnBuildGrid: TButton
      Left = 182
      Top = 40
      Width = 343
      Height = 25
      Caption = 'Build grid'
      TabOrder = 0
      OnClick = btnBuildGridClick
    end
    object edtHighest: TEdit
      Left = 247
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 1
      Text = '-50'
    end
    object edtLowlest: TEdit
      Left = 76
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 2
      Text = '50'
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 73
    Width = 706
    Height = 370
    Align = alClient
    Caption = 'pnlMain'
    TabOrder = 1
    ExplicitHeight = 481
    object sgdMy: TStringGrid
      Left = 1
      Top = 1
      Width = 704
      Height = 368
      Align = alClient
      Color = clMoneyGreen
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
      TabOrder = 0
      ExplicitHeight = 319
    end
  end
end
