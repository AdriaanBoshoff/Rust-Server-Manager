object frmservercreator: Tfrmservercreator
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Create New Server'
  ClientHeight = 106
  ClientWidth = 245
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
    Width = 146
    Height = 19
    Caption = 'New Server Identity:'
  end
  object pnl1: TPanel
    Left = 0
    Top = 69
    Width = 245
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      245
      37)
    object btn1: TButton
      Left = 77
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Create'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 164
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object edtserveridentity: TEdit
    Left = 8
    Top = 33
    Width = 229
    Height = 27
    CharCase = ecLowerCase
    TabOrder = 1
    OnKeyPress = edtserveridentityKeyPress
  end
end
