object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 512
  ClientWidth = 497
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
    Left = 96
    Top = 456
    Width = 289
    Height = 37
    Caption = 'DoIt'
    TabOrder = 0
    OnClick = btnDoItClick
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 433
    Align = alTop
    Caption = 'pnlMain'
    TabOrder = 1
    object memMain: TMemo
      Left = 1
      Top = 81
      Width = 240
      Height = 351
      Align = alLeft
      TabOrder = 0
      ExplicitHeight = 254
    end
    object pnlTop: TPanel
      Left = 1
      Top = 1
      Width = 495
      Height = 80
      Align = alTop
      TabOrder = 1
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
    object memResult: TMemo
      Left = 241
      Top = 81
      Width = 256
      Height = 351
      Align = alLeft
      TabOrder = 2
      ExplicitHeight = 254
    end
  end
end
