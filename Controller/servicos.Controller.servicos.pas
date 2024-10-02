unit servicos.Controller.servicos;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Agendar.Comuns.Types, servicos.Model.servicos, servicos.DAO.servicos;

type

  TservicosController = class
  strict private
    class var FInstance: TservicosController;
  private
    FservicosModel: TservicosModel;
    FservicosDAO: TservicosDAO;
  public
    constructor Create;
    destructor Destroy; override;

    class function GetInstance: TservicosController;
    class procedure ReleaseInstance;

    function Open(var Query: TFDMemTable; AParams: Array of variant; out StrErr: string): Boolean;
    function New(out StrErr: string): Boolean;
    function Edit(Id: Integer; out StrErr: string): Boolean;
    function Delete(Id: Integer; out StrErr: string): Boolean;
    function Post(out StrErr: string): Boolean;
    function Upsert(out StrErr: string): Boolean;
    function Report(var Query: TFDMemTable; AReport: Integer; AParams: Array of variant; out StrErr: string): Boolean;

    property servicosModel: TservicosModel read FservicosModel write FservicosModel;
  end;

implementation

{ TservicosController }

constructor TservicosController.Create;
begin
  FservicosModel := TservicosModel.Create;
  FservicosDAO := TservicosDAO.Create;
end;

destructor TservicosController.Destroy;
begin
  FreeAndNil(FservicosDAO);
  FreeAndNil(FservicosModel);

  inherited;
end;

class function TservicosController.GetInstance: TservicosController;
begin
  if not Assigned(FInstance) then
    FInstance := TservicosController.Create;
  Result := FInstance;
end;

class procedure TservicosController.ReleaseInstance; 
begin
  if Assigned(FInstance) then
    FInstance.Free;
end;

function TservicosController.Open(var Query: TFDMemTable; AParams: array of variant; out StrErr: string): Boolean;
begin
  Result := FservicosDAO.Open(Query, AParams, StrErr);
end;

function TservicosController.New(out StrErr: string): Boolean;
begin
  Result := FservicosDAO.New(FservicosModel, StrErr);
end;

function TservicosController.Edit(Id: Integer; out StrErr: string): Boolean;
begin
  Result := FservicosDAO.Edit(Id, FservicosModel, StrErr);
end;

function TservicosController.Delete(Id: Integer; out StrErr: string): Boolean;
begin
  Result := FservicosDAO.Delete(Id, StrErr);
end;

function TservicosController.Post(out StrErr: string): Boolean;
begin
  Result := FservicosDAO.Post(FservicosModel, StrErr);
end;

function TservicosController.Upsert(out StrErr: string): Boolean;
begin
  Result := FservicosDAO.Upsert(FservicosModel, StrErr);
end;

function TservicosController.Report(var Query: TFDMemTable; AReport: Integer; AParams: array of variant; out StrErr: string): Boolean;
begin
  Result := FservicosDAO.Report(Query, AReport, AParams, StrErr);
end;

initialization

finalization

 TservicosController.ReleaseInstance;
end.
