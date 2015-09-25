object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 99
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
    Height = 38
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 41
    object lblResult: TLabel
      Left = 429
      Top = 12
      Width = 30
      Height = 13
      Caption = 'Result'
    end
    object lbl1: TLabel
      Left = 37
      Top = 12
      Width = 314
      Height = 13
      Caption = 
        'First dialog OpenFile. Second dialog EvenFile. Third dialog OddF' +
        'ile'
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 38
    Width = 552
    Height = 61
    Align = alBottom
    Caption = 'pnlBottom'
    TabOrder = 1
    ExplicitTop = 256
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
  object dlgOpen: TOpenDialog
    Left = 336
  end
  object dlgSaveEven: TSaveDialog
    Left = 408
  end
  object dlgSaveOdd: TSaveDialog
    Left = 480
  end
end
