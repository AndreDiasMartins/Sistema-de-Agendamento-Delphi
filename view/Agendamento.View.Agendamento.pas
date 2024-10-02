unit Agendamento.View.Agendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls;

type
  TAgendarStatus = (dsInsert, dsUpdate);

  TfAgendamento = class(TForm)
    QAgendamento: TFDMemTable;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    ButtonCadastrarEdit: TButton;
    LblOperacao: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    LblHora: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    LblServico: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    qDataDisponivel: TFDMemTable;
    DataSource2: TDataSource;
    QhoraDisponivel: TFDMemTable;
    DataSource3: TDataSource;
    QServico: TFDMemTable;
    QServicoid: TIntegerField;
    QServicoservico: TWideStringField;
    DataSource4: TDataSource;
    qDataDisponivelid: TIntegerField;
    qDataDisponiveldata: TWideStringField;
    QhoraDisponivelid: TIntegerField;
    QhoraDisponivelhora: TWideStringField;
    QAgendamentoid: TIntegerField;
    QAgendamentonome_cliente: TWideStringField;
    QAgendamentoservico: TWideStringField;
    QAgendamentocontato: TWideStringField;
    QAgendamentoobservacoes: TWideMemoField;
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure ButtonCadastrarEditClick(Sender: TObject);
  private
    { Private declarations }

  strict private
    class var Finstance: TfAgendamento;

  public
    { Public declarations }
    class function GetInstance: TfAgendamento;
    class procedure RealeaseInstance;

    function Execute(const status: TAgendarStatus; var Data_agendamento: String; var HoraAgendamento: String; var Nome: String; var servico: String; var contato: string; var observa��o: string; out StrErr: string): Boolean;
  end;

var
  fAgendamento: TfAgendamento;

implementation

uses
  Agendamento.Controller.DatasDisponiveis, servicos.Controller.servicos;

{$R *.dfm}
{ TfAgendamento }

procedure TfAgendamento.ButtonCadastrarEditClick(Sender: TObject);
var
  StrErr: String;
  Atext: String;
begin
  try

    if qDataDisponiveldata.AsString.IsEmpty  then
      AText := AText + 'Selecione uma Data Disponivel!' + sLineBreak;

    if QhoraDisponivelhora.AsString.IsEmpty  then
      AText := Atext + 'Selecione um horario Disponivel';

    if QAgendamentonome_cliente.AsString.IsEmpty then
      AText := Atext + 'Preencha o campo Nome';

    if QAgendamentocontato.AsString.IsEmpty then
       AText := Atext + 'Preencha o campo Contato';

    if QServicoservico.AsString.IsEmpty then
       AText := Atext + 'Preencha o campo Servi�o';





    StrErr := AText;
    if StrErr <> EmptyStr then
      abort;

    ModalResult := mrOk;

  except
    ShowMessage(StrErr);
  end;

end;

procedure TfAgendamento.DBLookupComboBox1Click(Sender: TObject);
var
  StrErr: String;
  SelectedValue: String;
begin
  try
    SelectedValue := DBLookupComboBox1.KeyValue;
    if not VarIsNull(SelectedValue) then
    begin
      if not TDatasDisponiveisController.GetInstance.OpenHoraDisponiveis(QhoraDisponivel, [SelectedValue], StrErr) then
        abort;
    end;
  except
    ShowMessage(StrErr);
  end;
end;

function TfAgendamento.Execute(const status: TAgendarStatus; var Data_agendamento: String; var HoraAgendamento: String; var Nome: String; var servico: String; var contato: string; var observa��o: string; out StrErr: string): Boolean;
begin
  try
    case status of
      dsInsert:
        begin
          LblOperacao.Caption := 'Novo Agendamento';
          ButtonCadastrarEdit.Caption := 'Agendar';
        end;
      dsUpdate:
        begin
          LblOperacao.Caption := 'Alterar Agendamento';
          ButtonCadastrarEdit.Caption := 'Alterar';
        end;
    end;

    StrErr := 'N�o foi possivel criar "CreateDataSet".';
    QAgendamento.Close;
    QAgendamento.CreateDataSet;
    QAgendamento.Append;
    // qDataDisponivel.Close;
    // qDataDisponivel.CreateDataSet;
    // qDataDisponivel.Append;
    // QhoraDisponivel.Close;
    // QhoraDisponivel.CreateDataSet;
    // QhoraDisponivel.Append;

    // qDataDisponiveldata.AsString := Data_agendamento;
    // QhoraDisponivelhora.AsString := HoraAgendamento;

    QAgendamentonome_cliente.AsString := Nome;
    QAgendamentoservico.AsString := servico;
    QAgendamentocontato.AsString := contato;
    QAgendamentoobservacoes.AsString := observa��o;

    StrErr := 'Usuario cancelo a opera��o.';
    if ShowModal = mrCancel then
      abort;

    StrErr := 'Erro ao retornar valores.';
    Data_agendamento := qDataDisponiveldata.AsString;
    HoraAgendamento := QhoraDisponivelhora.AsString;
    Nome := QAgendamentonome_cliente.AsString;
    servico := QServicoservico.AsString;
    contato := QAgendamentocontato.AsString;
    observa��o := QAgendamentoobservacoes.AsString;

    RealeaseInstance;
    StrErr := '';
    Result := True;

  except
    Result := false
  end;
end;

procedure TfAgendamento.FormCreate(Sender: TObject);
var
  StrErr: string;
begin
  try
    if not TDatasDisponiveisController.GetInstance.OpenDataDisponiveis(qDataDisponivel, [], StrErr) then
      abort;

    if not TservicosController.GetInstance.Open(QServico, ['%'], StrErr) then
      abort

  except
    ShowMessage(StrErr);

  end;
end;

class function TfAgendamento.GetInstance: TfAgendamento;
begin
  if not Assigned(Finstance) then
    Finstance := TfAgendamento.Create(nil);
  Result := Finstance;
end;

class procedure TfAgendamento.RealeaseInstance;
begin
  if Assigned(Finstance) then
    FreeAndNil(Finstance);
end;

initialization

finalization

TfAgendamento.RealeaseInstance;

end.
