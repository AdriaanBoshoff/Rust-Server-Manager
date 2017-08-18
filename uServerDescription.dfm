object frmdescription: Tfrmdescription
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Server Description Editor'
  ClientHeight = 587
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnl2: TPanel
    Left = 0
    Top = 547
    Width = 800
    Height = 40
    Align = alBottom
    Caption = 
      'DO NOT ADD \n  It does it automatically!                        ' +
      '                                           '
    TabOrder = 0
    object lbl2: TLabel
      Left = 444
      Top = 6
      Width = 70
      Height = 19
      Caption = 'Font Size:'
    end
    object btn1: TButton
      Left = 724
      Top = 6
      Width = 67
      Height = 27
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btn1Click
    end
    object se1: TSpinEdit
      Left = 520
      Top = 6
      Width = 57
      Height = 29
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
      OnChange = se1Change
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 41
    Align = alTop
    Caption = 
      'Enter a description below for your server. It will display on th' +
      'e server info box in the server list '
    TabOrder = 1
  end
  object mmo1: TMemo
    Left = 0
    Top = 41
    Width = 800
    Height = 506
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 2
  end
end
