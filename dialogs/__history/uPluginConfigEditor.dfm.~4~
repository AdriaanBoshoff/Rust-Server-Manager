object frmconfigeditor: Tfrmconfigeditor
  Left = 0
  Top = 0
  Caption = 'Syntax Editor'
  ClientHeight = 613
  ClientWidth = 883
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
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 883
    Height = 613
    ActivePage = tseditor
    Align = alClient
    TabOrder = 0
    object tseditor: TTabSheet
      Caption = 'Editor'
      object synm1: TSynMemo
        Left = 0
        Top = 0
        Width = 875
        Height = 526
        Align = alClient
        Color = clBtnText
        ActiveLineColor = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
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
      object pnl1: TPanel
        Left = 0
        Top = 526
        Width = 875
        Height = 53
        Align = alBottom
        TabOrder = 1
        DesignSize = (
          875
          53)
        object btn1: TButton
          Left = 12
          Top = 6
          Width = 80
          Height = 43
          Caption = 'Search'
          TabOrder = 0
          OnClick = btn1Click
        end
        object rblight: TRadioButton
          Left = 217
          Top = 14
          Width = 113
          Height = 28
          Caption = 'Light Theme'
          TabOrder = 1
          OnClick = rblightClick
        end
        object rbdark: TRadioButton
          Left = 98
          Top = 14
          Width = 113
          Height = 28
          Caption = 'Dark Theme'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = rbdarkClick
        end
        object btn4: TButton
          Left = 732
          Top = 6
          Width = 132
          Height = 43
          Anchors = [akRight, akBottom]
          Caption = 'Save and Close'
          TabOrder = 3
          OnClick = btn4Click
        end
        object btn2: TButton
          Left = 647
          Top = 6
          Width = 79
          Height = 43
          Anchors = [akTop, akRight]
          Cancel = True
          Caption = 'Cancel'
          ModalResult = 2
          TabOrder = 4
          OnClick = btn2Click
        end
      end
    end
    object tssettings: TTabSheet
      Caption = 'Editor Settings'
      ImageIndex = 1
      object grpeditorsettings: TGroupBox
        Left = 32
        Top = 18
        Width = 209
        Height = 239
        Caption = 'Editor Settings'
        TabOrder = 6
      end
      object btn3: TButton
        Left = 47
        Top = 94
        Width = 136
        Height = 36
        Caption = 'Font Settings'
        TabOrder = 0
        OnClick = btn3Click
      end
      object btn5: TButton
        Left = 47
        Top = 52
        Width = 136
        Height = 36
        Caption = 'Active Line Color'
        TabOrder = 1
        OnClick = btn5Click
      end
      object chkhighlightline: TCheckBox
        Left = 47
        Top = 136
        Width = 178
        Height = 28
        Caption = 'HighLight Current Line'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = chkhighlightlineClick
      end
      object chklinenumbers: TCheckBox
        Left = 47
        Top = 170
        Width = 161
        Height = 17
        Caption = 'Show Line Numbers'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = chklinenumbersClick
      end
      object chktabs: TCheckBox
        Left = 47
        Top = 227
        Width = 98
        Height = 17
        Caption = 'Want Tabs'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = chktabsClick
      end
      object chkwordwrap: TCheckBox
        Left = 47
        Top = 193
        Width = 98
        Height = 28
        Caption = 'Word Wrap'
        TabOrder = 5
        OnClick = chkwordwrapClick
      end
    end
  end
  object dlgFont1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 504
    Top = 304
  end
  object synjsnsyndark: TSynJSONSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    AttributeAttri.Foreground = clSkyBlue
    ReservedAttri.Foreground = 33023
    SymbolAttri.Foreground = clWhite
    ValueAttri.Foreground = clTeal
    Left = 608
    Top = 200
  end
  object FindDialog1: TFindDialog
    OnFind = FindDialog1Find
    Left = 360
    Top = 256
  end
  object synjsnsynlight: TSynJSONSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 608
    Top = 264
  end
  object dlgColor1: TColorDialog
    Left = 504
    Top = 384
  end
end
