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
      Left = 760
      Top = 6
      Width = 79
      Height = 51
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 6
      Top = 6
      Width = 107
      Height = 51
      Caption = 'Font Settings'
      TabOrder = 1
      OnClick = btn3Click
    end
    object btn4: TButton
      Left = 622
      Top = 6
      Width = 132
      Height = 51
      Anchors = [akRight, akBottom]
      Caption = 'Save and Close'
      TabOrder = 2
      OnClick = btn4Click
    end
    object chktabs: TCheckBox
      Left = 119
      Top = 6
      Width = 98
      Height = 17
      Caption = 'Want Tabs'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = chktabsClick
    end
    object chkwordwrap: TCheckBox
      Left = 119
      Top = 29
      Width = 98
      Height = 28
      Caption = 'Word Wrap'
      TabOrder = 4
      OnClick = chkwordwrapClick
    end
    object chklinenumbers: TCheckBox
      Left = 223
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
      Left = 536
      Top = 6
      Width = 80
      Height = 51
      Anchors = [akTop, akRight]
      Caption = 'Search'
      TabOrder = 6
      OnClick = btn1Click
    end
    object rbdark: TRadioButton
      Left = 417
      Top = 6
      Width = 113
      Height = 28
      Anchors = [akTop, akRight]
      Caption = 'Dark Theme'
      Checked = True
      TabOrder = 7
      TabStop = True
      OnClick = rbdarkClick
    end
    object rblight: TRadioButton
      Left = 417
      Top = 29
      Width = 113
      Height = 28
      Anchors = [akTop, akRight]
      Caption = 'Light Theme'
      TabOrder = 8
      OnClick = rblightClick
    end
    object chkhighlightline: TCheckBox
      Left = 223
      Top = 29
      Width = 188
      Height = 28
      Caption = 'HighLight Current Line'
      Checked = True
      State = cbChecked
      TabOrder = 9
      OnClick = chkhighlightlineClick
    end
  end
  object synm1: TSynMemo
    Left = 0
    Top = 0
    Width = 845
    Height = 551
    Align = alClient
    Color = clBtnText
    ActiveLineColor = clTeal
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
    Gutter.GradientStartColor = 4473924
    Gutter.GradientEndColor = clBlack
    Highlighter = synjsnsyndark
    Lines.Strings = (
      '{'
      '  "Closed Sign": "[#262626][[#red]CLOSED[/#]][/#]",'
      '  "Notify About Closing": true,'
      '  "Notify About New Tickets": true,'
      '  "Notify About Replies": true,'
      '  "Notify About Wipes": true,'
      '  "Open Sign": "[#262626][[#C4FF00]OPEN[/#]][/#]",'
      '  "Slack Channel": "general",'
      '  "Title": "[#262626][[#C4FF00]Tickets[/#]][/#]",'
      '  "Use Email API": false,'
      '  "Use Push API": false,'
      '  "Use Slack": false'
      '}')
    WantTabs = True
    FontSmoothing = fsmClearType
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
  object synjsnsyndark: TSynJSONSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    AttributeAttri.Foreground = clSkyBlue
    ReservedAttri.Foreground = clMenuHighlight
    SymbolAttri.Foreground = clWhite
    ValueAttri.Foreground = clTeal
    Left = 608
    Top = 200
  end
  object FindDialog1: TFindDialog
    OnFind = FindDialog1Find
    Left = 728
    Top = 240
  end
  object synjsnsynlight: TSynJSONSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 608
    Top = 264
  end
end
