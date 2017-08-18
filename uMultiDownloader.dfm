object frmmultidownloader: Tfrmmultidownloader
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Downloader'
  ClientHeight = 153
  ClientWidth = 398
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
    Left = 36
    Top = 8
    Width = 310
    Height = 19
    Caption = 'Click download below to start the download'
  end
  object lblstatus: TLabel
    Left = 8
    Top = 34
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
    Top = 56
    Width = 369
    Height = 17
    TabOrder = 0
  end
  object btn1: TButton
    Left = 83
    Top = 88
    Width = 113
    Height = 49
    Caption = 'Download'
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 202
    Top = 88
    Width = 113
    Height = 49
    Caption = 'Close'
    TabOrder = 2
    OnClick = btn2Click
  end
end
