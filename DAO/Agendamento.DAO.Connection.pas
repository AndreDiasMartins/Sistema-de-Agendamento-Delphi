unit Agendamento.DAO.Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.MSAcc, FireDAC.Phys.MSAccDef,
  FireDAC.Stan.Def;

type
  TDAO = class(TDataModule)
    Connection: TFDConnection;
    fdQuery: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDQuery1: TFDQuery;
    FDQuery1id: TIntegerField;
    FDQuery1data_agendamento: TWideStringField;
    FDQuery1hora_agendamento: TWideStringField;
    FDQuery1nome_cliente: TWideStringField;
    FDQuery1servico: TWideStringField;
    FDQuery1contato: TWideStringField;
    FDQuery1observacoes: TWideMemoField;
    FDQuery1created_at: TSQLTimeStampField;
    FDQuery1updated_at: TSQLTimeStampField;
  strict private
    class var FInstance: TDAO;
  private
    { Private declarations }
  public
    { Public declarations }
    class function GetInstance: TDAO;
    class procedure ReleaseInstance;

    function Open(var Query: TFDMemTable; const SQLText: string; out StrErr: string): Boolean;
    function ExecSQL(const CommandSQL: string; out StrErr: string): Boolean;
    function TryExcept (msg : string) : string;
  end;

var
  DAO: TDAO;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDAO }

function TDAO.ExecSQL(const CommandSQL: string; out StrErr: string): Boolean;
begin
  try
    StrErr := 'N�o foi possivel executar comando SQL.';
    Connection.ExecSQL(CommandSQL);

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      StrErr := StrErr + ' - ' + E.Message;
      Result := False;
    end;
  end;
end;

class function TDAO.GetInstance: TDAO;
begin
  if not Assigned(FInstance) then
    FInstance := TDAO.Create(nil);
  Result := FInstance;
end;

function TDAO.Open(var Query: TFDMemTable; const SQLText: string; out StrErr: string): Boolean;
begin
  try
    StrErr := 'N�o foi possivel abrir pesquisa';
    FDQuery.Close;
    FDQuery.SQL.Text := SQLText;
    FDQuery.Open;

    StrErr := 'N�o foi possivel obter dados.';
    Query.Close;
    Query.AppendData(FDQuery);

    StrErr := '';
    Result := True;
  except
    Result := False;
  end;
end;

class procedure TDAO.ReleaseInstance;
begin
  if Assigned(FInstance) then
    FreeAndNil(FInstance);
end;

function TDAO.TryExcept(msg: string): string;
begin
 Result := msg;
end;

initialization

finalization

TDAO.ReleaseInstance;

end.
