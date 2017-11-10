unit uServerWipe;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.IOUtils, Vcl.CheckLst;

type
  Tfrmwipe = class(TForm)
    pnl1: TPanel;
    lst1: TListBox;
    btn1: TButton;
    btn2: TButton;
    pnl2: TPanel;
    chklstdata: TCheckListBox;
    chkbpwipe: TCheckBox;
    procedure GetDirList(sPath: string);
    procedure btn2Click(Sender: TObject);
    procedure DeleteFilesMatchingPattern(const Directory, Pattern: string);
    procedure ListFileDir(Path: string; FileList: TStrings);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure lst1Click(Sender: TObject);
    procedure DeleteDirectory(const Name: string);
  private
    { Private declarations }
  public
    { Public declarations }
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
  if MessageDlg('You are about to wipe ' + lst1.Items[lst1.ItemIndex] + ' along with the checked data.' + sLineBreak + ' Do you want to continue?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    if lst1.ItemIndex = -1 then
    begin
      ShowMessage('You have to select a server!');
    end
    else
    begin
      DeleteFilesMatchingPattern('.\server\' + lst1.Items[lst1.ItemIndex] + '\', '*.sav');
      ShowMessage('Server has been wiped along with the selected data!');
      Close;
    end;

    for I := 0 to chklstdata.Items.Count - 1 do
    begin
      if chklstdata.Checked[I] then
      begin
        DeleteFile('.\server\' + lst1.Items[lst1.ItemIndex] + '\oxide\data\' + chklstdata.Items.Strings[I]);
      end;
    end;

    if chkbpwipe.Checked then
    begin
      DeleteDirectory('.\server\' + lst1.Items[lst1.ItemIndex] + '\user');
    end;

  end;
end;

procedure Tfrmwipe.DeleteDirectory(const Name: string);
var
  F: TSearchRec;
begin
  if FindFirst(Name + '\*', faAnyFile, F) = 0 then
  begin
    try
      repeat
        if (F.Attr and faDirectory <> 0) then
        begin
          if (F.Name <> '.') and (F.Name <> '..') then
          begin
            DeleteDirectory(Name + '\' + F.Name);
          end;
        end
        else
        begin
          DeleteFile(Name + '\' + F.Name);
        end;
      until FindNext(F) <> 0;
    finally
      FindClose(F);
    end;
    RemoveDir(Name);
  end;
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
end;

procedure Tfrmwipe.GetDirList(sPath: string);
var
  Found: Integer;
  SearchRec: TSearchRec;
begin
  Found := SysUtils.FindFirst(IncludeTrailingBackslash(sPath) + '*.*', faDirectory, SearchRec);

  try
    while Found = 0 do
    begin
      if ((SearchRec.Attr and faDirectory) = faDirectory) and (SearchRec.Name[1] <> '.') then
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

