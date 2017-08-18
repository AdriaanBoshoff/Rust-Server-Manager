object frmconfigeditor: Tfrmconfigeditor
  Left = 0
  Top = 0
  Caption = 'Syntax Editor'
  ClientHeight = 613
  ClientWidth = 845
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
    Top = 551
    Width = 845
    Height = 62
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      845
      62)
    object btn2: TButton
      Left = 745
      Top = 6
      Width = 94
      Height = 51
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 14
      Top = 6
      Width = 131
      Height = 51
      Caption = 'Font Settings'
      TabOrder = 1
      OnClick = btn3Click
    end
    object btn4: TButton
      Left = 607
      Top = 6
      Width = 132
      Height = 51
      Anchors = [akRight, akBottom]
      Caption = 'Save and Close'
      TabOrder = 2
      OnClick = btn4Click
    end
    object chktabs: TCheckBox
      Left = 151
      Top = 6
      Width = 209
      Height = 17
      Caption = 'Want Tabs'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = chktabsClick
    end
    object chkwordwrap: TCheckBox
      Left = 151
      Top = 29
      Width = 98
      Height = 28
      Caption = 'Word Wrap'
      TabOrder = 4
      OnClick = chkwordwrapClick
    end
    object chklinenumbers: TCheckBox
      Left = 264
      Top = 6
      Width = 161
      Height = 17
      Caption = 'Show Line Numbers'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = chklinenumbersClick
    end
    object btn1: TButton
      Left = 502
      Top = 6
      Width = 99
      Height = 51
      Caption = 'Search'
      TabOrder = 6
      OnClick = btn1Click
    end
    object chkoverride: TCheckBox
      Left = 264
      Top = 29
      Width = 202
      Height = 28
      Caption = 'Override Windows Theme'
      Color = clWindow
      ParentColor = False
      TabOrder = 7
      OnClick = chkoverrideClick
    end
  end
  object synm1: TSynMemo
    Left = 0
    Top = 0
    Width = 845
    Height = 551
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 1
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWhite
    Gutter.Font.Height = -13
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.RightOffset = 1
    Gutter.ShowLineNumbers = True
    Gutter.Gradient = True
    Gutter.GradientStartColor = clBtnShadow
    Gutter.GradientEndColor = clBlack
    Highlighter = synjsnsyn1
    WantTabs = True
    FontSmoothing = fsmAntiAlias
    ExplicitLeft = 352
    ExplicitTop = 320
    ExplicitWidth = 200
    ExplicitHeight = 150
  end
  object dlgFont1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 448
    Top = 272
  end
  object synjsnsyn1: TSynJSONSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 328
    Top = 200
  end
  object FindDialog1: TFindDialog
    OnFind = FindDialog1Find
    Left = 728
    Top = 240
  end
end
