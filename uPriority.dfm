object frmpriority: Tfrmpriority
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Priority'
  ClientHeight = 234
  ClientWidth = 337
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
    Top = 197
    Width = 337
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 268
    ExplicitWidth = 645
    DesignSize = (
      337
      37)
    object btn1: TButton
      Left = 167
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Start'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 248
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object rg1: TRadioGroup
    Left = 8
    Top = 8
    Width = 315
    Height = 183
    Caption = 'Choose a priority for the server to run on'
    Items.Strings = (
      'Low'
      'Normal'
      'High'
      'Realtime'
      'Above Normal'
      'Below Normal')
    TabOrder = 1
  end
end
