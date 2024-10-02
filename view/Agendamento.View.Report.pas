unit Agendamento.View.Report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RLReport;

type
  TFormReport = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand4: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    QAgendado: TFDMemTable;
    DataSource1: TDataSource;
    QAgendadoid: TIntegerField;
    QAgendadodata_agendamento: TWideStringField;
    QAgendadohora_agendamento: TWideStringField;
    QAgendadonome_cliente: TWideStringField;
    QAgendadoservico: TWideStringField;
    QAgendadocontato: TWideStringField;
    QAgendadoobservacoes: TWideMemoField;
    QAgendadocreated_at: TSQLTimeStampField;
    QAgendadoupdated_at: TSQLTimeStampField;
    RLBand6: TRLBand;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
  private
    { Private declarations }

  strict private
    class var Finstance: TFormReport;
  public
    { Public declarations }
    class function GetInstance: TFormReport;
    class procedure RealeseInstance;
    function Execute(var id: integer; out StrErr: string): Boolean;
  end;

var
  FormReport: TFormReport;

implementation

uses
  Agendamento.Controller.Agendamento;

{$R *.dfm}
{ TFormReport }

function TFormReport.Execute(var id: integer; out StrErr: string): Boolean;
begin
  try

    if not TAgendamentoController.GetInstance.open(QAgendado, ['%'], StrErr) then
      abort;
    StrErr := 'Erro ao visualizar Rlreport';
    RLReport1.Preview();
    StrErr := '';
    Result := True
  except
    Result := False;

  end;
end;

class function TFormReport.GetInstance: TFormReport;
begin
  if not Assigned(Finstance) then
    Finstance := TFormReport.create(nil);
  Result := Finstance;
end;

class procedure TFormReport.RealeseInstance;
begin
  if Assigned(Finstance) then
    FreeAndNil(Finstance);
end;

initialization

finalization

TFormReport.RealeseInstance;

end.
