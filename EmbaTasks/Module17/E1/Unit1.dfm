object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 408
  ClientWidth = 616
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
    Width = 616
    Height = 336
    Align = alTop
    Caption = 'pnlMain'
    TabOrder = 1
    ExplicitWidth = 438
    object memMain: TMemo
      Left = 1
      Top = 43
      Width = 208
      Height = 292
      Align = alLeft
      TabOrder = 0
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 614
      Height = 42
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 436
      object edtCh1: TEdit
        Left = 16
        Top = 11
        Width = 121
        Height = 21
        TabOrder = 0
        Text = '-50'
      end
      object edtCh2: TEdit
        Left = 168
        Top = 11
        Width = 121
        Height = 21
        TabOrder = 1
        Text = '50'
      end
    end
    object memPositiveNum: TMemo
      Left = 417
      Top = 43
      Width = 208
      Height = 292
      Align = alLeft
      TabOrder = 2
      ExplicitLeft = 337
      ExplicitTop = 49
    end
    object memNegative: TMemo
      Left = 209
      Top = 43
      Width = 208
      Height = 292
      Align = alLeft
      TabOrder = 3
      ExplicitLeft = 337
      ExplicitTop = 49
    end
  end
end
