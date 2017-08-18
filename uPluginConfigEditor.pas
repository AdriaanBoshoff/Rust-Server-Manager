unit uPluginConfigEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, SynEdit,
  SynMemo, Vcl.ComCtrls, SynEditHighlighter, SynHighlighterJSON,
  SynEditMiscClasses, SynEditSearch, SynEditOptionsDialog;

type
  Tfrmconfigeditor = class(TForm)
    btn2: TButton;
    pnl1: TPanel;
    btn3: TButton;
    dlgFont1: TFontDialog;
    btn4: TButton;
    chktabs: TCheckBox;
    chkwordwrap: TCheckBox;
    synjsnsyn1: TSynJSONSyn;
    chklinenumbers: TCheckBox;
    FindDialog1: TFindDialog;
    btn1: TButton;
    synm1: TSynMemo;
    chkoverride: TCheckBox;
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure chktabsClick(Sender: TObject);
    procedure chkwordwrapClick(Sender: TObject);
    procedure chklinenumbersClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure chkoverrideClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sfile: string;
    sfolder: string;
    PreviousFoundPos: integer;
  end;

var
  frmconfigeditor: Tfrmconfigeditor;

implementation

{$R *.dfm}

procedure Tfrmconfigeditor.btn1Click(Sender: TObject);
begin
  PreviousFoundPos := 0;
  FindDialog1.Execute;
end;

procedure Tfrmconfigeditor.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrmconfigeditor.btn3Click(Sender: TObject);
begin
  dlgFont1.Font := synm1.Font;
  if dlgFont1.Execute then
  begin
    synm1.Font := dlgFont1.Font;
  end;
end;

procedure Tfrmconfigeditor.btn4Click(Sender: TObject);
begin
  synm1.Lines.SaveToFile(sfolder + sfile);
  Close;
end;

procedure Tfrmconfigeditor.chkoverrideClick(Sender: TObject);
begin
  if chkoverride.Checked = True then
    synm1.Color := clBtnText
  else
    synm1.Color := clWindow;
end;

procedure Tfrmconfigeditor.chklinenumbersClick(Sender: TObject);
begin
  if chklinenumbers.Checked then
    synm1.Gutter.ShowLineNumbers := True
  else
    synm1.Gutter.ShowLineNumbers := False;
end;

procedure Tfrmconfigeditor.chktabsClick(Sender: TObject);
begin
  if chktabs.Checked then
    synm1.WantTabs := True
  else
    synm1.WantTabs := False;
end;

procedure Tfrmconfigeditor.chkwordwrapClick(Sender: TObject);
begin
  if chkwordwrap.Checked = True then
  begin
    synm1.WordWrap := True;
    synm1.ScrollBars := ssVertical;
  end
  else
  begin
    synm1.WordWrap := False;
    synm1.ScrollBars := ssBoth
  end
end;

procedure Tfrmconfigeditor.FindDialog1Find(Sender: TObject);
var
  sText: string;
  StartFrom, FoundPos: integer;
begin
  { If saved position is 0, this must be a "Find First" operation. }
  if PreviousFoundPos = 0 then
    { Reset the frFindNext flag of the FindDialog }
    FindDialog1.Options := FindDialog1.Options - [frFindNext];

  if not(frFindNext in FindDialog1.Options) then
  begin // is it a Find "First" ?
    sText := synm1.Text;
    StartFrom := 1;
  end
  else
  begin // it's a Find "Next"
    { Calculate from where to start searching:
      start AFTER the end of the last found position. }
    StartFrom := PreviousFoundPos + Length(FindDialog1.Findtext);
    { Get text from the RichEdit, starting from StartFrom }
    sText := Copy(synm1.Text, StartFrom, Length(synm1.Text) - StartFrom + 1);
  end;

  if frMatchCase in FindDialog1.Options then // case-sensitive search?
    { Search position of FindText in sText.
      Note that function Pos() is case-sensitive. }
    FoundPos := Pos(FindDialog1.Findtext, sText)
  else
    { Search position of FindText, converted to uppercase,
      in sText, also converted to uppercase }
    FoundPos := Pos(UpperCase(FindDialog1.Findtext), UpperCase(sText));

  if FoundPos > 0 then
  begin
    { If found, calculate position of FindText in the RichEdit }
    PreviousFoundPos := FoundPos + StartFrom - 1;
    { Highlight the text that was found }
    synm1.SelStart := PreviousFoundPos - 1;
    synm1.SelLength := Length(FindDialog1.Findtext);
    synm1.SetFocus;
  end
  else
    PreviousFoundPos := 0;
  // ShowMessage('Could not find "' + FindDialog1.FindText + '"');
end;

procedure Tfrmconfigeditor.FormShow(Sender: TObject);
begin
  synm1.Lines.LoadFromFile(sfolder + sfile);
  synm1.SetFocus;
end;

end.
