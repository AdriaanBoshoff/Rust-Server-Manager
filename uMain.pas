unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  IniFiles, uDataModule, Vcl.Grids, Vcl.ValEdit, uNormal, uSSL, DosCommand,
  uBranchSelector, Tlhelp32, HTMLForm, uServerCreator, SysUtils, ShellAPI,
  uServerWipe, uServerDescriptionEditor, Vcl.OleCtrls, Vcl.CheckLst,
  uPluginEnableDisable, uPluginConfigEditor, Vcl.Menus, IdHTTP, htmlbtns, System.ImageList,
  Vcl.ImgList;

type
  Tfrmmain = class(TForm)
    pnltop: TPanel;
    pnlleft: TPanel;
    pgcmain: TPageControl;
    tsserverconfig: TTabSheet;
    tsserverinstaller: TTabSheet;
    lblsteamcmd: TLabel;
    mmosteamcmd: TMemo;
    btnInstallServer: TButton;
    btnVerifyServer: TButton;
    btnStopTask: TButton;
    btnexportsteamcmdlog: TButton;
    grpotheroptions: TGroupBox;
    btnInstallSteamcmd: TButton;
    btninstalloxidemod: TButton;
    tsPluginManager: TTabSheet;
    tsAutoBackup: TTabSheet;
    tsappsettings: TTabSheet;
    lblserverlist: TLabel;
    cbbserverlist: TComboBox;
    btnstartserver: TButton;
    chkautorestart: TCheckBox;
    lbladdserver: TLabel;
    dcmsteamcmd: TDosCommand;
    grpsteamcmd: TGroupBox;
    edtsteamcmdpath: TEdit;
    lblsteamcmdstatus: TLabel;
    btninstallsteamcmd2: TButton;
    btn1: TButton;
    lbledtservername: TLabeledEdit;
    lbledtserverdescription: TLabeledEdit;
    lbledtserverurl: TLabeledEdit;
    lbledtserverbannerurl: TLabeledEdit;
    vlstdtrservervar: TValueListEditor;
    lblservervariables: TLabel;
    grpmap: TGroupBox;
    cbbmap: TComboBox;
    btnserverdescriptioneditor: TButton;
    btnsaveserverconfig: TButton;
    btngenerateseed: TButton;
    btngeneraterconpass: TButton;
    pgcserveroptions: TPageControl;
    ts1: TTabSheet;
    vlstdtrmoreservervar: TValueListEditor;
    lblmadeby: TLabel;
    lblverfghsionfghf: TLabel;
    btnwipeserver: TButton;
    chklstplugins: TCheckListBox;
    lblsd: TLabel;
    lblplugins: TLabel;
    chklstconfigs: TCheckListBox;
    lblconfigs: TLabel;
    pnlpluginmanageroptions: TPanel;
    btnrefreshlists: TButton;
    btnenabledisable: TButton;
    pmplugins: TPopupMenu;
    Delete1: TMenuItem;
    Edit1: TMenuItem;
    lbl1: TLabel;
    lblversion: TLabel;
    lbl2: TLabel;
    btnupdatersm: TButton;
    btnrsmforums: TButton;
    btndonate: TButton;
    pmconfig: TPopupMenu;
    Deleteallcheckeditems1: TMenuItem;
    Editselecteditem1: TMenuItem;
    btnpluginupdater: TButton;
    imglst: TImageList;
    lbl3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SaveSettingString(Section, Name, Value: string);
    procedure SaveSettingInteger(Section, Name: string; Value: Integer);
    function LoadSettingString(Section, Name, Value: string): string;
    function LoadSettingInteger(Section, Name: string; Value: Integer): Integer;
    procedure DownloadSSL(Link, Path: string; Extract: Boolean; ExtractPath: string);
    procedure DownloadNormal(Link, Path: string; Extract: Boolean; ExtractPath: string);
    procedure btnstartserverClick(Sender: TObject);
    procedure btninstalloxidemodClick(Sender: TObject);
    procedure btnInstallSteamcmdClick(Sender: TObject);
    procedure btnexportsteamcmdlogClick(Sender: TObject);
    procedure CheckRequiredFiles;
    procedure CleanUp;
    procedure FormActivate(Sender: TObject);
    procedure btnInstallServerClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtsteamcmdpathChange(Sender: TObject);
    function KillTask(ExeFileName: string): Integer;
    procedure FormDestroy(Sender: TObject);
    procedure pgcmainChange(Sender: TObject);
    procedure LoadRSMsettings;
    procedure LoadServerConfig;
    procedure btninstallsteamcmd2Click(Sender: TObject);
    procedure btnVerifyServerClick(Sender: TObject);
    procedure CreateNewServer;
    procedure GetDirList(DirPath: string; DirList: TStrings);
    procedure cbbserverlistChange(Sender: TObject);
    procedure lbladdserverClick(Sender: TObject);
    procedure btnStopTaskClick(Sender: TObject);
    procedure CheckServerMadeWith;
    procedure btn1Click(Sender: TObject);
    procedure SaveConfigString(Section, Name, Value: string);
    function LoadConfigString(Section, Name, Value: string): string;
    procedure btnsaveserverconfigClick(Sender: TObject);
    procedure btngenerateseedClick(Sender: TObject);
    function GenerateRandomPassword(Lenght: Integer): string;
    procedure btngeneraterconpassClick(Sender: TObject);
    procedure Start(Path: string);
    procedure btnwipeserverClick(Sender: TObject);
    procedure btnserverdescriptioneditorClick(Sender: TObject);
    procedure btnrefreshlistsClick(Sender: TObject);
    procedure ListFileDir(Path: string; FileList: TStrings);
    procedure btnenabledisableClick(Sender: TObject);
    procedure chklstpluginsDblClick(Sender: TObject);
    procedure chklstconfigsDblClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure CheckForUpdates;
    procedure btnupdatersmClick(Sender: TObject);
    procedure btnrsmforumsClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Editselecteditem1Click(Sender: TObject);
    procedure Deleteallcheckeditems1Click(Sender: TObject);
    procedure btnpluginupdaterClick(Sender: TObject);
    procedure btndonateClick(Sender: TObject);
    procedure CheckRAM;
  private
    // serverconfig
    hostname, serverdescription, serverurl, bannerurl, serverseed, serverworldsize, servermaxplayers, serverip, serverport, servertickrate, serversaveinterval, rconip, rconport, rconpassword, servermap: string;

    // Extra server config var
    globalchat, radiation, eac, vac, rconweb, serverpve, buildingstability, aithink, aimove, antihack, buildingdecay, bradley, nav_wait, nav_disable, halloweenenabled, halloweenpopulation: string;
  public
    { Public declarations }
  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.dfm}

