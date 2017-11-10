unit uBranchSelector;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  Tfrmbranchselector = class(TForm)
    btnok: TButton;
    btncancel: TButton;
    pnl1: TPanel;
    rgbranches: TRadioGroup;
    procedure btncancelClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    branch: Integer;
    install: Boolean;
  end;

var
  frmbranchselector: Tfrmbranchselector;

implementation

{$R *.dfm}

procedure Tfrmbranchselector.btncancelClick(Sender: TObject);
begin
  install := False;
  Close;
end;

procedure Tfrmbranchselector.btnokClick(Sender: TObject);
begin
  install := True;
  branch := rgbranches.ItemIndex;
  Close;
end;

end.
