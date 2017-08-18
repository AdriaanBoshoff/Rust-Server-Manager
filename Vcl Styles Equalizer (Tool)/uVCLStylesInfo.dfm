object FrmVCLStyleInfoDialog: TFrmVCLStyleInfoDialog
  Left = 802
  Top = 497
  BorderStyle = bsDialog
  Caption = 'Save Theme'
  ClientHeight = 119
  ClientWidth = 244
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 504
    Top = 8
    Width = 41
    Height = 19
    Caption = 'Name'
    Visible = False
  end
  object Label2: TLabel
    Left = 641
    Top = 8
    Width = 49
    Height = 19
    Caption = 'Author'
    Visible = False
  end
  object Label3: TLabel
    Left = 504
    Top = 48
    Width = 91
    Height = 19
    Caption = 'Author EMail'
    Visible = False
  end
  object Label4: TLabel
    Left = 641
    Top = 48
    Width = 83
    Height = 19
    Caption = 'Author URL'
    Visible = False
  end
  object Label5: TLabel
    Left = 504
    Top = 88
    Width = 53
    Height = 19
    Caption = 'Version'
    Visible = False
  end
  object lbl1: TLabel
    Left = 62
    Top = 22
    Width = 120
    Height = 25
    Caption = 'Save theme?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EditName: TEdit
    Left = 504
    Top = 24
    Width = 121
    Height = 27
    Enabled = False
    TabOrder = 0
    Text = 'theme'
    Visible = False
  end
  object EditAuthor: TEdit
    Left = 641
    Top = 24
    Width = 121
    Height = 27
    TabOrder = 1
    Visible = False
  end
  object EditEMail: TEdit
    Left = 504
    Top = 64
    Width = 121
    Height = 27
    TabOrder = 2
    Visible = False
  end
  object EditURL: TEdit
    Left = 641
    Top = 64
    Width = 121
    Height = 27
    TabOrder = 3
    Visible = False
  end
  object EditVersion: TEdit
    Left = 504
    Top = 104
    Width = 121
    Height = 27
    TabOrder = 4
    Visible = False
  end
  object Button1: TButton
    Left = 8
    Top = 86
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 153
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = Button2Click
  end
end
