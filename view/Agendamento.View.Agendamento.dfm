object fAgendamento: TfAgendamento
  Left = 0
  Top = 0
  Caption = 'fAgendamento'
  ClientHeight = 661
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label2: TLabel
    Left = 136
    Top = 208
    Width = 73
    Height = 15
    Caption = 'Nome Cliente'
    FocusControl = DBEdit1
  end
  object Label4: TLabel
    Left = 136
    Top = 344
    Width = 43
    Height = 15
    Caption = 'Contato'
    FocusControl = DBEdit3
  end
  object Label5: TLabel
    Left = 136
    Top = 408
    Width = 65
    Height = 15
    Caption = 'observacoes'
    FocusControl = DBMemo1
  end
  object LblOperacao: TLabel
    Left = 136
    Top = 32
    Width = 6
    Height = 15
    Caption = '..'
  end
  object Label1: TLabel
    Left = 136
    Top = 75
    Width = 92
    Height = 15
    Caption = 'Datas Disponiveis'
  end
  object LblHora: TLabel
    Left = 136
    Top = 139
    Width = 84
    Height = 15
    Caption = 'Hora Disponivel'
  end
  object LblServico: TLabel
    Left = 136
    Top = 267
    Width = 43
    Height = 15
    Caption = 'Servi'#231'os'
  end
  object DBEdit1: TDBEdit
    Left = 136
    Top = 229
    Width = 400
    Height = 23
    DataField = 'nome_cliente'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 136
    Top = 365
    Width = 400
    Height = 23
    DataField = 'contato'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 136
    Top = 424
    Width = 400
    Height = 89
    DataField = 'observacoes'
    DataSource = DataSource1
    TabOrder = 2
  end
  object ButtonCadastrarEdit: TButton
    Left = 136
    Top = 543
    Width = 400
    Height = 57
    Caption = '...'
    TabOrder = 3
    OnClick = ButtonCadastrarEditClick
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 136
    Top = 160
    Width = 400
    Height = 23
    KeyField = 'hora'
    ListField = 'hora'
    ListSource = DataSource3
    TabOrder = 4
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 136
    Top = 288
    Width = 400
    Height = 23
    KeyField = 'servico'
    ListField = 'servico'
    ListSource = DataSource4
    TabOrder = 5
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 136
    Top = 96
    Width = 400
    Height = 23
    KeyField = 'data'
    ListField = 'data'
    ListSource = DataSource2
    TabOrder = 6
    OnClick = DBLookupComboBox1Click
  end
  object QAgendamento: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 40
    Top = 56
    object QAgendamentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QAgendamentonome_cliente: TWideStringField
      FieldName = 'nome_cliente'
      Origin = 'nome_cliente'
      Size = 100
    end
    object QAgendamentoservico: TWideStringField
      FieldName = 'servico'
      Origin = 'servico'
      Size = 50
    end
    object QAgendamentocontato: TWideStringField
      FieldName = 'contato'
      Origin = 'contato'
      Size = 50
    end
    object QAgendamentoobservacoes: TWideMemoField
      FieldName = 'observacoes'
      Origin = 'observacoes'
      BlobType = ftWideMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = QAgendamento
    Left = 40
    Top = 112
  end
  object qDataDisponivel: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 40
    Top = 184
    object qDataDisponivelid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qDataDisponiveldata: TWideStringField
      FieldName = 'data'
      Origin = 'data'
      Size = 10
    end
  end
  object DataSource2: TDataSource
    DataSet = qDataDisponivel
    Left = 40
    Top = 232
  end
  object QhoraDisponivel: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 40
    Top = 304
    object QhoraDisponivelid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QhoraDisponivelhora: TWideStringField
      FieldName = 'hora'
      Origin = 'hora'
      Size = 8
    end
  end
  object DataSource3: TDataSource
    DataSet = QhoraDisponivel
    Left = 40
    Top = 352
  end
  object QServico: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 32
    Top = 424
    object QServicoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QServicoservico: TWideStringField
      FieldName = 'servico'
      Origin = 'servico'
      Size = 255
    end
  end
  object DataSource4: TDataSource
    DataSet = QServico
    Left = 32
    Top = 472
  end
end
