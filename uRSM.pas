{
  ###                                                   #####  #######
  #  #    # ######  ####  #####   ####  ###### #####  #     # #
  #  ##   # #      #    # #    # #    # #      #    #       # #
  #  # #  # #####  #    # #    # #      #####  #    #  #####  ######
  #  #  # # #      #    # #####  #      #      #####  #             #
  #  #   ## #      #    # #   #  #    # #      #   #  #       #     #
  ### #    # #       ####  #    #  ####  ###### #    # #######  #####

  Follow me on Twitter for updates: https://twitter.com/inforcer25
  Subscribe to me on YouTube: https://www.youtube.com/Inforcer25
  GitHub: https://github.com/Inforcer25
  Donate to me: https://www.paypal.me/Inforcer25
  Website: http://inforcer25.co.za/
}
unit uRSM;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls,
  DosCommand, uOxideModInstaller, uSteamCMDinstaller, uServerInstaller,
  Tlhelp32, IniFiles,
  Vcl.Samples.Spin, Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg,
  ShellAPI, WinSock,
  uServerDescription, uServerWipe, uPluginConfigEditor, FileCtrl, Vcl.Themes,
  WinInet, IdHTTP,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  Vcl.Styles.Utils.SysControls, Vcl.Styles,
  uVclStylesEQU, uMultiDownloader, Vcl.OleCtrls, SHDocVw, uOxideModBrowser,
  uWelcome, Vcl.CheckLst, uPluginEnableDisable, uDownload, uCustomStart, uPriority,
  Vcl.AppAnalytics, System.Win.TaskbarCore, Vcl.Taskbar, Vcl.JumpList,
  Vcl.WinXCtrls, Vcl.Menus, oleAuto, ActiveX, uUpnp;

