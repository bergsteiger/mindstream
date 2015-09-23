object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 282
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
    Height = 49
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
      Left = 365
      Top = 11
      Width = 103
      Height = 25
      Caption = 'Build grid'
      TabOrder = 0
      OnClick = btnBuildGridClick
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 49
    Width = 706
    Height = 233
    Align = alClient
    Caption = 'pnlMain'
    TabOrder = 1
    object sgdMy: TStringGrid
      Left = 1
      Top = 1
      Width = 704
      Height = 231
      Align = alClient
      Color = clMoneyGreen
      FixedCols = 0
      RowCount = 2
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
      TabOrder = 0
    end
  end
end
