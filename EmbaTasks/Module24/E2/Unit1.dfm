object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 317
  ClientWidth = 552
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
    Width = 552
    Height = 63
    Align = alTop
    TabOrder = 0
    ExplicitHeight = 57
    object lbl1: TLabel
      Left = 118
      Top = 24
      Width = 50
      Height = 13
      Caption = 'FileName :'
    end
    object edtFileName: TEdit
      Left = 192
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'file.txt'
    end
  end
  object pnlCenter: TPanel
    Left = 0
    Top = 63
    Width = 552
    Height = 193
    Align = alClient
    Caption = 'pnlCenter'
    TabOrder = 1
    ExplicitTop = 57
    ExplicitHeight = 472
    object memResult: TMemo
      Left = 1
      Top = 1
      Width = 550
      Height = 191
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 64
      ExplicitWidth = 552
      ExplicitHeight = 193
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 256
    Width = 552
    Height = 61
    Align = alBottom
    Caption = 'pnlBottom'
    TabOrder = 2
    ExplicitTop = 535
    object btnStart: TButton
      Left = 118
      Top = 20
      Width = 315
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = btnStartClick
    end
  end
end
