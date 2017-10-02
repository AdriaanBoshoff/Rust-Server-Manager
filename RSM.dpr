program RSM;



uses
  Vcl.Forms,
  uRSM in 'uRSM.pas' {frmmain},
  Vcl.Themes,
  Vcl.Styles,
  uOxideModInstaller in 'uOxideModInstaller.pas' {frmoxidemodinstaller},
  uServerInstaller in 'uServerInstaller.pas' {frminstalleroption},
  uServerDescription in 'uServerDescription.pas' {frmdescription},
  uServerWipe in 'uServerWipe.pas' {frmwipe},
  uPluginConfigEditor in 'uPluginConfigEditor.pas' {frmconfigeditor},
  uMultiDownloader in 'uMultiDownloader.pas' {frmmultidownloader},
  uOxideModBrowser in 'uOxideModBrowser.pas' {frmoxidemodbrowser},
  uPluginEnableDisable in 'uPluginEnableDisable.pas' {frmpluginenabledisable},
  uDownload in 'uDownload.pas' {frmextradownload},
  uCustomStart in 'uCustomStart.pas' {frmcustomstart},
  uSteamCMDinstaller in 'uSteamCMDinstaller.pas' {frmsteamcmdinstaller},
  uDataModule in 'uDataModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Ruby Graphite');
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(Tfrmoxidemodinstaller, frmoxidemodinstaller);
  Application.CreateForm(Tfrminstalleroption, frminstalleroption);
  Application.CreateForm(Tfrmdescription, frmdescription);
  Application.CreateForm(Tfrmwipe, frmwipe);
  Application.CreateForm(Tfrmconfigeditor, frmconfigeditor);
  Application.CreateForm(Tfrmmultidownloader, frmmultidownloader);
  Application.CreateForm(Tfrmoxidemodbrowser, frmoxidemodbrowser);
  Application.CreateForm(Tfrmpluginenabledisable, frmpluginenabledisable);
  Application.CreateForm(Tfrmextradownload, frmextradownload);
  Application.CreateForm(Tfrmcustomstart, frmcustomstart);
  Application.CreateForm(Tfrmsteamcmdinstaller, frmsteamcmdinstaller);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Title := 'Rust Server Manager';
  Application.Run;

end.
