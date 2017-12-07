program RSM;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmmain},
  Vcl.Themes,
  Vcl.Styles,
  uDataModule in 'uDataModule.pas' {dmDataModule: TDataModule},
  uNormal in 'downloaders\uNormal.pas' {frmnormaldownloader},
  uSSL in 'downloaders\uSSL.pas' {frmssldownloader},
  uBranchSelector in 'dialogs\uBranchSelector.pas' {frmbranchselector},
  uServerCreator in 'dialogs\uServerCreator.pas' {frmservercreator},
  uServerWipe in 'dialogs\uServerWipe.pas' {frmwipe},
  uServerDescriptionEditor in 'dialogs\uServerDescriptionEditor.pas' {frmdescription},
  uPluginEnableDisable in 'dialogs\uPluginEnableDisable.pas' {frmpluginenabledisable},
  uPluginConfigEditor in 'dialogs\uPluginConfigEditor.pas' {frmconfigeditor},
  uOxideModBrowser in 'dialogs\uOxideModBrowser.pas' {frmOxideModBrowser},
  uLangEditor in 'dialogs\uLangEditor.pas' {frmLangEditor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Material Black Pearl');
  Application.CreateForm(TdmDataModule, dmDataModule);
  Application.CreateForm(Tfrmmain, frmmain);
  Application.CreateForm(Tfrmnormaldownloader, frmnormaldownloader);
  Application.CreateForm(Tfrmssldownloader, frmssldownloader);
  Application.CreateForm(Tfrmbranchselector, frmbranchselector);
  Application.CreateForm(Tfrmservercreator, frmservercreator);
  Application.CreateForm(Tfrmwipe, frmwipe);
  Application.CreateForm(Tfrmdescription, frmdescription);
  Application.CreateForm(Tfrmpluginenabledisable, frmpluginenabledisable);
  Application.CreateForm(Tfrmconfigeditor, frmconfigeditor);
  Application.CreateForm(TfrmOxideModBrowser, frmOxideModBrowser);
  Application.CreateForm(TfrmLangEditor, frmLangEditor);
  Application.Run;
end.
