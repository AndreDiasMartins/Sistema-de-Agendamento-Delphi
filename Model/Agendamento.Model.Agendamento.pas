unit Agendamento.Model.Agendamento;

interface

uses
  Dialogs;

type
  TAgendamentoModel = class
  private
    FId: Integer;
    FData_agendamento: String;
    FHora_agendamento: String;
    FNome_cliente: string;
    FServico: string;
    FContato: string;
    FObservacoes: String;
  public
    constructor Create;
    destructor Destroy; override;
    property ID: Integer read FId write FId;
    property Data_agendamento: String read FData_agendamento write FData_agendamento;
    property Hora_agendamento: String read FHora_agendamento write FHora_agendamento;
    property Nome_cliente: string read FNome_cliente write FNome_cliente;
    property Servico: string read FServico write FServico;
    property Contato: string read FContato write FContato;
    property Observacoes: String read FObservacoes write FObservacoes;
  end;

implementation

{ TAgendamentoModel }

constructor TAgendamentoModel.Create;
begin

end;

destructor TAgendamentoModel.Destroy;
begin

  inherited;
end;

end.

//  with FAgendamentoController.AgendamentoModel do
//  begin
//    QUERYid.AsInteger:= Id;
//    QUERYdata_agendamento.AsDateTime:= Data_agendamento;
//    QUERYhora_agendamento.AsTime:= Hora_agendamento;
//    QUERYnome_cliente.AsString:= Nome_cliente;
//    QUERYservico.AsString:= Servico;
//    QUERYcontato.AsString:= Contato;
//    QUERYobservacoes.AsString:= Observacoes;
//    QUERYcreated_at.AsString:= Created_at;
//    QUERYupdated_at.AsString:= Updated_at;
//  end;

//  with FAgendamentoController.AgendamentoModel do
//  begin
//    Id:= QUERYid.AsInteger;
//    Data_agendamento:= QUERYdata_agendamento.AsDateTime;
//    Hora_agendamento:= QUERYhora_agendamento.AsTime;
//    Nome_cliente:= QUERYnome_cliente.AsString;
//    Servico:= QUERYservico.AsString;
//    Contato:= QUERYcontato.AsString;
//    Observacoes:= QUERYobservacoes.AsString;
//    Created_at:= QUERYcreated_at.AsString;
//    Updated_at:= QUERYupdated_at.AsString;
//  end;

// if not FAgendamentoController.New(StrErr) then
//   Abort;

// if not FAgendamentoController.Edit(id, StrErr) then
//   Abort;

// if not FAgendamentoController.Delete(id, StrErr) then
//   Abort;

// if not FAgendamentoController.Post(StrErr) then
//   Abort;

// if not FAgendamentoController.Open(Query, [], StrErr) then
//   Abort;


