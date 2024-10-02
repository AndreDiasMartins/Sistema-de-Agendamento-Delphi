object FormAGendadosGrud: TFormAGendadosGrud
  Left = 0
  Top = 0
  Caption = 'FormAGendadosGrud'
  ClientHeight = 464
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 222
    Height = 47
    Caption = 'Agendamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 104
    Width = 569
    Height = 233
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object NewAgendar: TButton
    Left = 24
    Top = 343
    Width = 146
    Height = 50
    Caption = 'Novo Agendamento'
    TabOrder = 1
  end
  object CancelAgendamento: TButton
    Left = 176
    Top = 343
    Width = 145
    Height = 50
    Caption = 'Cancelar Agendamento'
    TabOrder = 2
    OnClick = CancelAgendamentoClick
  end
  object ButtonRelatorio: TButton
    Left = 327
    Top = 343
    Width = 145
    Height = 50
    Caption = 'Relatorio'
    TabOrder = 3
    OnClick = ButtonRelatorioClick
  end
  object QAgendados: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 528
    Top = 8
    object QAgendadosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QAgendadosdata_agendamento: TWideStringField
      FieldName = 'data_agendamento'
      Origin = 'data_agendamento'
      Size = 10
    end
    object QAgendadoshora_agendamento: TWideStringField
      FieldName = 'hora_agendamento'
      Origin = 'hora_agendamento'
      Size = 8
    end
    object QAgendadosnome_cliente: TWideStringField
      FieldName = 'nome_cliente'
      Origin = 'nome_cliente'
      Size = 100
    end
    object QAgendadosservico: TWideStringField
      FieldName = 'servico'
      Origin = 'servico'
      Size = 50
    end
    object QAgendadoscontato: TWideStringField
      FieldName = 'contato'
      Origin = 'contato'
      Size = 50
    end
    object QAgendadosobservacoes: TWideMemoField
      FieldName = 'observacoes'
      Origin = 'observacoes'
      BlobType = ftWideMemo
    end
    object QAgendadoscreated_at: TSQLTimeStampField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object QAgendadosupdated_at: TSQLTimeStampField
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
  end
  object DataSource1: TDataSource
    DataSet = QAgendados
    Left = 592
    Top = 8
  end
end
