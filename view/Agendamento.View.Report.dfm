object FormReport: TFormReport
  Left = 0
  Top = 0
  Caption = 'FormReport'
  ClientHeight = 799
  ClientWidth = 1255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport1: TRLReport
    Left = 206
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 224
        Top = 0
        Width = 265
        Height = 22
        Align = faTopOnly
        Caption = 'DADOS DO AGENDAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 32
      BandType = btHeader
      Color = clMedGray
      ParentColor = False
      Transparent = False
      object RLLabel3: TRLLabel
        Left = 0
        Top = 6
        Width = 115
        Height = 16
        Caption = 'Data Agendamento'
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 155
        Top = 6
        Width = 115
        Height = 16
        Caption = 'Hora Agendamento'
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 460
        Top = 6
        Width = 38
        Height = 16
        Caption = 'Nome'
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 600
        Top = 3
        Width = 49
        Height = 16
        Caption = 'Contato'
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 304
        Top = 6
        Width = 46
        Height = 16
        Caption = 'Servi'#231'o'
        Transparent = False
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 129
      Width = 718
      Height = 120
      object RLDBText9: TRLDBText
        Left = 155
        Top = 20
        Width = 114
        Height = 16
        DataField = 'hora_agendamento'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText10: TRLDBText
        Left = 452
        Top = 20
        Width = 81
        Height = 16
        DataField = 'nome_cliente'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText11: TRLDBText
        Left = 608
        Top = 22
        Width = 47
        Height = 16
        DataField = 'contato'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText12: TRLDBText
        Left = 304
        Top = 22
        Width = 44
        Height = 16
        DataField = 'servico'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText13: TRLDBText
        Left = 1
        Top = 22
        Width = 114
        Height = 16
        DataField = 'data_agendamento'
        DataSource = DataSource1
        Text = ''
      end
    end
  end
  object QAgendado: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 80
    Top = 136
    object QAgendadoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QAgendadodata_agendamento: TWideStringField
      FieldName = 'data_agendamento'
      Origin = 'data_agendamento'
      Size = 10
    end
    object QAgendadohora_agendamento: TWideStringField
      FieldName = 'hora_agendamento'
      Origin = 'hora_agendamento'
      Size = 8
    end
    object QAgendadonome_cliente: TWideStringField
      FieldName = 'nome_cliente'
      Origin = 'nome_cliente'
      Size = 100
    end
    object QAgendadoservico: TWideStringField
      FieldName = 'servico'
      Origin = 'servico'
      Size = 50
    end
    object QAgendadocontato: TWideStringField
      FieldName = 'contato'
      Origin = 'contato'
      Size = 50
    end
    object QAgendadoobservacoes: TWideMemoField
      FieldName = 'observacoes'
      Origin = 'observacoes'
      BlobType = ftWideMemo
    end
    object QAgendadocreated_at: TSQLTimeStampField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object QAgendadoupdated_at: TSQLTimeStampField
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
  end
  object DataSource1: TDataSource
    DataSet = QAgendado
    Left = 80
    Top = 200
  end
end
