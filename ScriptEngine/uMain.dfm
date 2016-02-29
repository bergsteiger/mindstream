object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 281
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnFindAndCopy: TButton
    Left = 0
    Top = 182
    Width = 418
    Height = 33
    Align = alBottom
    Caption = 'ParseCSV'
    TabOrder = 0
    OnClick = btnFindAndCopyClick
  end
  object lbOutput: TListBox
    Left = 0
    Top = 0
    Width = 418
    Height = 182
    Align = alClient
    ItemHeight = 13
    TabOrder = 1
  end
  object btnFindFiles: TButton
    Left = 0
    Top = 215
    Width = 418
    Height = 33
    Align = alBottom
    Caption = 'Find files'
    TabOrder = 2
    OnClick = btnFindFilesClick
  end
  object btnCopyFiles: TButton
    Left = 0
    Top = 248
    Width = 418
    Height = 33
    Align = alBottom
    Caption = 'Copy Files'
    TabOrder = 3
    OnClick = btnCopyFilesClick
  end
end
