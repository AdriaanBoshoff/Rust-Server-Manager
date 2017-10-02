object frmoxidemodinstaller: Tfrmoxidemodinstaller
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'OxideMod Installer'
  ClientHeight = 62
  ClientWidth = 227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object lblprogress: TLabel
    Left = 8
    Top = 31
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pb1: TProgressBar
    Left = 8
    Top = 8
    Width = 211
    Height = 17
    TabOrder = 0
  end
  object btn1: TButton
    Left = 160
    Top = 31
    Width = 59
    Height = 25
    Caption = 'Close'
    Enabled = False
    TabOrder = 1
    OnClick = btn1Click
  end
end
