DO $$ BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'authco') THEN
    CREATE ROLE authco LOGIN;
  END IF;
END $$;
ALTER ROLE authco PASSWORD :'authco_password';

SELECT 'CREATE DATABASE authco OWNER authco'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'authco')\gexec

DO $$ BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'restauco') THEN
    CREATE ROLE restauco LOGIN;
  END IF;
END $$;
ALTER ROLE restauco PASSWORD :'restauco_password';

SELECT 'CREATE DATABASE restauco OWNER restauco'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'restauco')\gexec

DO $$ BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'spaco') THEN
    CREATE ROLE spaco LOGIN;
  END IF;
END $$;
ALTER ROLE spaco PASSWORD :'spaco_password';

SELECT 'CREATE DATABASE spaco OWNER spaco'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'spaco')\gexec