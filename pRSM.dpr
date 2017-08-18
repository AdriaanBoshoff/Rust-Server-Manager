program pRSM;



uses
  Vcl.Forms,
  uRSM in 'uRSM.pas' {frmmain},
  Vcl.Themes,
  Vcl.Styles,
  uOxideModInstaller in 'uOxideModInstaller.pas' {frmoxidemodinstaller},
  uSteamCMDinstaller in 'uSteamCMDinstaller.pas' {frmsteamcmdinstaller},
  uServerInstaller in 'uServerInstaller.pas' {frminstalleroption},
  uServerDescription in 'uServerDescription.pas' {frmdescription},
  uServerWipe in 'uServerWipe.pas' {frmwipe},
  uPluginConfigEditor in 'uPluginConfigEditor.pas' {frmconfigeditor},
  uVclStylesEQU in 'Vcl Styles Equalizer (Tool)\uVclStylesEQU.pas' {FrmHueSat},
  PngFunctions in 'Extras\PngFunctions.pas',
  PngImageList in 'Extras\PngImageList.pas',
  uVCLStylesInfo in 'Vcl Styles Equalizer (Tool)\uVCLStylesInfo.pas' {FrmVCLStyleInfoDialog},
  uMultiDownloader in 'uMultiDownloader.pas' {frmmultidownloader},
  uOxideModBrowser in 'uOxideModBrowser.pas' {frmoxidemodbrowser},
  uPluginEnableDisable in 'uPluginEnableDisable.pas' {frmpluginenabledisable},
  uDownload in 'uDownload.pas' {frmextradownload},
  uCustomStart in 'uCustomStart.pas' {frmcustomstart},
  uPriority in 'uPriority.pas' {frmpriority},
  uUpnp in 'uUpnp.pas' {frmupnp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Ruby Graphite');
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(Tfrmoxidemodinstaller, frmoxidemodinstaller);
  Application.CreateForm(Tfrmsteamcmdinstaller, frmsteamcmdinstaller);
  Application.CreateForm(Tfrminstalleroption, frminstalleroption);
  Application.CreateForm(Tfrmdescription, frmdescription);
  Application.CreateForm(Tfrmwipe, frmwipe);
  Application.CreateForm(Tfrmconfigeditor, frmconfigeditor);
  Application.CreateForm(TFrmHueSat, FrmHueSat);
  Application.CreateForm(Tfrmmultidownloader, frmmultidownloader);
  Application.CreateForm(Tfrmoxidemodbrowser, frmoxidemodbrowser);
  Application.CreateForm(Tfrmpluginenabledisable, frmpluginenabledisable);
  Application.CreateForm(Tfrmextradownload, frmextradownload);
  Application.CreateForm(Tfrmcustomstart, frmcustomstart);
  Application.CreateForm(Tfrmpriority, frmpriority);
  Application.CreateForm(Tfrmupnp, frmupnp);
  Application.Title := 'Rust Server Manager';
  Application.Run;

end.
