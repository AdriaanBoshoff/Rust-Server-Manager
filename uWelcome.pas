unit uWelcome;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls, ShellAPI,
  IniFiles;

type
  Tfrmwelcome = class(TForm)
    pnl1: TPanel;
    pgc1: TPageControl;
    tswelcome: TTabSheet;
    tshowto: TTabSheet;
    lbl1: TLabel;
    lbl2: TLabel;
    Label1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    btn1: TButton;
    lbl7: TLabel;
    tschangelog: TTabSheet;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    procedure OpenURL(url: string);
    procedure lbl6Click(Sender: TObject);
    procedure lbl7Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwelcome: Tfrmwelcome;

implementation

{$R *.dfm}
{ Tfrmwelcome }

procedure Tfrmwelcome.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmwelcome.lbl6Click(Sender: TObject);
begin
  OpenURL('https://www.youtube.com/Inforcer25');
end;

procedure Tfrmwelcome.lbl7Click(Sender: TObject);
begin
  OpenURL('https://twitter.com/inforcer25');
end;

procedure Tfrmwelcome.OpenURL(url: string);
begin
  ShellExecute(self.WindowHandle, 'open', PChar(url), nil, nil, SW_SHOWNORMAL);
end;

end.
