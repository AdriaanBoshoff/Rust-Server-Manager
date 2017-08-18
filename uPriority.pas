unit uPriority;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  Tfrmpriority = class(TForm)
    btn1: TButton;
    btn2: TButton;
    pnl1: TPanel;
    rg1: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CanStart: Boolean;
    option: Integer;
  end;

var
  frmpriority: Tfrmpriority;

implementation

{$R *.dfm}

procedure Tfrmpriority.btn1Click(Sender: TObject);
begin
  CanStart := True;
  option := rg1.ItemIndex;
  Close;
end;

procedure Tfrmpriority.FormShow(Sender: TObject);
begin
  rg1.ItemIndex := 1;
  CanStart := False;
end;

end.
