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
    ExplicitWidth = 585
    object lblColumnCount: TLabel
      Left = 162
      Top = 19
      Width = 65
      Height = 13
      Caption = 'Column count'
    end
    object lblRowcount: TLabel
      Left = 24
      Top = 19
      Width = 51
      Height = 13
      Caption = 'Row count'
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
    object edtRowCount: TEdit
      Left = 93
      Top = 16
      Width = 41
      Height = 21
      TabOrder = 1
      Text = '10'
    end
    object edtColumnCount: TEdit
      Left = 231
      Top = 16
      Width = 42
      Height = 21
      TabOrder = 2
      Text = '10'
    end
  end
end
