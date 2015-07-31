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
    ExplicitLeft = -32
    ExplicitTop = 8
    object lblNPoints: TLabel
      Left = 10
      Top = 19
      Width = 39
      Height = 13
      Caption = 'N Points'
    end
    object lblCenterX: TLabel
      Left = 103
      Top = 19
      Width = 42
      Height = 13
      Caption = 'Center X'
    end
    object lblCenterY: TLabel
      Left = 199
      Top = 19
      Width = 42
      Height = 13
      Caption = 'Center Y'
    end
    object lblRadius: TLabel
      Left = 303
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Radius'
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
      Text = '4'
    end
    object edtCenterX: TEdit
      Left = 151
      Top = 16
      Width = 42
      Height = 21
      TabOrder = 2
      Text = '300'
    end
    object edtCenterY: TEdit
      Left = 247
      Top = 16
      Width = 42
      Height = 21
      TabOrder = 3
      Text = '200'
    end
    object edtRadius: TEdit
      Left = 351
      Top = 16
      Width = 42
      Height = 21
      TabOrder = 4
      Text = '150'
    end
  end
end
