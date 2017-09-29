unit uOxideModInstaller;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, System.Zip, ActiveX,
  IdSSLOpenSSL;

type

  TDownload = class;

  Tfrmoxidemodinstaller = class(TForm)
    pb1: TProgressBar;
    btn1: TButton;
    procedure FormShow(Sender: TObject);
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
  frmoxidemodinstaller: Tfrmoxidemodinstaller;

implementation

{$R *.dfm}
{ Thread }

constructor TDownload.Create(CreateSuspended: boolean; aurl, afilename: string);
begin
  inherited Create(CreateSuspended);
  httpclient := TIdHTTP.Create(nil);
  httpclient.Request.UserAgent := 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1';
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
    frmoxidemodinstaller.Caption := 'Done Downloading. Extracting...';
    ExtractZip('oxide.zip', GetCurrentDir);
  finally
    Stream.Free;
  end;
end;

procedure TDownload.UpdateProgressBar;
var
  ZipFile: string;
begin
  frmoxidemodinstaller.pb1.Position := progressbarstatus;
  frmoxidemodinstaller.Caption := 'Downloading...';
end;

procedure TDownload.SetMaxProgressBar;
begin
  frmoxidemodinstaller.pb1.Max := maxprogressbar;
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
    frmoxidemodinstaller.Caption := 'Done.';
    frmoxidemodinstaller.btn1.Enabled := True;
  end
  else
  begin
    frmoxidemodinstaller.Caption := 'Error Extracting files';
  end;
end;

procedure Tfrmoxidemodinstaller.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmoxidemodinstaller.FormShow(Sender: TObject);
var
  DownloadThread: TDownload;
  link: string;
begin
  pb1.Position := 0;
  btn1.Enabled := False;
  frmoxidemodinstaller.Caption := 'Starting Download...';
  link := 'https://www.github.com/OxideMod/Oxide/releases/download/latest/Oxide-Rust.zip';
  DownloadThread := TDownload.Create(true, link, 'oxide.zip');
  DownloadThread.FreeOnTerminate := true;
  DownloadThread.Start;
end;

end.
