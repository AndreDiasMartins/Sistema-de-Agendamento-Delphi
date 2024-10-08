unit Agendamento.View.crud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TFormAGendadosGrud = class(TForm)
    DBGrid1: TDBGrid;
    QAgendados: TFDMemTable;
    DataSource1: TDataSource;
    Label1: TLabel;
    NewAgendar: TButton;
    CancelAgendamento: TButton;
    ButtonRelatorio: TButton;
    QAgendadosid: TIntegerField;
    QAgendadosdata_agendamento: TWideStringField;
    QAgendadoshora_agendamento: TWideStringField;
    QAgendadosnome_cliente: TWideStringField;
    QAgendadosservico: TWideStringField;
    QAgendadoscontato: TWideStringField;
    QAgendadosobservacoes: TWideMemoField;
    QAgendadoscreated_at: TSQLTimeStampField;
    QAgendadosupdated_at: TSQLTimeStampField;
    procedure FormCreate(Sender: TObject);
    procedure ButtonRelatorioClick(Sender: TObject);
    procedure CancelAgendamentoClick(Sender: TObject);
  private
    { Private declarations }
  strict private
    class var Finstance: TFormAGendadosGrud;

  public
    { Public declarations }
    class function GetInstance: TFormAGendadosGrud;
    class procedure RealeseInstance;
    function Execute(out StrErr: String): Boolean;

  end;

var
  FormAGendadosGrud: TFormAGendadosGrud;

implementation

uses
  Agendamento.Controller.Agendamento, Agendamento.View.Report, Vcl.Dialogs;

{$R *.dfm}
{ TFormAGendadosGrud }

procedure TFormAGendadosGrud.ButtonRelatorioClick(Sender: TObject);
var
  StrErr: String;
  id: integer;
begin
  try
    StrErr := 'Voce deve selecionar um item antes!';
    if QAgendados.RecordCount = 0 then
      abort;

    StrErr := 'Erro ao Atribuir valores';
    id := QAgendadosid.AsInteger;

    if not TFormReport.GetInstance.Execute(id, StrErr) then
      abort;

  except
    ShowMessage(StrErr);

  end;

end;

procedure TFormAGendadosGrud.CancelAgendamentoClick(Sender: TObject);
var
  StrErr: String;
begin
  try
    StrErr := 'Voce deve selecionar um item antes!';
    if QAgendados.RecordCount = 0 then
      abort;

    StrErr := 'Opera��o abortada!';
    if MessageDLG('Deseja Cancelar o Agendamento da pessoa com o nome: ' + QAgendadosnome_cliente.AsString + ' ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      abort;

    if not TAgendamentoController.GetInstance.Delete(QAgendadosid.AsInteger, StrErr) then
      abort;

    ShowMessage('Agendamento Cancelado com Sucesso!');

    if not TAgendamentoController.GetInstance.Open(QAgendados, ['%'], StrErr) then
      abort;

  except
    ShowMessage(StrErr);

  end;

end;

function TFormAGendadosGrud.Execute(out StrErr: String): Boolean;
begin
  try
    StrErr := 'Usuario cancelo a opera��o.';
    if ShowModal = mrCancel then
      abort;

    RealeseInstance;
    result := True;
  except
    result := false
  end;
end;

procedure TFormAGendadosGrud.FormCreate(Sender: TObject);
var
  StrErr: String;
begin
  try
    if not TAgendamentoController.GetInstance.Open(QAgendados, ['%'], StrErr) then
      abort;
  except
    ShowMessage(StrErr);
  end;
end;

class function TFormAGendadosGrud.GetInstance: TFormAGendadosGrud;
begin
  if not Assigned(Finstance) then
    Finstance := TFormAGendadosGrud.create(nil);
  result := Finstance;
end;

class procedure TFormAGendadosGrud.RealeseInstance;
begin
  if Assigned(Finstance) then
    FreeAndNil(Finstance);
end;

initialization

finalization

TFormAGendadosGrud.RealeseInstance;

end.
