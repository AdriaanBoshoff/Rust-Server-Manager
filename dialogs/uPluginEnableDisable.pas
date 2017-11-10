unit uPluginEnableDisable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.ExtCtrls, uDataModule;

type
  Tfrmpluginenabledisable = class(TForm)
    pnl1: TPanel;
    chklstenabled: TCheckListBox;
    chklstdisabled: TCheckListBox;
    pnl2: TPanel;
    btn1: TButton;
    btn2: TButton;
    procedure RefreshLists;
    procedure ListFileDir(Path: string; FileList: TStrings);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpluginenabledisable: Tfrmpluginenabledisable;

implementation

{$R *.dfm}

{ Tfrmpluginenabledisable }

procedure Tfrmpluginenabledisable.btn1Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to chklstenabled.Items.Count -1 do
    begin
      if chklstenabled.Checked[I] then
        begin
          MoveFile(PChar('.\server\' + serveridentity + '\oxide\plugins\' + chklstenabled.Items.Strings[I]), PChar('.\server\' + serveridentity + '\oxide\plugins\disabled\'
            + chklstenabled.Items.Strings[I]));
        end;
    end;
  RefreshLists;
end;

procedure Tfrmpluginenabledisable.btn2Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to chklstdisabled.Items.Count -1 do
    begin
      if chklstdisabled.Checked[I] then
        begin
          MoveFile(PChar('.\server\' + serveridentity + '\oxide\plugins\disabled\' + chklstdisabled.Items.Strings[I]), PChar('.\server\' + serveridentity + '\oxide\plugins\'
            + chklstdisabled.Items.Strings[I]));
        end;
    end;
  RefreshLists;
end;

procedure Tfrmpluginenabledisable.FormShow(Sender: TObject);
begin
  frmpluginenabledisable.Caption := 'Enable / Disable Plugins (Active Server: ' + serveridentity + ')';
  RefreshLists;

  if DirectoryExists('.\server\' + serveridentity + '\oxide\plugins\disabled\') then
    //
  else
    ForceDirectories('.\server\' + serveridentity + '\oxide\plugins\disabled\');

end;

procedure Tfrmpluginenabledisable.RefreshLists;
begin
  chklstenabled.Clear;
  chklstdisabled.Clear;
  ListFileDir('.\server\' + serveridentity + '\oxide\plugins\', chklstenabled.Items);
  ListFileDir('.\server\' + serveridentity + '\oxide\plugins\disabled\', chklstdisabled.Items);
end;

procedure Tfrmpluginenabledisable.ListFileDir(Path: string; FileList: TStrings);
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

end.
