unit Agendamento.DAO.DatasDisponiveis;

interface

uses
  Agendamento.Model.DatasDisponiveis, Agendamento.DAO.Connection,
  FireDAC.Comp.Client, System.SysUtils, dialogs, System.Classes,
  Agendar.Comuns.Types;

const
  acmModulo = '';

type

  TDatasDisponiveisDAO = class

  private
    FSQL: TStringList;
    FInsertUpdate: TInsertUpdate;
  public
    constructor Create;
    destructor Destroy; override;

    function Open(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
    function OpenDataDisponivel(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
    function OpenHoraDisponivel(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
    function New(var R: TDatasDisponiveisModel; out StrErr: string): Boolean;
    function Edit(Id: Integer; var R: TDatasDisponiveisModel; out StrErr: string): Boolean;
    function Delete(Id: Integer; out StrErr: string): Boolean;
    function Post(var R: TDatasDisponiveisModel; out StrErr: string): Boolean;
    function Upsert(var R: TDatasDisponiveisModel; out StrErr: string): Boolean;
    function Report(var Query: TFDMemTable; AReport: Integer; AParams: array of variant; out StrErr: string): Boolean;
  end;

implementation

{ TDatasDisponiveisDAO }

constructor TDatasDisponiveisDAO.Create;
begin
  FSQL := TStringList.Create;
  FInsertUpdate := TInsertUpdate.iuNone;
end;

destructor TDatasDisponiveisDAO.Destroy;
begin
  FreeAndNil(FSQL);

  inherited;
end;

function TDatasDisponiveisDAO.Open(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
begin
  try
    StrErr := 'DAO[DatasDisponiveis]: Impossível abrir query.';
    FSQL.Clear;
    FSQL.Add('SELECT id, data, hora, disponivel ');
    FSQL.Add('FROM datas_disponiveis ');
    FSQL.Add('WHERE id=:id');

    TDAO.GetInstance.fdQuery.Close;
    TDAO.GetInstance.fdQuery.Open(FSQL.Text, AParams);

    StrErr := 'DAO[DatasDisponiveis]: Erro ao importar query.';
    Query.Active := False;
    Query.AppendData(TDAO.GetInstance.fdQuery);

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;
end;

function TDatasDisponiveisDAO.OpenDataDisponivel(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
begin
  try
    StrErr := 'DAO[DatasDisponiveis]: Impossível abrir query.';
    FSQL.Clear;
    FSQL.Add('SELECT MIN(id) AS id, data ');
    FSQL.Add('FROM datas_disponiveis ');
    FSQL.Add('WHERE disponivel = true ');
    FSQL.Add('GROUP BY data ');
    FSQL.Add('ORDER BY data;');

    TDAO.GetInstance.fdQuery.Close;
    TDAO.GetInstance.fdQuery.Open(FSQL.Text, AParams);

    StrErr := 'DAO[DatasDisponiveis]: Erro ao importar query.';
    Query.Active := False;
    Query.AppendData(TDAO.GetInstance.fdQuery);

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;
end;

function TDatasDisponiveisDAO.OpenHoraDisponivel(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
begin
  try
    StrErr := 'DAO[DatasDisponiveis]: Impossível abrir query.';
    FSQL.Clear;
    FSQL.Add('SELECT id, hora ');
    FSQL.Add('FROM datas_disponiveis ');
    FSQL.Add('WHERE data=:data and Disponivel=true ');

    TDAO.GetInstance.fdQuery.Close;
    TDAO.GetInstance.fdQuery.Open(FSQL.Text, AParams);

    StrErr := 'DAO[DatasDisponiveis]: Erro ao importar query.';
    Query.Active := False;
    Query.AppendData(TDAO.GetInstance.fdQuery);

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;
end;

function TDatasDisponiveisDAO.New(var R: TDatasDisponiveisModel; out StrErr: string): Boolean;
begin
  R.Id := 0;
  R.Data := Date;
  R.Hora := Time;
  R.Disponivel := True;

  FInsertUpdate := TInsertUpdate.iuInsert;
  Result := True;
end;

function TDatasDisponiveisDAO.Edit(Id: Integer; var R: TDatasDisponiveisModel; out StrErr: string): Boolean;
begin
  FInsertUpdate := TInsertUpdate.iuUpdate;
  StrErr := '';
  try
    StrErr := 'DAO[DatasDisponiveis]: Não foi possível editar.';
    FSQL.Clear;
    FSQL.Add('SELECT id, data, hora, disponivel ');
    FSQL.Add('FROM datas_disponiveis ');
    FSQL.Add('WHERE id=:id ');
    TDAO.GetInstance.fdQuery.Close;
    TDAO.GetInstance.fdQuery.Open(FSQL.Text, [Id]);

    StrErr := 'DAO[DatasDisponiveis]: Registro não encontrado.';
    if TDAO.GetInstance.fdQuery.RecordCount = 0 then
      Abort;

    StrErr := 'DAO[DatasDisponiveis]: Falha ao retornar campos.';
    R.Id := TDAO.GetInstance.fdQuery.Fields[0].AsInteger;
    R.Data := TDAO.GetInstance.fdQuery.Fields[1].AsDateTime;
    R.Hora := TDAO.GetInstance.fdQuery.Fields[2].AsDateTime;
    R.Disponivel := TDAO.GetInstance.fdQuery.Fields[3].AsBoolean;

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;

end;

function TDatasDisponiveisDAO.Delete(Id: Integer; out StrErr: string): Boolean;
var
  AText: string;
begin
  TDAO.GetInstance.Connection.StartTransaction;
  try
    StrErr := 'DAO[DatasDisponiveis]: Falha ao executar SQL.';
    FSQL.Clear;
    FSQL.Add('DELETE FROM datas_disponiveis ');
    FSQL.Add('WHERE id=:id ');
    TDAO.GetInstance.Connection.ExecSQL(FSQL.Text, [Id]);

    StrErr := 'DAO[DatasDisponiveis]: Falha ao concluir transação.';
    TDAO.GetInstance.Connection.Commit;

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      TDAO.GetInstance.Connection.RollBack;
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;

end;

function TDatasDisponiveisDAO.Post(var R: TDatasDisponiveisModel; out StrErr: string): Boolean;
var
  AText: string;
begin
  TDAO.GetInstance.Connection.StartTransaction;
  try
    case FInsertUpdate of

      TInsertUpdate.iuInsert:
        begin
          StrErr := 'DAO[DatasDisponiveis]: Falha ao incluir registro.';
          FSQL.Clear;
          FSQL.Add('INSERT INTO datas_disponiveis (id, data, hora, disponivel) ');
          FSQL.Add('VALUES (:id, :data, :hora, :disponivel) ');
          TDAO.GetInstance.Connection.ExecSQL(FSQL.Text, [R.Id, R.Data, R.Hora, R.Disponivel]);

        end;

      TInsertUpdate.iuUpdate:
        begin
          StrErr := 'DAO[DatasDisponiveis]: Falha ao alterar registro.';
          FSQL.Clear;
          FSQL.Add('UPDATE datas_disponiveis ');
          FSQL.Add('SET data=:data, hora=:hora, disponivel=:disponivel ');
          FSQL.Add('WHERE id=:id ');
          TDAO.GetInstance.Connection.ExecSQL(FSQL.Text, [R.Data, R.Hora, R.Disponivel, R.Id]);

        end;

    else
      StrErr := 'DAO[DatasDisponiveis]: Status de inclusão ou alteração não determinado.';
      Abort;
    end;

    StrErr := 'DAO[DatasDisponiveis]: Falha ao concluir transação.';
    TDAO.GetInstance.Connection.Commit;

    StrErr := '';
    FInsertUpdate := TInsertUpdate.iuNone;
    Result := True;
  except
    on E: Exception do
    begin
      TDAO.GetInstance.Connection.RollBack;
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;
end;

function TDatasDisponiveisDAO.Upsert(var R: TDatasDisponiveisModel; out StrErr: string): Boolean;
begin
  try
    StrErr := 'DAO[DatasDisponiveis]: Falha ao definir status.';
    FSQL.Clear;
    FSQL.Add('SELECT COALESCE(MAX(*), 0) ');
    FSQL.Add('FROM datas_disponiveis ');
    FSQL.Add('WHERE id=:id ');
    if TDAO.GetInstance.Connection.ExecSQLScalar(FSQL.Text, [R.Id]) = 1 then
      FInsertUpdate := TInsertUpdate.iuUpdate
    else
      FInsertUpdate := TInsertUpdate.iuInsert;

    if not Post(R, StrErr) then
      Abort;

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      TDAO.GetInstance.Connection.RollBack;
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;
end;

function TDatasDisponiveisDAO.Report(var Query: TFDMemTable; AReport: Integer; AParams: array of variant; out StrErr: string): Boolean;
begin
  try
    case AReport of
      0:
        begin
          StrErr := 'DAO[DatasDisponiveis]: Impossível abrir query.';
          FSQL.Clear;
          FSQL.Add('SELECT id, data, hora, disponivel ');
          FSQL.Add('FROM datas_disponiveis ');
          FSQL.Add('WHERE id=:id');
        end;
    else
      StrErr := 'DAO[DatasDisponiveis]: Relatório não definido.';
      Abort;
    end;

    TDAO.GetInstance.fdQuery.Close;
    TDAO.GetInstance.fdQuery.Open(FSQL.Text, AParams);

    StrErr := 'DAO[DatasDisponiveis]: Erro ao importar query.';
    Query.Active := False;
    Query.AppendData(TDAO.GetInstance.fdQuery);

    StrErr := '';
    Result := True;
  except
    on E: Exception do
    begin
      StrErr := StrErr + sLineBreak + TDAO.GetInstance.TryExcept(E.Message);
      Result := False;
    end;
  end;
end;

end.
