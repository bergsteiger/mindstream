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
    ExplicitLeft = 48
    ExplicitTop = 8
    object lblNPoints: TLabel
      Left = 10
      Top = 19
      Width = 39
      Height = 13
      Caption = 'N Points'
    end
    object lblCenterX: TLabel
      Left = 114
      Top = 19
      Width = 42
      Height = 13
      Caption = 'Center X'
    end
    object lblCenterY: TLabel
      Left = 218
      Top = 19
      Width = 42
      Height = 13
      Caption = 'Center Y'
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
    object edtNPoints: TEdit
      Left = 55
      Top = 16
      Width = 42
      Height = 21
      TabOrder = 1
      Text = '2'
    end
    object Edit1: TEdit
      Left = 159
      Top = 16
      Width = 42
      Height = 21
      TabOrder = 2
      Text = '2'
    end
    object edtCenterY: TEdit
      Left = 263
      Top = 16
      Width = 42
      Height = 21
      TabOrder = 3
      Text = '2'
    end
  end
end
