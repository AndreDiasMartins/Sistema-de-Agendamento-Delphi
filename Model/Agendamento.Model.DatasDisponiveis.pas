unit Agendamento.Model.DatasDisponiveis;

interface

uses
  Dialogs;

type
  TDatasDisponiveisModel = class
  private
    FId: Integer;
    FData: TDateTime;
    FHora: TTime;
    FDisponivel: Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    property ID: Integer read FId write FId;
    property Data: TDateTime read FData write FData;
    property Hora: TTime read FHora write FHora;
    property Disponivel: Boolean read FDisponivel write FDisponivel;
  end;

implementation

{ TDatasDisponiveisModel } 

constructor TDatasDisponiveisModel.Create;
begin

end;

destructor TDatasDisponiveisModel.Destroy;
begin

  inherited;
end;

end.

//  with FDatasDisponiveisController.DatasDisponiveisModel do
//  begin
//    QUERYid.AsInteger:= Id;
//    QUERYdata.AsDateTime:= Data;
//    QUERYhora.AsTime:= Hora;
//    QUERYdisponivel.AsBoolean:= Disponivel;
//  end;

//  with FDatasDisponiveisController.DatasDisponiveisModel do
//  begin
//    Id:= QUERYid.AsInteger;
//    Data:= QUERYdata.AsDateTime;
//    Hora:= QUERYhora.AsTime;
//    Disponivel:= QUERYdisponivel.AsBoolean;
//  end;

// if not FDatasDisponiveisController.New(StrErr) then
//   Abort;

// if not FDatasDisponiveisController.Edit(id, StrErr) then
//   Abort;

// if not FDatasDisponiveisController.Delete(id, StrErr) then
//   Abort;

// if not FDatasDisponiveisController.Post(StrErr) then
//   Abort;

// if not FDatasDisponiveisController.Open(Query, [], StrErr) then
//   Abort;
