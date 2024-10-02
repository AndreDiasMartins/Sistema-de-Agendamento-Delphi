# Sistema de Agendamento Delphi

Este projeto é um sistema de agendamento simples, desenvolvido utilizando o padrão de arquitetura MVC (Model-View-Controller). O MVC facilita a interação entre a interface do usuário e os dados armazenados no banco, permitindo que as respostas sejam mais rápidas e dinâmicas.

## Estrutura do MVC
- **Model**: Representa os dados e as regras de negócio.
- **View**: A interface do usuário, onde as informações são apresentadas.
- **Controller**: A lógica que intermedia a comunicação entre o Model e a View.

## Configurações

### 1. Configuração do Banco de Dados
Para que o sistema funcione corretamente, é necessário configurar a conexão com o banco de dados. Recomenda-se o uso do PostgreSQL.

**Passos para configurar a conexão:**
# 1. Acesse `agendamento.dao.Connection` no seu projeto.
# 2. Clique com o botão direito no componente `tfdConnection` (Connection).
# 3. Selecione "Connection Editor".
# 4. Preencha os campos conforme necessário:
   - **Database**: Nome do banco de dados.
   - **User_name**: Nome de usuário para acessar o banco.
   - **Password**: Senha do usuário.
   - **Server**: Endereço do servidor (use `localhost` se estiver rodando localmente).
   - **Port**: Por padrão, utilize `5432`.
**Exemplo de configuração**: No meu exemplo, utilizei `localhost` como servidor, mas você pode especificar outro servidor, se necessário.


# Tabelas utilizadas, basta vc criar elas no seu banco Postgres:
CREATE TABLE Agendamentos (
    id SERIAL PRIMARY KEY,
    data_agendamento VARCHAR NOT NULL,
    hora_agendamento VARCHAR NOT NULL,
    nome_cliente VARCHAR NOT NULL,
    servico VARCHAR NOT NULL,
    contato VARCHAR NULL,
    observacoes TEXT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

REATE TABLE datas_disponiveis (
    id SERIAL PRIMARY KEY,
    data VARCHAR(10) NOT NULL,
    hora VARCHAR(8) NOT NULL,
    disponivel BOOLEAN NOT NULL
);

## função trigger no banco postgres para autalizar as datas ja sendo utilizadas automaticamente:
```bash
CREATE OR REPLACE FUNCTION set_disponivel_false()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE datas_disponiveis
    SET disponivel = false
    WHERE data = NEW.data_agendamento AND hora = NEW.hora_agendamento;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

```bash
CREATE TRIGGER update_disponibilidade
AFTER INSERT ON Agendamentos
FOR EACH ROW
EXECUTE PROCEDURE set_disponivel_false(); 
```

# Agr uma função trigger no banco postgres para voltar os horarios disponiveis, caso o usuario desista  e cancele (excluindo o registro na tabela Agendamentos)

```bash
CREATE OR REPLACE FUNCTION set_disponivel_true()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE datas_disponiveis
    SET disponivel = true
    WHERE data = OLD.data_agendamento AND hora = OLD.hora_agendamento;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;
```

```bash
CREATE TRIGGER restore_disponibilidade
AFTER DELETE ON Agendamentos
FOR EACH ROW
EXECUTE PROCEDURE set_disponivel_true();
```

## Executando o Projeto
Após configurar a conexão com o banco de dados, você pode executar o sistema de agendamento e começar a utilizá-lo.

## Contribuições
Sinta-se à vontade para contribuir com melhorias ou relatar problemas. Pull requests são bem-vindos!

## Licença
Este projeto está licenciado sob a MIT License. Consulte o arquivo `LICENSE` para mais detalhes.

