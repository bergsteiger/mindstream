object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 645
  ClientWidth = 735
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
    Width = 735
    Height = 81
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 216
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Row : '
    end
    object lbl2: TLabel
      Left = 202
      Top = 54
      Width = 45
      Height = 13
      Caption = 'Column : '
    end
    object lbl3: TLabel
      Left = 25
      Top = 54
      Width = 72
      Height = 13
      Caption = 'Fixed column : '
    end
    object lbl4: TLabel
      Left = 37
      Top = 16
      Width = 60
      Height = 13
      Caption = 'Fixed Row : '
    end
    object lbl7: TLabel
      Left = 496
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Row : '
    end
    object lbl8: TLabel
      Left = 482
      Top = 54
      Width = 45
      Height = 13
      Caption = 'Column : '
    end
    object edtRow: TEdit
      Left = 253
      Top = 13
      Width = 68
      Height = 21
      TabOrder = 2
      Text = '5'
    end
    object edtColumn: TEdit
      Left = 253
      Top = 51
      Width = 68
      Height = 21
      TabOrder = 7
      Text = '7'
    end
    object edtFixedRow: TEdit
      Left = 103
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 1
      Text = '1'
    end
    object edtFixedColumn: TEdit
      Left = 103
      Top = 51
      Width = 74
      Height = 21
      TabOrder = 6
      Text = '1'
    end
    object btnCreateGrid: TButton
      Left = 345
      Top = 29
      Width = 103
      Height = 25
      Caption = 'Create grid'
      TabOrder = 4
      OnClick = btnCreateGridClick
    end
    object edtDisplayRow: TEdit
      Left = 533
      Top = 13
      Width = 68
      Height = 21
      TabOrder = 3
      Text = '2'
    end
    object edtDisplayColumn: TEdit
      Left = 533
      Top = 51
      Width = 68
      Height = 21
      TabOrder = 8
      Text = '2'
    end
    object btnDisplayRow: TButton
      Left = 617
      Top = 11
      Width = 103
      Height = 25
      Caption = 'Display row'
      TabOrder = 0
      OnClick = btnDisplayRowClick
    end
    object btnDisplayColumn: TButton
      Left = 617
      Top = 49
      Width = 103
      Height = 25
      Caption = 'Display column'
      TabOrder = 5
      OnClick = btnDisplayColumnClick
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 81
    Width = 735
    Height = 440
    Align = alClient
    Caption = 'pnlMain'
    TabOrder = 1
    ExplicitTop = 49
    ExplicitWidth = 428
    ExplicitHeight = 328
    object sgdMy: TStringGrid
      Left = 1
      Top = 1
      Width = 480
      Height = 438
      Align = alLeft
      Color = clBtnFace
      Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      ExplicitLeft = -5
      ExplicitTop = 2
    end
    object memResult: TMemo
      Left = 481
      Top = 1
      Width = 253
      Height = 438
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 482
      ExplicitWidth = 252
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 521
    Width = 735
    Height = 124
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 512
    object lbl5: TLabel
      Left = 25
      Top = 6
      Width = 126
      Height = 13
      Caption = 'Change color of fixed cells'
    end
    object lbl6: TLabel
      Left = 25
      Top = 62
      Width = 138
      Height = 13
      Caption = 'Change color of unfixed cells'
    end
    object btnChangeFixedRed: TButton
      Left = 37
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Red'
      TabOrder = 0
      OnClick = btnChangeFixedRedClick
    end
    object btnChangeFixedBlue: TButton
      Left = 301
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Blue'
      TabOrder = 2
      OnClick = btnChangeFixedBlueClick
    end
    object btnChangeFixedGreen: TButton
      Left = 169
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Green'
      TabOrder = 1
      OnClick = btnChangeFixedGreenClick
    end
    object btnChangeRed: TButton
      Left = 37
      Top = 81
      Width = 75
      Height = 25
      Caption = 'Red'
      TabOrder = 3
      OnClick = btnChangeRedClick
    end
    object btnChangeBlue: TButton
      Left = 301
      Top = 81
      Width = 75
      Height = 25
      Caption = 'Blue'
      TabOrder = 5
      OnClick = btnChangeBlueClick
    end
    object btnChangeGreen: TButton
      Left = 169
      Top = 81
      Width = 75
      Height = 25
      Caption = 'Green'
      TabOrder = 4
      OnClick = btnChangeGreenClick
    end
  end
end
