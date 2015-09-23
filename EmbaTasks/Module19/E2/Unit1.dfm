object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 282
  ClientWidth = 603
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
    Width = 603
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 735
    object lbl3: TLabel
      Left = 265
      Top = 16
      Width = 76
      Height = 13
      Caption = 'Scale intervals :'
    end
    object lbl4: TLabel
      Left = 37
      Top = 16
      Width = 119
      Height = 13
      Caption = 'Number of experiments :'
    end
    object edtNumExperiments: TEdit
      Left = 162
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 1
      Text = '5'
    end
    object edtScaleIntervals: TEdit
      Left = 347
      Top = 13
      Width = 74
      Height = 21
      TabOrder = 2
      Text = '10'
    end
    object btnDisplayRow: TButton
      Left = 473
      Top = 11
      Width = 103
      Height = 25
      Caption = 'Do It'
      TabOrder = 0
      OnClick = btnDisplayRowClick
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 49
    Width = 603
    Height = 233
    Align = alClient
    Caption = 'pnlMain'
    TabOrder = 1
    ExplicitTop = 81
    ExplicitWidth = 735
    ExplicitHeight = 440
    object sgdMy: TStringGrid
      Left = 1
      Top = 1
      Width = 601
      Height = 231
      Align = alClient
      Color = clBtnFace
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 6
      ExplicitWidth = 480
      ExplicitHeight = 376
    end
  end
end
