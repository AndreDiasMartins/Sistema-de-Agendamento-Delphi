object FormNewCadastro: TFormNewCadastro
  Left = 0
  Top = 0
  Caption = 'FormNewCadastro'
  ClientHeight = 537
  ClientWidth = 944
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 944
    Height = 81
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 18
      Width = 145
      Height = 48
      Caption = 'Agendar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object ButtonAgendados: TButton
    Left = 167
    Top = 18
    Width = 153
    Height = 48
    Caption = 'Agendados'
    TabOrder = 1
    OnClick = ButtonAgendadosClick
  end
end
