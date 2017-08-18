unit uSteamCMDinstaller;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, System.Zip;

type

  TDownload = class;

  Tfrmsteamcmdinstaller = class(TForm)
    lbl1: TLabel;
    pb1: TProgressBar;
    btn1: TButton;
    btn2: TButton;
    lblstatus: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TDownload = class(TThread)
  private
    httpclient: TIdHTTP;
    url: string;
    filename: string;
    maxprogressbar: integer;
    progressbarstatus: integer;
    procedure ExtractZip(ZipFile: string; ExtractPath: string);
    procedure idhttp1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure idhttp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure UpdateProgressBar;
    procedure SetMaxProgressBar;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: boolean; aurl, afilename: string);
    destructor Destroy; override;
  end;

var
  frmsteamcmdinstaller: Tfrmsteamcmdinstaller;

implementation

{$R *.dfm}

procedure Tfrmsteamcmdinstaller.btn1Click(Sender: TObject);
var
  DownloadThread: TDownload;
  link: string;
begin
  link := 'http://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip';
  DownloadThread := TDownload.Create(true, link, 'steamcmd.zip');
  DownloadThread.FreeOnTerminate := true;
  DownloadThread.Start;
end;

procedure Tfrmsteamcmdinstaller.btn2Click(Sender: TObject);
begin
  Close;
end;

{ TDownload }

constructor TDownload.Create(CreateSuspended: boolean; aurl, afilename: string);
begin
  inherited Create(CreateSuspended);
  httpclient := TIdHTTP.Create(nil);
  httpclient.OnWorkBegin := idhttp1WorkBegin;
  httpclient.OnWork := idhttp1Work;
  url := aurl;
  filename := afilename;
end;

procedure TDownload.idhttp1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  progressbarstatus := AWorkCount;
  Queue(UpdateProgressBar);

end;

procedure TDownload.idhttp1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  maxprogressbar := AWorkCountMax;
  Queue(SetMaxProgressBar);
end;

procedure TDownload.Execute;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    httpclient.Get(url, Stream);
    Stream.SaveToFile(filename);
  finally
    Stream.Free;
  end;
end;

procedure TDownload.ExtractZip(ZipFile, ExtractPath: string);
begin
  if DirectoryExists('.\steamcmd') then
  begin
    if TZipFile.IsValid(ZipFile) then
    begin
      TZipFile.ExtractZipFile(ZipFile, ExtractPath);
      frmsteamcmdinstaller.lblstatus.Caption := 'SteamCMD Installed!';
      DeleteFile(ZipFile);
    end
    else
    begin
      ShowMessage('Error installing...!');
      frmsteamcmdinstaller.lblstatus.Caption := 'Error Installing ...!';
    end;
  end
  else
  begin
    MkDir('.\steamcmd');
    if TZipFile.IsValid(ZipFile) then
    begin
      TZipFile.ExtractZipFile(ZipFile, ExtractPath);
      frmsteamcmdinstaller.lblstatus.Caption := 'SteamCMD Installed!';
      DeleteFile(ZipFile);
    end
    else
    begin
      ShowMessage('Error installing...!');
      frmsteamcmdinstaller.lblstatus.Caption := 'Error Installing ...!';
    end;
  end;
end;

procedure TDownload.UpdateProgressBar;
var
  ZipFile: string;
begin
  frmsteamcmdinstaller.pb1.Position := progressbarstatus;
  frmsteamcmdinstaller.lblstatus.Caption := 'Downloading...';

  if frmsteamcmdinstaller.pb1.Position = frmsteamcmdinstaller.pb1.Max then
  begin
    frmsteamcmdinstaller.lblstatus.Caption := 'Done Downloading. Installing...';
    Sleep(2000);
    ExtractZip('steamcmd.zip', '.\steamcmd');
  end;
end;

procedure TDownload.SetMaxProgressBar;
begin
  frmsteamcmdinstaller.pb1.Max := maxprogressbar;
end;

destructor TDownload.Destroy;
begin
  FreeAndNil(httpclient);
  inherited Destroy;
end;

end.
