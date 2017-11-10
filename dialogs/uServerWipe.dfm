object frmwipe: Tfrmwipe
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Server and data wipe'
  ClientHeight = 244
  ClientWidth = 448
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
  object pnl1: TPanel
    Left = 0
    Top = 203
    Width = 448
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btn1: TButton
      Left = 359
      Top = 6
      Width = 75
      Height = 27
      Caption = 'Close'
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 27
      Caption = 'Wipe'
      TabOrder = 1
      OnClick = btn2Click
    end
    object chkbpwipe: TCheckBox
      Left = 89
      Top = 6
      Width = 97
      Height = 29
      Caption = 'Wipe BP'
      TabOrder = 2
    end
  end
  object lst1: TListBox
    Left = 0
    Top = 41
    Width = 220
    Height = 162
    Align = alLeft
    ItemHeight = 19
    TabOrder = 1
    OnClick = lst1Click
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 41
    Align = alTop
    Caption = 'Servers                                oxide\data\'
    TabOrder = 2
  end
  object chklstdata: TCheckListBox
    Left = 228
    Top = 41
    Width = 220
    Height = 162
    Align = alRight
    ItemHeight = 19
    TabOrder = 3
    ExplicitLeft = 224
  end
end
