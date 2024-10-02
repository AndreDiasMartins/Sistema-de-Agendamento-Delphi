object DAO: TDAO
  Height = 410
  Width = 619
  object Connection: TFDConnection
    Params.Strings = (
      'Database=Dbandre'
      'User_Name=postgres'
      'Password=postgres'
      'Server=localhost'
      'DriverID=pG')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 32
  end
  object fdQuery: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from agendamentos')
    Left = 176
    Top = 32
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Fontes\Projeto4\Win32\Debug\libpq.dll'
    Left = 72
    Top = 104
  end
  object FDQuery1: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from agendamentos')
    Left = 240
    Top = 32
    object FDQuery1id: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery1data_agendamento: TWideStringField
      FieldName = 'data_agendamento'
      Origin = 'data_agendamento'
      Size = 10
    end
    object FDQuery1hora_agendamento: TWideStringField
      FieldName = 'hora_agendamento'
      Origin = 'hora_agendamento'
      Size = 8
    end
    object FDQuery1nome_cliente: TWideStringField
      FieldName = 'nome_cliente'
      Origin = 'nome_cliente'
      Size = 100
    end
    object FDQuery1servico: TWideStringField
      FieldName = 'servico'
      Origin = 'servico'
      Size = 50
    end
    object FDQuery1contato: TWideStringField
      FieldName = 'contato'
      Origin = 'contato'
      Size = 50
    end
    object FDQuery1observacoes: TWideMemoField
      FieldName = 'observacoes'
      Origin = 'observacoes'
      BlobType = ftWideMemo
    end
    object FDQuery1created_at: TSQLTimeStampField
      FieldName = 'created_at'
      Origin = 'created_at'
    end
    object FDQuery1updated_at: TSQLTimeStampField
      FieldName = 'updated_at'
      Origin = 'updated_at'
    end
  end
end
