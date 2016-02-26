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
  PixelsPerInch = 96
  TextHeight = 13
  object btnFindAndCopy: TButton
    Left = 0
    Top = 215
    Width = 418
    Height = 33
    Align = alBottom
    Caption = 'ParseCSV'
    TabOrder = 0
    OnClick = btnFindAndCopyClick
    ExplicitTop = 248
  end
  object lb1: TListBox
    Left = 0
    Top = 0
    Width = 418
    Height = 215
    Align = alClient
    ItemHeight = 13
    TabOrder = 1
    ExplicitLeft = 104
    ExplicitTop = 64
    ExplicitWidth = 121
    ExplicitHeight = 97
  end
  object btnFindFiles: TButton
    Left = 0
    Top = 248
    Width = 418
    Height = 33
    Align = alBottom
    Caption = 'Find files'
    TabOrder = 2
    OnClick = btnFindFilesClick
  end
end
