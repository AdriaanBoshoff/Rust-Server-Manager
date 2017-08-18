object frmwelcome: Tfrmwelcome
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Welcome to RSM (Rust Server Manager)'
  ClientHeight = 490
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object pnl1: TPanel
    Left = 0
    Top = 438
    Width = 782
    Height = 52
    Align = alBottom
    TabOrder = 0
    object lbl10: TLabel
      Left = 21
      Top = 16
      Width = 552
      Height = 19
      Caption = 
        'Sadly this message will popup after every restart due to how imp' +
        'ortant this is!'
    end
    object btn1: TButton
      Left = 692
      Top = 6
      Width = 86
      Height = 43
      Caption = 'Close'
      TabOrder = 0
      OnClick = btn1Click
    end
  end
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 782
    Height = 438
    ActivePage = tschangelog
    Align = alClient
    TabOrder = 1
    object tswelcome: TTabSheet
      Caption = 'Welcome'
      object lbl4: TLabel
        Left = 16
        Top = 16
        Width = 177
        Height = 25
        Caption = 'Welcome to RSM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 16
        Top = 56
        Width = 738
        Height = 285
        Caption = 
          'Rust Server Manager (RSM) was made and designed by the on and on' +
          'ly Inforcer25'#13#10'RSM Allows you to create and configure multiple R' +
          'ust Servers with ease.'#13#10#13#10'With RSM you can manage plugins and ed' +
          'it them directly form the application with syntax.'#13#10'You can also' +
          ' press the Update Plugins button and it will update all your plu' +
          'gins.'#13#10#13#10'RSM also has an OxideBrowser that allows you to downloa' +
          'd plugins and so on straight from the application'#13#10'OxideBrowser ' +
          'works by emulating Internet Explorer so if it'#39's slow don'#39't blame' +
          ' me.'#13#10#13#10'Want to AutoBackup every single file of your server ever' +
          'y x amount of time? I got you covered with the trusty AutoBackup' +
          ' Tab.'#13#10'Backup All your files and stop worrying about manually ba' +
          'cking up your data.'#13#10#13#10'There are more features so go check them ' +
          'out!'
        WordWrap = True
      end
      object lbl6: TLabel
        Left = 16
        Top = 363
        Width = 206
        Height = 19
        Cursor = crHandPoint
        Caption = 'Subscribe to me on YouTube'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
        OnClick = lbl6Click
      end
      object lbl7: TLabel
        Left = 248
        Top = 363
        Width = 146
        Height = 19
        Cursor = crHandPoint
        Caption = 'Follow me on twitter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clAqua
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
        OnClick = lbl7Click
      end
    end
    object tshowto: TTabSheet
      Caption = 'How to'
      ImageIndex = 1
      object lbl1: TLabel
        Left = 16
        Top = 16
        Width = 170
        Height = 25
        Caption = 'Server Installer:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 16
        Top = 56
        Width = 734
        Height = 152
        Caption = 
          '[1] Click Install Steamcmd and then install again.'#13#10'[2] After th' +
          'ats done click Install Server then choose your branch.'#13#10'[3] Your' +
          ' server should start downloading now. If for some reason it stop' +
          's then click install again and it will continue where it left of' +
          'f.'#13#10'[4] Click install OxideMod if you want your server to be mod' +
          'ded.'#13#10#13#10'If you want to update your server just click Update. If ' +
          'there'#39's an update out'#13#10'and it'#39's not downloading it just wait a f' +
          'ew minutes as SteamCMD may be delayed.'
        WordWrap = True
      end
      object Label1: TLabel
        Left = 16
        Top = 224
        Width = 168
        Height = 25
        Caption = 'Multiple Servers'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 16
        Top = 264
        Width = 592
        Height = 95
        Caption = 
          'You will have a server called DefaultServer by default.'#13#10'[1] Rem' +
          'ove the Text and call it what ever you want.'#13#10'[2] Edit the confi' +
          'g how ever you want and click save.'#13#10'[3] To switch between serve' +
          'rs dubble click on the server you want in the server list.'#13#10'[4] ' +
          'After you'#39've chosen the server you want click start and it will ' +
          'start that server!'
      end
    end
    object tschangelog: TTabSheet
      Caption = 'Changelog for this update'
      ImageIndex = 2
      object lbl8: TLabel
        Left = 17
        Top = 56
        Width = 740
        Height = 325
        Caption = 
          'THIS IS NOT READY TO USE FOR YOUR CURRENT SERVERS!'#13#10#13#10'This updat' +
          'e saves the server config in the server folder (myserver\setting' +
          's.ini).'#13#10'Because of this update you need to redo all the server ' +
          'configs or copy/paste your current settings.ini into your server' +
          ' folder.'#13#10#13#10'- Changed a lot of stuff behind the scenes.'#13#10'- Added' +
          ' support for multiple servers (Read the How To)'#13#10'- You can now s' +
          'ave settings for each server! (Read the How To)'#13#10'- Some fixes fo' +
          'r the branch getting lost after clicking cancel when choosing th' +
          'e branch.'#13#10'- Added this welcome screen with tabs.'#13#10'- Some change' +
          's and fixes behind the scenes.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object lbl9: TLabel
        Left = 218
        Top = 11
        Width = 337
        Height = 33
        Caption = 'READ EVERYTHING BELOW!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
    end
  end
end
