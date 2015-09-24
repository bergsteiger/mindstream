object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 118
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
    Height = 118
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 134
      Top = 24
      Width = 52
      Height = 13
      Caption = 'Time now :'
    end
    object lblDate: TLabel
      Left = 158
      Top = 48
      Width = 33
      Height = 13
      Caption = 'Date : '
    end
    object lblDayOfWeek: TLabel
      Left = 294
      Top = 48
      Width = 74
      Height = 13
      Caption = 'Date of week : '
    end
    object btnStart: TButton
      Left = 118
      Top = 79
      Width = 315
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = btnStartClick
    end
    object edtClock: TEdit
      Left = 192
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '00:00:00'
    end
  end
  object tmrMain: TTimer
    Enabled = False
    OnTimer = tmrMainTimer
    Left = 392
    Top = 8
  end
end
