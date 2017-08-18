unit uUpnp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ActiveX, oleAuto, WinSock;

type
  Tfrmupnp = class(TForm)
    lbl1: TLabel;
    mmo1: TMemo;
    lbl2: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    procedure ListUPnPEntries;
    Procedure RemoveUPnPEntry(Port: Integer);
    Procedure AddUPnPEntry(Port: Integer; Protocal: string; const Name: ShortString; LAN_IP: string);
    function GetLocalIP: string;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    serverport, rconport: string;
  end;

var
  frmupnp: Tfrmupnp;

implementation

{$R *.dfm}

{ Tfrmupnp }

procedure Tfrmupnp.RemoveUPnPEntry(Port: Integer);
Var
  Nat: Variant;
  Ports: Variant;
Begin
  try
    Nat := CreateOleObject('HNetCfg.NATUPnP');
    Ports := Nat.StaticPortMappingCollection;
    Ports.Remove(Port, 'TCP');
  except
    ShowMessage('An Error occured with removing UPnP Ports. ' +
      'Please check to see if your router supports UPnP and ' +
      'has it enabled or disable UPnP.');
  end;
End;

procedure Tfrmupnp.AddUPnPEntry(Port: Integer; Protocal: string;
  const Name: ShortString; LAN_IP: string);
Var
  Nat: Variant;
  Ports: Variant;
  SavedCW: Word;
Begin
  if NOT(LAN_IP = '127.0.0.1') then
  begin
    try
      Nat := CreateOleObject('HNetCfg.NATUPnP');
      Ports := Nat.StaticPortMappingCollection;

      if not VarIsClear(Ports) then
      begin
        //do something
        //ShowMessage(inttostr(Ports.count));
        Ports.Add(Port, Protocal, Port, LAN_IP, True, name);
      end;

    except on E:Exception do
      ShowMessage('An Error occured with adding UPnP Ports. '+E.Message);
    end;
  end;
end;

procedure Tfrmupnp.btn1Click(Sender: TObject);
begin
  ShowMessage(serverport + rconport);
  AddUPnPEntry(StrToInt(serverport), 'UDP', 'RustServer', GetLocalIP);
  AddUPnPEntry(StrToInt(serverport), 'TCP', 'RustServer2', GetLocalIP);
  AddUPnPEntry(StrToInt(rconport), 'TCP', 'RustServerRcon', GetLocalIP);
end;

procedure Tfrmupnp.btn2Click(Sender: TObject);
begin
  mmo1.Clear;
  ListUPnPEntries;
end;

procedure Tfrmupnp.btn3Click(Sender: TObject);
begin
  RemoveUPnPEntry(StrToInt(serverport));
  RemoveUPnPEntry(StrToInt(rconport));
  //RemoveUPnPEntry(28015);
end;

procedure Tfrmupnp.FormShow(Sender: TObject);
begin
  mmo1.Clear;
  ListUPnPEntries;
end;

function Tfrmupnp.GetLocalIP: string;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe : PHostEnt;
  pptr : PaPInAddr;
  Buffer : array [0..63] of AnsiChar;
  i : Integer;
  GInitData : TWSADATA;
begin
  WSAStartup($101, GInitData);
  Result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe :=GetHostByName(buffer);
  if phe = nil then Exit;
  pptr := PaPInAddr(Phe^.h_addr_list);
  i := 0;
  while pptr^[i] <> nil do begin
    result:=StrPas(inet_ntoa(pptr^[i]^));
    Inc(i);
  end;
  WSACleanup;
end;

procedure Tfrmupnp.ListUPnPEntries;
var
  Nat : Variant;
  Ports : Variant;
  Port : OleVariant;
  IntPort, ExtPort : Integer;
  Desc, Protocol, IntClient, ExtIP, InternalPort : WideString;
  Enabled: Boolean;
  foreach: IEnumVariant;
  enum: IUnknown;
  i:integer;
begin
  try
    Nat := CreateOleObject('HNetCfg.NATUPnP');
    Ports := Nat.StaticPortMappingCollection;

    Enum := Ports._NewEnum;
    foreach := enum as IEnumVariant;

    while foreach.Next(1, Port, PDWORD(0)^) = 0 do
    begin
      Desc := Port.Description;
      Enabled := Port.Enabled;
      ExtIP := Port.ExternalIPAddress;
      ExtPort := Port.ExternalPort;
      IntClient := Port.InternalClient;
      InternalPort := Port.InternalPort;
      Protocol := Port.Protocol;

      mmo1.lines.Append(inttostr(ExtPort)+' '+desc+' '+protocol+' '+ExtIP);
    end;
  except
    on e:Exception do
        ShowMessage(e.Message);
  end;
end;

end.
