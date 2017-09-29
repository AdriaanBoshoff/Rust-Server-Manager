unit uSteamCMDinstaller;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, System.Zip, ActiveX, IdSSLOpenSSL;

type

  TDownload = class;

  Tfrmsteamcmdinstaller = class(TForm)
    pb1: TProgressBar;
    procedure FormShow(Sender: TObject);
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

{ Thread }

constructor TDownload.Create(CreateSuspended: boolean; aurl, afilename: string);
begin
  inherited Create(CreateSuspended);
  httpclient := TIdHTTP.Create(nil);
  httpclient.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(httpclient);
  httpclient.HandleRedirects := True;
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
    frmsteamcmdinstaller.Caption := 'Done Downloading. Extracting...';
    ForceDirectories('.\steamcmd');
    ExtractZip('steamcmd.zip', '.\steamcmd');
  finally
    Stream.Free;
  end;
end;

procedure TDownload.UpdateProgressBar;
var
  ZipFile: string;
begin
  frmsteamcmdinstaller.pb1.Position := progressbarstatus;
  frmsteamcmdinstaller.Caption := 'Downloading...';
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

procedure TDownload.ExtractZip(ZipFile, ExtractPath: string);
begin
  if TZipFile.IsValid(ZipFile) then
  begin
    TZipFile.ExtractZipFile(ZipFile, ExtractPath);
    DeleteFile(ZipFile);
    frmsteamcmdinstaller.Caption := 'Done.';
    frmsteamcmdinstaller.Close;
  end
  else
  begin
    ShowMessage('There was some unknown error while downloading or extracting the files.');
    frmsteamcmdinstaller.Close;
  end;
end;

procedure Tfrmsteamcmdinstaller.FormShow(Sender: TObject);
  var
  DownloadThread: TDownload;
  link: string;
begin
  pb1.Position := 0;
  frmsteamcmdinstaller.Caption := 'Starting Download...';
  link := 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip';
  DownloadThread := TDownload.Create(true, link, 'steamcmd.zip');
  DownloadThread.FreeOnTerminate := true;
  DownloadThread.Start;
end;

end.
