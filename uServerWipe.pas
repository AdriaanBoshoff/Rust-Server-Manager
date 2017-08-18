unit uServerWipe;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.IOUtils,
  Vcl.CheckLst;

type
  Tfrmwipe = class(TForm)
    pnl1: TPanel;
    lst1: TListBox;
    btn1: TButton;
    btn2: TButton;
    pnl2: TPanel;
    chk1: TCheckBox;
    chklstdata: TCheckListBox;
    procedure GetDirList(sPath: string);
    procedure btn2Click(Sender: TObject);
    procedure DeleteFilesMatchingPattern(const Directory, Pattern: string);
    procedure ListFileDir(Path: string; FileList: TStrings);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure lst1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    serveridentity: string;
  end;

var
  frmwipe: Tfrmwipe;

implementation

{$R *.dfm}

procedure Tfrmwipe.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmwipe.btn2Click(Sender: TObject);
var
  I: Integer;
begin
  if chk1.Checked then
  begin
    if lst1.ItemIndex = -1 then
    begin
      ShowMessage('You have to select a server!');
    end
    else
    begin
      DeleteFilesMatchingPattern('.\server\' + lst1.Items[lst1.ItemIndex] +
        '\', '*.sav');
      ShowMessage('Server has been wiped along with the selected data!');
      Close;
    end;
  end
  else
    ShowMessage
      ('You need to accept the fact that you know your server will be wiped!');

  if chk1.Checked then
  begin
    for I := 0 to chklstdata.Items.Count - 1 do
    begin
      if chklstdata.Checked[I] then
      begin
        DeleteFile('.\server\' + serveridentity + '\oxide\data\' + chklstdata.Items.Strings[I]);
      end;
    end;
  end
  else
    ShowMessage
      ('You need to accept the fact that you know your server will be wiped!');
end;

procedure Tfrmwipe.DeleteFilesMatchingPattern(const Directory, Pattern: string);
var
  FileName: string;
begin
  for FileName in TDirectory.GetFiles(Directory, Pattern) do
    TFile.Delete(FileName);
end;

procedure Tfrmwipe.FormShow(Sender: TObject);
begin
  lst1.Clear;
  chklstdata.Clear;
  GetDirList('.\server');
  ListFileDir('.\server\' + serveridentity + '\oxide\data\', chklstdata.Items);
end;

procedure Tfrmwipe.GetDirList(sPath: string);
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
        lst1.Items.Add(SearchRec.Name);
      Found := SysUtils.FindNext(SearchRec);
    end;
  finally
    SysUtils.FindClose(SearchRec);
  end;
end;

procedure Tfrmwipe.ListFileDir(Path: string; FileList: TStrings);
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

procedure Tfrmwipe.lst1Click(Sender: TObject);
begin
  if lst1.ItemIndex <> -1 then
    begin
      chklstdata.Clear;
      ListFileDir('.\server\' + lst1.Items.Strings[lst1.ItemIndex] + '\oxide\data\', chklstdata.Items);
    end;
end;

end.
