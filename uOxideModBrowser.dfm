object frmoxidemodbrowser: Tfrmoxidemodbrowser
  Left = 0
  Top = 0
  Caption = 'Oxide Mod Browser'
  ClientHeight = 638
  ClientWidth = 884
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
    Top = 0
    Width = 884
    Height = 70
    Align = alTop
    Caption = '        '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      884
      70)
    object btn1: TButton
      Left = 767
      Top = 16
      Width = 99
      Height = 41
      Anchors = [akRight, akBottom]
      Caption = 'Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 303
      Top = 15
      Width = 136
      Height = 41
      Caption = 'Rust Plugins'
      TabOrder = 1
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 445
      Top = 15
      Width = 136
      Height = 41
      Caption = 'Universal Plugins'
      TabOrder = 2
      OnClick = btn3Click
    end
    object btn4: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 41
      Caption = 'Back'
      TabOrder = 3
      OnClick = btn4Click
    end
    object btn5: TButton
      Left = 97
      Top = 16
      Width = 75
      Height = 41
      Caption = 'Forward'
      TabOrder = 4
      OnClick = btn5Click
    end
    object btn6: TButton
      Left = 178
      Top = 16
      Width = 75
      Height = 41
      Caption = 'Refresh'
      TabOrder = 5
      OnClick = btn6Click
    end
  end
  object wb1: TWebBrowser
    Left = 0
    Top = 81
    Width = 884
    Height = 557
    Align = alClient
    TabOrder = 1
    OnProgressChange = wb1ProgressChange
    OnDownloadBegin = wb1DownloadBegin
    OnDownloadComplete = wb1DownloadComplete
    ExplicitLeft = 280
    ExplicitTop = 208
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C0000005D5B0000913900000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620A000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object pb1: TProgressBar
    Left = 0
    Top = 70
    Width = 884
    Height = 11
    Align = alTop
    TabOrder = 2
  end
end