procedure Tfrmmain.btn1Click(Sender: TObject);
begin
  if dmDataModule.dlgOpensteamcmd.Execute then
  begin
    steamcmdpath := dmDataModule.dlgOpensteamcmd.FileName;
    edtsteamcmdpath.Text := steamcmdpath;
  end;
end;

procedure Tfrmmain.btndonateClick(Sender: TObject);
begin
  Start('https://www.paypal.me/Inforcer25');
end;

procedure Tfrmmain.btnenabledisableClick(Sender: TObject);
begin
  frmpluginenabledisable.ShowModal;
  btnrefreshlists.Click;
end;

procedure Tfrmmain.btnexportsteamcmdlogClick(Sender: TObject);
begin
  mmosteamcmd.Lines.SaveToFile('.\rsm_installer.log');
  ShowMessage('Exported to rsm_installer.log');
end;

procedure Tfrmmain.btngeneraterconpassClick(Sender: TObject);
begin
  vlstdtrservervar.Strings.Values['rcon.password'] := GenerateRandomPassword(10);
end;

procedure Tfrmmain.btngenerateseedClick(Sender: TObject);
begin
  vlstdtrservervar.Strings.Values['server.seed'] := IntToStr(Random(0123456789))
end;

procedure Tfrmmain.btninstalloxidemodClick(Sender: TObject);
begin
  DownloadSSL('https://www.github.com/OxideMod/Oxide/releases/download/latest/Oxide-Rust.zip', 'oixde.zip', True, '.\');
end;

procedure Tfrmmain.btnInstallServerClick(Sender: TObject);
var
  branch: Integer;
  installcommand: string;
  command: TStringList;
begin
  dcmsteamcmd.Stop;
  KillTask('steamcmd.exe');
  mmosteamcmd.Clear;
  if not FileExists(steamcmdpath) then
  begin
    if MessageDlg('ERROR: steamcmd.exe could not be found. Do you want RSM to install it for you?', mtError, [mbYes, mbNo], 0) = mrYes then
    begin
      btnInstallSteamcmd.Click;
      btnInstallServer.Click;
    end;
  end
  else
  begin
    frmbranchselector.ShowModal;
    if frmbranchselector.install = True then
    begin
      branch := frmbranchselector.branch;
      case branch of
        -1:
          begin
            ShowMessage('You have to select a branch!');
            Exit
          end;
        0:
          installcommand := steamcmdpath + ' +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 +quit';
        1:
          installcommand := steamcmdpath + ' +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta staging +quit';
        2:
          installcommand := steamcmdpath + ' +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta prerelease +quit';
        3:
          installcommand := steamcmdpath + ' +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta july2016 +quit';
        4:
          installcommand := steamcmdpath + ' +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta october2016 +quit';
      end;

      command := TStringList.Create;
      try
        command.Add('@echo off');
        command.Add('echo Starting Server Installation..');
        command.Add(installcommand);
        command.Add('echo Done.');
      finally
        command.SaveToFile('install.bat');
        command.Free;
      end;
      dcmsteamcmd.CommandLine := 'install.bat';
      dcmsteamcmd.OutputLines := mmosteamcmd.Lines;
      dcmsteamcmd.Execute;
    end;
  end;
end;

procedure Tfrmmain.btninstallsteamcmd2Click(Sender: TObject);
begin
  btnInstallSteamcmd.Click;
end;

procedure Tfrmmain.btnInstallSteamcmdClick(Sender: TObject);
begin
  if not DirectoryExists('.\steamcmd') then
    MkDir('.\steamcmd');
  DownloadSSL('https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip', '.\steamcmd\steamcmd.zip', True, '.\steamcmd');
  steamcmdpath := '.\steamcmd\steamcmd.exe';
  edtsteamcmdpath.Text := steamcmdpath;
  SaveSettingString('Application Settings', 'steamcmd', steamcmdpath);
end;

procedure Tfrmmain.btnpluginupdaterClick(Sender: TObject);
var
  parameter: string;
begin
  ShowMessage('Please note that I did not make this plugin updater. All credit goes to Murky.');

  if not FileExists('pluginupdater.exe') then
  begin
    case MessageDlg('The plugin updater does not appear to be installed.' + #13#10#13#10 + 'Would you like RSM to download it for you?', mtError, [mbYes, mbNo], 0) of
      mrYes:
        begin
          DownloadSSL('https://inforcer25.co.za/owncloud/index.php/s/rZYvX06XIrrhm82/download', 'pluginupdater.zip', True, '.\');
          btnpluginupdater.Click;
        end;
      mrNo:
        begin
          Exit
        end;
    end;

  end
  else
  begin
    parameter := '--pluginFolder "server\' + serveridentity + '\oxide\plugins"';
    ShellExecute(0, 'open', 'pluginupdater.exe', Pchar(parameter), nil, SW_SHOW);
  end;

end;

procedure Tfrmmain.btnrefreshlistsClick(Sender: TObject);
begin
  chklstplugins.Clear;
  chklstconfigs.Clear;

  ListFileDir('.\server\' + serveridentity + '\oxide\plugins\', chklstplugins.Items);
  ListFileDir('.\server\' + serveridentity + '\oxide\config\', chklstconfigs.Items);

  lblplugins.Caption := '[' + IntToStr(chklstplugins.Items.Count) + '] Plugins:';
  lblconfigs.Caption := '[' + IntToStr(chklstconfigs.Items.Count) + '] Plugin Configs:';
end;

procedure Tfrmmain.btnrsmforumsClick(Sender: TObject);
begin
  Start('https://inforcer25.co.za/forum/index.php');
end;

procedure Tfrmmain.btnsaveserverconfigClick(Sender: TObject);
begin
  hostname := lbledtservername.Text;
  SaveConfigString('Server Config', 'hostname', hostname);

  serverdescription := lbledtserverdescription.Text;
  SaveConfigString('Server Config', 'serverdescription', serverdescription);

  serverurl := lbledtserverurl.Text;
  SaveConfigString('Server Config', 'serverurl', serverurl);

  bannerurl := lbledtserverbannerurl.Text;
  SaveConfigString('Server Config', 'bannerurl', bannerurl);

  serverseed := vlstdtrservervar.Strings.Values['server.seed'];
  SaveConfigString('Server Config', 'server.seed', serverseed);

  serverworldsize := vlstdtrservervar.Strings.Values['server.worldsize'];
  SaveConfigString('Server Config', 'server.worldsize', serverworldsize);

  servermaxplayers := vlstdtrservervar.Strings.Values['server.maxplayers'];
  SaveConfigString('Server Config', 'server.maxplayers', servermaxplayers);

  serverip := vlstdtrservervar.Strings.Values['server.ip'];
  SaveConfigString('Server Config', 'server.ip', serverip);

  serverport := vlstdtrservervar.Strings.Values['server.port'];
  SaveConfigString('Server Config', 'server.port', serverport);

  servertickrate := vlstdtrservervar.Strings.Values['server.tickrate'];
  SaveConfigString('Server Config', 'server.tickrate', servertickrate);

  serversaveinterval := vlstdtrservervar.Strings.Values['server.saveinterval'];
  SaveConfigString('Server Config', 'server.saveinterval', serversaveinterval);

  rconip := vlstdtrservervar.Strings.Values['rcon.ip'];
  SaveConfigString('Server Config', 'rcon.ip', rconip);

  rconport := vlstdtrservervar.Strings.Values['rcon.port'];
  SaveConfigString('Server Config', 'rcon.port', rconport);

  rconpassword := vlstdtrservervar.Strings.Values['rcon.password'];
  SaveConfigString('Server Config', 'rcon.password', rconpassword);

  servermap := cbbmap.Items[cbbmap.ItemIndex];
  SaveConfigString('Server Config', 'servermap', servermap);

  // More Server Variables
  globalchat := vlstdtrmoreservervar.Strings.Values['Global Chat'];
  SaveConfigString('Server Config', 'globalchat', globalchat);

  radiation := vlstdtrmoreservervar.Strings.Values['Radiation'];
  SaveConfigString('Server Config', 'radiation', radiation);

  vac := vlstdtrmoreservervar.Strings.Values['Valve Anti Cheat'];
  SaveConfigString('Server Config', 'vac', vac);

  eac := vlstdtrmoreservervar.Strings.Values['Easy Anti Cheat'];
  SaveConfigString('Server Config', 'eac', eac);

  rconweb := vlstdtrmoreservervar.Strings.Values['Rcon Web'];
  SaveConfigString('Server Config', 'rconweb', rconweb);

  serverpve := vlstdtrmoreservervar.Strings.Values['PVE'];
  SaveConfigString('Server Config', 'serverpve', serverpve);

  buildingstability := vlstdtrmoreservervar.Strings.Values['Building Stability'];
  SaveConfigString('Server Config', 'buildingstability', buildingstability);

  aithink := vlstdtrmoreservervar.Strings.Values['AI Think'];
  SaveConfigString('Server Config', 'aithink', aithink);

  aimove := vlstdtrmoreservervar.Strings.Values['AI Move'];
  SaveConfigString('Server Config', 'aimove', aimove);

  antihack := vlstdtrmoreservervar.Strings.Values['Anti Hack'];
  SaveConfigString('Server Config', 'antihack', antihack);

  buildingdecay := vlstdtrmoreservervar.Strings.Values['Building Decay'];
  SaveConfigString('Server Config', 'buildingdecay', buildingdecay);

  nav_wait := vlstdtrmoreservervar.Strings.Values['nav_wait'];
  SaveConfigString('Server Config', 'nav_wait', nav_wait);

  nav_disable := vlstdtrmoreservervar.Strings.Values['nav_disable'];
  SaveConfigString('Server Config', 'nav_disable', nav_disable);

  bradley := vlstdtrmoreservervar.Strings.Values['Bradley (APC)'];
  SaveConfigString('Server Config', 'bradley', bradley);

  halloweenenabled := vlstdtrmoreservervar.Strings.Values['halloween.enabled'];
  SaveConfigString('Server Config', 'halloweenenabled', halloweenenabled);

  halloweenpopulation := vlstdtrmoreservervar.Strings.Values['halloween.murdererpopulation'];
  SaveConfigString('Server Config', 'halloweenpopulation', halloweenpopulation);

  ShowMessage('Saved config for server: ' + serveridentity);
end;

procedure Tfrmmain.btnserverdescriptioneditorClick(Sender: TObject);
var
  description: string;
begin
  description := lbledtserverdescription.Text;
  description := StringReplace(description, ' \n', #13#10, [rfReplaceAll]);
  frmdescription.mmo1.Text := description;
  frmdescription.ShowModal;
  lbledtserverdescription.Text := frmdescription.description;
end;

procedure Tfrmmain.btnstartserverClick(Sender: TObject);
var
  commands: TStringList;
  batfile: string;
begin
  if FileExists('RustDedicated.exe') then
  begin
    batfile := serveridentity + '-start.bat';
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
      commands.Add('+rcon.password "' + rconpassword + '" ^');
      commands.Add('+rcon.web "' + rconweb + '" ^');
      commands.Add('+server.ip ' + serverip + ' ^');
      commands.Add('+server.port ' + serverport + ' ^');
      commands.Add('+server.maxplayers ' + servermaxplayers + ' ^');
      commands.Add('+server.hostname "' + hostname + '" ^');
      commands.Add('+server.identity "' + serveridentity + '" ^');
      commands.Add('+server.level "' + servermap + '" ^');
      commands.Add('+server.seed ' + serverseed + ' +server.worldsize ' + serverworldsize + ' ^');
      commands.Add('+server.saveinterval ' + serversaveinterval + ' ^');
      commands.Add('+server.globalchat ' + globalchat + ' ^');
      commands.Add('+server.description "' + serverdescription + '" ^');
      commands.Add('+server.headerimage "' + bannerurl + '" ^');
      commands.Add('+server.url "' + serverurl + '" ^');
      commands.Add('+server.radiation ' + radiation + ' ^');
      commands.Add('+server.eac ' + eac + ' ^');
      commands.Add('+server.secure ' + vac + ' ^');
      commands.Add('+server.tickrate ' + servertickrate + ' ^');
      commands.Add('+server.pve ' + serverpve + ' ^');
      commands.Add('+server.stability ' + buildingstability + ' ^');
      commands.Add('+ai.think ' + aithink + ' ^');
      commands.Add('+ai.move ' + aimove + ' ^');
      commands.Add('+antihack.enabled ' + antihack + ' ^');
      commands.Add('+decay.scale ' + buildingdecay + ' ^');
      commands.Add('+bradley.enabled ' + bradley + ' ^');
      commands.Add('+backup' + ' ^');
      commands.Add('+nav_wait ' + nav_wait + ' ^');
      commands.Add('+nav_disable ' + nav_disable + ' ^');
      commands.Add('+halloween.enabled ' + halloweenenabled + ' ^');
      commands.Add('+halloween.murdererpopulation ' + halloweenpopulation);

      if chkautorestart.Checked then
      begin
        commands.Add('cls');
        commands.Add('echo Restarting Server...');
        commands.Add('timeout /t 10');
        commands.Add('goto start');
      end;

    finally
      commands.SaveToFile(batfile);
      commands.Free;
      Start(batfile);
    end;
  end
  else
  begin
    if MessageDlg('The server does not appear to be installed. Do you want RSM to install it for you?', mtError, [mbYes, mbNo], 0) = mrYes then
    begin
      btnInstallServer.Click;
    end;
  end;

end;

procedure Tfrmmain.btnStopTaskClick(Sender: TObject);
begin
  dcmsteamcmd.Stop;
  KillTask('steamcmd.exe');
  mmosteamcmd.Clear;
end;

procedure Tfrmmain.btnupdatersmClick(Sender: TObject);
begin
  Start('http://oxidemod.org/resources/rust-server-manager.2494/');
end;

procedure Tfrmmain.btnVerifyServerClick(Sender: TObject);
var
  branch: Integer;
  installcommand: string;
  command: TStringList;
begin
  dcmsteamcmd.Stop;
  KillTask('steamcmd.exe');
  mmosteamcmd.Clear;
  if not FileExists(steamcmdpath) then
  begin
    if MessageDlg('ERROR: steamcmd.exe could not be found. Do you want RSM to install it for you?', mtError, [mbYes, mbNo], 0) = mrYes then
    begin
      btnInstallSteamcmd.Click;
      btnInstallServer.Click;
    end;
  end
  else
  begin
    frmbranchselector.ShowModal;
    if frmbranchselector.install = True then
    begin
      branch := frmbranchselector.branch;
      case branch of
        -1:
          begin
            ShowMessage('You have to select a branch!');
            Exit
          end;
        0:
          installcommand := steamcmdpath + ' +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 validate +quit';
        1:
          installcommand := steamcmdpath + ' +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta staging validate +quit';
        2:
          installcommand := steamcmdpath + ' +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta prerelease validate +quit';
        3:
          installcommand := steamcmdpath + ' +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta july2016 validate +quit';
        4:
          installcommand := steamcmdpath + ' +login anonymous +force_install_dir "' + GetCurrentDir + '" +app_update 258550 -beta october2016 validate +quit';
      end;

      command := TStringList.Create;
      try
        command.Add('@echo off');
        command.Add('echo Starting Server Validation...');
        command.Add(installcommand);
        command.Add('echo Done.');
      finally
        command.SaveToFile('validate.bat');
        command.Free;
      end;
      dcmsteamcmd.CommandLine := 'validate.bat';
      dcmsteamcmd.OutputLines := mmosteamcmd.Lines;
      dcmsteamcmd.Execute;
    end;
  end;
end;

procedure Tfrmmain.btnwipeserverClick(Sender: TObject);
begin
  frmwipe.ShowModal;
end;

procedure Tfrmmain.cbbserverlistChange(Sender: TObject);
begin
  serveridentity := cbbserverlist.Items[cbbserverlist.ItemIndex];
  ini_server_config := '.\server\' + serveridentity + '\rsm-server-config.ini';
  SaveSettingString('Application Settings', 'serveridentity', serveridentity);
  LoadServerConfig;
  btnrefreshlists.Click;
end;

procedure Tfrmmain.CheckForUpdates;
var
  httpclient: TIdHTTP;
begin
  httpclient := TIdHTTP.Create(nil);
  lblversion.Caption := httpclient.Get('http://41.185.91.51/RSM/latestversion.html');
  httpclient.Free;
end;

procedure Tfrmmain.CheckRAM;
var
  RamStats: TMemoryStatus;
  totalram: Real;
begin
  GlobalMemoryStatus(RamStats);
  totalram := RamStats.dwTotalPhys / 1073741824;
  totalram := Round(totalram);
  if totalram <= 4 then
    ShowMessage('RSM has detected you have a minimum of ' + FloatToStr(totalram) + 'GB RAM available.' + sLineBreak + sLineBreak + 'Rust Servers need the following amount of RAM:' + sLineBreak + sLineBreak + '50 slot server = 4gb ram' + sLineBreak + '100 slot server = 5.5gb ram' + sLineBreak + '150 slot server = 7gb ram' + sLineBreak + '200 slot server = 8-9gb ram');
  { GlobalMemoryStatus(RamStats);
    ShowMessage(FormatFloat('Total Memory: ##,##" MB"', RamStats.dwTotalPhys / 1048576));
    ShowMessage(Format('Amount of Free Memory: %d %%', [RamStats.dwMemoryLoad])); }
end;

procedure Tfrmmain.CheckRequiredFiles;
begin
  if not FileExists('libeay32.dll') or not FileExists('ssleay32.dll') or not FileExists('Rust.ttf') then
  begin
    DeleteFile('libeay32.dll');
    DeleteFile('ssleay32.dll');
    DeleteFile('Rust.ttf');
    ShowMessage('Some Files seem to be missing. They will now be downloaded. Please restart RSM after the download is complete.');
    DownloadNormal('http://inforcer25.co.za/owncloud/index.php/s/UPPKM6lIkbGTB4s/download', 'requiredfiles.zip', True, '.\');
  end
  else
  begin
    AddFontResource('Rust.ttf');
  end;
end;

procedure Tfrmmain.CheckServerMadeWith;
begin
  if FileExists('RSMsettings.ini') then
  begin
    if MessageDlg('RSM has detected that your server was made with RSM v3.9 or lower.' + sLineBreak + 'RSM v4.0 can''t work with the previous server config or settings. You''re going to have ' + sLineBreak + ' to redo the server config or continue to use the older version of RSM.' + sLineBreak + sLineBreak + 'Note: Your servers, plugins and plugin configs will not be affected' + sLineBreak + sLineBreak + 'Do you want RSM to delete the old config file? If you dont delete it this message will continue to show.', mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      DeleteFile('RSMsettings.ini')
    end;
  end;
end;

procedure Tfrmmain.chklstconfigsDblClick(Sender: TObject);
begin
  if chklstconfigs.ItemIndex <> -1 then
  begin
    frmconfigeditor.sfolder := '.\server\' + serveridentity + '\oxide\config\';
    frmconfigeditor.sfile := chklstconfigs.Items[chklstconfigs.ItemIndex];
    frmconfigeditor.Caption := 'Syntax Editor (' + serveridentity + ' - ' + chklstconfigs.Items[chklstconfigs.ItemIndex] + ')';
    frmconfigeditor.ShowModal;
  end;
end;

procedure Tfrmmain.chklstpluginsDblClick(Sender: TObject);
begin
  if chklstplugins.ItemIndex <> -1 then
  begin
    frmconfigeditor.sfolder := '.\server\' + serveridentity + '\oxide\plugins\';
    frmconfigeditor.sfile := chklstplugins.Items[chklstplugins.ItemIndex];
    frmconfigeditor.Caption := 'Syntax Editor (' + serveridentity + ' - ' + chklstplugins.Items[chklstplugins.ItemIndex] + ')';
    frmconfigeditor.ShowModal;
  end;
end;

procedure Tfrmmain.CleanUp;
begin
  RemoveFontResource('Rust.ttf');
  dcmsteamcmd.Stop;
  KillTask('steamcmd.exe');
end;

procedure Tfrmmain.CreateNewServer;
begin
  frmservercreator.edtserveridentity.Text := '';
  frmservercreator.ShowModal;
  if frmservercreator.cancreate = True then
  begin
    if DirectoryExists('.\server\' + serveridentity) then
    begin
      ShowMessage('Error: Server already exists.');
      Exit
    end
    else
    begin
      ForceDirectories('.\server\' + serveridentity);
      ini_server_config := '.\server\' + serveridentity + '\rsm-server-config.ini';
      cbbserverlist.Clear;
      GetDirList('.\server', cbbserverlist.Items);
      cbbserverlist.ItemIndex := cbbserverlist.Items.IndexOf(serveridentity);
      LoadServerConfig;
    end;
  end;
end;

procedure Tfrmmain.Delete1Click(Sender: TObject);
var
  I: Integer;
begin
  if MessageDlg('Are you sure you want to delete all checked items?' + sLineBreak + 'They will be lost FOREVER!', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    for I := 0 to chklstplugins.Items.Count - 1 do
    begin
      if chklstplugins.Checked[I] then
      begin
        DeleteFile('.\server\' + serveridentity + '\oxide\plugins\' + chklstplugins.Items.Strings[I]);
      end;
    end;

    btnrefreshlists.Click;
  end;
end;

procedure Tfrmmain.Deleteallcheckeditems1Click(Sender: TObject);
var
  I: Integer;
begin
  if MessageDlg('Are you sure you want to delete all checked items?' + sLineBreak + 'They will be lost FOREVER!', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    for I := 0 to chklstconfigs.Items.Count - 1 do
    begin
      if chklstconfigs.Checked[I] then
      begin
        DeleteFile('.\server\' + serveridentity + '\oxide\config\' + chklstconfigs.Items.Strings[I]);
      end;
    end;

    btnrefreshlists.Click;
  end;
end;

procedure Tfrmmain.DownloadNormal(Link, Path: string; Extract: Boolean; ExtractPath: string);
begin
  frmnormaldownloader.Link := Link;
  frmnormaldownloader.Path := Path;
  frmnormaldownloader.Extract := Extract;
  frmnormaldownloader.ExtractPath := ExtractPath;
  frmnormaldownloader.ShowModal;
  if frmnormaldownloader.error = True then
    ShowMessage('Error downloading or extracting.');
end;

procedure Tfrmmain.DownloadSSL(Link, Path: string; Extract: Boolean; ExtractPath: string);
begin
  frmssldownloader.Link := Link;
  frmssldownloader.Path := Path;
  frmssldownloader.Extract := Extract;
  frmssldownloader.ExtractPath := ExtractPath;
  frmssldownloader.ShowModal;
  if frmssldownloader.error = True then
    ShowMessage('Error downloading or extracting.');
end;

procedure Tfrmmain.Edit1Click(Sender: TObject);
begin
  if chklstplugins.ItemIndex <> -1 then
  begin
    frmconfigeditor.sfolder := '.\server\' + serveridentity + '\oxide\plugins\';
    frmconfigeditor.sfile := chklstplugins.Items[chklstplugins.ItemIndex];
    frmconfigeditor.Caption := 'Syntax Editor (' + serveridentity + ' - ' + chklstplugins.Items[chklstplugins.ItemIndex] + ')';
    frmconfigeditor.ShowModal;
  end;
end;

procedure Tfrmmain.Editselecteditem1Click(Sender: TObject);
begin
  if chklstconfigs.ItemIndex <> -1 then
  begin
    frmconfigeditor.sfolder := '.\server\' + serveridentity + '\oxide\config\';
    frmconfigeditor.sfile := chklstconfigs.Items[chklstconfigs.ItemIndex];
    frmconfigeditor.Caption := 'Syntax Editor (' + serveridentity + ' - ' + chklstconfigs.Items[chklstconfigs.ItemIndex] + ')';
    frmconfigeditor.ShowModal;
  end;
end;

procedure Tfrmmain.edtsteamcmdpathChange(Sender: TObject);
begin
  if FileExists(edtsteamcmdpath.Text) then
  begin
    lblsteamcmdstatus.Caption := 'Found steamcmd.exe';
    lblsteamcmdstatus.Font.Color := clLime;
    btninstallsteamcmd2.Visible := False;
  end
  else
  begin
    lblsteamcmdstatus.Caption := 'Could not find steamcmd.exe';
    lblsteamcmdstatus.Font.Color := clRed;
    btninstallsteamcmd2.Visible := True;
  end;
  steamcmdpath := edtsteamcmdpath.Text;
  SaveSettingString('Application Settings', 'steamcmd', steamcmdpath);
end;

procedure Tfrmmain.FormActivate(Sender: TObject);
begin
  CheckRequiredFiles;
  btnrefreshlists.Click;
end;

procedure Tfrmmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CleanUp;
end;

procedure Tfrmmain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  case MessageDlg('Are you sure you want to close RSM?', mtWarning, [mbYes, mbNo], 0) of
    mrYes:
      begin
        CanClose := True;
      end;
    mrNo:
      begin
        CanClose := False;
      end;
  end;
end;

procedure Tfrmmain.FormCreate(Sender: TObject);
var
  msg1: string;
begin
  Application.Title := 'Rust Server Manager';
  if not DirectoryExists('.\server\default') then
  begin
    ForceDirectories('.\server\default');
    serveridentity := 'default'
  end;
  CheckServerMadeWith;
  LoadRSMsettings;
  LoadServerConfig;
  CheckForUpdates;
  CheckRAM;

  // Msg 1
  msg1 := LoadSettingString('MSG', 'msg1', 'False');
  if msg1 = 'False' then
  begin
    if MessageDlg('Welcome to RSM.' + sLineBreak + sLineBreak + 'RSM is freeware and only makes money from donations. I spend a lot of my time working on RSM. Consider donating to it' + sLineBreak + ' so that the work on it can continue. The tools I used to make RSM do not come cheap.' + sLineBreak + sLineBreak + 'Do you want to donate to RSM? It will help with development.', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      Start('paypal.me/Inforcer25');
    end;

    SaveSettingString('MSG', 'msg1', 'True');
  end;

end;

procedure Tfrmmain.FormDestroy(Sender: TObject);
begin
  CleanUp;
end;

function Tfrmmain.GenerateRandomPassword(Lenght: Integer): string;
var
  str: string;
begin
  Randomize;
  // string with all possible chars
  str := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()';
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)) + 1];
  until (Length(Result) = Lenght)
end;

procedure Tfrmmain.GetDirList(DirPath: string; DirList: TStrings);
var
  Found: Integer;
  SearchRec: TSearchRec;
begin
  Found := SysUtils.FindFirst(IncludeTrailingBackslash(DirPath) + '*.*', faDirectory, SearchRec);

  try
    while Found = 0 do
    begin
      if ((SearchRec.Attr and faDirectory) = faDirectory) and (SearchRec.Name[1] <> '.') then
        DirList.Add(SearchRec.Name);
      Found := SysUtils.FindNext(SearchRec);
    end;
  finally
    SysUtils.FindClose(SearchRec);
  end;
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
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure Tfrmmain.lbladdserverClick(Sender: TObject);
begin
  CreateNewServer;
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

      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

function Tfrmmain.LoadConfigString(Section, Name, Value: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_server_config);
  try
    Result := ini.ReadString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.LoadRSMsettings;
begin
    // Application Settings
  pgcmain.ActivePageIndex := LoadSettingInteger('Application Settings', 'lasttab', 0);

  edtsteamcmdpath.Text := steamcmdpath;

    // Last Operation
  cbbserverlist.Clear;
  GetDirList('.\server', cbbserverlist.Items);
  cbbserverlist.ItemIndex := cbbserverlist.Items.IndexOf(serveridentity);
end;

procedure Tfrmmain.LoadServerConfig;
begin
    // Edits
  hostname := LoadConfigString('Server Config', 'hostname', 'My Server');
  lbledtservername.Text := hostname;

  serverdescription := LoadConfigString('Server Config', 'serverdescription', 'Welcome to my sexy server');
  lbledtserverdescription.Text := serverdescription;

  serverurl := LoadConfigString('Server Config', 'serverurl', 'http://myweb.com');
  lbledtserverurl.Text := serverurl;

  bannerurl := LoadConfigString('Server Config', 'bannerurl', 'http://myweb.com/banner.png');
  lbledtserverbannerurl.Text := bannerurl;

    // Server Variables
  serverseed := LoadConfigString('Server Config', 'server.seed', IntToStr(Random(0123456789)));
  vlstdtrservervar.Strings.Values['server.seed'] := serverseed;

  serverworldsize := LoadConfigString('Server Config', 'server.worldsize', '6000');
  vlstdtrservervar.Strings.Values['server.worldsize'] := serverworldsize;

  servermaxplayers := LoadConfigString('Server Config', 'server.maxplayers', '50');
  vlstdtrservervar.Strings.Values['server.maxplayers'] := servermaxplayers;

  serverip := LoadConfigString('Server Config', 'server.ip', '0.0.0.0');
  vlstdtrservervar.Strings.Values['server.ip'] := serverip;

  serverport := LoadConfigString('Server Config', 'server.port', '28015');
  vlstdtrservervar.Strings.Values['server.port'] := serverport;

  servertickrate := LoadConfigString('Server Config', 'server.tickrate', '10');
  vlstdtrservervar.Strings.Values['server.tickrate'] := servertickrate;

  serversaveinterval := LoadConfigString('Server Config', 'server.saveinterval', '300');
  vlstdtrservervar.Strings.Values['server.saveinterval'] := serversaveinterval;

  rconip := LoadConfigString('Server Config', 'rcon.ip', '0.0.0.0');
  vlstdtrservervar.Strings.Values['rcon.ip'] := rconip;

  rconport := LoadConfigString('Server Config', 'rcon.port', '28016');
  vlstdtrservervar.Strings.Values['rcon.port'] := rconport;

  rconpassword := LoadConfigString('Server Config', 'rcon.password', GenerateRandomPassword(10));
  vlstdtrservervar.Strings.Values['rcon.password'] := rconpassword;

  servermap := LoadConfigString('Server Config', 'servermap', 'Procedural Map');
  cbbmap.ItemIndex := cbbmap.Items.IndexOf(servermap);

    // More Server Variables
  globalchat := LoadConfigString('Server Config', 'globalchat', 'True');
  vlstdtrmoreservervar.Strings.Values['Global Chat'] := globalchat;

  radiation := LoadConfigString('Server Config', 'radiation', 'True');
  vlstdtrmoreservervar.Strings.Values['Radiation'] := radiation;

  vac := LoadConfigString('Server Config', 'vac', 'True');
  vlstdtrmoreservervar.Strings.Values['Valve Anti Cheat'] := vac;

  eac := LoadConfigString('Server Config', 'eac', 'True');
  vlstdtrmoreservervar.Strings.Values['Easy Anti Cheat'] := eac;

  rconweb := LoadConfigString('Server Config', 'rconweb', 'True');
  vlstdtrmoreservervar.Strings.Values['Rcon Web'] := rconweb;

  serverpve := LoadConfigString('Server Config', 'serverpve', 'False');
  vlstdtrmoreservervar.Strings.Values['PVE'] := serverpve;

  buildingstability := LoadConfigString('Server Config', 'buildingstability', 'True');
  vlstdtrmoreservervar.Strings.Values['Building Stability'] := buildingstability;

  aithink := LoadConfigString('Server Config', 'aithink', 'True');
  vlstdtrmoreservervar.Strings.Values['AI Think'] := aithink;

  aimove := LoadConfigString('Server Config', 'aimove', 'True');
  vlstdtrmoreservervar.Strings.Values['AI Move'] := aimove;

  antihack := LoadConfigString('Server Config', 'antihack', 'True');
  vlstdtrmoreservervar.Strings.Values['Anti Hack'] := antihack;

  buildingdecay := LoadConfigString('Server Config', 'buildingdecay', 'True');
  vlstdtrmoreservervar.Strings.Values['Building Decay'] := buildingdecay;

  nav_wait := LoadConfigString('Server Config', 'nav_wait', 'False');
  vlstdtrmoreservervar.Strings.Values['nav_wait'] := nav_wait;

  nav_disable := LoadConfigString('Server Config', 'nav_disable', 'False');
  vlstdtrmoreservervar.Strings.Values['nav_disable'] := nav_disable;

  bradley := LoadConfigString('Server Config', 'bradley', 'True');
  vlstdtrmoreservervar.Strings.Values['Bradley (APC)'] := bradley;

  halloweenenabled := LoadConfigString('Server Config', 'halloweenenabled', 'False');
  vlstdtrmoreservervar.Strings.Values['halloween.enabled'] := halloweenenabled;

  halloweenpopulation := LoadConfigString('Server Config', 'halloweenpopulation', '0');
  vlstdtrmoreservervar.Strings.Values['halloween.murdererpopulation'] := halloweenpopulation;
end;

function Tfrmmain.LoadSettingInteger(Section, Name: string; Value: Integer): Integer;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_rsm_settings);
  try
    Result := ini.ReadInteger(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

function Tfrmmain.LoadSettingString(Section, Name, Value: string): string;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_rsm_settings);
  try
    Result := ini.ReadString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.pgcmainChange(Sender: TObject);
begin
  SaveSettingInteger('Application Settings', 'lasttab', pgcmain.ActivePageIndex);
end;

procedure Tfrmmain.SaveConfigString(Section, Name, Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_server_config);
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.SaveSettingInteger(Section, Name: string; Value: Integer);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_rsm_settings);
  try
    ini.WriteInteger(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.SaveSettingString(Section, Name, Value: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ini_rsm_settings);
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

procedure Tfrmmain.Start(Path: string);
begin
  ShellExecute(self.WindowHandle, 'open', Pchar(Path), nil, nil, SW_SHOWNORMAL);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

finalization
  CheckSynchronize;

end.

