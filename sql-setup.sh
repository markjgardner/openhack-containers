#! /bin/bash
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$SA_PASSWORD" / 
-p 1433:1433 --name sqldb --network $HACK_NETWORK / 
-d mcr.microsoft.com/mssql/server:2019-latest

docker exec -it sqldb "bash"

docker run --network $HACK_NETWORK -e SQLFQDN=sqldb -e SQLUSER=sa -e "SQLPASS=$SA_PASSWORD"