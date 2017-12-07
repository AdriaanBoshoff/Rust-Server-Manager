unit uPluginConfigEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, SynEdit,
  SynMemo, Vcl.ComCtrls, SynEditHighlighter, SynHighlighterJSON,
  SynEditMiscClasses, SynHighlighterCS,
  IniFiles, uDataModule;

type
  Tfrmconfigeditor = class(TForm)
    btn2: TButton;
    btn3: TButton;
    dlgFont1: TFontDialog;
    btn4: TButton;
    chktabs: TCheckBox;
    chkwordwrap: TCheckBox;
    synjsnsyndark: TSynJSONSyn;
    chklinenumbers: TCheckBox;
    FindDialog1: TFindDialog;
    btn1: TButton;
    synm1: TSynMemo;
    synjsnsynlight: TSynJSONSyn;
    rbdark: TRadioButton;
    rblight: TRadioButton;
    chkhighlightline: TCheckBox;
    dlgColor1: TColorDialog;
    btn5: TButton;
    pgc1: TPageControl;
    tseditor: TTabSheet;
    tssettings: TTabSheet;
    pnl1: TPanel;
    grpeditorsettings: TGroupBox;
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure chktabsClick(Sender: TObject);
    procedure chkwordwrapClick(Sender: TObject);
    procedure chklinenumbersClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure rbdarkClick(Sender: TObject);
    procedure rblightClick(Sender: TObject);
    procedure chkhighlightlineClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure SaveSettingString(Section, Name, Value: string);
  private
    { Private declarations }
  public
    { Public declarations }
    sfile, sfolder: string;
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

procedure Tfrmconfigeditor.btn5Click(Sender: TObject);
begin
  if dlgColor1.Execute then
  begin
    synm1.ActiveLineColor := dlgColor1.Color;
    SaveSettingString('Syntax Editor', 'active_line_color',
      ColorToString(dlgColor1.Color));
  end;
end;

procedure Tfrmconfigeditor.chkhighlightlineClick(Sender: TObject);
begin
  if chkhighlightline.Checked = True then
  begin
    synm1.ActiveLineColor := clTeal;
    SaveSettingString('Syntax Editor', 'highlight_active_line',
      BoolToStr(True));
  end
  else
  begin
    synm1.ActiveLineColor := clNone;
    SaveSettingString('Syntax Editor', 'highlight_active_line',
      BoolToStr(False));
  end;
end;

procedure Tfrmconfigeditor.chklinenumbersClick(Sender: TObject);
begin
  if chklinenumbers.Checked then
  begin
    synm1.Gutter.ShowLineNumbers := True;
    SaveSettingString('Syntax Editor', 'show_line_numbers', BoolToStr(True));
  end
  else
  begin
    synm1.Gutter.ShowLineNumbers := False;
    SaveSettingString('Syntax Editor', 'show_line_numbers', BoolToStr(False));
  end;
end;

procedure Tfrmconfigeditor.chktabsClick(Sender: TObject);
begin
  if chktabs.Checked then
  begin
    synm1.WantTabs := True;
    SaveSettingString('Syntax Editor', 'want_tabs', BoolToStr(True));
  end
  else
  begin
    synm1.WantTabs := False;
    SaveSettingString('Syntax Editor', 'want_tabs', BoolToStr(False));
  end;
end;

procedure Tfrmconfigeditor.chkwordwrapClick(Sender: TObject);
begin
  if chkwordwrap.Checked = True then
  begin
    synm1.WordWrap := True;
    synm1.ScrollBars := ssVertical;
    SaveSettingString('Syntax Editor', 'word_wrap', BoolToStr(True));
  end
  else
  begin
    synm1.WordWrap := False;
    synm1.ScrollBars := ssBoth;
    SaveSettingString('Syntax Editor', 'word_wrap', BoolToStr(False));
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
  pgc1.ActivePageIndex := 0;
  synm1.SetFocus;
end;

procedure Tfrmconfigeditor.rbdarkClick(Sender: TObject);
begin
  synm1.Highlighter := synjsnsyndark;
  synm1.Color := clBtnText;
  SaveSettingString('Syntax Editor', 'theme', 'dark');
end;

procedure Tfrmconfigeditor.rblightClick(Sender: TObject);
begin
  synm1.Highlighter := synjsnsynlight;
  synm1.Color := clWhite;
  SaveSettingString('Syntax Editor', 'theme', 'light');
end;

procedure Tfrmconfigeditor.SaveSettingString(Section, Name, Value: string);
var
  ini: TiniFile;
begin
  ini := TiniFile.Create(ini_rsm_settings);
  try
    ini.WriteString(Section, Name, Value);
  finally
    ini.Free;
  end;
end;

end.
