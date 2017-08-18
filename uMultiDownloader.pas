unit uMultiDownloader;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, System.Zip;

type

  TDownload = class;

  Tfrmmultidownloader = class(TForm)
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
    multilink: string;
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
  frmmultidownloader: Tfrmmultidownloader;

implementation

{$R *.dfm}
{ Thread }

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

procedure TDownload.UpdateProgressBar;
var
  ZipFile: string;
begin
  frmmultidownloader.pb1.Position := progressbarstatus;
  frmmultidownloader.lblstatus.Caption := 'Downloading...';

  if frmmultidownloader.pb1.Position = frmmultidownloader.pb1.Max then
  begin
    frmmultidownloader.lblstatus.Caption := 'Done Downloading.';
    Sleep(2000);
    ExtractZip('download.zip', GetCurrentDir);
  end;
end;

procedure TDownload.SetMaxProgressBar;
begin
  frmmultidownloader.pb1.Max := maxprogressbar;
end;

destructor TDownload.Destroy;
begin
  FreeAndNil(httpclient);
  inherited Destroy;
end;

{ TForm1 }

procedure TDownload.ExtractZip(ZipFile, ExtractPath: string);
begin
  if TZipFile.IsValid(ZipFile) then
  begin
    TZipFile.ExtractZipFile(ZipFile, ExtractPath);
    frmmultidownloader.lblstatus.Caption := 'Downloaded!';
    DeleteFile(ZipFile);
  end
  else
  begin
    ShowMessage('Error downloading!');
    frmmultidownloader.lblstatus.Caption := 'Error downloading!';
  end;
end;

procedure Tfrmmultidownloader.btn1Click(Sender: TObject);
var
  DownloadThread: TDownload;
  link: string;
begin
  link := multilink;
  DownloadThread := TDownload.Create(true, link, 'download.zip');
  DownloadThread.FreeOnTerminate := true;
  DownloadThread.Start;
end;

procedure Tfrmmultidownloader.btn2Click(Sender: TObject);
begin
  Close;
end;

end.
