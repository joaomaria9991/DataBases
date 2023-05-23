/*  Sistema de Gestão de Stocks - Modulo de Encomendas  */
-- P4G7, Álvaro Freixo 93116, João Machado 89132


CREATE SCHEMA AulaStocksEncomendas
GO

-- [nome chave] -> é possivel pôr espaços no nome!

CREATE TABLE AulaStocksEncomendas.Fornecedor(
		NIF 										DECIMAL(9,0)				NOT NULL						CHECK( NIF > 0 ),
		ID_TipoFornecedor							INT							NOT NULL,
		TipoPagamento								VARCHAR(15)					NOT NULL 						CHECK( TipoPagamento IN ('Pré Pagamento', 'Imediato','Prestações')),
		NumFax										INT,
		Nome										VARCHAR(15)					NOT NULL,
		Endereco									VARCHAR(15),
		DesigTipoFornecedor							VARCHAR(128),
		
		UNIQUE (NIF),
		UNIQUE (ID_TipoFornecedor),
		PRIMARY KEY (NIF,ID_TipoFornecedor)
)
GO -- Executa totalmente o ficheiro sem dar erro em tudo.

CREATE TABLE AulaStocksEncomendas.Encomenda(
		ID											INT								NOT NULL					IDENTITY(1,1),
		DataEncomenda								DATETIME						NOT NULL,
		NIF_Fornecedor								DECIMAL(9,0)					NOT NULL,
		ID_TipoFornecedor							INT								NOT NULL,
		
		UNIQUE (DataEncomenda),
		PRIMARY KEY (ID)
)
GO

CREATE TABLE AulaStocksEncomendas.TemItens(
		NumItens									INT								NOT NULL,
		ID_Encomenda								INT 							NOT NULL					IDENTITY(1,1),
		ID_Produto									INT								NOT NULL,
		
		PRIMARY KEY ( ID_Encomenda, ID_Produto)
)
GO

CREATE TABLE AulaStocksEncomendas.Produto(
		ID											INT								NOT NULL,
		Nome										VARCHAR(15),
		Preco										MONEY							NOT NULL					CHECK( Preco > 0 ),
	
		PRIMARY KEY (ID)
)
GO



-- Chaves estrangeiras:
ALTER TABLE  AulaStocksEncomendas.Encomenda ADD
		CONSTRAINT EncFornFK1 FOREIGN KEY (NIF_Fornecedor) REFERENCES AulaStocksEncomendas.Fornecedor(NIF),
		CONSTRAINT EncFornFK2 FOREIGN KEY (ID_TipoFornecedor) REFERENCES AulaStocksEncomendas.Fornecedor(ID_TipoFornecedor)
GO
		
ALTER TABLE  AulaStocksEncomendas.TemItens ADD
		CONSTRAINT TItensEncFK1 FOREIGN KEY (ID_Encomenda) REFERENCES AulaStocksEncomendas.Encomenda(ID),
		CONSTRAINT TItensEncFK2 FOREIGN KEY (ID_Produto) REFERENCES AulaStocksEncomendas.Produto(ID)
GO
