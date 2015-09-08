object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 408
  ClientWidth = 727
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
    Top = 352
    Width = 433
    Height = 37
    Caption = 'DoIt'
    TabOrder = 0
    OnClick = btnDoItClick
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 727
    Height = 336
    Align = alTop
    Caption = 'pnlMain'
    TabOrder = 1
    ExplicitWidth = 438
    object memMain: TMemo
      Left = 1
      Top = 81
      Width = 240
      Height = 254
      Align = alLeft
      TabOrder = 0
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 725
      Height = 80
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 17
      ExplicitTop = -5
      ExplicitWidth = 614
      object lblSum: TLabel
        Left = 16
        Top = 48
        Width = 48
        Height = 19
        Caption = 'Sum : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSumNum: TLabel
        Left = 71
        Top = 48
        Width = 9
        Height = 19
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblAvg: TLabel
        Left = 106
        Top = 48
        Width = 44
        Height = 19
        Caption = 'Avg : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblAvgNum: TLabel
        Left = 156
        Top = 48
        Width = 9
        Height = 19
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblQuantiy: TLabel
        Left = 214
        Top = 48
        Width = 93
        Height = 19
        Caption = 'Quantity + : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblQuantityNumPos: TLabel
        Left = 322
        Top = 48
        Width = 9
        Height = 19
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMax: TLabel
        Left = 529
        Top = 48
        Width = 44
        Height = 19
        Caption = 'Max : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMaxNum: TLabel
        Left = 579
        Top = 48
        Width = 9
        Height = 19
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMin: TLabel
        Left = 619
        Top = 48
        Width = 41
        Height = 19
        Caption = 'Min : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMinNum: TLabel
        Left = 667
        Top = 48
        Width = 9
        Height = 19
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblQuantityNeg: TLabel
        Left = 369
        Top = 48
        Width = 87
        Height = 19
        Caption = 'Quantity - : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblQuantityNumNeg: TLabel
        Left = 477
        Top = 48
        Width = 9
        Height = 19
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtCh1: TEdit
        Left = 16
        Top = 11
        Width = 121
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '-50'
      end
      object edtCh2: TEdit
        Left = 168
        Top = 11
        Width = 121
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '50'
      end
    end
    object memPositiveNum: TMemo
      Left = 497
      Top = 81
      Width = 232
      Height = 254
      Align = alLeft
      TabOrder = 2
      ExplicitLeft = 417
    end
    object memNegativeNum: TMemo
      Left = 241
      Top = 81
      Width = 256
      Height = 254
      Align = alLeft
      TabOrder = 3
      ExplicitLeft = 209
    end
  end
end
