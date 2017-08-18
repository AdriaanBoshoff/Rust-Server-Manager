object frmsteamcmdinstaller: Tfrmsteamcmdinstaller
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'SteamCMD Installer'
  ClientHeight = 181
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 19
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 426
    Height = 38
    Alignment = taCenter
    Caption = 
      'You need to install SteamCMD to download/update/validate the ser' +
      'ver'
    WordWrap = True
  end
  object lblstatus: TLabel
    Left = 8
    Top = 52
    Width = 36
    Height = 16
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pb1: TProgressBar
    Left = 8
    Top = 72
    Width = 417
    Height = 17
    TabOrder = 0
  end
  object btn1: TButton
    Left = 88
    Top = 104
    Width = 131
    Height = 65
    Caption = 'Install'
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 225
    Top = 104
    Width = 131
    Height = 65
    Caption = 'Close'
    TabOrder = 2
    OnClick = btn2Click
  end
end
