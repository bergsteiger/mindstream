object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 452
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pbxEx: TPaintBox
    Left = 0
    Top = 52
    Width = 600
    Height = 400
    Align = alClient
    ExplicitTop = 0
    ExplicitWidth = 445
    ExplicitHeight = 273
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 52
    Align = alTop
    TabOrder = 0
    object lblMinRadius: TLabel
      Left = 163
      Top = 19
      Width = 63
      Height = 13
      Caption = 'Min radius (r)'
    end
    object lblNCircles: TLabel
      Left = 48
      Top = 19
      Width = 39
      Height = 13
      Caption = 'N circles'
    end
    object lblMaxRadius: TLabel
      Left = 286
      Top = 19
      Width = 70
      Height = 13
      Caption = 'Max radius (R)'
    end
    object btnDraw: TButton
      Left = 416
      Top = 14
      Width = 129
      Height = 25
      Caption = 'Draw'
      TabOrder = 0
      OnClick = btnDrawClick
    end
    object edtNCircles: TEdit
      Left = 93
      Top = 16
      Width = 41
      Height = 21
      TabOrder = 1
      Text = '5'
    end
    object edtMinRadius: TEdit
      Left = 231
      Top = 16
      Width = 42
      Height = 21
      TabOrder = 2
      Text = '50'
    end
    object edtMaxRadius: TEdit
      Left = 359
      Top = 16
      Width = 42
      Height = 21
      TabOrder = 3
      Text = '250'
    end
  end
end
