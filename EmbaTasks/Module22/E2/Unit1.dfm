object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 554
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
    Height = 81
    Align = alTop
    TabOrder = 0
    object lblHighest: TLabel
      Left = 21
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Start time :'
    end
    object lblLowlest: TLabel
      Left = 190
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Duration :'
    end
    object lbl1: TLabel
      Left = 354
      Top = 16
      Width = 84
      Height = 13
      Caption = 'Breaks'#8217' duration :'
    end
    object lbl2: TLabel
      Left = 526
      Top = 16
      Width = 95
      Height = 13
      Caption = 'Number of lessons :'
    end
    object btnBuildGrid: TButton
      Left = 175
      Top = 46
      Width = 343
      Height = 25
      Caption = 'Build grid'
      TabOrder = 0
      OnClick = btnBuildGridClick
    end
    object edtDuration: TEdit
      Left = 244
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 1
      Text = '45'
    end
    object edtStartTime: TEdit
      Left = 80
      Top = 13
      Width = 73
      Height = 21
      TabOrder = 2
      Text = '8:30'
    end
    object edtBreakDuration: TEdit
      Left = 444
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 3
      Text = '15'
    end
    object edtNumLessons: TEdit
      Left = 627
      Top = 13
      Width = 62
      Height = 21
      TabOrder = 4
      Text = '6'
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 81
    Width = 706
    Height = 473
    Align = alClient
    Caption = 'pnlMain'
    TabOrder = 1
    ExplicitTop = 73
    ExplicitHeight = 481
    object sgdMy: TStringGrid
      Left = 1
      Top = 1
      Width = 704
      Height = 471
      Align = alClient
      Color = clMoneyGreen
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
      TabOrder = 0
      ExplicitTop = 0
      ExplicitHeight = 432
    end
  end
end