type
  Tfrmmain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pgc1: TPageControl;
    tsserverconfig: TTabSheet;
    tsinstaller: TTabSheet;
    mmoinstaller: TMemo;
    btninstallserver: TButton;
    btninstallsteamcmd: TButton;
    btninstalloxidemod: TButton;
    btnvalidateserver: TButton;
    btncancel: TButton;
    dscmnd1: TDosCommand;
    btnstartserver: TButton;
    lbledtservername: TLabeledEdit;
    rgserverlevel: TRadioGroup;
    lbledtserverport: TLabeledEdit;
    lbledtrconport: TLabeledEdit;
    lbledtserverdescription: TLabeledEdit;
    lbledtserverurl: TLabeledEdit;
    lbledtserverbanner: TLabeledEdit;
    lbledtrconpass: TLabeledEdit;
    sedserverseed: TSpinEdit;
    lblserverseed: TLabel;
    lblworldsize: TLabel;
    sedworldsize: TSpinEdit;
    sedmaxplayers: TSpinEdit;
    lblmaxplayers: TLabel;
    btngenerate: TButton;
    lbledtserveridentity: TLabeledEdit;
    lstservers: TListBox;
    lblcurrentservers: TLabel;
    btnsaveconfig: TButton;
    btnexportinstallerlog: TButton;
    lbl5: TLabel;
    lbl6: TLabel;
    img1: TImage;
    grp1: TGroupBox;
    lbl9: TLabel;
    lbl11: TLabel;
    lblinstallinstructions: TLabel;
    lblactivebranch: TLabel;
    lblbranch: TLabel;
    btn11: TButton;
    lbledtserverip: TLabeledEdit;
    btnwipeserver: TButton;
    tsplugins: TTabSheet;
    lbl14: TLabel;
    lbl15: TLabel;
    pnl3: TPanel;
    btnrefreshplugins: TButton;
    btn16: TButton;
    lbl4: TLabel;
    lblplugincount: TLabel;
    tsbackup: TTabSheet;
    lbledtbackuppath: TLabeledEdit;
    btnselectbackuppath: TButton;
    lbl16: TLabel;
    sedbackup: TSpinEdit;
    btnstartbackup: TButton;
    btnstopbackup: TButton;
    lbledtbackupstatus: TLabeledEdit;
    tmrbackup: TTimer;
    mmobackuplog: TMemo;
    dscmndbackup: TDosCommand;
    lbl17: TLabel;
    tmrnextbackup: TTimer;
    btn13: TButton;
    lbl18: TLabel;
    lbl19: TLabel;
    btn17: TButton;
    lbl20: TLabel;
    lbledtrconip: TLabeledEdit;
    btn18: TButton;
    btn19: TButton;
    lblinstallerlog: TLabel;
    btnconnect: TButton;
    tssettings: TTabSheet;
    grp2: TGroupBox;
    cbbthemelist: TComboBox;
    btn21: TButton;
    grp3: TGroupBox;
    chksaveactivetab: TCheckBox;
    chkautorestart: TCheckBox;
    grp4: TGroupBox;
    trckbrtransparency: TTrackBar;
    lblversion: TLabel;
    idhtp1: TIdHTTP;
    btn22: TButton;
    chkloadcustomtheme: TCheckBox;
    sedsaveinterval: TSpinEdit;
    lblsaveinterval: TLabel;
    btn28: TButton;
    grpserversettings: TGroupBox;
    chkchecklatestversion: TCheckBox;
    tmrrefreshlatestversion: TTimer;
    btn24: TButton;
    chklstconfigs: TCheckListBox;
    chklstplugins: TCheckListBox;
    chklstdata: TCheckListBox;
    btn14: TButton;
    lbl24: TLabel;
    lbl25: TLabel;
    tswelcome: TTabSheet;
    pgc2: TPageControl;
    tsinfo: TTabSheet;
    tsTipsandTricks: TTabSheet;
    lbl27: TLabel;
    lbl28: TLabel;
    lbltickrate: TLabel;
    sedtickrate: TSpinEdit;
    btn7: TButton;
    btn15: TButton;
    btn23: TButton;
    lbl30: TLabel;
    mmo1: TMemo;
    lbl31: TLabel;
    btn25: TButton;
    btn26: TButton;
    btn27: TButton;
    btncustomstart: TButton;
    apnlytcs1: TAppAnalytics;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    lbl41: TLabel;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    tglswtchglobalchat: TToggleSwitch;
    tglswtchradiation: TToggleSwitch;
    tglswtcheac: TToggleSwitch;
    tglswtchvac: TToggleSwitch;
    tglswtchrconweb: TToggleSwitch;
    tglswtchserverpve: TToggleSwitch;
    tglswtchstability: TToggleSwitch;
    tglswtchaithink: TToggleSwitch;
    tglswtchaimove: TToggleSwitch;
    tglswtchinstantcraft: TToggleSwitch;
    tglswtchantihack: TToggleSwitch;
    tglswtchdecay: TToggleSwitch;
    trycn1: TTrayIcon;
    pmtray: TPopupMenu;
    Close1: TMenuItem;
    btnupdate: TButton;
    chkloadlangfile: TCheckBox;
    btn6: TButton;
    lbl1: TLabel;
    grplanguage: TGroupBox;
    btn8: TButton;
    btn9: TButton;
    lbl2: TLabel;
    btn4: TButton;
    lblserveridentity: TLabel;
    lbl3: TLabel;
    procedure btncancelClick(Sender: TObject);
    function KillTask(ExeFileName: string): Integer;
    procedure btninstalloxidemodClick(Sender: TObject);
    procedure btninstallsteamcmdClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btninstallserverClick(Sender: TObject);
    function SelectServerBranch: string;
    procedure FormCreate(Sender: TObject);
    procedure LoadSettings;
    procedure btngenerateClick(Sender: TObject);
    procedure GetDirList(sPath: string);
    procedure lstserversDblClick(Sender: TObject);
    procedure btnexportinstallerlogClick(Sender: TObject);
    procedure btnsaveconfigClick(Sender: TObject);
    procedure btnvalidateserverClick(Sender: TObject);
    procedure btnstartserverClick(Sender: TObject);
    procedure OpenURL(url: string);
    procedure lbl9Click(Sender: TObject);
    procedure lbl11Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btnwipeserverClick(Sender: TObject);
    procedure btn16Click(Sender: TObject);
    procedure ListFileDir(Path: string; FileList: TStrings);
    procedure btnrefreshpluginsClick(Sender: TObject);
    procedure btnselectbackuppathClick(Sender: TObject);
    procedure btnstartbackupClick(Sender: TObject);
    procedure btnstopbackupClick(Sender: TObject);
    function CopyPaste(xSourcePath, xDestPath, xPara: string): Boolean;
    procedure tmrbackupTimer(Sender: TObject);
    procedure tmrnextbackupTimer(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn17Click(Sender: TObject);
    procedure lbl20Click(Sender: TObject);
    procedure btn18Click(Sender: TObject);
    procedure OpenFolder(Folder: string);
    procedure btn19Click(Sender: TObject);
    procedure btnconnectClick(Sender: TObject);
    procedure cbbthemelistChange(Sender: TObject);
    procedure btn21Click(Sender: TObject);
    procedure trckbrtransparencyChange(Sender: TObject);
    function IsConnected: Boolean;
    function GetLatesVersion: string;
    procedure btn22Click(Sender: TObject);
    procedure lbl27Click(Sender: TObject);
    procedure lbl30Click(Sender: TObject);
    procedure lbl34Click(Sender: TObject);
    procedure MultiDownloader(link: string);
    procedure lbl36Click(Sender: TObject);
    procedure btn28Click(Sender: TObject);
    procedure tmrrefreshlatestversionTimer(Sender: TObject);
    procedure btn24Click(Sender: TObject);
    procedure chklstconfigsDblClick(Sender: TObject);
    procedure chklstdataDblClick(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure LoadRSMsettings;
    procedure lbl24Click(Sender: TObject);
    procedure lbl25Click(Sender: TObject);
    procedure StartApplication(Application: string);
    procedure btn7Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btn23Click(Sender: TObject);
    procedure btn25Click(Sender: TObject);
    procedure btn26Click(Sender: TObject);
    procedure btn27Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DownloadExtraFiles;
    procedure btncustomstartClick(Sender: TObject);
    function SelectPriority: String;
    procedure Close1Click(Sender: TObject);
    procedure btnupdateClick(Sender: TObject);
    procedure LoadLanguageFile;
    procedure MakeLanguageFile;
    procedure btn6Click(Sender: TObject);
    procedure lbl1Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function GetLocalIP: string;
    procedure btn4Click(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure lbl3Click(Sender: TObject);
  private
    { Private declarations }
    //Server Options variables
    globalchat, pve, stability, aithink, radiation, eac, vac: string;
    aimove, instantcraft, antihack, decay, rconweb: string;
  public
    { Public declarations }
    ini_settings, ini_RSMsettings, Branch: String;
    servername, description, serverurl, serverbanner, saveinterval: string;
    serverseed, worldsize, maxplayers, serveridentity, rconip,
      activeserver: string;
    rconpass, rconport, serverport, maptype, backupdir, serverip: string;
    tickrate: Integer;
    nextbackup, rtime: Real;
    ShowWelcome: Boolean;
  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.dfm}

procedure Tfrmmain.btnexportinstallerlogClick(Sender: TObject);
begin
  mmoinstaller.Lines.SaveToFile('installer.log');
end;

procedure Tfrmmain.btn11Click(Sender: TObject);
var
  description: string;
begin
  description := lbledtserverdescription.Text;
  description := StringReplace(description, ' \n', #13#10, [rfReplaceAll]);
  frmdescription.mmo1.Text := description;
  frmdescription.ShowModal;
  lbledtserverdescription.Text := frmdescription.description;
end;

procedure Tfrmmain.btnwipeserverClick(Sender: TObject);
begin
  frmwipe.serveridentity := serveridentity;
  frmwipe.ShowModal;
end;

procedure Tfrmmain.btn13Click(Sender: TObject);
begin
  OpenURL('http://oxidemod.org/plugins/categories/rust.24/?order=rating_weighted');
end;

procedure Tfrmmain.btn14Click(Sender: TObject);
var
  i_data, i_plugins, i_configs: Integer;
begin
  case MessageDlg
    ('Are you sure you want to delete all checked files? They will be lost FOREVER!',
    mtConfirmation, [mbOK, mbCancel], 0) of
    mrOk:
      begin

        for i_data := 0 to chklstdata.Items.Count - 1 do
        begin
          if chklstdata.Checked[i_data] then
          begin
            DeleteFile('.\server\' + serveridentity + '\oxide\data\' + chklstdata.Items.Strings[i_data]);
          end;
        end;

        for i_plugins := 0 to chklstplugins.Items.Count - 1 do
        begin
          if chklstplugins.Checked[i_plugins] then
          begin
            DeleteFile('.\server\'+ serveridentity +'\oxide\plugins\' + chklstplugins.Items.Strings
              [i_plugins]);
          end;
        end;

        for i_configs := 0 to chklstconfigs.Items.Count - 1 do
        begin
          if chklstconfigs.Checked[i_configs] then
          begin
            DeleteFile('.\server\' + serveridentity +  '\oxide\config\' + chklstconfigs.Items.Strings
              [i_configs]);
          end;
        end;

        ShowMessage('All selected items have been deleted!');
        btnrefreshplugins.Click;
      end;
    mrCancel:
      begin
        ShowMessage('Nothing has been deleted.');
      end;
  end;
end;

procedure Tfrmmain.btn15Click(Sender: TObject);
begin
  OpenURL('https://www.youtube.com/channel/UCcTPklJvT-3u0e7K6HBKYvw');
end;

procedure Tfrmmain.btnselectbackuppathClick(Sender: TObject);
var
  ini: TIniFile;
begin
  if selectdirectory('Select a directory to backup to', '', backupdir) then
    lbledtbackuppath.Text := backupdir;

  ini := TIniFile.Create(ini_RSMsettings);
  try
    ini.WriteString('Application Settings', 'backupto', backupdir);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.btnrefreshpluginsClick(Sender: TObject);
begin
  chklstplugins.Clear;
  chklstconfigs.Clear;
  chklstdata.Clear;
  ListFileDir('.\server\' + activeserver + '\oxide\plugins\', chklstplugins.Items);
  ListFileDir('.\server\' + activeserver + '\oxide\config\', chklstconfigs.Items);
  ListFileDir('.\server\' + activeserver + '\oxide\data\', chklstdata.Items);
  lblplugincount.Caption := '[' + IntToStr(chklstplugins.Items.Count) + ']';
end;

procedure Tfrmmain.Close1Click(Sender: TObject);
begin
  Close;
end;

function Tfrmmain.CopyPaste(xSourcePath, xDestPath, xPara: string): Boolean;
var
  PFileMsg: TSHFileOpStruct;
  mNowPath: string;
begin
  Result := False;
  FillChar(PFileMsg, sizeof(PFileMsg), #0);
  if pos('.', xPara) = 0 then
    exit;
  mNowPath := GetCurrentDir;
  if xSourcePath <> '' then
    if not DirectoryExists(xSourcePath) then
    begin
      ShowMessage('The source path does not exist !');
      exit;
    end;
  if xDestPath <> '' then
    if not DirectoryExists(xDestPath) then
    begin
      ShowMessage('The destination path does not exist !');
      exit;
    end;
  if SetCurrentDirectory(Pchar(xSourcePath)) then
  begin
    with PFileMsg do
    begin
      if Owner is TForm then
        Wnd := TForm(Owner).Handle
      else
        Wnd := Application.Handle;
      if xDestPath <> '' then
      begin
        wFunc := FO_COPY;
        PTo := Pchar(xDestPath);
        fFlags := FOF_MULTIDESTFILES + FOF_NOCONFIRMATION;
      end
      else
      begin
        wFunc := FO_DELETE;
        fFlags := FOF_ALLOWUNDO + FOF_NOCONFIRMATION;
      end;
      pFrom := Pchar(xPara + #0#0);
    end;
    SHFileOperation(PFileMsg);
    SetCurrentDirectory(Pchar(mNowPath));
    Application.ProcessMessages;
    Result := True;
  end;
end;

procedure Tfrmmain.DownloadExtraFiles;
begin
  frmextradownload.ShowModal;
end;

procedure Tfrmmain.btn16Click(Sender: TObject);
begin
  OpenURL('http://oxidemod.org/plugins/categories/universal.58/');
end;

procedure Tfrmmain.btn17Click(Sender: TObject);
begin
  if Trim(lbledtbackuppath.Text) <> '' then
  begin
    mmobackuplog.Clear;
    dscmndbackup.CommandLine := 'xcopy "' + GetCurrentDir + '" "' + backupdir +
      '\" /h/i/c/k/e/r/y';
    dscmndbackup.OutputLines := mmobackuplog.Lines;
    if dscmndbackup.IsRunning = False then
      dscmndbackup.Execute
    else
    begin
      dscmndbackup.Stop;
      dscmndbackup.Execute
    end;
  end
  else
    ShowMessage('You need to select a path!');
end;

procedure Tfrmmain.btn18Click(Sender: TObject);
begin
  OpenFolder('.\server\' + serveridentity + '\oxide\plugins');
end;

procedure Tfrmmain.btn19Click(Sender: TObject);
begin
  OpenFolder('.\server\' + serveridentity + '\oxide\config');
end;

procedure Tfrmmain.btnstartbackupClick(Sender: TObject);
var
  time: Integer;
  command: TStringList;
begin
  if Trim(lbledtbackuppath.Text) <> '' then
  begin
    sedbackup.Enabled := False;
    btnstartbackup.Enabled := False;
    btnstopbackup.Enabled := True;
    nextbackup := 0;
    time := sedbackup.Value * 60000;
    tmrbackup.Interval := time;
    tmrbackup.Enabled := True;
    rtime := tmrbackup.Interval / 60000;
    nextbackup := rtime;
    tmrnextbackup.Enabled := True;
    lbledtbackupstatus.Text := 'Next Backup: ' + IntToStr(sedbackup.Value)
      + ' mins';
    btnselectbackuppath.Enabled := False;
    lbledtbackuppath.Enabled := False;
  end
  else
    ShowMessage('You need to select a path!');

end;

procedure Tfrmmain.btnstopbackupClick(Sender: TObject);
begin
  lbledtbackupstatus.Text := 'Stopped...';
  tmrbackup.Enabled := False;
  tmrnextbackup.Enabled := False;
  sedbackup.Enabled := True;
  btnstopbackup.Enabled := False;
  btnstartbackup.Enabled := True;
  btnselectbackuppath.Enabled := True;
  lbledtbackuppath.Enabled := True;
end;

procedure Tfrmmain.cbbthemelistChange(Sender: TObject);
begin
  TStyleManager.SetStyle(cbbthemelist.Text);
end;

procedure Tfrmmain.chklstdataDblClick(Sender: TObject);
begin
  if chklstdata.ItemIndex <> -1 then
    begin
      frmconfigeditor.sfolder := '.\server\' + serveridentity + '\oxide\data\';
      frmconfigeditor.sfile := chklstdata.Items[chklstdata.ItemIndex];
      frmconfigeditor.ShowModal;
    end;
end;

procedure Tfrmmain.chklstconfigsDblClick(Sender: TObject);
begin
  if chklstconfigs.ItemIndex <> -1 then
    begin
      frmconfigeditor.sfolder := '.\server\' + serveridentity + '\oxide\config\';
      frmconfigeditor.sfile := chklstconfigs.Items[chklstconfigs.ItemIndex];
      frmconfigeditor.ShowModal;
    end;
end;

procedure Tfrmmain.btninstallserverClick(Sender: TObject);
var
  command: TStringList;
  ini: TIniFile;
begin
  Branch := SelectServerBranch;

  if frminstalleroption.install = True then
    begin
      lblbranch.Caption := Branch;

      if Branch = 'normal' then
      begin

        ini := TIniFile.Create(ini_RSMsettings);
        try
          ini.WriteString('Application Settings', 'Branch', Branch);
        finally
          ini.Free;
        end;

        if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command := TStringList.Create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Installation...');
            command.Add('.\steamcmd' +
              '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir
              + '" +app_update 258550 +quit');
            command.Add('echo Done');
            command.SaveToFile('UpdateInstall.bat');
          finally
            command.Free
          end;

          dscmnd1.CommandLine := 'UpdateInstall.bat';
          dscmnd1.OutputLines := mmoinstaller.Lines;
          dscmnd1.Execute;
        end
        else
          ShowMessage
            ('It seems that steamcmd is not installed. Please click Install SteamCMD below');
      end;

      if Branch = 'staging' then
      begin
        ini := TIniFile.Create(ini_RSMsettings);
        try
          ini.WriteString('Application Settings', 'Branch', Branch);
        finally
          ini.Free;
        end;

        if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command := TStringList.Create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Installation...');
            command.Add('.\steamcmd' +
              '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir
              + '" +app_update 258550 -beta staging +quit');
            command.Add('echo Done');
            command.SaveToFile('UpdateInstall.bat');
          finally
            command.Free
          end;

          dscmnd1.CommandLine := 'UpdateInstall.bat';
          dscmnd1.OutputLines := mmoinstaller.Lines;
          dscmnd1.Execute;
        end
        else
          ShowMessage
            ('It seems that steamcmd is not installed. Please click Install SteamCMD below');
      end;

      if Branch = 'prerelease' then
      begin
        ini := TIniFile.Create(ini_RSMsettings);
        try
          ini.WriteString('Application Settings', 'Branch', Branch);
        finally
          ini.Free;
        end;

        if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command := TStringList.Create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Installation...');
            command.Add('.\steamcmd' +
              '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir
              + '" +app_update 258550 -beta prerelease +quit');
            command.Add('echo Done');
            command.SaveToFile('UpdateInstall.bat');
          finally
            command.Free
          end;

          dscmnd1.CommandLine := 'UpdateInstall.bat';
          dscmnd1.OutputLines := mmoinstaller.Lines;
          dscmnd1.Execute;
        end
        else
          ShowMessage
            ('It seems that steamcmd is not installed. Please click Install SteamCMD below');
      end;

      if Branch = 'july2016' then
      begin
        ini := TIniFile.Create(ini_RSMsettings);
        try
          ini.WriteString('Application Settings', 'Branch', Branch);
        finally
          ini.Free;
        end;

        if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command := TStringList.Create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Installation...');
            command.Add('.\steamcmd' +
              '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir
              + '" +app_update 258550 -beta july2016 +quit');
            command.Add('echo Done');
            command.SaveToFile('UpdateInstall.bat');
          finally
            command.Free
          end;

          dscmnd1.CommandLine := 'UpdateInstall.bat';
          dscmnd1.OutputLines := mmoinstaller.Lines;
          dscmnd1.Execute;
        end
        else
          ShowMessage
            ('It seems that steamcmd is not installed. Please click Install SteamCMD below');
      end;

      if Branch = 'october2016' then
      begin
        ini := TIniFile.Create(ini_RSMsettings);
        try
          ini.WriteString('Application Settings', 'Branch', Branch);
        finally
          ini.Free;
        end;

        if FileExists('.\steamcmd\steamcmd.exe') then
        begin
          btncancel.Click;
          dscmnd1.Stop;
          command := TStringList.Create;
          try
            command.Clear;
            command.Add('@echo off');
            command.Add('echo Starting Installation...');
            command.Add('.\steamcmd' +
              '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir
              + '" +app_update 258550 -beta october2016 +quit');
            command.Add('echo Done');
            command.SaveToFile('UpdateInstall.bat');
          finally
            command.Free
          end;

          dscmnd1.CommandLine := 'UpdateInstall.bat';
          dscmnd1.OutputLines := mmoinstaller.Lines;
          dscmnd1.Execute;
        end
        else
          ShowMessage
            ('It seems that steamcmd is not installed. Please click Install SteamCMD below');
      end;
  end;
end;

procedure Tfrmmain.btnconnectClick(Sender: TObject);
begin
  case MessageDlg
    ('RSM will now attempt to open Rust and connect to your server. Do you want to continue? (Only works if rust is closed)',
    mtConfirmation, [mbOK, mbCancel], 0) of
    mrOk:
      begin
        StartApplication('steam://connect/localhost:' + serverport);
      end;
    mrCancel:
      begin
        //ShowMessage('Canceled');
      end;
  end;
end;

procedure Tfrmmain.btn21Click(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_RSMsettings);
  try
    ini.WriteString('Application Settings', 'theme', cbbthemelist.Text);
    ini.WriteString('Application Settings', 'remember last tab',
      BoolToStr(chksaveactivetab.Checked));
    ini.WriteString('Application Settings', 'transparency',
      IntToStr(trckbrtransparency.Position));
    ini.WriteString('Application Settings', 'loadcustomtheme',
      BoolToStr(chkloadcustomtheme.Checked));
    ini.WriteString('Application Settings', 'checklatestversion',
      BoolToStr(chkchecklatestversion.Checked));
    ini.WriteString('Application Settings', 'loadlangfile',
      BoolToStr(chkloadlangfile.Checked));
  finally
    tmrrefreshlatestversion.Enabled := chkchecklatestversion.Checked;
    ini.Free;
  end;
end;

procedure Tfrmmain.btn22Click(Sender: TObject);
begin
  FrmHueSat.ShowModal
end;

procedure Tfrmmain.btn23Click(Sender: TObject);
begin
  OpenURL('https://twitter.com/inforcer25');
end;

procedure Tfrmmain.btn24Click(Sender: TObject);
var
  parameter: string;
begin
  if FileExists('PluginUpdater.exe') then
  begin
    parameter := '--pluginFolder "server\' + serveridentity + '\oxide\plugins"';
    ShellExecute(0, 'open', 'PluginUpdater.exe', PChar(parameter), nil, SW_SHOW);
  end
  else
  begin
    ShowMessage
      ('Plugin updater does not seem to be installed! You will be asked to download it after closing this window.');
    MultiDownloader('http://41.185.91.51/RSM/PluginUpdater.zip');
  end;

end;

procedure Tfrmmain.btn25Click(Sender: TObject);
begin
  OpenURL('http://oxidemod.org/threads/using-the-oxide-permission-system.24291/');
end;

procedure Tfrmmain.btn26Click(Sender: TObject);
begin
  OpenURL('https://developer.valvesoftware.com/wiki/Rust_Dedicated_Server');
end;

procedure Tfrmmain.btn27Click(Sender: TObject);
begin
  frmpluginenabledisable.serveridentity := serveridentity;
  frmpluginenabledisable.ShowModal;
  btnrefreshplugins.Click;
end;

procedure Tfrmmain.btn28Click(Sender: TObject);
begin
  frmoxidemodbrowser.Show;
end;

procedure Tfrmmain.btncustomstartClick(Sender: TObject);
begin
  frmcustomstart.ShowModal;
end;

procedure Tfrmmain.btninstallsteamcmdClick(Sender: TObject);
begin
  frmsteamcmdinstaller.ShowModal;
end;

procedure Tfrmmain.btnupdateClick(Sender: TObject);
begin
  OpenURL('https://inforcer25.co.za/');
end;

procedure Tfrmmain.btninstalloxidemodClick(Sender: TObject);
begin
  frmoxidemodinstaller.ShowModal;
end;

procedure Tfrmmain.btn4Click(Sender: TObject);
begin
  frmupnp.serverport := serverport;
  frmupnp.rconport := rconport;
  frmupnp.ShowModal;
end;

procedure Tfrmmain.btnvalidateserverClick(Sender: TObject);
var
  command: TStringList;
  ini: TIniFile;
begin
  if Branch = 'normal' then
    if FileExists('.\steamcmd\steamcmd.exe') then
    begin
      btncancel.Click;
      dscmnd1.Stop;
      command := TStringList.Create;
      try
        command.Clear;
        command.Add('@echo off');
        command.Add('echo Starting Validation...');
        command.Add('.\steamcmd' +
          '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir
          + '" +app_update 258550 validate +quit');
        command.Add('echo Done');
        command.SaveToFile('UpdateInstall.bat');
      finally
        command.Free
      end;

      dscmnd1.CommandLine := 'UpdateInstall.bat';
      dscmnd1.OutputLines := mmoinstaller.Lines;
      dscmnd1.Execute;
    end
    else
      ShowMessage
        ('It seems that steamcmd is not installed. Please click Install SteamCMD below');

  if Branch = 'staging' then
  begin
    if FileExists('.\steamcmd\steamcmd.exe') then
    begin
      btncancel.Click;
      dscmnd1.Stop;
      command := TStringList.Create;
      try
        command.Clear;
        command.Add('@echo off');
        command.Add('echo Starting Validation...');
        command.Add('.\steamcmd' +
          '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir
          + '" +app_update 258550 -beta staging validate +quit');
        command.Add('echo Done');
        command.SaveToFile('UpdateInstall.bat');
      finally
        command.Free
      end;

      dscmnd1.CommandLine := 'UpdateInstall.bat';
      dscmnd1.OutputLines := mmoinstaller.Lines;
      dscmnd1.Execute;
    end
    else
      ShowMessage
        ('It seems that steamcmd is not installed. Please click Install SteamCMD below');
  end;

  if Branch = 'prerelease' then
  begin
    if FileExists('.\steamcmd\steamcmd.exe') then
    begin
      btncancel.Click;
      dscmnd1.Stop;
      command := TStringList.Create;
      try
        command.Clear;
        command.Add('@echo off');
        command.Add('echo Starting Validation...');
        command.Add('.\steamcmd' +
          '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir
          + '" +app_update 258550 -beta prerelease validate +quit');
        command.Add('echo Done');
        command.SaveToFile('UpdateInstall.bat');
      finally
        command.Free
      end;

      dscmnd1.CommandLine := 'UpdateInstall.bat';
      dscmnd1.OutputLines := mmoinstaller.Lines;
      dscmnd1.Execute;
    end
    else
      ShowMessage
        ('It seems that steamcmd is not installed. Please click Install SteamCMD below');
  end;

  if Branch = 'july2016' then
  begin
    if FileExists('.\steamcmd\steamcmd.exe') then
    begin
      btncancel.Click;
      dscmnd1.Stop;
      command := TStringList.Create;
      try
        command.Clear;
        command.Add('@echo off');
        command.Add('echo Starting Validation...');
        command.Add('.\steamcmd' +
          '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir
          + '" +app_update 258550 -beta july2016 validate +quit');
        command.Add('echo Done');
        command.SaveToFile('UpdateInstall.bat');
      finally
        command.Free
      end;

      dscmnd1.CommandLine := 'UpdateInstall.bat';
      dscmnd1.OutputLines := mmoinstaller.Lines;
      dscmnd1.Execute;
    end
    else
      ShowMessage
        ('It seems that steamcmd is not installed. Please click Install SteamCMD below');
  end;

  if Branch = 'october2016' then
  begin
    if FileExists('.\steamcmd\steamcmd.exe') then
    begin
      btncancel.Click;
      dscmnd1.Stop;
      command := TStringList.Create;
      try
        command.Clear;
        command.Add('@echo off');
        command.Add('echo Starting Validation...');
        command.Add('.\steamcmd' +
          '\steamcmd.exe +login anonymous +force_install_dir "' + GetCurrentDir
          + '" +app_update 258550 -beta october2016 validate +quit');
        command.Add('echo Done');
        command.SaveToFile('UpdateInstall.bat');
      finally
        command.Free
      end;

      dscmnd1.CommandLine := 'UpdateInstall.bat';
      dscmnd1.OutputLines := mmoinstaller.Lines;
      dscmnd1.Execute;
    end
    else
      ShowMessage
        ('It seems that steamcmd is not installed. Please click Install SteamCMD below');
  end;
end;

procedure Tfrmmain.btn6Click(Sender: TObject);
begin
  OpenURL('https://inforcer25.co.za/forum/');
end;

procedure Tfrmmain.btnstartserverClick(Sender: TObject);
var
  commands: TStringList;
  priority: string;
begin
  {priority := SelectPriority;

  if frmpriority.CanStart = True then
    begin                      }
      commands := TStringList.Create;
      try
        commands.Add('@echo off');
        commands.Add(':start');
        commands.Add('cls');
        commands.Add('echo Starting Server...');
        commands.Add('echo This may take a while...');
        commands.Add('RustDedicated.exe -batchmode -nographics ^');
        commands.Add('+oxide.directory "server/' + serveridentity + '/oxide" ^');
        commands.Add('+rcon.ip ' + rconip + ' ^');
        commands.Add('+rcon.port ' + rconport + ' ^');
        commands.Add('+rcon.password "' + rconpass + '" ^');
        commands.Add('+server.ip ' + serverip + ' ^');
        commands.Add('+server.port ' + serverport + ' ^');
        commands.Add('+server.maxplayers ' + maxplayers + ' ^');
        commands.Add('+server.hostname "' + servername + '" ^');
        commands.Add('+server.identity "' + serveridentity + '" ^');
        commands.Add('+server.level "' + maptype + '" ^');
        commands.Add('+server.seed ' + serverseed + ' +server.worldsize ' + worldsize + ' ^');
        commands.Add('+server.saveinterval ' + saveinterval + ' ^');
        commands.Add('+server.globalchat ' + globalchat + ' ^');
        commands.Add('+server.description "' + description + '" ^');
        commands.Add('+server.headerimage "' + serverbanner + '" ^');
        commands.Add('+server.url "' + serverurl + '" ^');
        commands.Add('+server.radiation ' + radiation + ' ^');
        commands.Add('+server.eac ' + eac + ' ^');
        commands.Add('+server.secure ' + vac + ' ^');
        commands.Add('+server.tickrate ' + IntToStr(tickrate) + ' ^');
        commands.Add('+server.pve ' + pve + ' ^');
        commands.Add('+server.stability ' + stability + ' ^');
        commands.Add('+ai.think ' + aithink + ' ^');
        commands.Add('+ai.move ' + aimove + ' ^');
        commands.Add('+craft.instant ' + instantcraft + ' ^');
        commands.Add('+antihack.enabled ' + antihack + ' ^');
        commands.Add('+decay.scale ' + decay);

        if chkautorestart.Checked then
          begin
            commands.Add('cls');
            commands.Add('echo Restarting Server...');
            commands.Add('timeout /t 10');
            commands.Add('goto start');
          end;

      finally
        commands.SaveToFile('start.bat');
        commands.Free;
      end;

      if FileExists('RustDedicated.exe') then
        WinExec('start.bat', SW_SHOWNORMAL)
      else
        ShowMessage('Could not find RustDedicated.exe! Is the server installed?');

      lstservers.Clear;
      GetDirList('.\server');
    //end;

end;

procedure Tfrmmain.btn7Click(Sender: TObject);
begin
  OpenURL('https://www.paypal.me/Inforcer25');
end;

procedure Tfrmmain.btn8Click(Sender: TObject);
begin
  MakeLanguageFile;
end;

procedure Tfrmmain.btn9Click(Sender: TObject);
begin
  LoadLanguageFile;
end;

procedure Tfrmmain.btngenerateClick(Sender: TObject);
begin
  sedserverseed.Value := Random(02147483647);
end;

procedure Tfrmmain.btnsaveconfigClick(Sender: TObject);
var
  ini: TIniFile;
  exists: Boolean;
begin
  activeserver := lbledtserveridentity.Text;

  if DirectoryExists('.\server\' + activeserver) then
  begin
    ini_settings := '.\server\' + activeserver + '\settings.ini';
    exists := True;
  end
  else
  begin
    ForceDirectories('.\server\' + activeserver);
    ini_settings := '.\server\' + activeserver + '\settings.ini';
    exists := True;
  end;

  if exists = True then
  begin
    servername := lbledtservername.Text;
    description := lbledtserverdescription.Text;
    serverurl := lbledtserverurl.Text;
    serverbanner := lbledtserverbanner.Text;
    serverseed := IntToStr(sedserverseed.Value);
    worldsize := IntToStr(sedworldsize.Value);
    maxplayers := IntToStr(sedmaxplayers.Value);
    if Trim(lbledtserveridentity.Text) <> '' then
      serveridentity := lbledtserveridentity.Text
    else
      ShowMessage('The Server Identity cannot be empty!');
    rconpass := lbledtrconpass.Text;
    rconport := lbledtrconport.Text;
    serverport := lbledtserverport.Text;
    serverip := lbledtserverip.Text;
    rconip := lbledtrconip.Text;
    saveinterval := IntToStr(sedsaveinterval.Value);
    tickrate := sedtickrate.Value;
    if rgserverlevel.ItemIndex = -1 then
      ShowMessage
        ('Error: You need to select a map! The config was still saved but you may get errors');
    if rgserverlevel.ItemIndex = 0 then
      maptype := 'Procedural Map';
    if rgserverlevel.ItemIndex = 1 then
      maptype := 'Barren';
    if rgserverlevel.ItemIndex = 2 then
      maptype := 'HapisIsland';
    if rgserverlevel.ItemIndex = 3 then
      maptype := 'SavasIslandp';
    if rgserverlevel.ItemIndex = 4 then
      maptype := 'SavasIsland_koth';
    if rgserverlevel.ItemIndex = 5 then
      maptype := 'CraggyIsland';

    ini := TIniFile.Create(ini_settings);
    try
      ini.WriteString('Server Config', 'servername', servername);
      ini.WriteString('Server Config', 'description', description);
      ini.WriteString('Server Config', 'serverurl', serverurl);
      ini.WriteString('Server Config', 'serverbanner', serverbanner);
      ini.WriteString('Server Config', 'serverseed', serverseed);
      ini.WriteString('Server Config', 'worldsize', worldsize);
      ini.WriteString('Server Config', 'maxplayers', maxplayers);
      ini.WriteString('Server Config', 'serveridentity', serveridentity);
      ini.WriteString('Server Config', 'rconpass', rconpass);
      ini.WriteString('Server Config', 'rconport', rconport);
      ini.WriteString('Server Config', 'serverport', serverport);
      ini.WriteString('Server Config', 'maptype', maptype);
      ini.WriteString('ServerSettings', 'Branch', Branch);
      ini.WriteString('ServerSettings', 'serverip', serverip);
      ini.WriteString('ServerSettings', 'rconip', rconip);
      ini.WriteString('ServerSettings', 'saveinterval', saveinterval);
      ini.WriteString('ServerSettings', 'tickrate', IntToStr(tickrate));

      if tglswtchrconweb.State = tssOn then
        begin
          ini.WriteString('ServerSettings', 'rconweb', '1');
          rconweb := '1';
        end
      else
        begin
          ini.WriteString('ServerSettings', 'rconweb', '0');
          rconweb := '0';
        end;

      if tglswtchglobalchat.State = tssOn then
        begin
          ini.WriteString('ServerSettings', 'globalchat', '1');
          globalchat := '1';
        end
      else
        begin
          ini.WriteString('ServerSettings', 'globalchat', '0');
          globalchat := '0';
        end;

      if tglswtchserverpve.State = tssOn then
        begin
          ini.WriteString('ServerSettings', 'pve', '1');
          pve := '1';
        end
      else
        begin
          ini.WriteString('ServerSettings', 'pve', '0');
          pve := '0';
        end;

      if tglswtchstability.State = tssOn then
        begin
          ini.WriteString('ServerSettings', 'stability', '1');
          stability := '1';
        end
      else
        begin
          ini.WriteString('ServerSettings', 'stability', '0');
          stability := '0';
        end;

      if tglswtchaithink.State = tssOn then
        begin
          ini.WriteString('ServerSettings', 'aithink', '1');
          aithink := '1';
        end
      else
        begin
          ini.WriteString('ServerSettings', 'aithink', '0');
          aithink := '0';
        end;

      if tglswtchradiation.State = tssOn then
        begin
          ini.WriteString('ServerSettings', 'radiation', '1');
          radiation := '1';
        end
      else
        begin
          ini.WriteString('ServerSettings', 'radiation', '0');
          radiation := '0';
        end;

      if tglswtcheac.State = tssOn then
        begin
          ini.WriteString('ServerSettings', 'easyanticheat', '1');
          eac := '1';
        end
      else
        begin
          ini.WriteString('ServerSettings', 'easyanticheat', '0');
          eac := '0';
        end;

      if tglswtchvac.State = tssOn then
        begin
          ini.WriteString('ServerSettings', 'secure', '1');
          vac := '1';
        end
      else
        begin
          ini.WriteString('ServerSettings', 'secure', '0');
          vac := '0';
        end;

      if tglswtchaimove.State = tssOn then
        begin
          ini.WriteString('ServerSettings', 'aimove', '1');
          aithink := '1';
        end
      else
        begin
          ini.WriteString('ServerSettings', 'aimove', '0');
          aithink := '0';
        end;

      if tglswtchinstantcraft.State = tssOn then
      begin
        ini.WriteString('ServerSettings', 'instantcraft', '1');
        instantcraft := '1';
      end
      else
      begin
        ini.WriteString('ServerSettings', 'instantcraft', '0');
        instantcraft := '0';
      end;

      if tglswtchantihack.State = tssOn then
      begin
        ini.WriteString('ServerSettings', 'antihack', '1');
        antihack := '1';
      end
      else
      begin
        ini.WriteString('ServerSettings', 'antihack', '0');
        antihack := '0';
      end;

      if tglswtchdecay.State = tssOn then
      begin
        ini.WriteString('ServerSettings', 'decay', '1');
        decay := '1';
      end
      else
      begin
        ini.WriteString('ServerSettings', 'decay', '0');
        decay := '0';
      end;

    finally
      ini.Free;
    end;
  end;

  ini := TIniFile.Create(ini_RSMsettings);
  try
    ini.WriteString('Application Settings', 'activeserver',
      lbledtserveridentity.Text);
  finally
    ini.Free;
  end;

  lstservers.Clear;
  GetDirList('.\server');
  lblcurrentservers.Caption := 'Current Servers: [' +
    IntToStr(lstservers.Items.Count) + ']';

  LoadSettings;
end;

procedure Tfrmmain.btncancelClick(Sender: TObject);
begin
  if dscmnd1.IsRunning then
    dscmnd1.Stop;
  KillTask('steamcmd.exe');
end;

procedure Tfrmmain.FormActivate(Sender: TObject);
begin
  if FileExists('libeay32.dll') and FileExists('ssleay32.dll') and FileExists('Rust.ttf') then
    //
  else
    begin
      ShowMessage('There seems to be some missing files. They will be downloaded after clicking ok. (Size: 1mb)');

      if IsConnected = True then
        begin
          DownloadExtraFiles;
          ShowMessage('Please restart Rust Server Manager for the files to take full effect.');
        end
      else
        ShowMessage('Error: There is no internet connection!');
    end;
end;

procedure Tfrmmain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  lasttab: string;
  ini: TIniFile;
begin
  RemoveFontResource('Rust.ttf');

  if dscmnd1.IsRunning then
    dscmnd1.Stop;

  KillTask('steamcmd.exe');

  if chksaveactivetab.Checked then
  begin
    ini := TIniFile.Create(ini_RSMsettings);
    try
      ini.WriteString('Application Settings', 'lasttab',
        IntToStr(pgc1.ActivePageIndex));
      ini.WriteString('Application Settings', 'activeserver', activeserver);
    finally
      ini.Free;
    end;
  end;
end;

procedure Tfrmmain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  RemoveFontResource('Rust.ttf');
end;

procedure Tfrmmain.FormCreate(Sender: TObject);
var
  stylename: string;
begin
  Application.Title := 'Rust Server Manager';
  ini_RSMsettings := '.\RSMsettings.ini';
  AddFontResource('Rust.ttf');
  LoadRSMsettings;
  btnrefreshplugins.Click;
  lstservers.Clear;
  GetDirList('.\server');
  lblcurrentservers.Caption := 'Current Servers: [' +
    IntToStr(lstservers.Items.Count) + ']';

  lblversion.Caption := GetLatesVersion;

  for stylename in TStyleManager.StyleNames do
    cbbthemelist.Items.Add(stylename);

  cbbthemelist.ItemIndex := cbbthemelist.Items.IndexOf
    (TStyleManager.ActiveStyle.Name);

  { if DirectoryExists('.\server\' + activeserver) then
    ini_settings := '.\server\' + activeserver + '\settings.ini'
    else
    begin
    ForceDirectories('.\server\' + activeserver);
    ini_settings := '.\server\' + activeserver + '\settings.ini';
    lstservers.Clear;
    GetDirList('.\server');
    lblcurrentservers.Caption := 'Current Servers: [' + IntToStr(lstservers.Items.Count) + ']';
    end; }

  if DirectoryExists('.\server\' + activeserver) then
    begin
      ini_settings := '.\server\' + activeserver + '\settings.ini';
      lbledtserveridentity.Text := activeserver;
      LoadSettings;
    end
  else
    begin
      ForceDirectories('.\server\' + activeserver);
      ini_settings := '.\server\' + activeserver + '\settings.ini';
      lbledtserveridentity.Text := activeserver;

      lstservers.Clear;
      GetDirList('.\server');
      lblcurrentservers.Caption := 'Current Servers: [' +
        IntToStr(lstservers.Items.Count) + ']';
      LoadSettings;
    end;

  if FileExists('libeay32.dll') and FileExists('ssleay32.dll') then
    //
  else
    begin
      DeleteFile('ssleay32.dll');
      DeleteFile('libeay32.dll');
    end;
end;

procedure Tfrmmain.FormDestroy(Sender: TObject);
begin
  RemoveFontResource('Rust.ttf');
end;

procedure Tfrmmain.GetDirList(sPath: string);
var
  Found: Integer;
  SearchRec: TSearchRec;
begin
  Found := SysUtils.FindFirst(IncludeTrailingBackslash(sPath) + '*.*',
    faDirectory, SearchRec);

  try
    while Found = 0 do
    begin
      if ((SearchRec.Attr and faDirectory) = faDirectory) and
        (SearchRec.Name[1] <> '.') then
        lstservers.Items.Add(SearchRec.Name);
      Found := SysUtils.FindNext(SearchRec);
    end;
  finally
    SysUtils.FindClose(SearchRec);
  end;
end;

function Tfrmmain.GetLatesVersion: string;
var
  version: string;
begin
  if IsConnected = True then
  begin
    version := idhtp1.Get('http://41.185.91.51/RSM/latestversion.html');
    Result := version;
  end
  else
    Result := 'Offline';
end;

function Tfrmmain.GetLocalIP: string;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe : PHostEnt;
  pptr : PaPInAddr;
  Buffer : array [0..63] of AnsiChar;
  i : Integer;
  GInitData : TWSADATA;
begin
  WSAStartup($101, GInitData);
  Result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe :=GetHostByName(buffer);
  if phe = nil then Exit;
  pptr := PaPInAddr(Phe^.h_addr_list);
  i := 0;
  while pptr^[i] <> nil do begin
    result:=StrPas(inet_ntoa(pptr^[i]^));
    Inc(i);
  end;
  WSACleanup;
end;

function Tfrmmain.IsConnected: Boolean;
const
  // Local system has a valid connection to the Internet, but it might or might
  // not be currently connected.
  INTERNET_CONNECTION_CONFIGURED = $40;

  // Local system uses a local area network to connect to the Internet.
  INTERNET_CONNECTION_LAN = $02;

  // Local system uses a modem to connect to the Internet
  INTERNET_CONNECTION_MODEM = $01;

  // Local system is in offline mode.
  INTERNET_CONNECTION_OFFLINE = $20;

  // Local system uses a proxy server to connect to the Internet
  INTERNET_CONNECTION_PROXY = $04;

  // Local system has RAS installed.
  INTERNET_RAS_INSTALLED = $10;

var
  InetState: DWORD;
  hHttpSession, hReqUrl: HInternet;
begin
  Result := InternetGetConnectedState(@InetState, 0);
  if (Result and (InetState and INTERNET_CONNECTION_CONFIGURED =
    INTERNET_CONNECTION_CONFIGURED)) then
  begin
    // so far we ONLY know there's a valid connection. See if we can grab some
    // known URL ...
    hHttpSession := InternetOpen(Pchar(Application.Title),
      // this line is the agent string
      INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
    try
      hReqUrl := InternetOpenURL(hHttpSession,
        Pchar('41.185.91.51' { the URL to check } ), nil, 0, 0, 0);
      Result := hReqUrl <> nil;
      InternetCloseHandle(hReqUrl);
    finally
      InternetCloseHandle(hHttpSession);
    end;
  end
  else if (InetState and INTERNET_CONNECTION_OFFLINE =
    INTERNET_CONNECTION_OFFLINE) then
    Result := False; // we know for sure we are offline.
end;

function Tfrmmain.KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))
      = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile)
      = UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
        FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure Tfrmmain.lbl11Click(Sender: TObject);
begin
  OpenURL('https://www.paypal.me/Inforcer25');
end;

procedure Tfrmmain.lbl1Click(Sender: TObject);
begin
  OpenURL('https://inforcer25.co.za/forum/');
end;

procedure Tfrmmain.lbl20Click(Sender: TObject);
begin
  OpenURL('http://oxidemod.org/threads/using-the-oxide-permission-system.24291/');
end;

procedure Tfrmmain.lbl24Click(Sender: TObject);
begin
  OpenURL('https://www.youtube.com/Inforcer25');
end;

procedure Tfrmmain.lbl25Click(Sender: TObject);
begin
  OpenURL('https://twitter.com/inforcer25');
end;

procedure Tfrmmain.lbl27Click(Sender: TObject);
begin
  OpenURL('https://nodejs.org/en/');
end;

procedure Tfrmmain.lbl30Click(Sender: TObject);
begin
  OpenURL('https://nodejs.org/en/');
end;

procedure Tfrmmain.lbl34Click(Sender: TObject);
begin
  OpenURL('https://github.com/brainfoolong/rcon-web-admin');
end;

procedure Tfrmmain.lbl36Click(Sender: TObject);
var
  commands1: TStringList;
begin
  if DirectoryExists('.\rcon-web-admin') then
  begin
    commands1 := TStringList.Create;
    try
      commands1.Add('cd rcon-web-admin');
      commands1.Add('npm install');
    finally
      commands1.SaveToFile('rcon-web-admin-install-npm.bat');
      commands1.Free;

      if FileExists('rcon-web-admin-install-npm.bat') then
        WinExec('rcon-web-admin-install-npm.bat', SW_SHOWNORMAL)
      else
        ShowMessage('There was some kind of unknown error');
    end;
  end
  else
    ShowMessage('You need to download rcon web admin first!');
end;

procedure Tfrmmain.lbl3Click(Sender: TObject);
begin
  OpenURL('https://youtu.be/irAh3LblU2s');
end;

procedure Tfrmmain.lbl9Click(Sender: TObject);
begin
  OpenURL('https://inforcer25.co.za/forum');
end;

procedure Tfrmmain.ListFileDir(Path: string; FileList: TStrings);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        FileList.Add(SR.Name);
        pnl1.Color := clLime
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

procedure Tfrmmain.LoadLanguageFile;
var
  ini: TMemIniFile;
begin
  ini := TMemIniFile.Create(ChangeFileExt(GetCurrentDir,'.\lang.ini'), TEncoding.UTF8);
  try
    //Server Config Tab
    lbledtservername.EditLabel.Caption := ini.ReadString('Server Config TAB','Server Name','Server Name:');
    lbledtserverdescription.EditLabel.Caption := ini.ReadString('Server Config TAB','Server Description','Server Description:');
    lbledtserverurl.EditLabel.Caption := ini.ReadString('Server Config TAB','Server URL','Server URL:');
    lbledtserverbanner.EditLabel.Caption := ini.ReadString('Server Config TAB','Server Banner URL','Server Banner URL:');
    lblserverseed.Caption := ini.ReadString('Server Config TAB','Server Seed','Server Seed:');
    btngenerate.Caption := ini.ReadString('Server Config TAB','Generate','Generate');
    lblworldsize.Caption := ini.ReadString('Server Config TAB','World Size','World Size:');
    lblmaxplayers.Caption := ini.ReadString('Server Config TAB','Max Players','Max Players:');
    lbledtserverip.EditLabel.Caption := ini.ReadString('Server Config TAB','Server IP','Server IP:');
    lbledtrconip.EditLabel.Caption := ini.ReadString('Server Config TAB','Rcon IP','Rcon IP:');
    lblsaveinterval.Caption := ini.ReadString('Server Config TAB','Save Interval','Save Interval');
    lbledtserveridentity.EditLabel.Caption := ini.ReadString('Server Config TAB','Server Identity','Server Identity:');
    lbledtrconpass.EditLabel.Caption := ini.ReadString('Server Config TAB','Rcon Password','Rcon Password:');
    lblcurrentservers.Caption := ini.ReadString('Server Config TAB','Current Servers','Current Servers:');
    lbltickrate.Caption := ini.ReadString('Server Config TAB', 'Tick Rate', 'Tick Rate:');
    lbledtserverport.EditLabel.Caption := ini.ReadString('Server Config TAB', 'Server Port', 'Server Port:');
    lbledtrconport.EditLabel.Caption := ini.ReadString('Server Config TAB', 'Rcon Port', 'Rcon Port:');
    btnsaveconfig.Caption := ini.ReadString('Server Config TAB', 'Save Config', 'Save Config:');
    rgserverlevel.Caption := ini.ReadString('Server Config TAB', 'Map Type', 'Map Type:');
    grpserversettings.Caption := ini.ReadString('Server Config TAB', 'More Server Settings', 'More Server Settings:');

    //Server Installer
    lblinstallerlog.Caption := ini.ReadString('Server Installer TAB', 'Log', 'Log:');
    lblactivebranch.Caption := ini.ReadString('Server Installer TAB', 'Active Branch', 'Active Branch:');
    btninstallserver.Caption := ini.ReadString('Server Installer TAB', 'Install / Update Server', 'Install / Update Server:');
    btnvalidateserver.Caption := ini.ReadString('Server Installer TAB', 'Validate Server', 'Validate Server:');
    btnexportinstallerlog.Caption := ini.ReadString('Server Installer TAB', 'Export Log', 'Export Log:');
    btncancel.Caption := ini.ReadString('Server Installer TAB', 'Stop Task (Can Continue)', 'Stop Task (Can Continue):');
    btninstallsteamcmd.Caption := ini.ReadString('Server Installer TAB', 'Install SteamCMD', 'Install SteamCMD:');
    btninstalloxidemod.Caption := ini.ReadString('Server Installer TAB', 'Install OxideMod', 'Install OxideMod:');

    //Plugin Manager
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.MakeLanguageFile;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('.\lang.ini');
  try
    //Server Config Tab
    ini.WriteString('Server Config TAB','Server Name','Server Name:');
    ini.WriteString('Server Config TAB','Server Description','Server Description:');
    ini.WriteString('Server Config TAB','Server URL','Server URL:');
    ini.WriteString('Server Config TAB','Server Banner URL','Server Banner URL:');
    ini.WriteString('Server Config TAB','Server Seed','Server Seed:');
    ini.WriteString('Server Config TAB','Generate','Generate');
    ini.WriteString('Server Config TAB','World Size','World Size:');
    ini.WriteString('Server Config TAB','Max Players','Max Players:');
    ini.WriteString('Server Config TAB','Server IP','Server IP:');
    ini.WriteString('Server Config TAB','Rcon IP','Rcon IP:');
    ini.WriteString('Server Config TAB','Save Interval','Save Interval:');
    ini.WriteString('Server Config TAB','Server Identity','Server Identity:');
    ini.WriteString('Server Config TAB','Rcon Password','Rcon Password:');
    ini.WriteString('Server Config TAB','Current Servers','Current Servers:');
    ini.WriteString('Server Config TAB', 'Tick Rate', 'Tick Rate:');
    ini.WriteString('Server Config TAB', 'Server Port', 'Server Port:');
    ini.WriteString('Server Config TAB', 'Rcon Port', 'Rcon Port:');
    ini.WriteString('Server Config TAB', 'Save Config', 'Save Config:');
    ini.WriteString('Server Config TAB', 'Map Type', 'Map Type:');
    ini.WriteString('Server Config TAB', 'More Server Settings', 'More Server Settings:');

    //Server Installer
    ini.WriteString('Server Installer TAB', 'Log', 'Log:');
    ini.WriteString('Server Installer TAB', 'Active Branch', 'Active Branch:');
    ini.WriteString('Server Installer TAB', 'Install / Update Server', 'Install / Update Server:');
    ini.WriteString('Server Installer TAB', 'Validate Server', 'Validate Server:');
    ini.WriteString('Server Installer TAB', 'Export Log', 'Export Log:');
    ini.WriteString('Server Installer TAB', 'Stop Task (Can Continue)', 'Stop Task (Can Continue):');
    ini.WriteString('Server Installer TAB', 'Install SteamCMD', 'Install SteamCMD:');
    ini.WriteString('Server Installer TAB', 'Install OxideMod', 'Install OxideMod:');

    //Plugin Manager
  finally
    ShowMessage('lang.ini generated!');
    ini.Free;
  end;
end;

procedure Tfrmmain.LoadRSMsettings;
var
  ini: TIniFile;
begin
  if FileExists(ini_RSMsettings) then
  begin
    ini := TIniFile.Create(ini_RSMsettings);
    try
      activeserver := ini.ReadString('Application Settings',
        'activeserver', 'server1');
      lbledtserveridentity.Text := activeserver;

      backupdir := ini.ReadString('Application Settings', 'backupto', '');
      lbledtbackuppath.Text := backupdir;

      TStyleManager.SetStyle(ini.ReadString('Application Settings', 'theme',
        'Ruby Graphite'));

      trckbrtransparency.Position :=
        StrToInt(ini.ReadString('Application Settings', 'transparency', '255'));
      frmmain.AlphaBlendValue := trckbrtransparency.Position;

      pgc1.ActivePageIndex := StrToInt(ini.ReadString('Application Settings',
        'lasttab', '0'));
      chksaveactivetab.Checked :=
        StrToBool(ini.ReadString('Application Settings',
        'remember last tab', '1'));
      if chksaveactivetab.Checked = False then
        pgc1.ActivePageIndex := 0;

      chkloadcustomtheme.Checked :=
        StrToBool(ini.ReadString('Application Settings',
        'loadcustomtheme', '0'));

      chkloadlangfile.Checked := StrToBool(ini.ReadString('Application Settings', 'loadlangfile', '0'));
      if chkloadlangfile.Checked then
        begin
          if FileExists('lang.ini') then
            begin
              LoadLanguageFile
            end
          else
            ShowMessage('You have chosen to load the language file on start but there is nothing to load.');
        end;

      if chkloadcustomtheme.Checked = True then
      begin
        if FileExists('theme.vsf') then
        begin
          TStyleManager.LoadFromFile('theme.vsf');
          TStyleManager.SetStyle('theme');
        end;
      end;
      chkchecklatestversion.Checked :=
        StrToBool(ini.ReadString('Application Settings',
        'checklatestversion', '1'));

      tmrrefreshlatestversion.Enabled := chkchecklatestversion.Checked;

    finally
      ini.Free;
    end;
  end;
end;

procedure Tfrmmain.LoadSettings;
var
  ini: TIniFile;
begin
    ini := TIniFile.Create(ini_settings);
    try
      Branch := ini.ReadString('ServerSettings', 'Branch', 'normal');
      servername := ini.ReadString('Server Config', 'servername', 'My Server');
      description := ini.ReadString('Server Config', 'description', 'Edit me');
      serverurl := ini.ReadString('Server Config', 'serverurl', '');
      serverbanner := ini.ReadString('Server Config', 'serverbanner', '');
      serverseed := ini.ReadString('Server Config', 'serverseed', '54162');
      worldsize := ini.ReadString('Server Config', 'worldsize', '4000');
      maxplayers := ini.ReadString('Server Config', 'maxplayers', '10');
      serveridentity := ini.ReadString('Server Config', 'serveridentity', 'server1');
      rconpass := ini.ReadString('Server Config', 'rconpass', 'changeme');
      rconport := ini.ReadString('Server Config', 'rconport', '28016');
      serverport := ini.ReadString('Server Config', 'serverport', '28015');
      maptype := ini.ReadString('Server Config', 'maptype', 'Barren');
      serverip := ini.ReadString('ServerSettings', 'serverip', '0.0.0.0');
      rconip := ini.ReadString('ServerSettings', 'rconip', '0.0.0.0');
      saveinterval := ini.ReadString('ServerSettings', 'saveinterval', '300');
      tickrate := StrToInt(ini.ReadString('ServerSettings', 'tickrate', '10'));

      lblbranch.Caption := Branch;
      lbledtservername.Text := servername;
      lbledtserverdescription.Text := description;
      lbledtserverurl.Text := serverurl;
      lbledtserverbanner.Text := serverbanner;
      sedserverseed.Value := StrToInt(serverseed);
      sedworldsize.Value := StrToInt(worldsize);
      sedmaxplayers.Value := StrToInt(maxplayers);
      lbledtserveridentity.Text := serveridentity;
      lbledtrconpass.Text := rconpass;
      lbledtrconport.Text := rconport;
      lbledtserverport.Text := serverport;
      lbledtserverip.Text := serverip;
      lbledtrconip.Text := rconip;
      sedsaveinterval.Value := StrToInt(saveinterval);
      sedtickrate.Value := tickrate;
      if maptype = 'Procedural Map' then
        rgserverlevel.ItemIndex := 0;
      if maptype = 'Barren' then
        rgserverlevel.ItemIndex := 1;
      if maptype = 'HapisIsland' then
        rgserverlevel.ItemIndex := 2;
      if maptype = 'SavasIslandp' then
        rgserverlevel.ItemIndex := 3;
      if maptype = 'SavasIsland_koth' then
        rgserverlevel.ItemIndex := 4;
      if maptype = 'CraggyIsland' then
        rgserverlevel.ItemIndex := 5;

      rconweb := ini.ReadString('ServerSettings', 'rconweb', '1');
      if rconweb = '1' then
        tglswtchrconweb.State := tssOn
      else
        tglswtchrconweb.State := tssOff;

      globalchat := ini.ReadString('ServerSettings', 'globalchat', '1');
      if globalchat = '1' then
        tglswtchglobalchat.State := tsson
      else
        tglswtchglobalchat.State := tssOff;

      radiation := ini.ReadString('ServerSettings', 'radiation', '1');
      if radiation = '1' then
        tglswtchradiation.State := tsson
      else
        tglswtchradiation.State := tssOff;

      eac := ini.ReadString('ServerSettings', 'easyanticheat', '1');
      if eac = '1' then
        tglswtcheac.State := tssOn
      else
        tglswtcheac.State := tssOff;

      vac := ini.ReadString('ServerSettings', 'secure', '1');
      if vac = '1' then
        tglswtchvac.State := tssOn
      else
        tglswtchvac.State := tssOff;

      pve := ini.ReadString('ServerSettings', 'pve', '0');
      if pve = '1' then
        tglswtchserverpve.State := tssOn
      else
        tglswtchserverpve.State := tssOff;

      stability := ini.ReadString('ServerSettings', 'stability', '1');
      if stability = '1' then
        tglswtchstability.State := tssOn
      else
        tglswtchstability.State := tssOff;

      aithink := ini.ReadString('ServerSettings', 'aithink', '1');
      if aithink = '1' then
        tglswtchaithink.State := tssOn
      else
        tglswtchaithink.State := tssOff;

      aimove := ini.ReadString('ServerSettings', 'aimove', '1');
      if aimove = '1' then
        tglswtchaimove.State := tssOn
      else
        tglswtchaimove.State := tssOff;

      instantcraft := ini.ReadString('ServerSettings', 'instantcraft', '0');
      if instantcraft = '1' then
        tglswtchinstantcraft.State := tssOn
      else
        tglswtchinstantcraft.State := tssOff;

      antihack := ini.ReadString('ServerSettings', 'antihack', '1');
      if antihack = '1' then
        tglswtchantihack.State := tssOn
      else
        tglswtchantihack.State := tssOff;

      decay := ini.ReadString('ServerSettings', 'decay', '1');
      if decay = '1' then
        tglswtchdecay.State := tssOn
      else
        tglswtchdecay.State := tssOff;


      tmrrefreshlatestversion.Enabled := chkchecklatestversion.Checked;

      lblserveridentity.Caption := 'Active Server Identity: ' + serveridentity;
    finally
      ini.Free;
    end;
end;

procedure Tfrmmain.lstserversDblClick(Sender: TObject);
begin
  if lstservers.ItemIndex = -1 then
    begin
      //
    end
  else
    begin
      lbledtserveridentity.Text := lstservers.Items[lstservers.ItemIndex];
      activeserver := lbledtserveridentity.Text;

      if DirectoryExists('.\server\' + activeserver) then
      begin
        ini_settings := '.\server\' + activeserver + '\settings.ini';
        lbledtserveridentity.Text := activeserver;
        LoadSettings;
      end
      else
      begin
        ForceDirectories('.\server\' + activeserver);
        ini_settings := '.\server\' + activeserver + '\settings.ini';
        lbledtserveridentity.Text := activeserver;
        // LoadSettings;
      end;
    end;
end;

procedure Tfrmmain.MultiDownloader(link: string);
begin
  frmmultidownloader.multilink := link;
  frmmultidownloader.ShowModal;
end;

procedure Tfrmmain.OpenFolder(Folder: string);
begin
  ShellExecute(Application.Handle, nil, PChar(Folder), nil, nil, SW_NORMAL);
end;

procedure Tfrmmain.OpenURL(url: string);
begin
  ShellExecute(self.WindowHandle, 'open', Pchar(url), nil, nil, SW_SHOWNORMAL);
end;

procedure Tfrmmain.pgc1Change(Sender: TObject);
begin
  btnrefreshplugins.Click;
end;

function Tfrmmain.SelectPriority: string;
var
  priority: Integer;
begin
  {frmpriority.ShowModal;
  priority := frmpriority.option;

  if priority = 0 then Result := '/LOW';
  if priority = 1 then Result := '/NORMAL';
  if priority = 2 then Result := '/HIGH';
  if priority = 3 then Result := '/REALTIME';
  if priority = 4 then Result := '/ABOVENORMAL';
  if priority = 5 then Result := '/BELOWNORMAL';  }

end;

function Tfrmmain.SelectServerBranch: string;
begin
  frminstalleroption.ShowModal;
  Result := frminstalleroption.option;
end;

procedure Tfrmmain.StartApplication(Application: string);
begin
  ShellExecute(self.WindowHandle,'open',PChar(Application),nil,nil, SW_SHOWNORMAL);
end;

procedure Tfrmmain.tmrbackupTimer(Sender: TObject);
begin
  mmobackuplog.Clear;
  dscmndbackup.CommandLine := 'xcopy "' + GetCurrentDir + '" "' + backupdir +
    '\" /h/i/c/k/e/r/y';
  dscmndbackup.OutputLines := mmobackuplog.Lines;
  if dscmndbackup.IsRunning = False then
    dscmndbackup.Execute
  else
  begin
    dscmndbackup.Stop;
    dscmndbackup.Execute
  end;
end;

procedure Tfrmmain.tmrnextbackupTimer(Sender: TObject);
begin
  nextbackup := nextbackup - 1;
  if nextbackup = 0 then
    nextbackup := rtime;
  lbledtbackupstatus.Text := 'Next Backup: ' + FloatToStr(nextbackup) + ' mins';
end;

procedure Tfrmmain.tmrrefreshlatestversionTimer(Sender: TObject);
begin
  GetLatesVersion;
end;

procedure Tfrmmain.trckbrtransparencyChange(Sender: TObject);
begin
  frmmain.AlphaBlendValue := trckbrtransparency.Position;
end;

end.
