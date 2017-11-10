object frmbranchselector: Tfrmbranchselector
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Select a Server Branch'
  ClientHeight = 286
  ClientWidth = 279
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
  object pnl1: TPanel
    Left = 0
    Top = 249
    Width = 279
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 239
    ExplicitWidth = 277
    DesignSize = (
      279
      37)
    object btnok: TButton
      Left = 111
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnokClick
      ExplicitLeft = 109
    end
    object btncancel: TButton
      Left = 198
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      OnClick = btncancelClick
      ExplicitLeft = 196
    end
  end
  object rgbranches: TRadioGroup
    Left = 0
    Top = 0
    Width = 279
    Height = 249
    Align = alClient
    Caption = 'Select a server Branch'
    Items.Strings = (
      'Normal (Recommended)'
      'Staging'
      'Pre-Release'
      'July 2016 (Old Blueprint System)'
      'October 2016 (XP System)')
    TabOrder = 1
    ExplicitWidth = 277
    ExplicitHeight = 239
  end
end
