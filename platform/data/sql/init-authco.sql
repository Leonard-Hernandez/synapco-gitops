DO $$ BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'authco') THEN
    CREATE ROLE authco LOGIN;
  END IF;
END $$;
ALTER ROLE authco PASSWORD :'authco_password';

SELECT 'CREATE DATABASE authco OWNER authco'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'authco')\gexec