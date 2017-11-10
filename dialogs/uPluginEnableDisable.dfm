object frmpluginenabledisable: Tfrmpluginenabledisable
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enable / Disable Plugins'
  ClientHeight = 529
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 546
    Height = 41
    Align = alTop
    Caption = 'Enabled                              Disabled'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object chklstenabled: TCheckListBox
    Left = 0
    Top = 41
    Width = 270
    Height = 447
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object chklstdisabled: TCheckListBox
    Left = 276
    Top = 41
    Width = 270
    Height = 447
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = 273
  end
  object pnl2: TPanel
    Left = 0
    Top = 488
    Width = 546
    Height = 41
    Align = alBottom
    TabOrder = 3
    object btn1: TButton
      Left = 32
      Top = 6
      Width = 193
      Height = 27
      Caption = '-------------------->'
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 320
      Top = 6
      Width = 193
      Height = 27
      Caption = '<--------------------'
      TabOrder = 1
      OnClick = btn2Click
    end
  end
end
