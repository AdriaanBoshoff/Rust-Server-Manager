unit uCustomStart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  Tfrmcustomstart = class(TForm)
    btn1: TButton;
    btn2: TButton;
    pnl1: TPanel;
    mmo1: TMemo;
    lbl1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmcustomstart: Tfrmcustomstart;

implementation

{$R *.dfm}

procedure Tfrmcustomstart.btn1Click(Sender: TObject);
begin
  if FileExists('RustDedicated.exe') then
    begin
      mmo1.Lines.SaveToFile('start.bat');
      WinExec('start.bat', SW_SHOWNORMAL);
    end
    else
      ShowMessage('Could not find RustDedicated.exe! Is the server installed?');
end;

procedure Tfrmcustomstart.FormShow(Sender: TObject);
begin
  if FileExists('start.bat') then
    mmo1.Lines.LoadFromFile('start.bat');
end;

end.
