unit uOxideModBrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.StdCtrls, ShellAPI, Vcl.ComCtrls;

type
  Tfrmoxidemodbrowser = class(TForm)
    pnl1: TPanel;
    wb1: TWebBrowser;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    pb1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure OpenURL(url: string);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure wb1DownloadBegin(Sender: TObject);
    procedure wb1DownloadComplete(Sender: TObject);
    procedure wb1ProgressChange(ASender: TObject;
      Progress, ProgressMax: Integer);
  private
    { Private declarations }
    FDownCount: Integer;
  public
    { Public declarations }
  end;

var
  frmoxidemodbrowser: Tfrmoxidemodbrowser;

implementation

{$R *.dfm}

procedure Tfrmoxidemodbrowser.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmoxidemodbrowser.btn2Click(Sender: TObject);
begin
  FDownCount := 0;
  wb1.Navigate('http://oxidemod.org/plugins/categories/rust.24/');
end;

procedure Tfrmoxidemodbrowser.btn3Click(Sender: TObject);
begin
  FDownCount := 0;
  wb1.Navigate('http://oxidemod.org/plugins/categories/universal.58/');
end;

procedure Tfrmoxidemodbrowser.btn4Click(Sender: TObject);
begin
  FDownCount := 0;
  wb1.GoBack;
end;

procedure Tfrmoxidemodbrowser.btn5Click(Sender: TObject);
begin
  FDownCount := 0;
  wb1.GoForward;
end;

procedure Tfrmoxidemodbrowser.btn6Click(Sender: TObject);
begin
  FDownCount := 0;
  wb1.Refresh;
end;

procedure Tfrmoxidemodbrowser.FormCreate(Sender: TObject);
begin
  FDownCount := 0;
  wb1.Navigate('http://oxidemod.org/plugins/categories/rust.24/');
end;

procedure Tfrmoxidemodbrowser.OpenURL(url: string);
begin
  ShellExecute(self.WindowHandle, 'open', PChar(url), nil, nil, SW_SHOWNORMAL);
end;

procedure Tfrmoxidemodbrowser.wb1DownloadBegin(Sender: TObject);
begin
  Inc(FDownCount);
  pb1.Position := 0;
end;

procedure Tfrmoxidemodbrowser.wb1DownloadComplete(Sender: TObject);
begin
  Dec(FDownCount);
  pb1.Position := 0;
end;

procedure Tfrmoxidemodbrowser.wb1ProgressChange(ASender: TObject;
  Progress, ProgressMax: Integer);
begin
  if (ProgressMax > 0) and (Progress > 0) and (FDownCount > 0) then
  begin
    pb1.Position := Trunc(Progress / ProgressMax) * 100;
    pb1.Update;
    Sleep(100);
    Application.ProcessMessages;
  end;
end;

end.
