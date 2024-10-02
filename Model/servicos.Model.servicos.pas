unit servicos.Model.servicos;

interface

uses
  Dialogs;

type
  TservicosModel = class
  private
    FId: Integer;
    FServico: string;
  public
    constructor Create;
    destructor Destroy; override;

    property ID: Integer read FId write FId;
    property Servico: string read FServico write FServico;
  end;

implementation

{ TservicosModel } 

constructor TservicosModel.Create;
begin

end;

destructor TservicosModel.Destroy;
begin

  inherited;
end;

end.

//  with FservicosController.servicosModel do
//  begin
//    QUERYid.AsInteger:= Id;
//    QUERYservico.AsString:= Servico;
//  end;

//  with FservicosController.servicosModel do
//  begin
//    Id:= QUERYid.AsInteger;
//    Servico:= QUERYservico.AsString;
//  end;

// if not FservicosController.New(StrErr) then
//   Abort;

// if not FservicosController.Edit(id, StrErr) then
//   Abort;

// if not FservicosController.Delete(id, StrErr) then
//   Abort;

// if not FservicosController.Post(StrErr) then
//   Abort;

// if not FservicosController.Open(Query, [], StrErr) then
//   Abort;
