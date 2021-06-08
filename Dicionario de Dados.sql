
--// Dicionário de Dados 
SELECT
  T.name as Tabela,
  C.name as Coluna,
  TY.name as Tipo,
  C.max_length, -- Tamanho em bytes, para nvarchar normalmente se divide este valor por 2
  C.precision, -- Para tipos numeric e decimal (tamanho)
  C.scale -- Para tipos numeric e decimal (números após a virgula)
FROM sys.columns C
INNER JOIN sys.tables T
  ON T.object_id = C.object_id
INNER JOIN sys.types TY
  ON TY.user_type_id = C.user_type_id
  WHERE C.Name Like '%XML%'
ORDER BY T.name, C.name


--// Colunas e Tabelas
SELECT
 TABLE_NAME as Tabela,
 COLUMN_NAME as Coluna,
 DATA_TYPE as Tipo,
 CHARACTER_MAXIMUM_LENGTH, 
 NUMERIC_PRECISION, 
 NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
ORDER BY Tabela, Coluna


--// Só as Tabelas
SELECT
 TABLE_NAME as Tabela
FROM INFORMATION_SCHEMA.TABLES
ORDER BY Tabela