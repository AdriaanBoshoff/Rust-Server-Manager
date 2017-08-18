object frminstalleroption: Tfrminstalleroption
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Select  a branch for your server'
  ClientHeight = 257
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object pnl1: TPanel
    Left = 0
    Top = 204
    Width = 274
    Height = 53
    Align = alBottom
    TabOrder = 0
    ExplicitWidth = 289
    object btn1: TButton
      Left = 148
      Top = 6
      Width = 89
      Height = 41
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 37
      Top = 6
      Width = 89
      Height = 41
      Caption = 'Install'
      ModalResult = 1
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object rg1: TRadioGroup
    Left = 0
    Top = 0
    Width = 274
    Height = 204
    Align = alClient
    Caption = 'Select Branch'
    Items.Strings = (
      'Normal (recommended)'
      'Staging'
      'Pre-Release'
      'July 2016 (Blueprint System)'
      'October 2016 (XP System)')
    TabOrder = 1
    ExplicitWidth = 289
  end
end
