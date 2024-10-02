program Agendar;

uses
  Vcl.Forms,
  Agendamento.View.Deshboard in 'view\Agendamento.View.Deshboard.pas' {FormNewCadastro},
  Agendamento.Model.Agendamento in 'Model\Agendamento.Model.Agendamento.pas',
  Agendamento.DAO.Agendamento in 'DAO\Agendamento.DAO.Agendamento.pas',
  Agendamento.Controller.Agendamento in 'Controller\Agendamento.Controller.Agendamento.pas',
  Agendar.Comuns.Types in 'COMUNS\Agendar.Comuns.Types.pas',
  Agendamento.DAO.Connection in 'DAO\Agendamento.DAO.Connection.pas' {DAO: TDataModule},
  Agendamento.DAO.DatasDisponiveis in 'DAO\Agendamento.DAO.DatasDisponiveis.pas',
  Agendamento.Model.DatasDisponiveis in 'Model\Agendamento.Model.DatasDisponiveis.pas',
  Agendamento.Controller.DatasDisponiveis in 'Controller\Agendamento.Controller.DatasDisponiveis.pas',
  Agendamento.View.Agendamento in 'view\Agendamento.View.Agendamento.pas' {fAgendamento},
  servicos.Controller.servicos in 'Controller\servicos.Controller.servicos.pas',
  servicos.DAO.servicos in 'DAO\servicos.DAO.servicos.pas',
  servicos.Model.servicos in 'Model\servicos.Model.servicos.pas',
  Agendamento.View.crud in 'view\Agendamento.View.crud.pas' {FormAGendadosGrud},
  Agendamento.View.Report in 'view\Agendamento.View.Report.pas' {FormReport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormNewCadastro, FormNewCadastro);
  Application.CreateForm(TDAO, DAO);
  Application.CreateForm(TFormAGendadosGrud, FormAGendadosGrud);
  Application.CreateForm(TFormReport, FormReport);
  Application.Run;
end.
