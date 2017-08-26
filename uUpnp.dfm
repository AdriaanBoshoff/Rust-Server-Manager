object frmupnp: Tfrmupnp
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Upnp Port Forwarding (Experimental)'
  ClientHeight = 214
  ClientWidth = 476
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
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 451
    Height = 48
    Caption = 
      'This feature will attempt to open your ports for you rust server' +
      ' if your router supports upnp. Please note that this feature is ' +
      'experimental and may not even work for you. Also make sure Upnp ' +
      'is enabled in your router settings.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lbl2: TLabel
    Left = 111
    Top = 62
    Width = 85
    Height = 19
    Caption = 'Upnp Ports:'
  end
  object mmo1: TMemo
    Left = 111
    Top = 87
    Width = 357
    Height = 119
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btn1: TButton
    Left = 8
    Top = 62
    Width = 97
    Height = 43
    Caption = 'Open Ports'
    TabOrder = 1
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 8
    Top = 111
    Width = 97
    Height = 42
    Caption = 'Refresh List'
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 8
    Top = 159
    Width = 97
    Height = 42
    Caption = 'Delete Ports'
    TabOrder = 3
    OnClick = btn3Click
  end
end
