object frmcustomstart: Tfrmcustomstart
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Custom Server Start'
  ClientHeight = 567
  ClientWidth = 559
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 530
    Width = 559
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      559
      37)
    object btn1: TButton
      Left = 405
      Top = 6
      Width = 67
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Start'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 478
      Top = 6
      Width = 67
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object mmo1: TMemo
    Left = 0
    Top = 0
    Width = 559
    Height = 530
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
