object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 426
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
    object lbl3: TLabel
      Left = 11
      Top = 16
      Width = 72
      Height = 13
      Caption = 'Column count :'
    end
    object lbl4: TLabel
      Left = 195
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Row count :'
    end
    object lblHighest: TLabel
      Left = 382
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Highest :'
    end
    object lblLowlest: TLabel
      Left = 551
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Lowlest :'
    end
    object edtRowCount: TEdit
      Left = 264
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 1
      Text = '6'
    end
    object edtColCount: TEdit
      Left = 93
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 2
      Text = '5'
    end
    object btnBuildGrid: TButton
      Left = 218
      Top = 40
      Width = 103
      Height = 25
      Caption = 'Build grid'
      TabOrder = 0
      OnClick = btnBuildGridClick
    end
    object edtHighest: TEdit
      Left = 608
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 3
      Text = '-50'
    end
    object edtLowlest: TEdit
      Left = 437
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 4
      Text = '50'
    end
    object btnCalcPow: TButton
      Left = 344
      Top = 40
      Width = 103
      Height = 25
      Caption = 'Calc pow'
      TabOrder = 5
      OnClick = btnCalcPowClick
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 73
    Width = 706
    Height = 353
    Align = alClient
    Caption = 'pnlMain'
    TabOrder = 1
    object sgdMy: TStringGrid
      Left = 1
      Top = 1
      Width = 704
      Height = 279
      Align = alClient
      Color = clMoneyGreen
      FixedCols = 0
      RowCount = 2
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
      TabOrder = 0
    end
    object memResult: TMemo
      Left = 1
      Top = 280
      Width = 704
      Height = 72
      Align = alBottom
      Lines.Strings = (
        '')
      TabOrder = 1
    end
  end
end
