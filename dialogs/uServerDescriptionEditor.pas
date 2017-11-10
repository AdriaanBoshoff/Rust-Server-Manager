unit uServerDescriptionEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin;

type
  Tfrmdescription = class(TForm)
    pnl2: TPanel;
    btn1: TButton;
    pnl1: TPanel;
    lbl2: TLabel;
    se1: TSpinEdit;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure se1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    description: string;
  end;

var
  frmdescription: Tfrmdescription;

implementation

{$R *.dfm}

procedure Tfrmdescription.btn1Click(Sender: TObject);
begin
  description := mmo1.Text;
  description := StringReplace(description, #13#10, ' \n', [rfReplaceAll]);
  Close;
end;

procedure Tfrmdescription.FormCreate(Sender: TObject);
begin
  se1.Value := mmo1.Font.Size;
end;

procedure Tfrmdescription.FormShow(Sender: TObject);
begin
  mmo1.SetFocus;
  mmo1.SelStart := mmo1.SelLength;
end;

procedure Tfrmdescription.se1Change(Sender: TObject);
begin
  mmo1.Font.Size := se1.Value;
end;

end.
