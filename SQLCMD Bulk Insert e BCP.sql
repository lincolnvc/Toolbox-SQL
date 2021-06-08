-- sqlcmd é mais rápido, mas não funciona com campos nulos
!!sqlcmd -S . -d SysacME -E -Q "set nocount on select * from ACESSO " -o "C:\Temp\ACESSO2.csv" -k -W -s"|" -h-1


-- BCP funcioina bem com campo nulo
--- Acessando tabela inteira
!!bcp SysAcme.dbo.Acesso out "C:\Temp\TempAcesso.csv" -k -T -c -C 65001 -t "|" 
--- Acessando query
!!bcp "select id_num, grpcod, rotcod, regperm, regfix, sbrnom from SysAcme.dbo.Acesso" queryout "C:\Temp\TempAcessoQuery.csv" -k -T -c -C 65001 -t "|" 


-- Comando para desabilitar as constraints
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all' 


-- Importando os arquivos de dados
bulk insert ACESSO FROM 'C:\Temp\TempACESSO.csv' with (fieldterminator = '|', rowterminator = '\n', KEEPNULLS, CodePage = 65001)

