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
    ExplicitWidth = 706
    ExplicitHeight = 145
    object lbl1: TLabel
      Left = 118
      Top = 24
      Width = 58
      Height = 13
      Caption = 'Enter data :'
    end
    object lblResult: TLabel
      Left = 192
      Top = 54
      Width = 30
      Height = 13
      Caption = 'Result'
    end
    object btnCompute: TButton
      Left = 118
      Top = 79
      Width = 315
      Height = 25
      Caption = 'Compute'
      TabOrder = 0
      OnClick = btnComputeClick
    end
    object edtEnterDate: TEdit
      Left = 192
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '01.01.2015'
    end
  end
end
