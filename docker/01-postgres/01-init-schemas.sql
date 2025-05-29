-- Creazione database richiestii da wso2 api-manager

CREATE DATABASE wso2_am_shared_db;
CREATE DATABASE wso2_am_db;

CREATE DATABASE wso2_is_shared_db;
CREATE DATABASE wso2_is_identity_db;



-- Creazione utenza
CREATE USER wso2 WITH PASSWORD 'Manager2025_ApiM';


-- Grant dei privilegi per l'utente wso2 sui database
GRANT ALL PRIVILEGES ON DATABASE wso2_am_shared_db      TO wso2;
GRANT ALL PRIVILEGES ON DATABASE wso2_am_db             TO wso2;
GRANT ALL PRIVILEGES ON DATABASE wso2_is_shared_db      TO wso2;
GRANT ALL PRIVILEGES ON DATABASE wso2_is_identity_db    TO wso2;

-- Grant Connections
GRANT CONNECT ON DATABASE wso2_am_shared_db     TO wso2;
GRANT CONNECT ON DATABASE wso2_am_db            TO wso2; 
GRANT CONNECT ON DATABASE wso2_is_shared_db     TO wso2;
GRANT CONNECT ON DATABASE wso2_is_identity_db   TO wso2;     


-- ///////////////////////////////////////////////////////
-- ///////////////////////////////////////////////////////
-- ///////////////////////////////////////////////////////

\connect wso2_am_shared_db

-- Grant sullo schema public
GRANT USAGE  ON SCHEMA public TO wso2;
GRANT CREATE ON SCHEMA public TO wso2;

-- Permessi su tutte le tabelle esistenti
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO wso2;
-- Permessi sulla creazione di nuove tabelle
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO wso2;

-- Permessi sequence
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO wso2;  
-- Permessi sequence sulla creazione nuove
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO wso2;

-- grant per wso2 se abilitata la parte analitycs
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO wso2;


-- ///////////////////////////////////////////////////////
-- ///////////////////////////////////////////////////////
-- ///////////////////////////////////////////////////////

\connect wso2_am_db

-- Grant sullo schema public
GRANT USAGE  ON SCHEMA public TO wso2;
GRANT CREATE ON SCHEMA public TO wso2;

-- Permessi su tutte le tabelle esistenti
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO wso2;
-- Permessi sulla creazione di nuove tabelle
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO wso2;

-- Permessi sequence
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO wso2;  
-- Permessi sequence sulla creazione nuove
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO wso2;

-- grant per wso2 se abilitata la parte analitycs
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO wso2;





-- ///////////////////////////////////////////////////////
-- ///////////////////////////////////////////////////////
-- ///////////////////////////////////////////////////////

\connect wso2_is_shared_db

-- Grant sullo schema public
GRANT USAGE  ON SCHEMA public TO wso2;
GRANT CREATE ON SCHEMA public TO wso2;

-- Permessi su tutte le tabelle esistenti
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO wso2;
-- Permessi sulla creazione di nuove tabelle
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO wso2;

-- Permessi sequence
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO wso2;  
-- Permessi sequence sulla creazione nuove
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO wso2;

-- grant per wso2 se abilitata la parte analitycs
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO wso2;


-- ///////////////////////////////////////////////////////
-- ///////////////////////////////////////////////////////
-- ///////////////////////////////////////////////////////

\connect wso2_is_identity_db

-- Grant sullo schema public
GRANT USAGE  ON SCHEMA public TO wso2;
GRANT CREATE ON SCHEMA public TO wso2;

-- Permessi su tutte le tabelle esistenti
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO wso2;
-- Permessi sulla creazione di nuove tabelle
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO wso2;

-- Permessi sequence
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO wso2;  
-- Permessi sequence sulla creazione nuove
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO wso2;

-- grant per wso2 se abilitata la parte analitycs
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO wso2;