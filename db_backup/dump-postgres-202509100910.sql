--
-- PostgreSQL database cluster dump
--

-- Started on 2025-09-10 09:10:16

\restrict 9TMFTM6UX4QszbOzO4fWsXkDGGBARup4vCwCIAjE0J6CNX4oq3NUwjwYxls2KgM

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE anon;
ALTER ROLE anon WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE authenticated;
ALTER ROLE authenticated WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE authenticator;
ALTER ROLE authenticator WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE dashboard_user;
ALTER ROLE dashboard_user WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB NOLOGIN REPLICATION NOBYPASSRLS;
CREATE ROLE pgbouncer;
ALTER ROLE pgbouncer WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE service_role;
ALTER ROLE service_role WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION BYPASSRLS;
CREATE ROLE supabase_admin;
ALTER ROLE supabase_admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE supabase_auth_admin;
ALTER ROLE supabase_auth_admin WITH NOSUPERUSER NOINHERIT CREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE supabase_etl_admin;
ALTER ROLE supabase_etl_admin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN REPLICATION NOBYPASSRLS;
CREATE ROLE supabase_read_only_user;
ALTER ROLE supabase_read_only_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION BYPASSRLS;
CREATE ROLE supabase_realtime_admin;
ALTER ROLE supabase_realtime_admin WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE supabase_replication_admin;
ALTER ROLE supabase_replication_admin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN REPLICATION NOBYPASSRLS;
CREATE ROLE supabase_storage_admin;
ALTER ROLE supabase_storage_admin WITH NOSUPERUSER NOINHERIT CREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;

--
-- User Configurations
--

--
-- User Config "anon"
--

ALTER ROLE anon SET statement_timeout TO '3s';

--
-- User Config "authenticated"
--

ALTER ROLE authenticated SET statement_timeout TO '8s';

--
-- User Config "authenticator"
--

ALTER ROLE authenticator SET session_preload_libraries TO 'safeupdate';
ALTER ROLE authenticator SET statement_timeout TO '8s';
ALTER ROLE authenticator SET lock_timeout TO '8s';

--
-- User Config "postgres"
--

ALTER ROLE postgres SET search_path TO E'\\$user', 'public', 'extensions';

--
-- User Config "supabase_admin"
--

ALTER ROLE supabase_admin SET search_path TO '$user', 'public', 'auth', 'extensions';
ALTER ROLE supabase_admin SET log_statement TO 'none';

--
-- User Config "supabase_auth_admin"
--

ALTER ROLE supabase_auth_admin SET search_path TO 'auth';
ALTER ROLE supabase_auth_admin SET idle_in_transaction_session_timeout TO '60000';
ALTER ROLE supabase_auth_admin SET log_statement TO 'none';

--
-- User Config "supabase_read_only_user"
--

ALTER ROLE supabase_read_only_user SET default_transaction_read_only TO 'on';

--
-- User Config "supabase_storage_admin"
--

ALTER ROLE supabase_storage_admin SET search_path TO 'storage';
ALTER ROLE supabase_storage_admin SET log_statement TO 'none';


--
-- Role memberships
--

GRANT anon TO authenticator WITH INHERIT FALSE GRANTED BY supabase_admin;
GRANT anon TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT authenticated TO authenticator WITH INHERIT FALSE GRANTED BY supabase_admin;
GRANT authenticated TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT authenticator TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT authenticator TO supabase_storage_admin WITH INHERIT FALSE GRANTED BY supabase_admin;
GRANT pg_create_subscription TO postgres WITH INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_monitor TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_read_all_data TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_read_all_data TO supabase_etl_admin WITH INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_read_all_data TO supabase_read_only_user WITH INHERIT TRUE GRANTED BY supabase_admin;
GRANT pg_signal_backend TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT service_role TO authenticator WITH INHERIT FALSE GRANTED BY supabase_admin;
GRANT service_role TO postgres WITH ADMIN OPTION, INHERIT TRUE GRANTED BY supabase_admin;
GRANT supabase_realtime_admin TO postgres WITH INHERIT TRUE GRANTED BY supabase_admin;






\unrestrict 9TMFTM6UX4QszbOzO4fWsXkDGGBARup4vCwCIAjE0J6CNX4oq3NUwjwYxls2KgM

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict SeD6QzbWbIofNeIoUnYu0gIcDEofmhTG1ezJa5AbYYgUTKhzFEH8uv0mXJy1msa

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.6

-- Started on 2025-09-10 09:10:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-09-10 09:10:17

--
-- PostgreSQL database dump complete
--

\unrestrict SeD6QzbWbIofNeIoUnYu0gIcDEofmhTG1ezJa5AbYYgUTKhzFEH8uv0mXJy1msa

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict zkJY2asSWcNoJN5y1sN6O5JDV34zn7v8zKrmAZJUsZlknUOwUG2AUj8HHdYSQNp

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.6

-- Started on 2025-09-10 09:10:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 76 (class 2615 OID 16494)
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- TOC entry 23 (class 2615 OID 16388)
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- TOC entry 35 (class 2615 OID 16624)
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- TOC entry 34 (class 2615 OID 16613)
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- TOC entry 12 (class 2615 OID 16386)
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- TOC entry 9 (class 2615 OID 16605)
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- TOC entry 77 (class 2615 OID 16542)
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- TOC entry 11 (class 2615 OID 17347)
-- Name: supabase_migrations; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA supabase_migrations;


ALTER SCHEMA supabase_migrations OWNER TO postgres;

--
-- TOC entry 32 (class 2615 OID 16653)
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- TOC entry 6 (class 3079 OID 16689)
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- TOC entry 4143 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- TOC entry 2 (class 3079 OID 16389)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- TOC entry 4144 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- TOC entry 4 (class 3079 OID 16443)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- TOC entry 4145 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 5 (class 3079 OID 16654)
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- TOC entry 4146 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- TOC entry 3 (class 3079 OID 16432)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- TOC entry 4147 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 1135 (class 1247 OID 16782)
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- TOC entry 1159 (class 1247 OID 16923)
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- TOC entry 1132 (class 1247 OID 16776)
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- TOC entry 1129 (class 1247 OID 16771)
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1207 (class 1247 OID 17287)
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1165 (class 1247 OID 16965)
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- TOC entry 1180 (class 1247 OID 17188)
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- TOC entry 1190 (class 1247 OID 17123)
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- TOC entry 1193 (class 1247 OID 17137)
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- TOC entry 1186 (class 1247 OID 17234)
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- TOC entry 1183 (class 1247 OID 17201)
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- TOC entry 1199 (class 1247 OID 17161)
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- TOC entry 418 (class 1255 OID 16540)
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- TOC entry 4148 (class 0 OID 0)
-- Dependencies: 418
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- TOC entry 437 (class 1255 OID 16753)
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- TOC entry 417 (class 1255 OID 16539)
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- TOC entry 4151 (class 0 OID 0)
-- Dependencies: 417
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- TOC entry 416 (class 1255 OID 16538)
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- TOC entry 4153 (class 0 OID 0)
-- Dependencies: 416
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- TOC entry 419 (class 1255 OID 16597)
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- TOC entry 4169 (class 0 OID 0)
-- Dependencies: 419
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- TOC entry 423 (class 1255 OID 16618)
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- TOC entry 4171 (class 0 OID 0)
-- Dependencies: 423
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- TOC entry 420 (class 1255 OID 16599)
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- TOC entry 4173 (class 0 OID 0)
-- Dependencies: 420
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- TOC entry 421 (class 1255 OID 16609)
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- TOC entry 422 (class 1255 OID 16610)
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- TOC entry 424 (class 1255 OID 16620)
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 424
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- TOC entry 366 (class 1255 OID 16387)
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- TOC entry 473 (class 1255 OID 17632)
-- Name: insert_comment_with_parent(integer, text, text, uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.insert_comment_with_parent(p_word_id integer, p_content text, p_author text, p_parent_id uuid) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
  new_id UUID;
BEGIN
  INSERT INTO comments (word_id, content, author, parent_id)
  VALUES (p_word_id, p_content, p_author, p_parent_id)
  RETURNING id INTO new_id;
  
  RETURN new_id;
END;
$$;


ALTER FUNCTION public.insert_comment_with_parent(p_word_id integer, p_content text, p_author text, p_parent_id uuid) OWNER TO postgres;

--
-- TOC entry 466 (class 1255 OID 17227)
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 472 (class 1255 OID 17328)
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- TOC entry 468 (class 1255 OID 17239)
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- TOC entry 464 (class 1255 OID 17185)
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- TOC entry 463 (class 1255 OID 17180)
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- TOC entry 467 (class 1255 OID 17235)
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- TOC entry 469 (class 1255 OID 17246)
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- TOC entry 462 (class 1255 OID 17179)
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- TOC entry 471 (class 1255 OID 17327)
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- TOC entry 461 (class 1255 OID 17177)
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- TOC entry 465 (class 1255 OID 17216)
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- TOC entry 470 (class 1255 OID 17321)
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- TOC entry 450 (class 1255 OID 17110)
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 443 (class 1255 OID 17036)
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- TOC entry 451 (class 1255 OID 17111)
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 454 (class 1255 OID 17114)
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 460 (class 1255 OID 17158)
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- TOC entry 440 (class 1255 OID 17010)
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 439 (class 1255 OID 17009)
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 438 (class 1255 OID 17008)
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 447 (class 1255 OID 17092)
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 448 (class 1255 OID 17108)
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 449 (class 1255 OID 17109)
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- TOC entry 458 (class 1255 OID 17156)
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- TOC entry 445 (class 1255 OID 17075)
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- TOC entry 444 (class 1255 OID 17038)
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- TOC entry 453 (class 1255 OID 17113)
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 459 (class 1255 OID 17157)
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 446 (class 1255 OID 17091)
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- TOC entry 452 (class 1255 OID 17112)
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- TOC entry 441 (class 1255 OID 17025)
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 457 (class 1255 OID 17154)
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 456 (class 1255 OID 17153)
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- TOC entry 455 (class 1255 OID 17119)
-- Name: search_v2(text, text, integer, integer, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
BEGIN
    RETURN query EXECUTE
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name || '/' AS name,
                    NULL::uuid AS id,
                    NULL::timestamptz AS updated_at,
                    NULL::timestamptz AS created_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
                ORDER BY prefixes.name COLLATE "C" LIMIT $3
            )
            UNION ALL
            (SELECT split_part(name, '/', $4) AS key,
                name,
                id,
                updated_at,
                created_at,
                metadata
            FROM storage.objects
            WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
            ORDER BY name COLLATE "C" LIMIT $3)
        ) obj
        ORDER BY name COLLATE "C" LIMIT $3;
        $sql$
        USING prefix, bucket_name, limits, levels, start_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text) OWNER TO supabase_storage_admin;

--
-- TOC entry 442 (class 1255 OID 17026)
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 313 (class 1259 OID 16525)
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- TOC entry 4232 (class 0 OID 0)
-- Dependencies: 313
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- TOC entry 330 (class 1259 OID 16927)
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- TOC entry 4234 (class 0 OID 0)
-- Dependencies: 330
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- TOC entry 321 (class 1259 OID 16725)
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- TOC entry 4236 (class 0 OID 0)
-- Dependencies: 321
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- TOC entry 4237 (class 0 OID 0)
-- Dependencies: 321
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- TOC entry 312 (class 1259 OID 16518)
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 312
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- TOC entry 325 (class 1259 OID 16814)
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 325
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- TOC entry 324 (class 1259 OID 16802)
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 324
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- TOC entry 323 (class 1259 OID 16789)
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 323
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- TOC entry 342 (class 1259 OID 17291)
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_id text NOT NULL,
    client_secret_hash text NOT NULL,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- TOC entry 331 (class 1259 OID 16977)
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 311 (class 1259 OID 16507)
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 311
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- TOC entry 310 (class 1259 OID 16506)
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- TOC entry 4251 (class 0 OID 0)
-- Dependencies: 310
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- TOC entry 328 (class 1259 OID 16856)
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 4253 (class 0 OID 0)
-- Dependencies: 328
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- TOC entry 329 (class 1259 OID 16874)
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- TOC entry 4255 (class 0 OID 0)
-- Dependencies: 329
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- TOC entry 314 (class 1259 OID 16533)
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- TOC entry 4257 (class 0 OID 0)
-- Dependencies: 314
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- TOC entry 322 (class 1259 OID 16755)
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- TOC entry 4258 (class 0 OID 0)
-- Dependencies: 322
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- TOC entry 4259 (class 0 OID 0)
-- Dependencies: 322
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- TOC entry 327 (class 1259 OID 16841)
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 327
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- TOC entry 326 (class 1259 OID 16832)
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- TOC entry 4263 (class 0 OID 0)
-- Dependencies: 326
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- TOC entry 4264 (class 0 OID 0)
-- Dependencies: 326
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- TOC entry 309 (class 1259 OID 16495)
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- TOC entry 4266 (class 0 OID 0)
-- Dependencies: 309
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- TOC entry 4267 (class 0 OID 0)
-- Dependencies: 309
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- TOC entry 348 (class 1259 OID 17795)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    word_id integer NOT NULL,
    content text NOT NULL,
    author text DEFAULT '익명'::text NOT NULL,
    parent_id uuid,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- TOC entry 350 (class 1259 OID 17905)
-- Name: words; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.words (
    id integer NOT NULL,
    english text NOT NULL,
    korean text NOT NULL,
    pronunciation text,
    part_of_speech text,
    tip text,
    category text DEFAULT ''::text NOT NULL,
    difficulty character varying(10)
);


ALTER TABLE public.words OWNER TO postgres;

--
-- TOC entry 349 (class 1259 OID 17904)
-- Name: words_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.words_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.words_id_seq OWNER TO postgres;

--
-- TOC entry 4273 (class 0 OID 0)
-- Dependencies: 349
-- Name: words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.words_id_seq OWNED BY public.words.id;


--
-- TOC entry 343 (class 1259 OID 17331)
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- TOC entry 345 (class 1259 OID 17393)
-- Name: messages_2025_09_06; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_09_06 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_09_06 OWNER TO supabase_admin;

--
-- TOC entry 346 (class 1259 OID 17404)
-- Name: messages_2025_09_07; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_09_07 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_09_07 OWNER TO supabase_admin;

--
-- TOC entry 347 (class 1259 OID 17415)
-- Name: messages_2025_09_08; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_09_08 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_09_08 OWNER TO supabase_admin;

--
-- TOC entry 351 (class 1259 OID 17961)
-- Name: messages_2025_09_09; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_09_09 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_09_09 OWNER TO supabase_admin;

--
-- TOC entry 352 (class 1259 OID 18057)
-- Name: messages_2025_09_10; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_09_10 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_09_10 OWNER TO supabase_admin;

--
-- TOC entry 353 (class 1259 OID 18068)
-- Name: messages_2025_09_11; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_09_11 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_09_11 OWNER TO supabase_admin;

--
-- TOC entry 354 (class 1259 OID 19363)
-- Name: messages_2025_09_12; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_09_12 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_09_12 OWNER TO supabase_admin;

--
-- TOC entry 332 (class 1259 OID 17003)
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- TOC entry 338 (class 1259 OID 17139)
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- TOC entry 337 (class 1259 OID 17138)
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 315 (class 1259 OID 16546)
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- TOC entry 4286 (class 0 OID 0)
-- Dependencies: 315
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 339 (class 1259 OID 17166)
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- TOC entry 317 (class 1259 OID 16588)
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- TOC entry 316 (class 1259 OID 16561)
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- TOC entry 4289 (class 0 OID 0)
-- Dependencies: 316
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- TOC entry 335 (class 1259 OID 17093)
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- TOC entry 333 (class 1259 OID 17040)
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- TOC entry 334 (class 1259 OID 17054)
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- TOC entry 344 (class 1259 OID 17348)
-- Name: schema_migrations; Type: TABLE; Schema: supabase_migrations; Owner: postgres
--

CREATE TABLE supabase_migrations.schema_migrations (
    version text NOT NULL,
    statements text[],
    name text
);


ALTER TABLE supabase_migrations.schema_migrations OWNER TO postgres;

--
-- TOC entry 3638 (class 0 OID 0)
-- Name: messages_2025_09_06; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_09_06 FOR VALUES FROM ('2025-09-06 00:00:00') TO ('2025-09-07 00:00:00');


--
-- TOC entry 3639 (class 0 OID 0)
-- Name: messages_2025_09_07; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_09_07 FOR VALUES FROM ('2025-09-07 00:00:00') TO ('2025-09-08 00:00:00');


--
-- TOC entry 3640 (class 0 OID 0)
-- Name: messages_2025_09_08; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_09_08 FOR VALUES FROM ('2025-09-08 00:00:00') TO ('2025-09-09 00:00:00');


--
-- TOC entry 3641 (class 0 OID 0)
-- Name: messages_2025_09_09; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_09_09 FOR VALUES FROM ('2025-09-09 00:00:00') TO ('2025-09-10 00:00:00');


--
-- TOC entry 3642 (class 0 OID 0)
-- Name: messages_2025_09_10; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_09_10 FOR VALUES FROM ('2025-09-10 00:00:00') TO ('2025-09-11 00:00:00');


--
-- TOC entry 3643 (class 0 OID 0)
-- Name: messages_2025_09_11; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_09_11 FOR VALUES FROM ('2025-09-11 00:00:00') TO ('2025-09-12 00:00:00');


--
-- TOC entry 3644 (class 0 OID 0)
-- Name: messages_2025_09_12; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_09_12 FOR VALUES FROM ('2025-09-12 00:00:00') TO ('2025-09-13 00:00:00');


--
-- TOC entry 3654 (class 2604 OID 16510)
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- TOC entry 3712 (class 2604 OID 17908)
-- Name: words id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words ALTER COLUMN id SET DEFAULT nextval('public.words_id_seq'::regclass);


--
-- TOC entry 4097 (class 0 OID 16525)
-- Dependencies: 313
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- TOC entry 4111 (class 0 OID 16927)
-- Dependencies: 330
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- TOC entry 4102 (class 0 OID 16725)
-- Dependencies: 321
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- TOC entry 4096 (class 0 OID 16518)
-- Dependencies: 312
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4106 (class 0 OID 16814)
-- Dependencies: 325
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- TOC entry 4105 (class 0 OID 16802)
-- Dependencies: 324
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- TOC entry 4104 (class 0 OID 16789)
-- Dependencies: 323
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid) FROM stdin;
\.


--
-- TOC entry 4120 (class 0 OID 17291)
-- Dependencies: 342
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 4112 (class 0 OID 16977)
-- Dependencies: 331
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4095 (class 0 OID 16507)
-- Dependencies: 311
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- TOC entry 4109 (class 0 OID 16856)
-- Dependencies: 328
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- TOC entry 4110 (class 0 OID 16874)
-- Dependencies: 329
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- TOC entry 4098 (class 0 OID 16533)
-- Dependencies: 314
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
\.


--
-- TOC entry 4103 (class 0 OID 16755)
-- Dependencies: 322
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
\.


--
-- TOC entry 4108 (class 0 OID 16841)
-- Dependencies: 327
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4107 (class 0 OID 16832)
-- Dependencies: 326
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- TOC entry 4093 (class 0 OID 16495)
-- Dependencies: 309
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- TOC entry 4125 (class 0 OID 17795)
-- Dependencies: 348
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, word_id, content, author, parent_id, created_at) FROM stdin;
249a8bbf-98f0-49bf-aca6-9a9c3d76f138	2	"needle"은 "니들"이라고 발음하니,  "니들(너희들)이 바늘로 옷을 꿰매는 모습"을 상상해봐!  🧵  마치 작은 뾰족한 니들이 옷감을 콕콕 찌르는 것처럼 말이야! 😄	AI 도우미 🤖	\N	2025-09-05 06:39:28.35094+00
2c34630f-9296-4172-b624-5d0795ae4e1a	3	"pattern"은 "패턴"이라고 읽으니,  옷에 예쁜 패턴을 넣어 입고 패션쇼 무대에 섰는데,  갑자기 바닥에 깔린 패턴이랑 똑같은 옷을 입은 사람들이 우르르 나타나 춤을 추는 장면을 상상해 보세요! 👯‍♀️✨  마치 똑같은 모양이 반복되는 패턴처럼요!	AI 도우미 🤖	\N	2025-09-05 06:40:38.512435+00
3a83bbac-e91e-44c9-b256-bac32f49a8eb	4	"distribute"는 "디스트리뷰트",  "디스트리뷰트"하면 마치  '디(많이) 스트리(스트레스) 뷰트(뷰티)'처럼 많은 스트레스를 받으면서도 아름답게 선물🎁을 나눠주는 산타클로스🎅 같아요!  (많은 선물을 다양한 곳에 분배하는 모습을 상상해보세요!)	AI 도우미 🤖	\N	2025-09-05 06:41:32.920698+00
3d827b5b-7256-420d-9208-12d7a8b64973	5	"distributor"는 "디스트리뷰터"니까,  "디스(이것) + 트리(나무) + 뷰터(보는 사람)"라고 생각해봐요! 🌳  마치 커다란 나무(트리)에 온갖 물건들이 주렁주렁 달려있고, 그걸 보고 이것저것 골라서 사람들에게 나눠주는 (디스) 분배업자(뷰터)를 상상하면 기억하기 쉽겠죠? 😄	AI 도우미 🤖	\N	2025-09-05 06:41:41.203366+00
02549dc2-ed33-4222-9906-03985c42bc89	6	"For oneself"  → "포 원셀프",  "포(포기하지 않고!) 원(원하는 것을) 셀프(스스로!)" 로 생각해봐! 💪  혼자서 끙끙대며 목표를 이루는 씩씩한 곰돌이를 상상하면 기억하기 쉽겠죠? 🐻	AI 도우미 🤖	\N	2025-09-05 06:41:51.879909+00
3ef3ed21-3fbc-45bc-8518-b142cb43f4bb	7	"피처(feature)"는  "피" (피부) + "처" (처리) 라고 생각해봐요!  피부의 특징(n)을  화장품으로 특별하게 처리(v)해서 아름답게 만들어주는 모습을 상상하면 쉽게 기억나요! ✨😊	AI 도우미 🤖	\N	2025-09-05 06:44:01.447292+00
ea368ac1-b238-4773-aedd-23027c8c848c	7	헐..	익명	\N	2025-09-05 06:44:09.047184+00
5e5eabee-cc42-4ffa-b2cb-149627c7f695	8	"Creativity"는 "크리에이티비티"니까,  "크리에이트(만들다)" + "이티(E.T. 외계인!)" + "비티(빛나는)"  라고 생각해봐요! ✨  E.T. 외계인이 빛나는 새로운 것을 만들어내는 모습을 상상하면 창의성이 떠오르지 않을까요? 😉	AI 도우미 🤖	\N	2025-09-05 06:46:42.664002+00
5044090d-f613-4a1a-a60b-395fea2c6163	538	"play a role"을 "플레이 어 롤"이라고 발음하면, 마치 "플레이(놀이)에서 어떤 역할(롤)"을 맡는 것 같죠!  🎭  연극 무대에서 배우가 자신의 배역을 맡아 열연하는 모습을 상상하면 쉽게 기억할 수 있어요! 👍	AI 도우미 🤖	\N	2025-09-05 07:02:20.964779+00
8b203d6f-f134-4986-972c-4814cad76b47	102	"Chief Executive Officer"를  "치프 이그제큐티브 오피서"라고 읽고,  "치프(Chief)"를 "치프스(칩스)" 과자처럼 바삭하게 깨물면,  "이그제큐티브(Executive)"  직원들이  "오피서(Officer)" 사무실에서  바삭한 칩스를 먹으며  회사를  척척  (CEO의 역할처럼)  운영하는  모습을 상상해 보세요! 🍟✨	AI 도우미 🤖	\N	2025-09-05 07:02:38.412481+00
df8ae5ba-9ccc-4018-a54b-074c67e3941b	621	"Get bored"를 "겟 보어드"라고 읽으면서, "겟(Get!)"하는 순간  😮  지루한 강의를 듣다가 갑자기 졸음이 쏟아져서 "보어(보오~)" 하고 침대에 푹 파묻히는 상황을 상상해보세요!  그럼 "지루해하다"라는 뜻이 자연스럽게 기억날 거예요. 😊	AI 도우미 🤖	\N	2025-09-05 07:05:48.708948+00
6e923321-c51f-498d-a4a5-889c391d839e	1642	"Effort"는 "에포트"라고 발음되는데,  "에(에너지) 폭발하는 트럭"을 상상해 보세요! 🚛💥  엄청난 에너지를 쏟아붓는 트럭처럼,  노력(effort)은 힘든 일이지만 결과를 얻기 위한 엄청난 에너지 소모를 의미하죠!	AI 도우미 🤖	\N	2025-09-05 07:06:29.518282+00
10aa8dc9-8efe-4178-a695-7049fbc7c2b9	9	"Blessing phrase"를 "블레싱 프레이즈"라고 읽으면서, "블레스(bless)"를 "블레스~ 받아!"처럼 축복을 외치는 소리로 연상하고,  "프레이즈(phrase)"는  "프레이즈~ 멋진 문구!"처럼 멋진 문구를 칭찬하는 소리로 생각해보세요! ✨  마치 마법사가 "블레스~ 프레이즈~!" 외치며 마법같은 축복의 문구를 만들어내는 장면을 상상하면 쉽게 기억될 거예요! 💖	AI 도우미 🤖	\N	2025-09-05 07:20:25.320067+00
3ead501e-156e-48b7-996f-37dbc7d870eb	10	"Tend to Root"는 "텐드 투 루트", 발음이 "텐트 치고 뿌리내리다"랑 비슷하죠! 🏕️  마치 텐트를 치고 한 곳에 오래 머무르는 것처럼,  "tend to"는 어떤 행동을 꾸준히, 즉 뿌리내리듯 하는 경향이 있다는 뜻이에요! 😊	AI 도우미 🤖	\N	2025-09-05 07:20:36.40637+00
e62b7337-5b16-4892-a7f9-15892a3ef9c1	129	"indifferent"는 "인디퍼런트"라고 읽히는데,  "인디(인도)" 사람이 "퍼런트"(퍼런 + 트럭)를 타고 아무렇지도 않게 지나가는 모습을 상상해 보세요!  무관심한 태도를 보이는 인도 사람의 퍼런 트럭이 슝~ 지나가는 모습이죠. 😎💨	AI 도우미 🤖	\N	2025-09-05 07:23:10.149308+00
66c8843e-8a43-4c53-a54c-6c7ec4a3eb89	12	"Woodcutter"는 "우드커터"니까,  "우드(wood, 나무)를 커터(cutter, 자르는 기계)로 싹둑싹둑 자르는 나무꾼"을 상상해봐!  🪓  마치 엄청난 크기의 나무를  전기톱으로 자르는 멋진 로봇 나무꾼 같다고 생각하면 기억하기 쉽겠죠? 😊	AI 도우미 🤖	\N	2025-09-05 07:37:11.173055+00
9b26e0b3-89aa-4fd3-bc47-eba861e54653	1373	"Invitation"은 "인비테이션"인데,  "인비" (인기 많은) + "테이션" (역대급 파티)로 생각해보세요! 🎉  인기 많은 사람들이 역대급 파티에 초대하는 모습을 상상하면 잊지 못할 거예요! 😉	AI 도우미 🤖	\N	2025-09-05 07:38:50.301368+00
6e004b1e-4343-4896-b6ce-bddeb830406a	1374	"Brilliance"는 "brilliant"에서 온 거잖아요?  ✨  "브릴리언트"를  "불이 붙은+리언트(라이언처럼 멋진)" 라고 생각해보세요!  불이 활활 타오르듯 엄청난 재능과 능력으로 멋지게 빛나는 모습, 그게 바로 brilliance! 😎	AI 도우미 🤖	\N	2025-09-05 07:39:07.818487+00
789e4a85-2d45-4ca8-bb63-6f90812c8652	458	"shape"는 "쉐이프"니까,  쉐프(chef)가 멋진 모양의 케이크를 🎂  만드는 모습을 상상해봐요!  쉐프의 손길이 케이크의 모양(shape)을 만들어내는 거죠! 😉	AI 도우미 🤖	\N	2025-09-05 07:39:24.244+00
8fbbe79b-c26f-4523-a5fa-e716b8178d9f	1262	"Gain"은 "게인"이라고 발음하니, 게임에서 레벨업해서 경험치를 "게인"하는 모습을 상상해봐요!  💪  점수가 쑥쑥 올라가는 모니터 화면을 떠올리면 "gain = 얻다, 늘리다"가 쉽게 기억될 거예요! ✨	AI 도우미 🤖	\N	2025-09-05 07:39:53.819496+00
9f392a3f-d3a6-4c6d-b350-f865140b6adc	19	"look after"는 "룩 애프터"니까,  "룩(look) 👀  닮은 엄마가 애프터(after)  애기 뒤를 졸졸 따라다니며 엄청나게 돌보는 모습"을 상상해보세요!  엄마의 헌신적인 모습이 바로 "돌보다"의 의미를 떠올리게 해줄 거예요. 😊	AI 도우미 🤖	\N	2025-09-05 07:40:52.960136+00
07c8718d-efec-4b2b-a2cb-20f4735f3159	1127	"brick"은 "브릭"인데,  "브리(브리치즈처럼 네모난)" + "크(크다!)"  라고 생각하면 돼요!  🧱  네모나고 큰 브리치즈처럼 생긴 벽돌이 막 쌓여있는 모습을 상상하면 잊지 않겠죠? 😉	AI 도우미 🤖	\N	2025-09-05 07:55:12.336374+00
d704673c-acce-4028-9836-7f2d3e5429fa	1816	"make sure that"  🤔  "메이크 슈어"를 "메이크(만들다) 슈어(슈퍼 확실하게!)" 라고 생각해 보세요!  슈퍼히어로가 임무를 완수하기 전에 모든 장비가 완벽한지 꼼꼼하게 확인하는 모습을 상상하면 잊지 않겠죠! 💪	AI 도우미 🤖	\N	2025-09-05 07:49:09.96389+00
9dec7ea3-0715-4e29-abb4-5670c585043c	15	"indicate"는 "인디케이트",  "인디" (인디밴드처럼 독특하게) 가 "케이트" (Kate,  손가락으로 가리키는 여자)를  가리키는 거야!  👉  그래서 indicate는 독특한 방법으로 무언가를 가리킨다는 뜻이지! 😉	AI 도우미 🤖	\N	2025-09-05 07:57:26.230313+00
632c5340-54ac-4607-b897-91565a9c3e1c	1122	"individually"는 "인디비쥬얼리" 비슷하게 들리죠?  🤔  마치 "인디" 밴드 멤버들이 각자 (individually)  멋진 기타 솔로를 선보이는 모습을 상상해 보세요!  🎸  각자의 개성이 빛나는 모습이 바로 "개인적인" 의미를 떠올리게 해 줄 거예요!	AI 도우미 🤖	\N	2025-09-05 07:54:50.009112+00
87c712d6-dc87-499b-b92e-94f98a6c75e4	1124	"Charity"는 "차리티"니까,  차를 마시며 넉넉한 마음으로 티타임을 즐기는 부자 할아버지가 떠오르네요!  그 할아버지가 바로 자선 단체를 운영하는 분이라 생각하면 쉽게 기억할 수 있을 거예요. ☕️😄	AI 도우미 🤖	\N	2025-09-05 07:54:59.65648+00
1b2b6b75-09d4-4faa-af97-dfb51a399ead	13	"hut"는 "헛" 하고 외칠 만큼 작은 오두막이야!  🏠  "h"는 작은 집 모양 같고, "ut"는 "웃"는 소리처럼 작고 귀여운 느낌이지.  마치 숲 속에 숨어있는 작은 헛간처럼! 😄	AI 도우미 🤖	\N	2025-09-05 07:57:16.583982+00
1ed60d94-be32-48a7-b165-363e41a81047	17	"scold"는 "스콜드"라고 발음되는데, 마치 "스윽 콜!" 하고 엄하게 부르는 소리 같아요! 😠  엄마가 "스윽 콜!" 하며 혼내는 모습을 상상하면 scold의 뜻인 '꾸짖다'가 쉽게 떠오를 거예요. 😉	AI 도우미 🤖	\N	2025-09-05 07:57:40.466992+00
9a412665-40bf-4a2b-bff3-5d88d6243d99	18	"Care for"는 "케어 포"니까,  "케어(Care)하는 마음으로 포(抱)옥 안아 돌본다!"  라고 생각해보세요.  마치 엄마가 아기를 포근하게 안고 돌보는 모습처럼요 🤗  "Care"의 'C'를 커다란 엄마의 품으로, 'for'를 아기를 품에 안는  '포옹'으로 연상하면 쉽게 기억할 수 있을 거예요! 🥰	AI 도우미 🤖	\N	2025-09-05 07:57:57.775876+00
85c48b56-683b-4c47-94b0-29138b32ce31	658	"Motivate"는 "모티베이트"니까,  "모티브(주제)+베이트(미끼)"라고 생각해봐요! 🎣  마치 낚시처럼,  흥미로운 모티브(주제)라는 미끼로 사람들의 마음을 낚아서 동기를 부여하는 거죠! 😊	AI 도우미 🤖	\N	2025-09-05 08:02:10.089758+00
2a4df012-bf3e-4901-aa59-e90db7c57322	658	"Motivate"는 "모티베이트"니까,  "모티(모터) 베이트(베이트, 미끼)"라고 생각해봐요!  🚘🎣  힘센 모터가 미끼를 던져서 사람들을 낚아(동기를 부여해서) 움직이게 만드는 거죠!  힘찬 모터의 움직임이 곧 동기부여!	AI 도우미 🤖	\N	2025-09-05 08:02:36.871285+00
b336ea7c-f82c-4b44-ad06-fc114fe77589	1	"thread"는 "쓰레드"랑 발음이 비슷하죠?  🧵  상상해보세요, 엄청나게 긴 쓰레드가 꼬불꼬불 지구를 한 바퀴 돌고 있는데, 그 실 끝에 바늘이 달려있어요!  그 바늘이 옷감을 꿰매듯이,  thread는 여러 이야기나 사건들을 하나로 연결해주는 '실'이랍니다! 😉	AI 도우미 🤖	\N	2025-09-05 08:08:02.386322+00
c83d324e-33f5-4587-97d2-bfab774d150d	1292	"Hang up" (전화 끊다) 🤔  "행거(옷걸이)에 전화기를 휙! 걸어두면 전화가 끊어져요!"  전화기가 옷걸이에 걸리는 모습을 상상하면서,  "행거 업(Hang up)" 이라고 기억하면 쉽답니다! 😄	AI 도우미 🤖	\N	2025-09-05 08:18:09.22887+00
8c9cbc70-a05f-4b1e-841c-f9b482a61bbf	11	"celebrate"는 "셀러브레이트"니까,  "셀러브리티(유명인)"가 화려한 파티로 자기 생일을 "셀러브레이트(기념)"하는 모습을 상상해봐요! 🎉  마치 "셀러브레이트"라는 단어 자체가 축제의 현장처럼 반짝거리는 것 같죠! ✨	AI 도우미 🤖	\N	2025-09-05 08:26:46.513167+00
53f3ade6-d0d1-4211-9fc5-31d2dc511a25	14	"by signalling"  ➡️  "바이 시그널링" 은 마치 바이킹(バイキング)들이 멀리서 ✨반짝이는 시그널(signal) 깃발을 흔들며 신호를 보내는 장면을 상상해 보세요!  바이킹의 깃발 색깔과 신호의 의미를 기억하면서  "신호로서"라는 뜻을 쉽게 떠올릴 수 있답니다! 😊	AI 도우미 🤖	\N	2025-09-05 08:26:55.016978+00
6483adac-a32d-4108-a41a-940eb2b16a7b	16	"Gratitude"는 "그래튜드"니까,  "그래! 튜브에 튜브에 맛있는 음료가 가득 담겨있어! (튜브=tube)"  라고 생각하면서 감사한 마음으로 맛있는 음료를 꿀꺽 마시는 상황을 떠올리세요! 😄  마시는 행위가 감사함을 표현하는 행위로 연결되면 기억하기 쉬울 거예요! ✨	AI 도우미 🤖	\N	2025-09-05 08:27:10.894758+00
7fe9dba2-f2f2-4622-8832-7d77c94645c6	22	"According to"는  "어코딩 투" 발음이 "어 코딩 투" 처럼 들리잖아요? 🤔  마치 컴퓨터가 "어! 코딩해서 찾아봤더니 투표 결과는 이래!" 라고 알려주는 것처럼 생각하면 쉽게 기억나요!  😄	AI 도우미 🤖	\N	2025-09-05 08:28:59.075148+00
1df15ccf-6a9d-446a-8260-5e36ac93927f	23	"Recent study"를  "리슨트 스터디" 라고 발음해 보세요!  🎧  마치 "리슨(listen)" 하고 귀 기울여 최근 연구 결과를 "스터디(열심히 공부)" 하는 모습을 상상해 보세요.  최신 연구 결과를 듣고 열심히 공부하는 똑똑한 당신의 모습이 떠오르면 절대 잊지 않겠죠! 😉	AI 도우미 🤖	\N	2025-09-05 08:29:07.715277+00
3207ee20-f87e-4158-bfb0-016b98b10e98	714	"sentence"는 "센텐스"니까,  "센(쎈) 텐션으로 쏘아붙이는 문장!" 이라고 생각해보세요.  😠🔥  마치 쎈 텐션으로 쏘아붙이는 문장처럼,  단어들이 힘있게 연결되어 하나의 완벽한 의미를 만들어내잖아요!	AI 도우미 🤖	\N	2025-09-05 08:51:38.52179+00
17a3119c-fb74-4986-9955-a71282b66590	715	"define"은 "디-파인"으로,  마치 숲 속의 나무(pine)를 '디'(자세히) 파고들어  그 나무의 특징을 하나하나 정확하게 밝히는 모습을 상상해 보세요!🌳  그렇게  나무의 정체성을  '정의'하는 것처럼,  단어의 뜻을 명확히 하는 것이 'define'이랍니다! 😊	AI 도우미 🤖	\N	2025-09-05 08:51:50.301175+00
df7f1d73-61cb-4bcb-a52c-a3b4427a8751	716	"Statement"는 "스테이트먼트"니까,  "스테이트(상태) + 먼트(먼 곳)"라고 생각해봐요! 🗣️  먼 곳에서 온 중요한 상태, 즉,  자신의 주장이나 진술을 크게 외치는 모습을 상상하면 쉽게 기억할 수 있을 거예요! 🤩	AI 도우미 🤖	\N	2025-09-05 08:52:07.65525+00
f15d89e9-cb1c-4dab-8c19-bffbab662ee3	517	"Above"는 "어, 보브!" 라고 외치며 위로 솟아오르는 보브컷 머리의 사람을 상상해 보세요!  머리카락이 위로 솟아 있으니까 "above"의 의미를 쉽게 기억할 수 있죠!  😆⬆️	AI 도우미 🤖	\N	2025-09-05 08:55:24.326131+00
53522fe0-15d7-4e25-84e8-7bc329c8882d	518	"Prefer"는 "프리퍼"니까,  "프리미엄" 과 연결해서 생각해봐요! ✨ 프리미엄 제품은 다른 것보다 더 좋아하잖아요? 그래서 "프리퍼(prefer)"는 "프리미엄처럼 더 좋아하는 것" 이라고 기억하면 쉽답니다! 👍	AI 도우미 🤖	\N	2025-09-05 08:55:32.286659+00
7f677329-6de3-4f94-ba08-51e51ffaa84a	523	"Consider"는 "컨시더"니까,  "컨(컨설팅)을 시더(시작하다)!" 라고 생각해 보세요!  🤔  중요한 결정을 내리기 전에 컨설팅을 받듯이,  꼼꼼하게 모든 것을 따져보고(고려하고)  시작하는 거죠! 👍	AI 도우미 🤖	\N	2025-09-05 08:55:43.320109+00
a3156d21-a870-44c8-b303-ae8a89d692a8	338	"Sympathy"는 "심파티"라고 발음되는데,  "심(마음) + 파티(파티)"처럼 생각해보세요! 🎉 마음이 따뜻한 파티, 즉 슬픔을 함께 나누고 위로하는 마음 따뜻한 모임을 떠올리면 쉽게 기억할 수 있어요! 🥰	AI 도우미 🤖	\N	2025-09-05 09:55:29.177709+00
aa29be3c-b3c8-4a82-9e46-e2270fc9a1bd	660	"correctness"는 "커렉트니스"니까,  "커다란 렉스(공룡)가 엄청난 정확성으로  🎯 과녁을 맞히는 모습"을 상상해보세요!  렉스의 정확한 사격 실력이 바로 "correctness"죠! 😄	AI 도우미 🤖	\N	2025-09-05 09:56:05.65965+00
1e67a901-013d-4135-aa95-36558c9f3649	1142	"figure out" 은 "피겨 (피겨스케이팅 선수처럼) 아웃(밖으로)! "  라고 생각해봐!  빙판 위에서 멋진 피겨스케이팅을 하는 선수가 어려운 동작을  "파악"해서  "이해"하고  "성공적으로 해내는" 모습을 상상하면 쉽게 기억될 거야! ✨👍	AI 도우미 🤖	\N	2025-09-05 10:20:14.321819+00
2ca0c638-c633-4763-990d-80a408fbffea	1143	"location"은 "로케이션"인데,  "로케(로켓) + 이션(션, 션샤인처럼 햇빛이 비추는 장소)"처럼 생각해보세요! 🚀 로켓이 슝 날아가서 햇빛이 쨍쨍한 멋진 곳에 착륙하는 장면을 상상하면 위치(location)를 쉽게 기억할 수 있을 거예요! ✨	AI 도우미 🤖	\N	2025-09-05 10:20:23.301452+00
b956cd15-80bb-48a0-ac8c-402c0f1d8222	1812	"management"는 "매니지먼트"라고 읽으니,  "매니저(manager)가 쥐(management의 'ment'를 쥐의 꼬리처럼 연상)를 잡아서 정신없이 회사를 관리하는 모습"을 떠올려보세요! 🐭💼  정신없지만, 결국 회사를 잘 관리하는 모습이 경영의 의미와 연결됩니다!	AI 도우미 🤖	\N	2025-09-05 10:25:52.234087+00
7ec179e9-110a-4c5b-8f20-d00b58fc11b4	1726	"The instant"는 "더 인스턴트"니까,  "더! 순간적으로 인스턴트 라면처럼 🍜  끓는 물 붓는 순간  '스프' 퍼지는 것처럼 순식간에 일어나는 일!"  이라고 생각하면 돼요! 😉	AI 도우미 🤖	\N	2025-09-05 11:36:01.773934+00
a594755a-146a-4dfe-a9ef-6dd12809320f	1727	"Desire"는 "디자이어"니까,  디자인을 너무너무 원해서 (🔥) 눈에 불을 켜고 디자인 작업에 몰두하는 디자이너를 떠올리세요!  그 열정적인 모습이 바로 강렬한 욕망, 즉 desire죠! 😉	AI 도우미 🤖	\N	2025-09-05 11:36:11.718875+00
3320ea9f-bdea-47ae-8a32-bd0faef3b5e0	1728	"matter"는 "매터"니까, "매우 중요한 문제(matter)는 매트리스(mattress)처럼 푹신하게 넘길 수 없어! 😡  매우 중요하다는 뜻이니, 마음속에 매트리스처럼 쿵! 하고 박히도록 기억해!" 💥	AI 도우미 🤖	\N	2025-09-05 11:36:19.792144+00
d1c8f4a6-b2c9-4fba-b6fa-09a9dd860626	1728	"matter"는 "매터"니까,  "매우 중요한 문제는 매터(matter)처럼 마음속에 깊이 박혀서 잊을 수가 없다! "💥  마치 엄청난 중량의 매터(matter)가 가슴에 얹혀있는 것처럼! 😄	AI 도우미 🤖	\N	2025-09-05 11:36:26.664855+00
8670221f-30cd-4240-9e0a-64b4091d07f8	1729	"Convenient"는 "컨비니언트"라고 발음되는데,  "컨비니" (편의점) + "언트" (많다)  라고 생각해보세요!  편의점처럼 편리한 게 엄~~~청 많다는 뜻이죠! 🏪😄	AI 도우미 🤖	\N	2025-09-05 11:36:39.101689+00
e1122978-ea18-4f90-b725-d4ef5211061b	1091	"Class president"는 "클래스 프레지던트"니까,  "클래스"는 수업이고 "프레지던트"는 대통령이잖아요?  👑  그래서 떠오르는 건,  수업의 작은 대통령,  반 친구들을 이끄는 멋진 리더가  자신의 '클래스'를  '프레지던트'처럼 멋지게 이끌어가는 모습이에요! 👍	AI 도우미 🤖	\N	2025-09-05 22:48:21.668966+00
328dfcb9-5ff6-4cca-b097-d5e7f17faab3	1098	"Determine"는 "디터민"으로 들리는데,  "디(Dee) 터(터) 민(民)!"  처럼  Dee라는 이름을 가진 사람이  "터"무니없이 많은 사람들(민) 중에서  결정을 내리는 모습을 상상해보세요! 🤔😂  그렇게 힘들게 하나를 골라 결정하는 거죠!	AI 도우미 🤖	\N	2025-09-05 22:48:46.349283+00
46255743-9c9d-4774-97e3-5c25c83d1f2d	1494	"handle"은 "핸들"이랑 발음이 비슷하죠?  🚗  큰 트럭의 핸들을 잡고 힘겹게 컨테이너를 옮기는 상황을 생각해보세요!  "handle"은 그 힘든 컨테이너를 '취급'하는 행위를 뜻하는 거예요.  💪	AI 도우미 🤖	\N	2025-09-06 02:59:06.899418+00
2d9d1a65-cd44-46b0-b04a-88da913e8f71	1495	"document"는 "도큐먼트"라고 읽으니,  "도둑(도)이 중요한 문서(큐먼트)를 훔쳐 달아나는데,  그 문서에는  '도둑 잡는 법' 이 적혀있었대요! 😂  그래서 '도큐먼트'(document)는 중요한 서류라는 걸 잊지 않겠죠! 👮‍♂️	AI 도우미 🤖	\N	2025-09-06 02:59:13.737589+00
1eec20c9-c1ea-4369-97e9-299d633ca831	6769	"research"는 "리서치"니까,  "리(이리저리) 서치(검색)해서 찾는 거야!" 라고 생각하면 돼요.🕵️🔎  이리저리 뛰어다니며 자료를 찾는 모습을 떠올리면 쉽게 기억할 수 있을 거예요!	AI 도우미 🤖	\N	2025-09-06 14:26:33.778313+00
75001884-90b8-430d-914a-12b710a2c69a	3179	"region"은 "리전"으로 들리죠?  마치 '리그(league)'처럼 여러 지역들이 경쟁하듯 각자의 특색을 뽐내는, 경계가 그어진 여러 개의 '리전'을 상상해보세요!  🗺️  각 리전은 독특한 문화와 자연으로 가득 차 있답니다!	AI 도우미 🤖	\N	2025-09-06 14:26:41.977543+00
947afdba-b2fd-49b2-8a87-dcbd019de5ef	4135	"Enkindle"은 "엔킨들" 이라고 발음되는데,  "엔진"이 "킨들" (불을 붙이다) 시키는 모습을 상상해보세요! 🔥  마치 강력한 엔진이 불꽃을 뿜어내며 불을 활활 지피는 장면처럼요!  🚀	AI 도우미 🤖	\N	2025-09-06 14:26:55.191396+00
5da8be72-3cff-496c-afd7-12779b7c1503	9378	"브라이브(bribe)"는 "브라"와 "아이브(I've)"를 떠올려봐요!  🤫  잘못된 일을 숨기려고 브라 속에 뇌물(아이브 숨겨놓은거!)을 넣어 몰래 건네는 모습을 상상하면 잊지 않겠죠? 😉	AI 도우미 🤖	\N	2025-09-06 14:27:22.158738+00
142a380a-84df-40bf-b8d9-c644249db58e	10932	"raise"는 "레이즈",  "레이저"처럼 발음이 비슷하죠?  레이저 광선이 쫙! 하고 뭔가를 위로 쏘아 올리는 모습을 상상해보세요! 🚀  마치 레이저가 물건을 "일으키는" 것처럼요! 😄	AI 도우미 🤖	\N	2025-09-06 14:27:38.500953+00
bda03c29-bd8a-4973-836f-0ea662a6d92d	4010	"Disintegrate"는 "디스인티그레이트"니까,  "디스(싫어!) 인티(인테리어) 그레이트(위대한)!"  ➡️  싫어하는 인테리어가 위대하게 산산조각 나는 모습을 상상해봐! 💥  마치 멋진 성이 폭발해서 가루가 되는 것처럼! ✨	AI 도우미 🤖	\N	2025-09-06 14:27:47.75164+00
e4fa44f1-3057-4721-8537-7ce8e05fb423	2655	"Humidity"는 "휴미디티"라고 발음되는데,  "휴~" 하고 습한 날씨에 숨 쉬기 힘들어 땀 뻘뻘 흘리는 모습을 상상해 보세요!  🥵  "휴~" 하는 숨소리와 땀으로 축축한 "humidity", 습도를 잊지 못할 거예요!	AI 도우미 🤖	\N	2025-09-06 14:28:00.173481+00
70d5b7ed-80f1-493a-91d6-9bd4de5a50b2	9610	"scrutiny"는 "스크루터니"라고 발음하면서,  "스크루(나사)"를 엄청나게 꼼꼼하게 "터니(돌리며)" 조사하는 모습을 상상해 보세요!  🕵️‍♂️ 마치 시계공이 아주 작은 나사 하나하나를 현미경으로 확인하듯이,  세세한 부분까지 놓치지 않고 면밀히 조사하는 거죠! 😊	AI 도우미 🤖	\N	2025-09-06 14:54:49.293458+00
bfc6adc8-726b-432f-bdd1-cf1b2d8c601e	9609	"jest"는 "제스트"처럼 들리잖아요?  🍊 제스트는 레몬이나 오렌지 껍질의 향긋한 부분인데,  농담도 그처럼 톡 쏘는 재미와 흥미를 주는, 짧고 강렬한 맛(?) 같은 거라고 생각해 보세요! 😄	AI 도우미 🤖	\N	2025-09-06 14:55:01.694446+00
9661a82f-2738-4a53-9ae3-a313f260fdf6	2543	"Consider"를 "컨시더"라고 발음해 보세요!  컨테이너에 실어 놓고(con)  신중히(sider,  '시더'처럼)  고민하는 모습을 상상해 보세요. 🤔  중요한 결정을 내리기 전에 컨테이너 안에 담긴 모든 것을 꼼꼼히 살펴보는 거죠!  ✨	AI 도우미 🤖	\N	2025-09-06 14:56:21.487743+00
a4631126-5644-4613-9a88-0424e284d840	5579	"Bleak"은 "블랙"(black)과 발음이 비슷하죠?  真っ暗闇の未来(まっくらやみのみらい) - 까만 어둠 속의 미래를 상상해보세요!  💀  희망이라고는 눈꼽만큼도 없는, 칙칙하고 차가운 블랙홀 같은 미래, 그것이 바로 bleak입니다!	AI 도우미 🤖	\N	2025-09-06 14:58:51.648329+00
d342a9e0-0b68-43a5-96b4-d000fa1d7301	5580	"Blithe"는 "블리스(bliss, 행복)"랑 비슷하죠? 😄  마치 블리스처럼 행복하고 즐거운 삶을 사는 블리쓰 씨를 생각해보세요!  항상 밝고 경쾌한 블리쓰 씨는 걱정 없이 즐거운 일만 하며 살아요! ✨	AI 도우미 🤖	\N	2025-09-06 14:59:34.511515+00
3b4be515-a81c-46f5-8b50-9b9bbea92588	5582	"Blunder"는 "블런더"로 발음되는데, 마치 "블랙홀(Black Hole)"에 "런던(London)"이 빨려 들어가는 모습을 상상해 보세요!  😨  런던이 엉뚱한 곳으로 뿅 하고 사라지는 큰 실수, 그것이 바로 블런더! 😉	AI 도우미 🤖	\N	2025-09-06 14:59:42.962668+00
873dd44b-2602-4e23-b682-398c66de651e	1999	"Knowledgeably"는 "놀랍게도 지식이 많이!" 라고 생각해 보세요!  🤓  "Know" (알다)에 "-ledge" (지식)가 붙어 박식함을 나타내는데,  "ably" (능숙하게)가 더해져 마치 놀라울 정도로 지식을 능숙하게 활용하는 모습을 상상하면 쉽게 기억할 수 있답니다. ✨	AI 도우미 🤖	\N	2025-09-06 15:12:54.49065+00
5b1e9321-2183-4843-8006-05c114b5e995	3221	"Malfunction" 🤔  말(말하다) + 펑션(기능, 펑!하고 터지는 소리) = 말이 안 통하고 기능이 펑! 하고 망가진다는 뜻이야!  말썽꾸러기 기계가 갑자기 자기 기능을 잃고 "말"도 안 듣고 "펑!" 하고 고장나는 모습을 상상해봐! 😂	AI 도우미 🤖	\N	2025-09-06 15:38:38.554981+00
d01684f3-7163-4c9d-8537-9cdc5aefa053	6338	"Internment"는 "인턴쉽"이랑 발음이 비슷하죠? 🤔  인턴으로 회사에 들어갔는데, 알고 보니 회사 전체가 갑자기 외계인의 침략을 받아서 캡슐 안에 갇히는(internment!)  어처구니없는 상황을 상상해 보세요!  😂  그 캡슐 안에서 강제로 인턴 생활을 계속하는 거죠!	AI 도우미 🤖	\N	2025-09-07 00:04:30.790719+00
55f4064f-8f3b-4737-a4f1-926b86941923	3341	"abandon"은 "어! 반돈!" 이라고 생각해봐요!  돈을 반이나 버렸다는 뜻으로,  낭비하고 버리는 느낌을  재밌게 기억할 수 있죠! 😂  (발음과 상황 연결)	AI 도우미 🤖	\N	2025-09-07 00:05:44.464519+00
46c639cb-729d-4f0f-b5e6-0574e88a838b	3632	"Blithe"는 "블라이트"처럼 들리죠?  ✨  마치 블랙 라이트(Black Light) 아래서 밝게 빛나는 듯한, 신나고 명랑한 모습을 상상해 보세요!  블랙 라이트 아래선 모든 게 밝고 신나잖아요? 😄	AI 도우미 🤖	\N	2025-09-07 00:06:11.917959+00
e37f20be-f953-4154-8b5b-8a5f68e1e3c1	4246	"Fatuous"는 "패투어스" 비슷하게 들리죠?  🤔  패(패배) + 투(투덜거리며) + 어스(어리석은)  =  패배하고 투덜거리며 어리석은 짓을 하는 사람, 바로 'fatuous'한 사람이에요! 😄	AI 도우미 🤖	\N	2025-09-07 00:22:03.831136+00
e74e5fc1-2a90-4225-8651-6cf80d0fb1ca	11687	"Disabled/Handicapped"는  "디스에이블드/핸디캡드"니까,  "디스(this) 에이블(able)"  -> "이것도 할 수 있어!" 라고 외치는 씩씩한 장애인 친구들을 떠올려 보세요! 💪  혹은 "핸디(handy)" ->  "손재주가 뛰어난"  능력자들을 생각하며,  장애를 넘어선 멋진 재능을 떠올리면 기억하기 쉽겠죠! ✨	AI 도우미 🤖	\N	2025-09-07 00:38:20.375561+00
dd7fca23-17bc-43de-a67f-d6533323c367	1992	"Knowledgeable"은 "노우(know) + レッジ(ledge, 지식)"라고 생각해봐요!  🤓  마치 노래하는 듯한 "노우~"하며 지식의 산(ledge)을 쌓아 올리는 모습을 상상하면 쉽게 기억나겠죠?  마치 지식의 산을 정복한, 아는 것이 많은 사람이 된 것처럼요! ✨	AI 도우미 🤖	\N	2025-09-07 01:46:42.516323+00
f0b280cc-9f27-43fe-ad30-2b25ed63e443	2703	"Overhaul"은 "오버홀"처럼 들리죠?  ⚙️  낡은 자동차 엔진을 "오버(넘어) 홀(구멍)"에 쑤셔넣어 완전히 분해하고, 부품 하나하나 꼼꼼히 점검해서 다시 조립하는 모습을 상상해보세요!  그럼 "점검하다"라는 뜻이 딱 떠오를 거예요! 😉	AI 도우미 🤖	\N	2025-09-07 23:42:32.966004+00
3cf7363d-1283-41e6-9707-6bacbe881597	7148	"inform"은 "인-폼"으로, 마치 "인형"이 정보를 "폼 나게" 알려주는 모습을 상상해 보세요! 🗣️✨  인형이 입을 쩍 벌리고 중요한 소식을 멋지게 전달하는 거죠!	AI 도우미 🤖	\N	2025-09-08 00:20:40.659453+00
8f005013-370c-4ef3-b3d8-4d6393289615	9651	"thread"는 "쓰레드"랑 발음이 비슷하죠?  🧵  상상해보세요.  엄청나게 긴 쓰레드가 하늘에서 땅까지 이어져 있고, 그 실 끝에 귀여운 꼬마 요정이 매달려서 빙글빙글 내려오고 있는 거예요!  그 실이 바로 "thread",  실이라는 뜻이랍니다! ✨	AI 도우미 🤖	\N	2025-09-08 00:23:13.820786+00
297e3a49-c5f2-43e5-8185-0554adbbd964	2014	"Declining demand"는 "디클라인(decline) + 디맨드(demand)"잖아요?  🤔  "디클라인"은 마치 "디끌고 라인"처럼,  수요가 줄어들어 물건들이 끌려가는 컨베이어 벨트 라인이 텅텅 비어있는 모습을 상상해보세요!  텅 빈 컨베이어 벨트는 감소하는 수요를 보여주는 셈이죠! 📉	AI 도우미 🤖	\N	2025-09-08 00:48:05.816512+00
0e643412-bc1c-426a-98d8-80334843a8da	5386	"abandon"은 "아-반-돈"으로,  "아! 반도 못 가서 돈 다 쓰고 포기했어!" 라고 생각해봐요. 😅  돈 다 써서 여행을 포기하는 상황처럼,  'abandon'은 무언가를 포기하거나 버리는 것을 뜻하죠!	AI 도우미 🤖	\N	2025-09-08 03:27:04.344529+00
f5daac0c-5339-4016-8252-dd0a5aabc130	9700	"Slim plates" 라고요?  슬림(Slim)은 마치 "슬림한 몸매"를 생각하면 되고, plates는 접시처럼 납작한 "플레이트"니까,  👯‍♀️  "슬림한 몸매의 사람이 납작한 접시 위에 겨우 올라가 있는 모습"을 상상해보세요!  아주 가늘고 얇은 접시, 즉 "가느다란 판"이 떠오르지 않나요? 😄	AI 도우미 🤖	\N	2025-09-08 03:45:58.500688+00
c9f2b4ef-5c9e-4617-ae00-9c962efccb53	9702	"Powerproducing"은 "파워프로듀싱"으로 발음되는데,  마치 파워레인저들이 "파워! 프로듀스!" 외치며 로봇을 만들어 에너지를 뿜어내는 장면을 상상해 보세요! 💥  힘(power)을 생산(producing)하는 모습이죠! 😄	AI 도우미 🤖	\N	2025-09-08 03:46:08.037932+00
0494030b-91b0-4884-be1d-e960566cb3d8	6279	"incomparable"은 "인컴퍼러블" 이라고 발음되는데,  "인간(人)을 컴퓨터(💻)로 비교할 수 없을 만큼 뛰어나다!" 라고 생각하면 돼요!  인간의 창의성이나 감정은 기계로는 따라올 수 없다는 의미를 떠올리면 쉽게 기억할 수 있을 거예요! 😉	AI 도우미 🤖	\N	2025-09-08 03:46:53.43151+00
e00f0e78-4631-4f9a-a57f-2b30b1a57721	10559	"experiment"는 "익스페리먼트"라고 발음되는데, "익숙한 실험"이라고 생각해보세요!  🧪  익숙한 실험 도구들을 가지고,  "익숙하게"  (ex-) 새로운 것을 "페리(ferry, 배)"처럼 탐험하고(peri-) 결과를 "먼트(mount, 산)"처럼 쌓아 올리는 거예요!  😄	AI 도우미 🤖	\N	2025-09-08 07:53:36.978409+00
44f908a1-16a2-48aa-b0d4-b755343ad4ba	3350	"Abide"는 "어바이드"라고 발음하는데, "어! 바이~드"라고 생각해 보세요!  🏡  어떤 사람이 자기 집(바이)에 딱! (드)  붙어서 오랫동안 살고 있다는 재밌는 상황을 떠올리면 "살다"라는 뜻을 쉽게 기억할 수 있을 거예요! 😊	AI 도우미 🤖	\N	2025-09-08 07:55:35.992672+00
888c5404-a589-4c33-ae39-cadcc006714a	3351	"abolish"는 "애보리쉬"라고 발음해 보세요!  애지중지하던 낡은 법을 "애보리쉬"(애써 없애 버리쉬!) 하고 폐지하는 모습을 상상해보세요.  💥  마치 낡은 옷을 버리듯이 말이죠! 😉	AI 도우미 🤖	\N	2025-09-08 07:55:50.508496+00
04ea7969-f79a-45b1-a630-2c436b671314	10566	"characteristic"  캐릭터리스틱!  캐릭터(character) + istic(같은)~  ✨  마치 캐릭터가 가진 고유한 특징, 성격 같은 것처럼 생각해봐!  캐릭터가 틱틱거리는 성격이라면 그건 그 캐릭터의 characteristic이겠지! 😉	AI 도우미 🤖	\N	2025-09-08 07:58:34.222269+00
9b57acfe-ce1d-4095-87d5-af3a88873557	9654	"Distribute"는 "디스트리뷰트"니까,  "디스(이것) + 트리(나무) + 뷰트(뷰티풀, 아름다운)"라고 생각해봐요!  🌳 이렇게 아름다운 나무 열매들을 이것저것 나눠주는 모습을 상상하면 쉽게 기억나겠죠?  😋	AI 도우미 🤖	\N	2025-09-08 07:58:41.696971+00
5ab165a7-56e8-438d-bb0c-2bc92af11935	9652	"needle"은 "니들"이라고 발음하니,  니들이 바늘처럼 뾰족하고 가늘게 톡 쏘는 상황을 상상해봐요!  😈  혹은 "nee-dle"로 나누어 "니"가 실을 꿰는 "들"을 가리킨다고 생각하면 기억하기 쉽겠죠!🧵	AI 도우미 🤖	\N	2025-09-08 07:58:48.841006+00
8e622807-2588-49f7-8335-6c68f2dd22af	9653	"pattern"은 "패턴"이라고 읽으니,  옷에 예쁜 패턴(무늬)을 붙이는데,  "PATTern"이라고 생각하며  "PATT" 부분을  "팻"이라고 생각해보세요!  귀여운 강아지 팻이 옷에 알록달록한 무늬를 찍찍 찍어대는 모습을 상상하면 쉽게 기억날 거예요!🐾🎨	AI 도우미 🤖	\N	2025-09-08 07:58:51.776535+00
4f4312e6-7794-4c85-95ab-4f3b024a9f6c	11450	"endangered"는 "엔-데인-저드"니까,  "앤드(and) + 데인저(danger) = 앤드 데인저! 위험에 처한 멸종 위기 동물이 '앤드' 게임처럼 마지막 순간에 위기에 처했어요!😨"  빨리 구해줘야 해요!	AI 도우미 🤖	\N	2025-09-08 07:59:23.523925+00
c7f703fa-232f-406d-b68a-e3fca015119c	11635	"Manage to V"는 "매니저"가 겨우겨우 "투(to)"를 잡아서 일을 해내는 모습을 상상해보세요! 🤪  매니저가 정신없이 일하다가 마지막 순간에 "투(to)"라는 목표를 간신히 잡아서 성공하는 모습이 "가까스로 ~하다"의 뜻과 딱 맞죠! 👍	AI 도우미 🤖	\N	2025-09-08 08:16:55.048967+00
fae9a787-9ce6-48d1-b9c7-8d629bca1525	11634	"pedal"은 "페달"이라고 읽으면 발음이 비슷하죠? 🚴  발로 밟는 페달을 생각하며, "페달 밟고 신나게 달리는 내 모습"을 상상하면 기억하기 쉬울 거예요!	AI 도우미 🤖	\N	2025-09-08 08:17:09.410125+00
948f0e83-252a-448c-bc0e-0d76bcc60630	9324	"toll"은 "톨"이라고 발음하니, 고속도로 톨게이트를 떠올려봐요! 🚗  톨게이트를 지날 때마다 내는 돈이 바로 사용세(toll)니까요.  쉽죠? 😊	AI 도우미 🤖	\N	2025-09-08 10:15:17.05486+00
26ba4577-9440-42e0-a3ae-c766f64a6f1a	7759	"Kindergarten"은 "킨더(kind=친절한) + 가든(garden=정원)"처럼 생각해봐요!  친절한 선생님들이 예쁜 정원 같은 유치원에서 아이들을 돌봐주는 모습을 상상하면 잊지 않겠죠? 🌸😊	AI 도우미 🤖	\N	2025-09-08 10:15:26.025437+00
9cdc22c1-4d2b-4055-a4a4-c8d02d9ebd84	8598	"Sibling"은 "시블링"으로 발음되는데, "시ㅂ(십)"자 형제 자매가 "링(ring, 고리)"처럼 서로 얽혀있는 모습을 상상해보세요!  👨‍👩‍👧‍👦  서로 싸우기도 하지만, 언제나 서로 연결된 특별한 관계니까요!	AI 도우미 🤖	\N	2025-09-08 10:15:34.003906+00
888eb911-6b44-4835-8311-3c89bc91d1b7	2023	"lasting effect/memory"는  "래스팅 이펙트/메모리"니까,  "래"핑된 선물처럼 ✨  오래도록(lasting)  "이펙트" 효과가  마음속에 "메모리"처럼  각인되어  잊혀지지 않는 강렬한 기억으로 남는다고 생각해봐요!  🎁	AI 도우미 🤖	\N	2025-09-08 10:33:10.234598+00
a71b1b98-90df-41f9-a248-35107ad84f52	11233	"skillfully"는 "스킬풀리"니까,  스킬(skill)이 풀(풀어지다)리만큼 자유롭고 능숙하게 펼쳐지는 모습을 상상해보세요! ✨ 마치 능숙한 요리사가 재료들을 척척 풀어내듯이 말이죠!  🍜	AI 도우미 🤖	\N	2025-09-08 12:17:44.948632+00
035891bf-3054-492e-9113-96a06f265c96	12878	"ท่าทางจน" (타탕촌) 발음이 "타다 텅 찬" 과 비슷하죠?  낡고 텅 빈 수레를 타고 다니는 꼬질꼬질한 모습을 상상해보세요!  💰 그 모습이 바로 가난해 보이는 모습이랍니다! 😄	AI 도우미 🤖	\N	2025-09-09 00:18:15.883463+00
9454962c-c7b8-4cc5-96da-fc9c4084439c	1992	"Knowledgeable"은 "놀라울 정도로 지식이 많은" 이라고 생각해봐요!  🧠  "Know" (알다)에  "ledge" (선반)을 붙여서, 머릿속 선반에 지식이 놀라울 정도로 가득 차 있는 모습을 상상하면 쉽게 기억나요! 🤩	AI 도우미 🤖	\N	2025-09-09 00:24:17.475089+00
d38d0ab8-600b-4cbd-b7e5-e1b6edca0a10	1993	"Recognize"는 "렉-어-나이즈"니까,  "렉카(렉카차)가 어나이즈(어나이징, 깜짝 놀라게 하는) 하듯이,  내 공로를 렉카처럼 확실하게 알아주고 인정해주는 거야!"  🥳  렉카처럼 확실하게 인정받는 상황을 떠올리면 쉽게 기억할 수 있을 거예요!	AI 도우미 🤖	\N	2025-09-09 01:04:29.18273+00
948e11e0-90e3-4a7c-ac09-a1f291f0468e	7150	"provide"는 "프로바이드"니까,  "프로(pro)"페셔널 요리사가 "바이드"(바이-드,  '바구니'를 연상) 가득한 음식을 손님들에게 척척 공급하는 모습을 상상해 보세요! 👨‍🍳🧺  프로페셔널이니만큼 훌륭한 음식을 듬뿍 제공한다는 이미지로 기억하면 쉽답니다!	AI 도우미 🤖	\N	2025-09-09 01:05:41.433636+00
b84b80d9-3630-4727-9d76-686b9ac9c4b1	2435	"Withdraw"는 "위드-드로우"니까,  "위험한 드래곤의 굴에서 내 소중한 보물을 조심스럽게 빼내는(with-draw) 모습"을 상상해 보세요! 🐉✨  보물이 바로 당신이 인출하거나 철수시키는 돈이나 군대일 수 있겠죠!	AI 도우미 🤖	\N	2025-09-09 01:23:47.361467+00
39dd62be-f930-448c-b1c9-f30650b1ad8b	6799	"rigidly"는 "리지들리" 라고 발음되는데, 마치 "리지드(rigid, 딱딱한)"한 쇠막대기로 "들리"는 듯이 엄격하고 움직임 없이 고정된 모습을 상상해보세요! 👮‍♂️  마치 규칙을 어기면 쇠막대기로 딱딱하게 혼내는 무서운 선생님 같죠!	AI 도우미 🤖	\N	2025-09-09 01:24:00.459422+00
fd0ab998-a26f-4653-bdf4-daf0dfc776ee	12999	"หวงไว้ทำไม" (후엉와이탐마이) 발음이 "후웅~ 왜 이렇게 기다려?"  같잖아요? 🤔  마치 엄청난 보물을 품고 "후웅~ 이 좋은 걸 왜 기다리고 있어?"라며 혼잣말하는 곰돌이 푸처럼,  기대감에 부풀어 끙끙대는 모습을 상상해 보세요!🐻	AI 도우미 🤖	\N	2025-09-09 01:25:36.739819+00
c4811cf3-c8b1-4847-9b60-a2ac914005d7	12836	"ไม่มียางอาย"는 발음이 '마이미양아야이' 비슷하죠?  🤔  그래서 "마이(마음) 미(미안함) 양(양심) 아야(아야, 아프다!) 이(이해) 없이" 뻔뻔하게 행동하는 모습을 상상해 보세요!  마음에 미안함도, 양심의 가책도 없이, 남의 마음을 아프게 해도 아무렇지 않은, 이해할 수 없는 뻔뻔함! 😄	AI 도우미 🤖	\N	2025-09-09 01:25:47.958704+00
dde89caa-bb7a-49ef-85c6-ca7486ee2ca8	13038	"เป็นคนละคน" 이라고요?  "변신! 뼛속까지 다른 사람!" 이라고 생각해보세요!  🐸  마치 개구리가 폴짝 뛰어올라 완전히 다른 모습의 개구리🐸로 변신한 것처럼, 예전과는 전혀 다른 사람이 된 거죠! ✨	AI 도우미 🤖	\N	2025-09-09 01:25:56.687811+00
55ea3dab-01d0-48df-b193-4658556f105d	2551	"assessment"는 "어세스먼트" 발음이 "어! 세상에! 스스로 먼저 척척 평가!" 같지 않나요? 🤔  자신의 실력을 스스로 먼저 척척 평가하는 모습을 상상하면서 기억해보세요! 👍	AI 도우미 🤖	\N	2025-09-09 01:43:22.219104+00
05bec168-4571-44ee-b1b3-8000d9e26498	2551	아무도 댓글을 ㅋㅋㅋㅋ	익명	\N	2025-09-09 01:43:32.526762+00
1985d2dc-9608-4b2f-bd82-4e93f8d703ea	9651	쓰레드만 몇번째인지	익명	\N	2025-09-09 01:43:57.047617+00
326dea90-500f-4785-82d4-25b5d8495455	1997	"precisely"는 "프리사이즐리"니까  "프라이팬에 사이즈를 정확히 맞춰 계란 프라이를 굽는다!"  🍳  라고 생각하면 정확함을 떠올리기 쉬워요!  완벽한 계란 프라이처럼 정확하게! 👍	AI 도우미 🤖	\N	2025-09-09 01:44:32.339348+00
90bb91f9-ebce-474a-b896-b7843dc35262	1996	"Regulation"은 "레귤레이션"인데,  "레귤(래글래글)" 거리며 규칙을 지키지 않는 사람들을 👮‍♂️  "레이션(ration, 배급)"처럼 딱딱하게 규제하는 모습을 상상해보세요!  🤣	AI 도우미 🤖	\N	2025-09-09 01:44:56.13656+00
faa0c27b-857e-407e-b918-9e0cd893d05f	1995	"provide"는 "프로바이드"니까,  "프로" 선수가 "바이드"(바이올린)를  관객들에게  "제공"하는 모습을 상상해봐요! 🎻✨ 프로 선수가 멋진 연주를 선물하는 것처럼, provide는 무언가를 제공하는 행위를 뜻하죠!	AI 도우미 🤖	\N	2025-09-09 01:45:16.342497+00
5c97be2c-093a-43b5-996e-2fb926203ee0	7148	"inform"은 "인폼"으로 들리죠?  🕵️‍♂️  마치 정보원(Informant)이 중요한 정보를  "인폼!  (알려드립니다!)" 하고 귓속말로 알려주는 장면을 상상해 보세요!  🤫	AI 도우미 🤖	\N	2025-09-09 02:07:07.319073+00
a9896219-5148-4c96-8bda-6ad217772346	1992	ㄱㄱ	ㄱㄱ	\N	2025-09-09 02:07:53.294806+00
a4f4cab9-fff3-4f31-a756-8b59a26a52e2	5387	"Aberrant"는 "애버런트"처럼 들리는데,  "애버(애벌레)"가 "런트(runt, 작고 볼품없는 것)"처럼 삐뚤빼뚤, 엉뚱하게 자라서 정상적인 애벌레 길을 벗어난 모습을 상상해 보세요!🐛  정도를 벗어난, 이상한 모습이죠! 😊	AI 도우미 🤖	\N	2025-09-09 02:08:10.93038+00
64fb6320-0b1e-429b-a8c6-6f8b3402a0e0	1994	"Updated"는 "업데이트"랑 발음이 비슷하죠?  👵🏻  낡은 할머니 옷장에 최신 유행 옷들이 뿅! 하고 나타나 업데이트 된 것처럼 생각해보세요!  ✨  (옷장이 업데이트 되었으니, 당연히 "updated" 옷장!)	AI 도우미 🤖	\N	2025-09-09 02:47:29.049114+00
e0766c72-a356-454d-af2b-f38e979f0588	2006	"be credited with"는  "비 크레디티드 위드"  발음이  "비 크레딧 이득"  처럼 들리죠? 🤔  그래서 엄청난 업적을 세운 사람에게 "비 크레딧 이득!" 이라고 외치며, 그 공로를 크게 인정해주는 장면을 상상해보세요!  그 사람은 마치  "크레딧" 카드처럼  자신의 업적이라는  "이득"을  세상에 인정받는 거예요! 🎉	AI 도우미 🤖	\N	2025-09-09 02:47:42.296862+00
3b75e085-216f-4073-8bc0-6232bea138a9	2488	"accurate"는 "액큐릿"으로 발음되는데,  "액체를 큐(Q)알처럼 정확하게 쏘는 모습"을 상상해보세요!  🧪  마치 정밀한 과학 실험처럼,  'accurate' 하다는 건  조금의 오차도 없이 정확하게 딱 맞춘다는 의미니까요! 😊	AI 도우미 🤖	\N	2025-09-09 03:26:45.319309+00
3347f29e-d630-48ff-81d4-276a18239863	7156	"require"는 "리콰이어"라고 발음되는데, 마치 "리(리필) 콰이어(콰르텟처럼 4명이 필요해!)"처럼 생각해보세요! 🎼  넷이서 합창을 하려면 4명이 꼭 필요하잖아요?  그래서 "require"는 '필요로 하다'라는 뜻이에요! 😉	AI 도우미 🤖	\N	2025-09-09 04:18:14.042533+00
d2df724b-bca1-4a61-8361-2ae97a9f69aa	3226	"Locals"는 "로컬스"니까,  "로컬(지역의) + 스(들)"이라고 생각해 보세요! 마을 주민들이 "로컬" 음식을 먹으며  "스스스" (수군수군) 이야기하는 모습을 상상하면 기억하기 쉽죠! 🗣️😄	AI 도우미 🤖	\N	2025-09-09 04:53:12.718346+00
ba4d551e-38b6-47ed-9ccf-d36eda434858	2729	"Supervisor"는 "슈퍼바이저"처럼 들리죠?  슈퍼마켓 바이저(감독관)처럼 상사가 슈퍼파워로 직원들을 감독하는 모습을 상상해보세요! 💪  매장을 슈퍼바이징하는 멋진 상사를 떠올리면 쉽게 기억할 수 있을 거예요! 😉	AI 도우미 🤖	\N	2025-09-09 05:37:50.710194+00
a38f8fd5-012b-4494-b6c6-eede790099f8	10421	"lack"은 "락" (rock, 바위)처럼 딱딱하게 막혀서 부족한 것을 상징해요!  🪨  마치 바위가 길을 막아서 목표에 도달하지 못하는 것처럼, "lack"은 필요한 것이 부족해서 뭔가를 할 수 없는 상태를 나타내죠! 😊	AI 도우미 🤖	\N	2025-09-09 05:38:01.647316+00
93dbf6fa-3807-4d9b-9887-0be1e7cedeba	12512	"ทำอะไรอย่" (탐아라이욕) 발음이 "탐 아! 라이옥!" 처럼 들리죠?  탐정이 "아!" 하고 외치며 범인의 흔적(라이옥! 라이온의 발자국처럼 생긴 흔적!)을 찾는 상황을 상상해보세요! 🕵️‍♂️  탐정이 범인을 잡기 위해 뭐하고 있는지 묻는 것처럼,  "탐아라이욕? (뭐하고 있니?)" 라고 생각하면 쉽게 기억될 거예요! 😊	AI 도우미 🤖	\N	2025-09-09 06:05:13.531534+00
edfc3f3e-fac8-46fc-b5d7-7cda6ee11af9	12514	"เดี๋ยว ก่อน" (디아오 곤)을 "디어, 곤란해!" 라고 생각해 보세요!  급한 일이 생겨 친구에게 "잠깐만 기다려!"라고 외치는 상황을 떠올리면서, "디어(애인)야, 곤란해! 잠깐만 기다려줘!" 라고 외치는 모습을 상상하면 기억하기 쉽겠죠? 😉😄	AI 도우미 🤖	\N	2025-09-09 06:05:43.728549+00
36af2231-08da-48f0-883d-4b3d68d93215	1992	"Knowledgeable"은 "놀라울 정도로 지식이 많은" 이라고 생각해봐요!  "Know" (알다)에 "ledge" (선반, 지식의 선반을 떠올려 보세요!)가 붙어서,  지식의 선반이 놀라울 정도로 가득 차 있는 모습을 상상하면 쉽게 기억할 수 있답니다. 🤩📚	AI 도우미 🤖	\N	2025-09-09 06:43:55.007034+00
dd6ca416-8630-4830-bfbe-2257d53e9257	9651	그럴때는 랜덤을 ㅋㅋㅋㅋ	익명	\N	2025-09-09 07:03:42.392711+00
06598869-b113-41d8-910e-77c2612cdf32	5401	"Abstain"은 "앱스테인"으로 들리죠?  🍺  "앱(App)을 스테인(Stain, 얼룩)처럼 붙잡고 있지 않고,  앱을 잠시 멀리 한다!" 라고 생각해보세요.  술앱을 멀리하고 절주하는 모습을 상상하면 "삼가다"라는 뜻이 쉽게 기억날 거예요! 😉	AI 도우미 🤖	\N	2025-09-09 07:24:42.588434+00
ad80a636-478e-4ff1-b6db-6e9e7213c522	5398	"Abscond"는 "앱스콘드"라고 발음되는데, "앱" (app, 어플리케이션)을 몰래 "스콘드" (scoot, 쏜살같이 달리다)처럼 도망치는 모습을 상상해보세요! 🤫💨  마치 범죄를 저지른 후 어플을 삭제하고 도망가는 악당 같죠!	AI 도우미 🤖	\N	2025-09-09 07:34:32.5679+00
30a784f9-3cbd-4e28-bd83-7866ac3a54c0	5397	"Abruptly"는 "어 브럽 틀리"  처럼 들리죠?  😲  마치 친구가 브런치 약속을 "어! 브런치? 틀렸어! 지금 당장 회의야!" 하고 갑자기 취소하는 모습을 상상해보세요!  브런치 약속이 갑자기(abruptly) 틀어진 거죠! 😄	AI 도우미 🤖	\N	2025-09-09 07:34:40.382248+00
5d5887ff-fed3-49bc-9d26-5c53879a39b1	5394	"abreast"는 "어 브레스트"니까,  "어깨를 브이(V)자로 만들고 나란히 브레이크를 잡는 자전거 두 대"를 떠올려 보세요! 🚴‍♀️🚴‍♂️  두 자전거가 나란히 달리는 모습이 "abreast"의 의미인 나란히, 병행하는 것을 딱 떠올리게 해줄 거예요.	AI 도우미 🤖	\N	2025-09-09 07:34:51.454087+00
cb37320e-0085-4276-9c71-57267e56d6c0	3342	"Abate"는 "에이베이트"라고 발음되는데,  "에이, 베이트(베팅) 좀 줄여!" 라고 생각해보세요!  😡  마치 카지노에서 무리하게 베팅하는 친구를 말리는 장면처럼,  'abate'는 뭔가를 줄이거나 약화시킨다는 뜻이죠! 😄	AI 도우미 🤖	\N	2025-09-09 08:03:24.02607+00
67cf3f42-7afc-44ed-a16b-32c2091bb6ba	15590	"Knowledgeable"은 "놀라울 정도로 지식이 많은" 이라는 뜻이죠!  🤓  "Know" (알다)에  "ledge" (선반, 층)을 붙여 생각해보세요.  마치 지식이 가득 차서 넘쳐 흐르는 책 선반들이 층층이 쌓여있는 모습을 상상하면 잊지 않겠죠? 👍	AI 도우미 🤖	\N	2025-09-09 08:03:37.818419+00
3dabdde9-acbd-4459-b934-d3a422a2e75e	15591	"Recognize"는 "리-커-나이즈"니까,  "리코(리코타 치즈처럼 부드러운) + 커나이즈(커다란 아이즈, 눈)" 로 생각해봐요!  🎉  커다란 눈으로 리코타 치즈처럼 부드럽고 정확하게 알아보고, 그 공로를 인정하는 거죠!	AI 도우미 🤖	\N	2025-09-09 08:04:03.718956+00
3bd29460-602a-4cb3-a052-44dc927eb8b7	15602	"recognizable"은 "알아볼 수 있는"이라는 뜻인데,  "recognize" (인식하다)에 "-able" (할 수 있는)이 붙은 거죠!  그래서  "리커그나이저블"을 "리커(리커는 술!) + 그나이저블(그냥 저 블!) =  술 마시고 뻗어서 다음 날 아침에도 "저 블!" 하고 알아볼 수 있을 만큼 익숙한, 인식 가능한!" 이라고 생각하면 재밌어요! 🤣👍	AI 도우미 🤖	\N	2025-09-09 11:18:21.751708+00
a4282244-f15e-4b6a-8b62-058020f7c486	3577	"backlash"는 "백래시"처럼 들리죠?  백(100) 개의 래시가드 입은 사람들이  😡  갑자기 당신을 향해  "시끄러워! 반대야!" 라고 소리치는 장면을 상상해보세요!  그게 바로 강한 반발, backlash 입니다! 😄	AI 도우미 🤖	\N	2025-09-09 11:42:38.974736+00
9cae8815-3e32-48d1-bf84-745ecda117d8	15594	"Regulation"은 "레귤레이션"인데,  "레기(적게)" + "울레이션(울부짖는 소리)" 처럼 생각해보세요!  규제가 심하면 자유가 적어져서 사람들이 울부짖는 소리가 들릴 것 같잖아요? 😭  규제는 자유를 적게 만드는 울부짖음이라고 기억하면 재밌겠죠! 😄	AI 도우미 🤖	\N	2025-09-09 13:55:50.278416+00
3cb316ee-a4b6-482b-a596-fedc01be5998	15595	"precisely"는 "프리사이즐리"  발음이 "프라이스(값) + 아이즐리(정확히)" 같죠?  💰  마치 정확한 가격을 말할 때처럼,  "프라이스, 아이즐리!  정확히 100원입니다!" 라고 외치는 상인을 떠올리세요!  그럼 "precisely = 정확히" 가 딱! 기억날 거예요. 😊	AI 도우미 🤖	\N	2025-09-09 13:56:12.881669+00
ae19f6c2-91d0-4db5-a3b3-b25a61cec9eb	15591	"Recognize"는 "리커나이즈"니까,  "리커(리커는 술이잖아!)"  마신 후  "나이즈(나이스!)"하게  내 공로를  알아주는  모습을 상상해봐! 🤩  마치 술 마시고 기분 좋아서 내 능력을 자랑하는 것처럼! 🍾	AI 도우미 🤖	\N	2025-09-09 22:11:04.25248+00
190c1e13-55f2-4544-913f-65b4e23f3938	15596	"Perspective"는 "퍼스펙티브"라고 읽으니, "퍼(퍼붓다) 스펙(스펙타클한) 티브(티비) 광고"를 떠올려봐요!  마치 티비 광고처럼 다양한 각도에서 퍼붓는 스펙타클한 장면들을 보면서,  각기 다른 관점(perspective)을 이해하는 거죠! ✨😎	AI 도우미 🤖	\N	2025-09-09 22:14:48.684133+00
\.


--
-- TOC entry 4127 (class 0 OID 17905)
-- Dependencies: 350
-- Data for Name: words; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.words (id, english, korean, pronunciation, part_of_speech, tip, category, difficulty) FROM stdin;
8	creativity	창조성	\N	\N	\N		하
10	tend to Root	하는 경향이 있다	\N	\N	\N		기타
11	celebrate	기념하다	\N	\N	\N		하
12	woodcutter	나무꾼	\N	\N	\N		중
13	hut	오두막	\N	\N	\N		하
14	by signalling	신호로서	\N	\N	\N		기타
15	indicate	가리키다	\N	\N	\N		하
16	gratitude	감사	\N	\N	\N		하
17	scold	꾸짖다 비난하다	\N	\N	\N		중
18	care for	돌보다	\N	\N	\N		기타
19	look after	돌보다	\N	\N	\N		기타
21	natural response	자연스러운 반응	\N	\N	\N		기타
22	According to	에 따르면	\N	\N	\N		기타
23	recent study	최근의 연구	\N	\N	\N		기타
24	do harm	해가 되다	\N	\N	\N		기타
25	keep going on	계속해서 해나가다	\N	\N	\N		기타
26	courage	용기	\N	\N	\N		하
27	courageous	용기 있는	\N	\N	\N		하
28	encourage	격려하다 용기를 주다	\N	\N	\N		하
29	encouragement	격려	\N	\N	\N		하
30	discourage	실망시키다 낙담시키다	\N	\N	\N		하
31	recover	회복하다	\N	\N	\N		하
32	benefit	이익	\N	\N	\N		하
34	activity	활동	\N	\N	\N		하
35	inactivity	비 활동	\N	\N	\N		하
36	muscle weakness	근육약화	\N	\N	\N		기타
37	depress	우울하게 만들다	\N	\N	\N		하
38	depression	우울증	\N	\N	\N		하
39	awesome	멋진 근사한 두려운	\N	\N	\N		하
40	awesome trick	멋진 묘기	\N	\N	\N		기타
41	amazing animal	놀라운 동물	\N	\N	\N		기타
42	accompany	동반하다 수반하다	\N	\N	\N		하
44	grand	웅장한	\N	\N	\N		하
45	grand prize	대상	\N	\N	\N		기타
46	include	포함하다	\N	\N	\N		하
47	accommodations	숙박	\N	\N	\N		하
48	encyclopedia	백과사전	\N	\N	\N		하
49	the unique appeal	독특한 매력	\N	\N	\N		기타
50	slim plates	가느다란 판	\N	\N	\N		기타
51	enable A to Root A	가 하는 것을 가능하게하다	\N	\N	\N		기타
52	powerproducing	동력을 발생시키는	\N	\N	\N		기타
53	device	장치	\N	\N	\N		하
54	expert	전문가 숙련가	\N	\N	\N		하
55	advanced form	진보된 형태	\N	\N	\N		기타
57	soar	하늘로 솟아오르다	\N	\N	\N		하
59	census	인구조사	\N	\N	\N		하
60	bureau	사무소 국	\N	\N	\N		하
61	census bureau	인구조사국	\N	\N	\N		기타
62	popularity	인기	\N	\N	\N		하
63	population	인구	\N	\N	\N		하
64	calculate	계산하다	\N	\N	\N		하
65	million	억	\N	\N	\N		하
66	conduct	수행하다	\N	\N	\N		하
67	predict	예측하다	\N	\N	\N		하
68	omit	생략하다 누락하다	\N	\N	\N		하
69	illegal immigrant	불법이민자	\N	\N	\N		기타
70	precise	정확한	\N	\N	\N		하
72	somewhat close	다소 근접한	\N	\N	\N		기타
73	comic strip	연재만화	\N	\N	\N		기타
74	remark	말하다 언급하다	\N	\N	\N		하
75	mound	투수 마운드	\N	\N	\N		하
76	faith	신념 확신	\N	\N	\N		하
79	as it were	즉 다시 말해서	\N	\N	\N		기타
80	that is	즉 다시 말해서	\N	\N	\N		기타
81	the lack of faith	신념확신의 결핍	\N	\N	\N		기타
82	pursuit	추구	\N	\N	\N		하
83	the pursuit of happiness	행복의 추구	\N	\N	\N		기타
84	demand	요구 수요	\N	\N	\N		하
85	realization	실현 현실화	\N	\N	\N		하
86	frightened	두려운	\N	\N	\N		하
87	scared	두려운	\N	\N	\N		하
89	dogs biting people	사람을 무는 개들	\N	\N	\N		기타
90	rush into action	즉시 행동에 옮기다	\N	\N	\N		기타
91	bite bit bitten	물다	\N	\N	\N		기타
92	in this case	이런 경우에	\N	\N	\N		기타
93	protect	보호하다	\N	\N	\N		하
94	award	상	\N	\N	\N		하
95	reward	보상	\N	\N	\N		하
97	approach	접근하다	\N	\N	\N		하
98	lawyer	변호사	\N	\N	\N		하
99	commute	통근하다	\N	\N	\N		하
100	commuter train	통근기차	\N	\N	\N		기타
101	CEO	최고경영자	\N	\N	\N		하
103	principle	원리 원칙	\N	\N	\N		하
104	daydream	공상에 잠기다	\N	\N	\N		하
105	complain	불평하다	\N	\N	\N		하
106	complaint	불평	\N	\N	\N		하
107	reluctant to Root	마지못해서 하다	\N	\N	\N		기타
108	be willing to Root	기꺼이 하다	\N	\N	\N		기타
109	opportunity	기회	\N	\N	\N		하
110	behavior	행동 처신	\N	\N	\N		하
111	instinct	본능	\N	\N	\N		하
113	play a role	역할을 하다	\N	\N	\N		기타
115	mammal	포유동물	\N	\N	\N		하
116	genetic characters	유전적 특성	\N	\N	\N		기타
117	complex	복잡한	\N	\N	\N		하
118	process	과정 절차	\N	\N	\N		하
119	enormous	거대한 막대한	\N	\N	\N		하
120	tumble	구르다	\N	\N	\N		하
122	stair	계단	\N	\N	\N		하
123	below me	내 아래	\N	\N	\N		기타
124	stretch	쭉 뻗다 잡아 늘리다	\N	\N	\N		하
125	stare at	빤히 쳐다 보다 응시하다	\N	\N	\N		기타
126	scrap	까지다 찢어지다	\N	\N	\N		하
127	grateful	감사해하는	\N	\N	\N		하
128	pleased	기쁜	\N	\N	\N		하
2	needle	바늘	\N	\N	\N		하
4	distribute	분배하다	\N	\N	\N		하
5	distributor	분배업자 도매상인	\N	\N	\N		하
6	for oneself	혼자의 힘으로	\N	\N	\N		기타
7	feature n v	특징 특징을 이루다	\N	\N	\N		기타
58	obstacle	장애물	\N	\N	\N		하
137	garbage	쓰레기	\N	\N	\N		하
138	litter	더럽히다	\N	\N	\N		하
139	seriously	심각하게 진지하게	\N	\N	\N		하
141	flexible	유연한	\N	\N	\N		하
142	flexibility	유연성	\N	\N	\N		하
143	mobility	움직임	\N	\N	\N		하
144	moral	도덕적인	\N	\N	\N		하
145	immoral	비도덕적인	\N	\N	\N		하
146	morality	도덕성	\N	\N	\N		하
147	inform	알리다	\N	\N	\N		하
149	perform	수행하다	\N	\N	\N		하
150	suffer from	로 고통 받다	\N	\N	\N		기타
151	differ from	과 다르다	\N	\N	\N		기타
152	spine	척추	\N	\N	\N		하
153	oxygen	산소	\N	\N	\N		하
155	tissue	조직	\N	\N	\N		하
156	maintain	유지하다	\N	\N	\N		하
157	everyday routine	일상생활	\N	\N	\N		기타
158	stiff	뻐근한 뻣뻣한	\N	\N	\N		하
159	aching back	욱신거리는 등	\N	\N	\N		기타
160	fasten	고정시키다	\N	\N	\N		하
161	horizontally	수평으로	\N	\N	\N		하
162	vertically	수직으로	\N	\N	\N		하
163	grindgroundground	갈다	\N	\N	\N		기타
164	grinding device	가는 기계	\N	\N	\N		기타
166	be used to ing	하는데 익숙하다	\N	\N	\N		기타
167	used to Root	하곤 했다	\N	\N	\N		기타
168	flour	밀가루	\N	\N	\N		하
169	paste	반죽	\N	\N	\N		하
170	grain	곡물	\N	\N	\N		하
171	mill n v	분쇄기 가루로 만들다	\N	\N	\N		기타
172	in addition	게다가	\N	\N	\N		기타
173	attach	붙이다 부착하다	\N	\N	\N		하
174	detach	떨어뜨리다 분리하다	\N	\N	\N		하
175	the grain jammed	짓눌려진 곡물	\N	\N	\N		기타
176	groove	홈	\N	\N	\N		하
177	concept	개념	\N	\N	\N		하
178	care	보살핌	\N	\N	\N		하
180	comfort	안락 위안	\N	\N	\N		하
181	support	지원 지지 지원하다	\N	\N	\N		하
182	lifelimiting illness	불치병	\N	\N	\N		기타
183	no longer	더 이상 이 아니다	\N	\N	\N		기타
184	respond to	에 반응하다	\N	\N	\N		기타
185	treatment	치료	\N	\N	\N		하
186	human dignity	인간의 존엄성	\N	\N	\N		기타
187	counseling service	상담서비스	\N	\N	\N		기타
189	professional	전문가	\N	\N	\N		하
191	spiritual impact	정신적 충격	\N	\N	\N		기타
192	emotional	정신적인 감성적인	\N	\N	\N		하
193	something complex	복잡한 무엇인가	\N	\N	\N		기타
194	scribble	갈겨쓰다	\N	\N	\N		하
195	necessary	필요한	\N	\N	\N		하
197	avoid	피하다	\N	\N	\N		하
198	erase	지우다	\N	\N	\N		하
199	refer to	언급하다 말하다	\N	\N	\N		기타
200	if necessary	필요하다면	\N	\N	\N		기타
201	attract	유혹하다 마음을 끌어당기다	\N	\N	\N		하
202	attention	관심	\N	\N	\N		하
203	effectively	효과적으로	\N	\N	\N		하
204	explain	설명하다	\N	\N	\N		하
205	explanation	설명	\N	\N	\N		하
207	in contrast	반대로	\N	\N	\N		기타
208	positive	긍정적인	\N	\N	\N		하
209	negative	부정적인	\N	\N	\N		하
210	competition	경쟁	\N	\N	\N		하
211	attitude	태도	\N	\N	\N		하
212	overcome	극복하다	\N	\N	\N		하
213	defeat	부수다 이기다	\N	\N	\N		하
214	recognize	인식하다	\N	\N	\N		하
215	focus on	초점을 맞추다	\N	\N	\N		기타
216	weakness	약점	\N	\N	\N		하
217	explorer	탐험가	\N	\N	\N		하
219	caravan	여행 대	\N	\N	\N		하
220	award n v	상 상을 주다	\N	\N	\N		기타
221	reward n v	보상 보상하다	\N	\N	\N		기타
224	in theory	이론상	\N	\N	\N		기타
225	particular path	특별한 길	\N	\N	\N		기타
226	equip	장비를 갖추다	\N	\N	\N		하
227	equipment	장비	\N	\N	\N		하
228	take over	양도받다 물려받다	\N	\N	\N		기타
229	aging population	노령인구	\N	\N	\N		기타
230	above graph	위 도표	\N	\N	\N		기타
231	elderly people	노인	\N	\N	\N		기타
233	while	반면에 동안	\N	\N	\N		하
234	gradual rise	점차적인 증가	\N	\N	\N		기타
235	figure	숫자 모양	\N	\N	\N		하
236	social context	사회적 상황	\N	\N	\N		기타
237	various	다양한	\N	\N	\N		하
238	male	남성의	\N	\N	\N		하
239	female	여성의	\N	\N	\N		하
240	happen to Root	우연히 알게 되다	\N	\N	\N		기타
241	researcher	학자 연구자	\N	\N	\N		하
242	prove	증명하다	\N	\N	\N		하
243	pregnant	임신한	\N	\N	\N		하
244	pregnancy	임신	\N	\N	\N		하
246	male hormone	남성호르몬	\N	\N	\N		기타
247	due to	때문에	\N	\N	\N		기타
249	communicative connection	의사소통연결고리	\N	\N	\N		기타
250	three times	세배	\N	\N	\N		기타
251	floor	가속페달을 밟다	\N	\N	\N		하
252	slam	쾅 부딪히다	\N	\N	\N		하
254	all at once	갑자기	\N	\N	\N		기타
255	explode	폭발하다	\N	\N	\N		하
256	explosion	폭발	\N	\N	\N		하
257	gunshop	총격	\N	\N	\N		기타
258	head for	로 향하다	\N	\N	\N		기타
259	teartoretorn	찢다	\N	\N	\N		기타
260	torn metal	찢겨진 금속	\N	\N	\N		기타
261	spin spanspun	돌다	\N	\N	\N		기타
132	cigarette butt	담배 공초	\N	\N	\N		기타
133	food container	음식물 용기	\N	\N	\N		기타
134	vehicle	탈 것 차량	\N	\N	\N		하
135	rubbish	쓰레기	\N	\N	\N		하
269	colleague	동료	\N	\N	\N		하
270	customer	고객	\N	\N	\N		하
272	gladiator	검투사	\N	\N	\N		하
273	battle	전투	\N	\N	\N		하
274	weary	피로한 지친	\N	\N	\N		하
275	wearily	지쳐서	\N	\N	\N		중
277	regain	되찾다	\N	\N	\N		하
278	calmness	평온함 안정	\N	\N	\N		하
279	this sorry scenario	이 슬픈 상황	\N	\N	\N		기타
280	scenario	극본 상황 대본	\N	\N	\N		하
281	greet	인사하다	\N	\N	\N		하
283	bamboo	대나무	\N	\N	\N		하
284	stick	막대기	\N	\N	\N		하
285	gunpowder	화약	\N	\N	\N		하
286	explode	폭발시키다	\N	\N	\N		하
288	evil spirits	악령	\N	\N	\N		기타
289	various	다양한	\N	\N	\N		하
290	describe	묘사하다 서술하다	\N	\N	\N		하
291	bomb	폭탄	\N	\N	\N		하
292	burst	터지다 폭발하다	\N	\N	\N		하
293	key part	중요한 역할	\N	\N	\N		기타
294	celebrate	축하하다	\N	\N	\N		하
295	national holidays	국경일	\N	\N	\N		기타
296	cultural events	문화 행사	\N	\N	\N		기타
298	increase	증가시키다	\N	\N	\N		하
299	total	전체의	\N	\N	\N		하
300	level	수준	\N	\N	\N		하
301	grease	기름 지방	\N	\N	\N		하
302	sink	부엌 싱크대	\N	\N	\N		하
303	that is	즉 다시 말하면	\N	\N	\N		기타
304	block up	막다 방해하다	\N	\N	\N		기타
305	blood vessel	혈관	\N	\N	\N		기타
306	as a result	그 결과	\N	\N	\N		기타
308	smooth	부드러운 유연한	\N	\N	\N		하
309	contain	포함하다 이 들어 있다	\N	\N	\N		하
310	be likely toR R	할 것 같다	\N	\N	\N		기타
311	heart disease	심장 질환	\N	\N	\N		기타
312	therefore	그러므로	\N	\N	\N		하
313	communicate with	와 의사소통하다	\N	\N	\N		기타
314	insect	곤충	\N	\N	\N		하
315	such as	와 같은	\N	\N	\N		기타
316	over there	저쪽에	\N	\N	\N		기타
317	by sight	시각으로	\N	\N	\N		기타
318	a ind of	일종의	\N	\N	\N		기타
321	whale	고래	\N	\N	\N		하
322	exchange	교환하다	\N	\N	\N		하
323	symbol	상징	\N	\N	\N		하
324	represent	말하다 표현하다	\N	\N	\N		하
325	thought	생각	\N	\N	\N		하
326	ease	덜다 완화시키다	\N	\N	\N		하
327	pain	고통	\N	\N	\N		하
328	loss	상실 잃음	\N	\N	\N		하
329	special	특별한	\N	\N	\N		하
330	in many ways	여러 면에서	\N	\N	\N		기타
332	passion	열정	\N	\N	\N		하
333	pleasure	기쁨	\N	\N	\N		하
334	cherish	소중히 하다	\N	\N	\N		하
335	funeral	장례식	\N	\N	\N		하
336	come by	에 들리다	\N	\N	\N		기타
337	in the meantime	그사이에	\N	\N	\N		기타
339	take time from sleep	잠 잘 시간을 뺐다	\N	\N	\N		기타
340	supper	저녁식사	\N	\N	\N		하
341	society	사회	\N	\N	\N		하
342	open	열려있는	\N	\N	\N		하
343	company	회사	\N	\N	\N		하
344	employee	종업원 사원	\N	\N	\N		하
345	television station TV	방송국	\N	\N	\N		기타
346	broadcast	방송하다	\N	\N	\N		하
347	these days	요즘	\N	\N	\N		기타
348	common	일반적인	\N	\N	\N		하
349	express	표현하다	\N	\N	\N		하
350	romantic	낭만적인	\N	\N	\N		하
351	nervous	흥분하기 쉬운	\N	\N	\N		하
352	decoration	장식	\N	\N	\N		하
354	anniversary	기념일	\N	\N	\N		하
355	selected	선택된	\N	\N	\N		하
356	select	선택하다	\N	\N	\N		하
357	present	에게 주다	\N	\N	\N		하
358	celebration	축하	\N	\N	\N		하
360	opinion	의견	\N	\N	\N		하
361	get along with	와 사이좋게 지내다	\N	\N	\N		기타
362	dont have toR R	할 필요 없다	\N	\N	\N		기타
363	difference	차이	\N	\N	\N		하
365	negative	부정적인	\N	\N	\N		하
366	thought	생각	\N	\N	\N		하
367	that is	즉	\N	\N	\N		기타
369	intelligent	지적인	\N	\N	\N		하
370	bowl	주발 공기	\N	\N	\N		하
371	separate	떼어 놓다	\N	\N	\N		하
372	immediately	즉시	\N	\N	\N		하
373	notice	알아차리다	\N	\N	\N		하
374	behave	행동하다	\N	\N	\N		하
376	bang	쾅 부딪히다	\N	\N	\N		하
377	miss	그리워하다	\N	\N	\N		하
378	float	뜨다 표류하다	\N	\N	\N		하
379	surface	표면	\N	\N	\N		하
380	broken heart	실연	\N	\N	\N		기타
381	temperature	온도	\N	\N	\N		하
382	lack	부족 결핍	\N	\N	\N		하
384	rare	보기 드문 희귀한	\N	\N	\N		하
385	researcher	연구조사원	\N	\N	\N		하
386	search for	을 찾다	\N	\N	\N		기타
387	avoid	피하다	\N	\N	\N		하
389	purple	보라색	\N	\N	\N		하
390	dye	염색하다	\N	\N	\N		하
391	serve	음식을 차려내다	\N	\N	\N		하
392	appetite	식욕	\N	\N	\N		하
393	on the other hand	반면에	\N	\N	\N		기타
394	decoration	장식	\N	\N	\N		하
395	most of	대부분	\N	\N	\N		기타
397	poetry	시	\N	\N	\N		하
399	education	교육	\N	\N	\N		하
264	urgent	다급한 긴박한	\N	\N	\N		하
266	promising	가망 있는 유망한	\N	\N	\N		하
364	accept	받아들이다	\N	\N	\N		하
267	pressure	압력 압박	\N	\N	\N		하
268	exhausted	녹초가 된 기진맥진한	\N	\N	\N		하
398	common	일반적인	\N	\N	\N		하
407	describe	묘사하다 서술하다	\N	\N	\N		하
408	tearful	눈물어린	\N	\N	\N		하
409	deeply	짙게 몹시	\N	\N	\N		하
410	move	감동시키다	\N	\N	\N		하
411	relationship	관계	\N	\N	\N		하
412	form	형성하다	\N	\N	\N		하
414	amazing	놀라운	\N	\N	\N		하
415	point	어떤 특정한 때 시점 순간 찰나	\N	\N	\N		하
416	effort	노력	\N	\N	\N		하
417	truly	진심으로	\N	\N	\N		하
418	depend on	에 의존하다	\N	\N	\N		기타
420	increase	증가시키다	\N	\N	\N		하
421	amount	양 총계	\N	\N	\N		하
422	carbon	탄소	\N	\N	\N		하
423	cause	의 원인이 되다	\N	\N	\N		하
425	in order toR R	하기 위하여	\N	\N	\N		기타
426	avoid	피하다	\N	\N	\N		하
427	sources of energy	에너지 원	\N	\N	\N		기타
428	solar energy	태양 에너지	\N	\N	\N		기타
429	produce	생산하다	\N	\N	\N		하
430	electricity	전기	\N	\N	\N		하
431	take steps	조치를 취하다	\N	\N	\N		기타
432	skin	피부	\N	\N	\N		하
433	most of	대부분	\N	\N	\N		기타
435	select	고르다 선택하다	\N	\N	\N		하
436	heat	열	\N	\N	\N		하
437	dirt	오물	\N	\N	\N		하
438	for instance	예를 들어	\N	\N	\N		기타
439	function	기능	\N	\N	\N		하
441	sense of touch	촉감	\N	\N	\N		기타
442	sense	감각	\N	\N	\N		하
443	difference	차이	\N	\N	\N		하
444	rough	거친	\N	\N	\N		하
445	smooth	부드러운	\N	\N	\N		하
446	surface	표면	\N	\N	\N		하
447	determine	결정하다	\N	\N	\N		하
448	slightly	약간	\N	\N	\N		하
449	pale	창백한	\N	\N	\N		하
450	sign	징조 조짐	\N	\N	\N		하
452	illness	병	\N	\N	\N		하
453	camel	낙타	\N	\N	\N		하
454	spin	회전	\N	\N	\N		하
455	spin move	회전동작	\N	\N	\N		기타
457	general	일반적인	\N	\N	\N		하
458	shape	모양 형태	\N	\N	\N		하
459	letter	글자 문자	\N	\N	\N		하
460	stretch	뻗치다	\N	\N	\N		하
461	side by side	나란히	\N	\N	\N		기타
462	upper body	상체	\N	\N	\N		기타
463	bend	구부리다	\N	\N	\N		하
464	forward	앞쪽으로	\N	\N	\N		하
465	straight line	직선	\N	\N	\N		기타
467	either	둘 중 하나	\N	\N	\N		하
468	backward	뒤쪽으로	\N	\N	\N		하
469	among	사이에	\N	\N	\N		하
470	play a role	역할을 하다	\N	\N	\N		기타
471	path	길	\N	\N	\N		하
473	attract	끌다 매혹하다	\N	\N	\N		하
474	male	수컷의	\N	\N	\N		하
475	worker bee	일 벌	\N	\N	\N		기타
477	affect	영향을 주다	\N	\N	\N		하
478	human beings	인간	\N	\N	\N		기타
479	discover	발견하다	\N	\N	\N		하
480	fall in love	사랑에 빠지다	\N	\N	\N		기타
481	relation	관계	\N	\N	\N		하
482	govern	통치하다	\N	\N	\N		하
484	imagine	상상하다	\N	\N	\N		하
485	hate	증오하다	\N	\N	\N		하
486	last	지속하다 계속하다	\N	\N	\N		하
487	clearly	분명하게	\N	\N	\N		하
488	nap	낮잠	\N	\N	\N		하
491	relax	긴장을 풀다	\N	\N	\N		하
492	fairly	꽤 매우	\N	\N	\N		하
493	slow down	속도가떨어뜨리다	\N	\N	\N		기타
494	beat	심장이 뛰다	\N	\N	\N		하
495	breathe	숨 쉬다	\N	\N	\N		하
497	digestion	소화	\N	\N	\N		하
498	stomach	위장	\N	\N	\N		하
499	digest	소화시키다	\N	\N	\N		하
501	refer to	언급하다	\N	\N	\N		기타
502	spine	등뼈 가시	\N	\N	\N		하
503	mainly	주로	\N	\N	\N		하
504	produce	생산하다	\N	\N	\N		하
505	various	다양한	\N	\N	\N		하
506	root	뿌리	\N	\N	\N		하
507	treat	치료하다	\N	\N	\N		하
508	fever	열 열병	\N	\N	\N		하
509	creature	동물 생물	\N	\N	\N		하
510	sharp	날카로운	\N	\N	\N		하
511	rat	쥐	\N	\N	\N		하
512	squirrel	다람쥐	\N	\N	\N		하
513	amazingly	놀랍게	\N	\N	\N		하
514	active	활동적인	\N	\N	\N		하
515	evil	나쁜 사악한	\N	\N	\N		하
516	sight	시력	\N	\N	\N		하
517	above	위	\N	\N	\N		하
518	prefer	더 좋아하다	\N	\N	\N		하
519	silver	은 은색	\N	\N	\N		하
520	four out of ten	개중에서 넷	\N	\N	\N		기타
521	in ing ing	할 때	\N	\N	\N		기타
522	advertiser	광고주	\N	\N	\N		하
523	consider	고려하다	\N	\N	\N		하
524	culture	문화	\N	\N	\N		하
525	advertisement	광고	\N	\N	\N		하
526	describe	묘사하다 설명하다	\N	\N	\N		하
527	product	제품	\N	\N	\N		하
528	explain	설명하다	\N	\N	\N		하
530	in this case	이런 경우에	\N	\N	\N		기타
531	commercial	상업광고	\N	\N	\N		하
532	goal	목표	\N	\N	\N		하
533	create	창조하다 만들다	\N	\N	\N		하
534	positive	긍정적인	\N	\N	\N		하
535	mood	기분 분위기	\N	\N	\N		하
536	disease	질병	\N	\N	\N		하
537	gene	유전자	\N	\N	\N		하
539	prevent	막다 예방하다	\N	\N	\N		하
401	indoor	실내의	\N	\N	\N		하
402	be full of	으로 가득 차다	\N	\N	\N		기타
404	feel like	처럼 느끼다	\N	\N	\N		기타
472	female	암컷의	\N	\N	\N		하
405	counselor	상담원 캠프지도자	\N	\N	\N		하
406	realize	깨닫다	\N	\N	\N		하
547	physical	신체의	\N	\N	\N		하
548	stuff	요소 음식물	\N	\N	\N		하
549	checkup	검사 건강 진단	\N	\N	\N		하
550	period	기간	\N	\N	\N		하
551	inventor	발명가	\N	\N	\N		하
552	architect	건축가	\N	\N	\N		하
554	most of	대부분	\N	\N	\N		기타
556	pet	애완동물	\N	\N	\N		하
557	these days	요즈음	\N	\N	\N		기타
558	almost	거의	\N	\N	\N		하
559	keep	기르다	\N	\N	\N		하
560	at least	최소한	\N	\N	\N		기타
562	carry	운반하다 휴대하다	\N	\N	\N		하
563	troublesome	골치 아픈	\N	\N	\N		하
564	anymore	더 이상	\N	\N	\N		하
565	company	회사	\N	\N	\N		하
566	product	제품	\N	\N	\N		하
568	shoulder	어깨	\N	\N	\N		하
570	all the time	항상	\N	\N	\N		기타
571	handwriting	필적 손으로 씀	\N	\N	\N		하
572	modern	현대의	\N	\N	\N		하
573	more than	이상	\N	\N	\N		기타
574	fingerprint	손금	\N	\N	\N		하
575	identify	확인하다	\N	\N	\N		하
577	sort	종류	\N	\N	\N		하
578	silent	조용한	\N	\N	\N		하
579	grave	무덤	\N	\N	\N		하
580	notice	알아차리다	\N	\N	\N		하
581	movement	움직임 동작	\N	\N	\N		하
582	behind	뒤	\N	\N	\N		하
584	hook	갈고리처럼 구부리다	\N	\N	\N		하
585	pointed	예리한 뾰족한	\N	\N	\N		하
586	unusual	유별난	\N	\N	\N		하
587	honeymoon	신혼여행	\N	\N	\N		하
588	turn on	켜다	\N	\N	\N		기타
589	poverty	가난	\N	\N	\N		하
591	nutrition	영양	\N	\N	\N		하
592	suggest	제안하다	\N	\N	\N		하
593	establish	설립하다	\N	\N	\N		하
594	organization	단체	\N	\N	\N		하
596	almost	거의	\N	\N	\N		하
597	volunteer	자원 봉사자	\N	\N	\N		하
598	lots of	많은	\N	\N	\N		기타
599	although	일지라도	\N	\N	\N		하
600	valuable	귀중한	\N	\N	\N		하
601	certain types of jobs	어떤 종류의 일	\N	\N	\N		기타
602	graduate	졸업하다	\N	\N	\N		하
603	moreover	더구나	\N	\N	\N		하
604	ability	능력	\N	\N	\N		하
605	consider	고려하다	\N	\N	\N		하
607	official	관리 공무원	\N	\N	\N		하
608	liar	거짓말쟁이	\N	\N	\N		하
609	cheat	속이다	\N	\N	\N		하
610	congratulate	축하하다	\N	\N	\N		하
611	victory	승리	\N	\N	\N		하
612	seriously	심각하게	\N	\N	\N		하
614	bill	청구서	\N	\N	\N		하
615	expense	경비 비용	\N	\N	\N		하
616	touch	감동시키다	\N	\N	\N		하
617	nod	고개를 끄덕이다	\N	\N	\N		하
618	worst	가장 나쁜	\N	\N	\N		하
621	get bored	지루해하다	\N	\N	\N		기타
623	certain	어떤	\N	\N	\N		하
624	area	분야 영역	\N	\N	\N		하
625	private	사적인	\N	\N	\N		하
626	exist	존재하다	\N	\N	\N		하
627	rare	희귀한 보기 드문	\N	\N	\N		하
628	purpose	목적	\N	\N	\N		하
629	used goods	중고품	\N	\N	\N		기타
630	necessity	필요 필수품	\N	\N	\N		하
631	value	가치	\N	\N	\N		하
632	set a goal	목표를 설정하다	\N	\N	\N		기타
633	ingredient	재료	\N	\N	\N		하
634	Mediterranean	지중해	\N	\N	\N		하
636	acquire	얻다	\N	\N	\N		하
637	instruction	교육 명령 지시	\N	\N	\N		하
638	enable	가능하게 하다 허락하다	\N	\N	\N		하
639	individual	개인 개개의	\N	\N	\N		하
641	aspect	외관 관점 용모	\N	\N	\N		하
642	influence	영향을 미치다	\N	\N	\N		하
643	interaction	상호 작용	\N	\N	\N		하
644	scale	규모	\N	\N	\N		하
645	property	재산 자산	\N	\N	\N		하
646	payment	지불 납입	\N	\N	\N		하
647	attachment	첨부물	\N	\N	\N		하
648	hesitate	망설이다 주저하다	\N	\N	\N		하
650	focus	집중하다	\N	\N	\N		하
651	knowledge	지식	\N	\N	\N		하
652	talent	재능	\N	\N	\N		하
653	condition	상태 조건	\N	\N	\N		하
654	worldwide	세계적인	\N	\N	\N		하
655	accomplish	이루다 성취하다	\N	\N	\N		하
656	attract	끌다 매혹하다	\N	\N	\N		하
657	be committed to	에 헌신하다	\N	\N	\N		기타
659	perform	이행하다 공연하다	\N	\N	\N		하
660	correctness	정확함	\N	\N	\N		하
661	share	공유하다	\N	\N	\N		하
662	operate	작동하다 움직이다	\N	\N	\N		하
663	inborn	타고난 선천적인	\N	\N	\N		하
664	physiology	생리학	\N	\N	\N		하
665	detect	감지하다	\N	\N	\N		하
666	sensitive	민감한	\N	\N	\N		하
668	determine	결정하다 결론내리다	\N	\N	\N		하
669	court	궁전 왕실	\N	\N	\N		하
670	conclude	결론내리다	\N	\N	\N		하
672	assume	역할 임무를 맡다	\N	\N	\N		하
673	expose	노출시키다	\N	\N	\N		하
674	organ	신체장기	\N	\N	\N		하
675	wear out	닳다	\N	\N	\N		기타
676	sustain	계속하다	\N	\N	\N		하
677	eventually	드디어 결국	\N	\N	\N		하
678	continually	계속해서	\N	\N	\N		하
541	form	형태	\N	\N	\N		하
542	heart disease	심장 질환	\N	\N	\N		기타
567	purse	지갑	\N	\N	\N		하
543	cancer	암	\N	\N	\N		하
619	humans	인간	\N	\N	\N		하
545	basics	기본 기초	\N	\N	\N		하
546	plenty of	많은	\N	\N	\N		기타
622	specialize	전문으로 다루다하다전공하다	\N	\N	\N		하
686	fascinating	매혹적인 황홀한	\N	\N	\N		하
687	slap	뺨때림	\N	\N	\N		하
689	discipline	훈련 수양	\N	\N	\N		하
690	actual	현실의	\N	\N	\N		하
691	completely	완전히 완벽하게	\N	\N	\N		하
692	quarter	분	\N	\N	\N		하
693	calendar	달력	\N	\N	\N		하
694	match up	조화를 이루다	\N	\N	\N		기타
695	orbit	궤도	\N	\N	\N		하
696	leap day	윤일	\N	\N	\N		기타
697	extend	확장하다	\N	\N	\N		하
699	visualize	눈에 보이게 하다	\N	\N	\N		하
700	disastrous	비참한 재난의	\N	\N	\N		하
701	productive	생산적인	\N	\N	\N		하
702	creative	창의적인	\N	\N	\N		하
703	joyful	반가운 즐거운	\N	\N	\N		하
704	fewer	보다 소수의	\N	\N	\N		하
706	prefer	선호하다	\N	\N	\N		하
708	secretary	비서	\N	\N	\N		하
709	invisible	보이지 않는	\N	\N	\N		하
710	translate	번역하다	\N	\N	\N		하
711	harmonious	조화된 균형 잡힌	\N	\N	\N		하
712	feature	특징	\N	\N	\N		하
713	confidence	신임 신용 신뢰	\N	\N	\N		하
714	sentence	문장	\N	\N	\N		하
716	statement	진술	\N	\N	\N		하
717	to the point	적절한	\N	\N	\N		기타
718	paragraph	절 단락	\N	\N	\N		하
719	statement	말해진 것 진술	\N	\N	\N		하
720	president	대통령 장	\N	\N	\N		하
721	calculate	계산하다	\N	\N	\N		하
723	belong to	에 속하다	\N	\N	\N		기타
724	take the place of	대체하다	\N	\N	\N		기타
725	turn off	잠그다	\N	\N	\N		기타
726	conserve	보존하다	\N	\N	\N		하
727	firmly	견고하게	\N	\N	\N		하
729	primitive	원시적인	\N	\N	\N		하
730	plenty of	많은	\N	\N	\N		기타
731	civilization	문명	\N	\N	\N		하
732	doubtful	의심을 품고 있는	\N	\N	\N		하
733	primitive	원시의	\N	\N	\N		하
734	engage	약속하다 보증하다	\N	\N	\N		하
735	efficient	능률적인 효과 있는	\N	\N	\N		하
736	inactive	활동하지 않은	\N	\N	\N		하
737	rude	무례한	\N	\N	\N		하
738	particularly	특별히	\N	\N	\N		하
739	chew	씹다	\N	\N	\N		하
741	spice	향료	\N	\N	\N		하
742	ginger	생강	\N	\N	\N		하
743	garlic	마늘	\N	\N	\N		하
744	ancient	고대의	\N	\N	\N		하
745	inequality	불평등	\N	\N	\N		하
746	statistics	통계	\N	\N	\N		하
747	wage	임금	\N	\N	\N		하
749	persuade	설득하다	\N	\N	\N		하
750	greatness	거대함 위대함	\N	\N	\N		하
751	potential	잠재력	\N	\N	\N		하
752	sparkling	반짝이는	\N	\N	\N		하
753	stuff	에 채우다	\N	\N	\N		하
754	squash	호박	\N	\N	\N		하
755	fig	무화과	\N	\N	\N		하
756	pat	가볍게 톡톡 치다	\N	\N	\N		하
757	servant	하인	\N	\N	\N		하
759	immigrant	이민 이주자	\N	\N	\N		하
760	identity	동일함 신원	\N	\N	\N		하
761	academic	학원의 대학의	\N	\N	\N		하
762	failure	실패 실수	\N	\N	\N		하
764	selfesteem	자존심 자부심	\N	\N	\N		기타
765	adjust	조정하다 조절하다	\N	\N	\N		하
766	opportunity	기회	\N	\N	\N		하
767	behave	행동하다	\N	\N	\N		하
768	badly	나쁘게	\N	\N	\N		하
769	polite	예의바른	\N	\N	\N		하
770	exhausted	지친 힘든	\N	\N	\N		하
772	pain	고통	\N	\N	\N		하
773	annoyance	짜증	\N	\N	\N		하
774	accept	수용하다 받아들이다	\N	\N	\N		하
775	complain	불평하다	\N	\N	\N		하
777	patience	인내력	\N	\N	\N		하
778	curiosity	호기심	\N	\N	\N		하
779	creativity	창의력	\N	\N	\N		하
780	export	수출하다	\N	\N	\N		하
781	recognize	인식하다	\N	\N	\N		하
782	excellence	우수성	\N	\N	\N		하
783	match	어울리다	\N	\N	\N		하
784	pronunciation	발음	\N	\N	\N		하
684	camper	야영객	\N	\N	\N		하
785	represent	나타내다	\N	\N	\N		하
786	actually	실제로	\N	\N	\N		하
790	pet	애완동물	\N	\N	\N		하
791	human	인간	\N	\N	\N		하
792	raise	기르다	\N	\N	\N		하
793	ancient	고대의	\N	\N	\N		하
794	spiritual	정신의 영혼의	\N	\N	\N		하
795	attractive	매력적인	\N	\N	\N		하
796	piece	조각	\N	\N	\N		하
797	recently	최근에	\N	\N	\N		하
798	bone	뼈	\N	\N	\N		하
799	remains	유해	\N	\N	\N		하
800	vacation	휴가 방학	\N	\N	\N		하
801	fortunately	다행히	\N	\N	\N		하
802	equipment	장비	\N	\N	\N		하
803	borrow	빌리다	\N	\N	\N		하
804	away from	멀리 떨어져	\N	\N	\N		기타
805	prefer to	더 좋아하다	\N	\N	\N		기타
806	though	라고 해도	\N	\N	\N		하
807	cheaper	더 저렴한	\N	\N	\N		하
808	dangerous	위험한	\N	\N	\N		하
809	robber	강도	\N	\N	\N		하
811	organize	조직하다	\N	\N	\N		하
812	wherever	어느 곳이든	\N	\N	\N		하
813	bravery	용기 용맹	\N	\N	\N		하
814	fine shooting	뛰어난 사격 솜씨	\N	\N	\N		기타
816	pistol	권총	\N	\N	\N		하
817	rifle	소총	\N	\N	\N		하
818	vocabulary	어휘력	\N	\N	\N		하
680	countryside	한 지방 시골	\N	\N	\N		하
683	individual	개인의	\N	\N	\N		하
682	annoying	괴롭히는	\N	\N	\N		하
707	graduation	졸업	\N	\N	\N		하
685	fortunate	운이 좋은 행운의	\N	\N	\N		하
824	neither	또한 아니다	\N	\N	\N		하
826	guess	추측하다	\N	\N	\N		하
827	meaning	의미	\N	\N	\N		하
828	measure	측정하다	\N	\N	\N		하
830	while	반면에	\N	\N	\N		하
831	some	어떤 사람들	\N	\N	\N		하
834	therefore	그래서 그리하여	\N	\N	\N		하
835	length	길이	\N	\N	\N		하
836	royal	왕의	\N	\N	\N		하
837	width	너비	\N	\N	\N		하
838	thumb	엄지손가락	\N	\N	\N		하
839	blame	비난하다	\N	\N	\N		하
840	international	국제적인	\N	\N	\N		하
842	reveal	발표하다	\N	\N	\N		하
843	list	목록	\N	\N	\N		하
844	latest	최신의	\N	\N	\N		하
845	phrase	어구	\N	\N	\N		하
846	select	선택하다	\N	\N	\N		하
847	gain popularity	인기를 얻다	\N	\N	\N		기타
849	evidence	증거	\N	\N	\N		하
850	publication	출판물	\N	\N	\N		하
851	president	사장	\N	\N	\N		하
852	ordinary people	평범한 사람들	\N	\N	\N		기타
853	delicious	맛있는	\N	\N	\N		하
854	aroma	향	\N	\N	\N		하
855	garlic	마늘	\N	\N	\N		하
856	widely	널리	\N	\N	\N		하
858	for instance	예를 들어	\N	\N	\N		기타
859	strength	힘	\N	\N	\N		하
860	courage	용기	\N	\N	\N		하
861	fought fight	싸우다의 과거	\N	\N	\N		기타
862	unknown	알려지지 않은	\N	\N	\N		하
864	frighten	겁나게 하다	\N	\N	\N		하
865	enemy	적 적군	\N	\N	\N		하
866	magic power	마술적인 힘	\N	\N	\N		기타
867	various taste	다양한 맛	\N	\N	\N		기타
868	different shape	다양한 형태	\N	\N	\N		기타
869	healing effect	치료 효과	\N	\N	\N		기타
870	economic value	경제적 가치	\N	\N	\N		기타
871	complain	불평하다	\N	\N	\N		하
872	fingerprint	지문	\N	\N	\N		하
874	index finger	검지손가락	\N	\N	\N		기타
875	scanner	인식기	\N	\N	\N		하
876	personal information	개인 정보	\N	\N	\N		기타
877	be concerned about	에 대해 염려하다	\N	\N	\N		기타
879	be supposed to	할 예정이다	\N	\N	\N		기타
880	be satisfied with	에 만족하다	\N	\N	\N		기타
881	transfer	옮기다	\N	\N	\N		하
882	gather	모으다	\N	\N	\N		하
883	state government	주정부	\N	\N	\N		기타
884	far from	멀리 떨어진	\N	\N	\N		기타
885	village	마을	\N	\N	\N		하
886	trail	길의 흔적 오솔길	\N	\N	\N		하
887	curve	구부러지다	\N	\N	\N		하
889	escape	도망가다	\N	\N	\N		하
890	point	겨누다	\N	\N	\N		하
891	fire	총을 쏘다	\N	\N	\N		하
892	fled flee	도망가다의 과거	\N	\N	\N		기타
893	bark	개가 짖다	\N	\N	\N		하
894	loudly	큰소리로	\N	\N	\N		하
895	hill	언덕	\N	\N	\N		하
897	through the day	하루 종일	\N	\N	\N		기타
898	stare at	응시하다	\N	\N	\N		기타
899	blank	텅 빈	\N	\N	\N		하
900	condition	상태	\N	\N	\N		하
902	overcome	극복하다	\N	\N	\N		하
903	opening	앞부분	\N	\N	\N		하
904	section	부분	\N	\N	\N		하
905	tend to	하게 하다 이끌다	\N	\N	\N		기타
906	activate	활성화 하다	\N	\N	\N		하
908	experience	경험	\N	\N	\N		하
909	experiment	실험	\N	\N	\N		하
911	fighter jet	전투기	\N	\N	\N		기타
912	nickname	별명	\N	\N	\N		하
913	calm	침착한 차분한	\N	\N	\N		하
914	positive	긍정적인	\N	\N	\N		하
915	negative	부정적인	\N	\N	\N		하
916	characteristic	성향 성격	\N	\N	\N		하
917	panic	공포	\N	\N	\N		하
918	dangerous situation	위험한 상황	\N	\N	\N		기타
919	cloud	구름	\N	\N	\N		하
920	instructor	교관	\N	\N	\N		하
921	control	통제하다	\N	\N	\N		하
922	fix	고쳐주다	\N	\N	\N		하
924	correct	수정하다 고치다	\N	\N	\N		하
925	collect	수집하다	\N	\N	\N		하
926	confidence	자신감	\N	\N	\N		하
928	exploration	탐험 탐사	\N	\N	\N		하
929	microwave	전자레인지	\N	\N	\N		하
930	wheel	바퀴	\N	\N	\N		하
932	panel	판	\N	\N	\N		하
933	severe temperature	심한 온도	\N	\N	\N		기타
935	collect	수집하다	\N	\N	\N		하
936	visual data	시각자료	\N	\N	\N		기타
938	signal	신호	\N	\N	\N		하
939	handlike	손과 같은	\N	\N	\N		기타
940	structure	구조	\N	\N	\N		하
941	hold	잡다	\N	\N	\N		하
942	various	다양한	\N	\N	\N		하
943	wake up	잠에서 깨다	\N	\N	\N		기타
945	dietician	영양사	\N	\N	\N		하
946	recommend	추천하다	\N	\N	\N		하
947	point to	지적하다	\N	\N	\N		기타
948	scientific evidence	과학적 증거	\N	\N	\N		기타
949	chemicals	화학물질	\N	\N	\N		하
950	contain	포함하다	\N	\N	\N		하
951	blood circulation	혈액순환	\N	\N	\N		기타
952	relieve	제거하다 줄이다	\N	\N	\N		하
953	headache	두통	\N	\N	\N		하
955	sleepy	졸리는	\N	\N	\N		하
956	stimulate	자극하다	\N	\N	\N		하
957	ahead of a day	하루 시작 전	\N	\N	\N		기타
820	develop	개발하다 향상 되다	\N	\N	\N		하
821	article	기사	\N	\N	\N		하
907	whenever	할 때마다	\N	\N	\N		하
822	rather than	라기 보다는	\N	\N	\N		기타
833	step	발걸음	\N	\N	\N		하
823	context	문맥	\N	\N	\N		하
964	in other words	다시 말해서	\N	\N	\N		기타
965	theater	극장	\N	\N	\N		하
966	suit	적합하다	\N	\N	\N		하
967	earn	벌다	\N	\N	\N		하
969	profession	직업 분야	\N	\N	\N		하
970	different parts	다른 지역	\N	\N	\N		기타
971	different cultures	다른 문화	\N	\N	\N		기타
972	be surprised at	에 놀라다	\N	\N	\N		기타
974	jealous	질투나는	\N	\N	\N		하
975	green with envy	질투로 파래지다	\N	\N	\N		기타
976	skin of an ill	아픈 사람의 피부	\N	\N	\N		기타
977	with jealousy	질투가 나서	\N	\N	\N		기타
978	by carrying bags	가방을 날라주며	\N	\N	\N		기타
979	be sent to a prison	감옥에 보내지다	\N	\N	\N		기타
980	develop	익히다	\N	\N	\N		하
981	pitching skills	던지기 기술	\N	\N	\N		기타
982	get out	석방하다 나가다	\N	\N	\N		기타
983	join	들어가다	\N	\N	\N		하
985	diameter	지름	\N	\N	\N		하
986	seed	씨앗	\N	\N	\N		하
987	carry	운반하다	\N	\N	\N		하
989	lack	부족하다	\N	\N	\N		하
990	structure	구조	\N	\N	\N		하
991	survive	살다 생존하다	\N	\N	\N		하
992	stem	줄기	\N	\N	\N		하
993	leave	나뭇잎	\N	\N	\N		하
994	attach	에 붙다	\N	\N	\N		하
995	suck	빨아 먹다	\N	\N	\N		하
997	sharp increase	급격한 증가	\N	\N	\N		기타
998	stay steady	안정되어 있다	\N	\N	\N		기타
999	lowest number	가장 낮은 수	\N	\N	\N		기타
1000	fast rise	빠른 상승세	\N	\N	\N		기타
1001	peak	최고	\N	\N	\N		하
961	available	이용할 수 있는	\N	\N	\N		하
1003	forest fire	산불	\N	\N	\N		기타
1004	disaster	재앙	\N	\N	\N		하
1005	in the past	과거에	\N	\N	\N		기타
1006	whenever	할 때마다	\N	\N	\N		하
1007	forest keeper	산림 감시원	\N	\N	\N		기타
1008	put out	을 끄다	\N	\N	\N		기타
1009	be allowed to	하기를 허락 하다	\N	\N	\N		기타
1010	Forest Service	산림청	\N	\N	\N		기타
1012	limited fire	제한된 화재	\N	\N	\N		기타
1013	make room	공간을 만들다	\N	\N	\N		기타
1015	clear away	제거하다	\N	\N	\N		기타
1016	acre	넓이의 단위	\N	\N	\N		하
1017	passive listener	수동적 청취자	\N	\N	\N		기타
1018	communicate	의사소통하다	\N	\N	\N		하
1019	factual message	사실적 메시지	\N	\N	\N		기타
1020	miss	놓치다	\N	\N	\N		하
1021	run into	뛰어들다	\N	\N	\N		기타
1022	my gosh	맙소사	\N	\N	\N		기타
1023	assume	가정하다	\N	\N	\N		하
1024	point	핵심	\N	\N	\N		하
1026	become involved in	합류하다	\N	\N	\N		기타
1027	block association	반상회	\N	\N	\N		기타
1028	organization	조직	\N	\N	\N		하
1029	ordinary citizen	일반시민	\N	\N	\N		기타
1030	activity	활동	\N	\N	\N		하
1032	tree and flower planting	나무 꽃 심기	\N	\N	\N		기타
1033	cleanup day	대청소	\N	\N	\N		기타
1035	neighborhood	이웃	\N	\N	\N		하
1036	crime	범죄	\N	\N	\N		하
1037	take a chance	기회를 잡다	\N	\N	\N		기타
1038	be in a hurry	서두르다	\N	\N	\N		기타
1039	time	시간을 재다	\N	\N	\N		하
1040	at almost twice the rate	거의 배 비율	\N	\N	\N		기타
1041	nervous	불안한	\N	\N	\N		하
1042	bean	콩	\N	\N	\N		하
1044	funny	재미있는	\N	\N	\N		하
1045	wing	날개	\N	\N	\N		하
1046	chicken wings	닭 날개	\N	\N	\N		기타
1047	get out	나가다	\N	\N	\N		기타
1048	temperature	기온	\N	\N	\N		하
1049	rise	오르다	\N	\N	\N		하
1050	stair	계단	\N	\N	\N		하
1053	flame	불꽃	\N	\N	\N		하
1054	shed tears	눈물을 흘리다	\N	\N	\N		기타
1055	breathe	호흡하다	\N	\N	\N		하
1056	ash	재	\N	\N	\N		하
1057	fly by	날아가다	\N	\N	\N		기타
1058	fire truck	소방차	\N	\N	\N		기타
1059	siren	사이렌	\N	\N	\N		하
1061	attach	붙이다	\N	\N	\N		하
1062	lightning	번개	\N	\N	\N		하
1063	urgent	급한	\N	\N	\N		하
1064	be hold	개최되다	\N	\N	\N		기타
1066	trophy	트로피	\N	\N	\N		하
1068	investigate	조사하다	\N	\N	\N		하
1069	robbery	도난사건	\N	\N	\N		하
1070	strange object	이상한 물건	\N	\N	\N		기타
1071	wrap	포장하다	\N	\N	\N		하
1072	unwrap	포장을 풀다	\N	\N	\N		하
1073	buried	묻혀있는	\N	\N	\N		하
1074	recognize	인식하다	\N	\N	\N		하
1076	lemon scent	레몬 향	\N	\N	\N		기타
1077	smell of vanilla	바닐라 향	\N	\N	\N		기타
1078	relax	편하게 하다	\N	\N	\N		하
1079	patient	환자	\N	\N	\N		하
1080	customer	고객	\N	\N	\N		하
1081	comfortable	편안한	\N	\N	\N		하
1082	remind	떠오르게 하다	\N	\N	\N		하
1083	pretend	인 척하다	\N	\N	\N		하
1084	cheerlead	응원하다	\N	\N	\N		기타
1085	outgoing	사교적인	\N	\N	\N		하
1086	shy	수줍은	\N	\N	\N		하
1087	get involved with	에 열중하다	\N	\N	\N		기타
1088	perfect body	완벽한 신체	\N	\N	\N		기타
1090	average	보통의	\N	\N	\N		하
1092	personality	성격	\N	\N	\N		하
1093	sigh	한숨	\N	\N	\N		하
960	choosing a career	직업 선택	\N	\N	\N		기타
962	option	선택상항	\N	\N	\N		하
963	romantic person	낭만적인 사람	\N	\N	\N		기타
1098	determine	결정하다	\N	\N	\N		하
1100	beg for	구걸하다	\N	\N	\N		기타
1101	face up to	극복하다	\N	\N	\N		기타
1102	financial problem	재정적인 문제	\N	\N	\N		기타
1103	government	정부	\N	\N	\N		하
1104	even worse	더 나쁜 것은	\N	\N	\N		기타
1105	professional beggar	직업적 거지	\N	\N	\N		기타
1106	in real need	정말로 궁핍한	\N	\N	\N		기타
1107	sentiment	감정	\N	\N	\N		하
1109	in itself	그 자체인	\N	\N	\N		기타
1110	negative	부정적인	\N	\N	\N		하
1111	properly	적절하게	\N	\N	\N		하
1112	be applied to	에 적용시키다	\N	\N	\N		기타
1113	penniless	돈 없는	\N	\N	\N		중
1114	unemployment	실직	\N	\N	\N		하
1115	miserable	비참한	\N	\N	\N		하
1116	family background	가정환경	\N	\N	\N		기타
1117	be treated as	로 취급되다	\N	\N	\N		기타
1118	social failure	사회적 실패자	\N	\N	\N		기타
1119	end up	끝나다	\N	\N	\N		기타
1120	family or community support		\N	\N	\N		기타
1121	selfish	이기적인	\N	\N	\N		하
1123	individual giving	개인적 도움	\N	\N	\N		기타
1125	government action	정부 조치	\N	\N	\N		기타
1126	be made from	으로 만들어지다	\N	\N	\N		기타
1127	brick	벽돌	\N	\N	\N		하
1128	concrete	콘크리트	\N	\N	\N		하
1177	solar panel	태양 전지판	\N	\N	\N		기타
1178	generate	발생시키다	\N	\N	\N		하
1179	electricity	전기	\N	\N	\N		하
1181	not only A but also B A B	뿐만아니라 도	\N	\N	\N		기타
1182	recycle	재활용하다	\N	\N	\N		하
1183	waste	쓰레기	\N	\N	\N		하
1185	in the long run	결국	\N	\N	\N		기타
1186	The Board of Education	교육 위원회	\N	\N	\N		기타
1187	consider	고려하다	\N	\N	\N		하
1188	break up	해체하다	\N	\N	\N		기타
1189	agree with	동의하다	\N	\N	\N		기타
1191	behave n behavior	행동하다	\N	\N	\N		기타
1193	Year after year	해가 갈수록	\N	\N	\N		기타
1194	terribly	지독하게	\N	\N	\N		하
1195	be criticized for	에 대해 비난받다	\N	\N	\N		기타
1196	rude	무례한	\N	\N	\N		하
1197	conduct	행동 행위	\N	\N	\N		하
1198	such	그런	\N	\N	\N		하
1199	continual	지속적인 계속되는	\N	\N	\N		하
1200	grocery	식료품	\N	\N	\N		하
1213	like	처럼	\N	\N	\N		하
1214	guarantee	보증하다	\N	\N	\N		하
1202	sweet	귀여운	\N	\N	\N		하
1203	next to	옆에	\N	\N	\N		기타
1204	parking lot	주차장	\N	\N	\N		기타
1205	unlocked	잠기지 않은	\N	\N	\N		하
1206	completely	완전히	\N	\N	\N		하
1207	alone	혼자	\N	\N	\N		하
1209	get in	타다	\N	\N	\N		기타
1210	get out	내리다	\N	\N	\N		기타
1219	develop	발달시키다	\N	\N	\N		하
1220	skill T	기술 솜	\N	\N	\N		기타
1211	concern	염려 걱정	\N	\N	\N		하
1212	front seat	앞좌석	\N	\N	\N		중
1215	cardboard	마분지	\N	\N	\N		하
1217	shape	모양	\N	\N	\N		하
1218	subject	주제	\N	\N	\N		하
1222	sort	분류하다	\N	\N	\N		하
1223	sleigh	썰매	\N	\N	\N		하
1224	absurd	부조리한 엉터리없는	\N	\N	\N		하
1225	first of all	우선 무엇보다도	\N	\N	\N		기타
1226	supposed	가정의 가상의 상상된	\N	\N	\N		하
1227	activity	행동	\N	\N	\N		하
1228	rule	규칙	\N	\N	\N		하
1129	steel	강철	\N	\N	\N		하
1130	iron	철	\N	\N	\N		하
1131	various	다양한	\N	\N	\N		하
1132	shape	모양	\N	\N	\N		하
1133	flat	편평한 납작한	\N	\N	\N		하
1134	cliff	절벽	\N	\N	\N		하
1135	century	세기 년	\N	\N	\N		하
1136	sailor	선원	\N	\N	\N		하
1137	guide	안내하다	\N	\N	\N		하
1139	alert	에게 위험을 경고하다	\N	\N	\N		하
1140	flash	불 빛을 번쩍 발하다	\N	\N	\N		하
1142	figure out	파악하다 이해하다	\N	\N	\N		기타
1143	location	위치	\N	\N	\N		하
1145	specialized	전문의	\N	\N	\N		하
1146	navigation	항법 항해	\N	\N	\N		하
1147	equipment	장비 설비	\N	\N	\N		하
1148	not any more	더 이상 않다	\N	\N	\N		기타
1149	builder	건축가	\N	\N	\N		하
1151	orderly	순서 바른	\N	\N	\N		하
1152	lay	쌓아 올리다	\N	\N	\N		하
1153	foundation	기초 토대	\N	\N	\N		하
1154	put up	올리다 설치하다	\N	\N	\N		기타
1155	process	진행 과정	\N	\N	\N		하
1156	roof	지붕	\N	\N	\N		하
1157	floor	마루	\N	\N	\N		하
1158	check	검사하다	\N	\N	\N		하
1160	at any time	언제라도	\N	\N	\N		기타
1161	housework	집안일	\N	\N	\N		하
1163	accomplish	완성하다 이루다	\N	\N	\N		하
1164	special kind	특별한 종류	\N	\N	\N		기타
1165	friendly	우호적인	\N	\N	\N		하
1166	environmentally	환경적으로	\N	\N	\N		하
1167	look like	처럼 보이다	\N	\N	\N		기타
1168	typical	전형적인	\N	\N	\N		하
1169	stack	쌓아 올리다	\N	\N	\N		하
1170	cardboard	판지 마분지	\N	\N	\N		하
1171	one of	중에 하나	\N	\N	\N		기타
1172	major	주요한	\N	\N	\N		하
1174	traffic accident	교통사고	\N	\N	\N		기타
1175	feature	특징 특색	\N	\N	\N		하
1176	include	포함하다	\N	\N	\N		하
1096	character	등장인물	\N	\N	\N		하
1201	back seat	뒤 좌석	\N	\N	\N		기타
1097	script	대본	\N	\N	\N		하
1234	chimney	굴뚝	\N	\N	\N		하
1235	deliver	배달하다	\N	\N	\N		하
1236	at least	최소한 적어도	\N	\N	\N		기타
1237	mall	대형 상가	\N	\N	\N		하
1238	despite	에도 불구하고	\N	\N	\N		하
1239	suit	정장 한 벌	\N	\N	\N		하
1241	be good at	를 잘하다	\N	\N	\N		기타
1242	unfortunately	불행히도	\N	\N	\N		하
1243	make money	돈을 벌다	\N	\N	\N		기타
1244	in order to	하기 위해서	\N	\N	\N		기타
1246	try	시도하다	\N	\N	\N		하
1247	skill	기술 솜씨	\N	\N	\N		하
1248	pale	창백한	\N	\N	\N		하
1249	skin	피부	\N	\N	\N		하
1250	no longer	더 이상 않다	\N	\N	\N		기타
1252	tan	햇볕에 태우다	\N	\N	\N		하
1253	desire	욕구 욕망	\N	\N	\N		하
1254	lead to	결과를 가져오다	\N	\N	\N		기타
1255	invention	발명	\N	\N	\N		하
1256	spray	스프레이 분무	\N	\N	\N		하
1257	lotion	로션	\N	\N	\N		하
1258	darken	빛깔이 거뭇해지다	\N	\N	\N		하
1259	vacation	휴가 방학	\N	\N	\N		하
1260	product	제품	\N	\N	\N		하
1261	lie down	눕다	\N	\N	\N		기타
1262	gain	얻다 늘리다	\N	\N	\N		하
1263	temperature	기온	\N	\N	\N		하
1265	rise	오르다	\N	\N	\N		하
1266	in a short time	짧은 시간에	\N	\N	\N		기타
1267	be careful	조심하다	\N	\N	\N		기타
1268	quarrel with	와 다투다	\N	\N	\N		기타
1269	spouse	배우자	\N	\N	\N		하
1271	actually	실제로	\N	\N	\N		하
1272	formal	정식의 형식적인	\N	\N	\N		하
1273	weather forecast	일기예보	\N	\N	\N		기타
1274	warn	경고하다	\N	\N	\N		하
1275	couples	부부	\N	\N	\N		하
1276	that day	그 날	\N	\N	\N		기타
1277	Celsius	섭씨의	\N	\N	\N		하
1278	increase	증가하다	\N	\N	\N		하
1281	raise	일으키다	\N	\N	\N		하
1286	position	직책	\N	\N	\N		하
1287	manager	관리자	\N	\N	\N		하
1288	as soon as possible	가능한 빨리	\N	\N	\N		기타
1289	amazed	깜짝 놀란	\N	\N	\N		하
1290	such a great	그 런 멋진	\N	\N	\N		기타
1291	opportunity	기회	\N	\N	\N		하
1292	hang up	전화를 끊다	\N	\N	\N		기타
1293	joy	기쁨	\N	\N	\N		하
1295	button	버튼을 누르다	\N	\N	\N		하
1297	indifferent	무관심한	\N	\N	\N		하
1298	disappointed	실망한	\N	\N	\N		하
1299	delighted	아주 기뻐하는	\N	\N	\N		하
1300	get old	나이를 먹다	\N	\N	\N		기타
1301	be supposed toR R	할 예정이다	\N	\N	\N		기타
1302	allow	허락하다	\N	\N	\N		하
1303	strict	엄격한 엄한	\N	\N	\N		하
1304	bend	악용하다 구부리다	\N	\N	\N		하
1305	bring up	양육하다 기르다	\N	\N	\N		기타
1306	properly	올바르게 제대로	\N	\N	\N		하
1307	generous	관대한	\N	\N	\N		하
1309	modern society	현대 사회	\N	\N	\N		기타
1310	silence	침묵	\N	\N	\N		하
1311	rare	드문 진기한	\N	\N	\N		하
1312	common	일반적인 흔한	\N	\N	\N		하
1313	suffer from	로 부터 고통 받다	\N	\N	\N		기타
1314	unwanted	원치 않는	\N	\N	\N		하
1315	noise	소음	\N	\N	\N		하
1316	sunrise	해돋이 일출	\N	\N	\N		하
1318	sunset	해질 녘 일몰	\N	\N	\N		하
1319	sauce	소스 양념	\N	\N	\N		하
1320	constant	끊임없는	\N	\N	\N		하
1321	sauce	양념	\N	\N	\N		하
1322	source	근원 원천 원인	\N	\N	\N		하
1323	be well known for	을 잘 알려지다	\N	\N	\N		기타
1324	noisiness	소음	\N	\N	\N		기타
1326	disturbing	어지럽히는	\N	\N	\N		하
1327	effect	효과 영향	\N	\N	\N		하
1328	anywhere	어느 곳에서나	\N	\N	\N		하
1329	one day	어느 날	\N	\N	\N		기타
1330	above	위	\N	\N	\N		하
1331	dont have to	할 필요가 없다	\N	\N	\N		기타
1333	invention	발명 발명품	\N	\N	\N		하
1334	heat	열	\N	\N	\N		하
1335	melt	녹이다	\N	\N	\N		하
1336	ice cube	얼음 덩어리	\N	\N	\N		기타
1337	weight	무게	\N	\N	\N		하
1338	connect	연결하다	\N	\N	\N		하
1339	take a shower	샤워하다	\N	\N	\N		기타
1341	bucket	양동이	\N	\N	\N		하
1342	so That will	하기 위하여	\N	\N	\N		기타
1343	original	최초의 본래의	\N	\N	\N		하
1344	position	위치 자리	\N	\N	\N		하
1345	recent	최근	\N	\N	\N		하
1346	get	얻다	\N	\N	\N		하
1347	print	인쇄 출판물	\N	\N	\N		하
1348	organization	조직체 단체	\N	\N	\N		하
1349	especially	특히	\N	\N	\N		하
1350	profit	이익 수익	\N	\N	\N		하
1351	decrease	감소하다	\N	\N	\N		하
1352	create	만들다	\N	\N	\N		하
1353	report	보도하다	\N	\N	\N		하
1355	deliver	배달하다 전하다	\N	\N	\N		하
1356	comment	견해 의견	\N	\N	\N		하
1357	shape	구체화하다	\N	\N	\N		하
1358	examine	검사조사하다 고찰하다	\N	\N	\N		하
1360	issue	논쟁점 문제	\N	\N	\N		하
1361	otherwise	그렇지 않으면	\N	\N	\N		하
1362	unexamined	검사하지 않은	\N	\N	\N		중
1363	take notes	필기하다	\N	\N	\N		기타
1364	in ing ing	할 때	\N	\N	\N		기타
1365	gain	얻다 획득하다	\N	\N	\N		하
1230	in just one night	하룻밤에	\N	\N	\N		기타
1280	mood	기분	\N	\N	\N		하
1232	nowadays	요즘	\N	\N	\N		하
1233	exist	존재하다	\N	\N	\N		하
1283	pray	기도하다	\N	\N	\N		하
1372	huge	거대한	\N	\N	\N		하
1373	invitation	초대	\N	\N	\N		하
1375	when it comes to	에 관해서	\N	\N	\N		기타
1376	care	관심을 갖다 신경 쓰다	\N	\N	\N		하
1377	uncomfortable	불편한	\N	\N	\N		하
1378	in order toR R	하기 위하여	\N	\N	\N		기타
1379	stylish	현대식의 유행의	\N	\N	\N		하
1380	not only A but also B		\N	\N	\N		기타
1381	look taller	더 크게 보이다	\N	\N	\N		기타
1382	slim	늘씬한	\N	\N	\N		하
1383	attractive	매력적인	\N	\N	\N		하
1384	effect	영향 효과	\N	\N	\N		하
1386	blister	물집	\N	\N	\N		하
1387	painful	고통스런	\N	\N	\N		하
1388	misstep	실족	\N	\N	\N		중
1389	hammertoe	갈고리 모양의 기형적인 발가락	\N	\N	\N		기타
1390	describe	묘사하다 설명하다	\N	\N	\N		하
1391	as	로서	\N	\N	\N		하
1392	light	색이 연한	\N	\N	\N		하
1393	front	앞	\N	\N	\N		하
1395	unfinished	미완성의	\N	\N	\N		하
1396	stripe	줄무늬	\N	\N	\N		하
1397	herd	떼 무리	\N	\N	\N		하
1398	plain	평원	\N	\N	\N		하
1399	extinction	멸종	\N	\N	\N		하
1400	settler	정착민 개척자	\N	\N	\N		하
1402	grazing land	목초지	\N	\N	\N		기타
1403	cattle	소	\N	\N	\N		하
1404	revolution	혁명	\N	\N	\N		하
1405	flee	달아나다 도망치다	\N	\N	\N		하
1406	publish	출판하다	\N	\N	\N		하
1407	earn	획득하다	\N	\N	\N		하
1409	criticism	비평 비판	\N	\N	\N		하
1410	popularity	인기	\N	\N	\N		하
1411	above	위에 위쪽에	\N	\N	\N		하
1412	chart	도표 그림	\N	\N	\N		하
1413	marriage proposal	청혼 프러포즈	\N	\N	\N		기타
1414	occur	일어나다 발생하다	\N	\N	\N		하
1415	in the course of	동안에	\N	\N	\N		기타
1416	least little	의 최상급	\N	\N	\N		기타
1418	more thanover	이상	\N	\N	\N		기타
1419	previous	이전의	\N	\N	\N		하
1420	one fifth	분의	\N	\N	\N		기타
1421	steadily	꾸준히	\N	\N	\N		하
1422	increase	증가하다	\N	\N	\N		하
1424	serious	진지한 진정인	\N	\N	\N		하
1425	gym	체육관 체육	\N	\N	\N		하
1426	according to	에 따르면	\N	\N	\N		기타
1427	recent search	최근 연구	\N	\N	\N		기타
1428	though	그러나	\N	\N	\N		하
1429	researcher	연구가	\N	\N	\N		하
1430	encourage	장려하다 권하다	\N	\N	\N		하
1431	limit	제한하다	\N	\N	\N		하
1432	amount	양	\N	\N	\N		하
1434	cause	의 원인이 되다	\N	\N	\N		하
1435	such as	와 같은	\N	\N	\N		기타
1436	dizziness	현기증	\N	\N	\N		하
1437	avoid	피하다	\N	\N	\N		하
1439	labor union	노동조합	\N	\N	\N		기타
1440	economics	경제학	\N	\N	\N		하
1441	profession	직업	\N	\N	\N		하
1442	rise to fame	명성을 얻다	\N	\N	\N		기타
1443	prediction	예측	\N	\N	\N		하
1445	in the past	과거에	\N	\N	\N		기타
1447	endless	끝이 없는	\N	\N	\N		하
1448	reflect	반영하다	\N	\N	\N		하
1449	reality	현실	\N	\N	\N		하
1450	island	섬	\N	\N	\N		하
1452	as a result	결과적으로	\N	\N	\N		기타
1453	southern	남쪽의	\N	\N	\N		하
1454	few	거의 없는	\N	\N	\N		하
1455	yet	그러나	\N	\N	\N		하
1456	thorn bush	가시덤불	\N	\N	\N		기타
1457	despite	에도 불구하고	\N	\N	\N		하
1458	a variety of	다양한	\N	\N	\N		기타
1459	landscape	경치 풍경	\N	\N	\N		하
1460	average	평균의	\N	\N	\N		하
1461	yearly	년의	\N	\N	\N		하
1462	around	약 대략	\N	\N	\N		하
1464	rainfall	강수량	\N	\N	\N		하
1465	tropical rain forest	열대우림	\N	\N	\N		기타
1467	mostly	대개	\N	\N	\N		하
1468	common	흔한	\N	\N	\N		하
1469	generally	일반적으로	\N	\N	\N		하
1470	rate	비율	\N	\N	\N		하
1471	disease	질병	\N	\N	\N		하
1473	play a part	역할을 하다	\N	\N	\N		기타
1474	reduce	줄이다	\N	\N	\N		하
1475	risk	위험	\N	\N	\N		하
1476	heart attack	심장 마비발작	\N	\N	\N		기타
1477	healthy	건강한	\N	\N	\N		하
1478	take part in	에 참여하다	\N	\N	\N		기타
1479	three times a week	일주일에 번	\N	\N	\N		기타
1480	death	죽음	\N	\N	\N		하
1481	those who	하는 사람들	\N	\N	\N		기타
1482	improve	개선하다 향상시키다	\N	\N	\N		하
1483	cash	현금	\N	\N	\N		하
1484	check	수표	\N	\N	\N		하
1485	decision	결정	\N	\N	\N		하
1487	task	일 과업 업무	\N	\N	\N		하
1488	even if	비록 일지라도	\N	\N	\N		기타
1490	experience	경험	\N	\N	\N		하
1491	much	비교급 훨씬	\N	\N	\N		하
1492	process	과정	\N	\N	\N		하
1493	unlike	와는 다르게	\N	\N	\N		하
1494	handle	취급하다	\N	\N	\N		하
1495	document	서류	\N	\N	\N		하
1496	receipt	영수증	\N	\N	\N		하
1497	record	기록	\N	\N	\N		하
1498	company	회사	\N	\N	\N		하
1500	statement	명세서	\N	\N	\N		하
1501	still	움직임 없는 고요한	\N	\N	\N		하
1502	weak	몸이 약한 허약한	\N	\N	\N		하
1503	lightlitlit	불을 켜다	\N	\N	\N		기타
1504	shake	흔들다 떨다	\N	\N	\N		하
1505	cheer	활기 원기	\N	\N	\N		하
1367	develop	발전시키다	\N	\N	\N		하
1368	curiosity	호기심	\N	\N	\N		하
1370	interest	관심 흥미	\N	\N	\N		하
1511	reach	도착하다	\N	\N	\N		하
1512	pause	잠시 쉬다	\N	\N	\N		하
1514	presence	존재 있음	\N	\N	\N		하
1515	gradually	점차로 점진적으로	\N	\N	\N		하
1516	take shape	형체를 갖추다	\N	\N	\N		기타
1517	perform trick	재주를 부리다	\N	\N	\N		기타
1518	sign	징조 표시	\N	\N	\N		하
1519	be capable of	할 수 있다	\N	\N	\N		기타
1520	perhaps	아마	\N	\N	\N		하
1521	surface	표면	\N	\N	\N		하
1522	look for	을 찾다	\N	\N	\N		기타
1524	enter	들어가다	\N	\N	\N		하
1525	do tricks	재주를 부리다	\N	\N	\N		기타
1526	be filled with	으로 가득 차다	\N	\N	\N		기타
1527	clap	손뼉을 치다	\N	\N	\N		하
1528	seal	물개	\N	\N	\N		하
1529	behavior	행동	\N	\N	\N		하
1531	trick	재주 곡예 책략	\N	\N	\N		하
1532	intelligence	지능	\N	\N	\N		하
1533	ability	능력	\N	\N	\N		하
1535	solve	해결하다	\N	\N	\N		하
1536	by ing ing	하므로	\N	\N	\N		기타
1537	previous	이전의 앞선	\N	\N	\N		하
1538	collection	수집 수집물	\N	\N	\N		하
1539	actually	실제로	\N	\N	\N		하
1540	quite a lot	많은	\N	\N	\N		기타
1541	be likely toR R	할 것 같다	\N	\N	\N		기타
1542	creative	창조적인	\N	\N	\N		하
1543	on the other hand	반면에	\N	\N	\N		기타
1544	those who	하는 사람들	\N	\N	\N		기타
1545	religious	종교적인	\N	\N	\N		하
1547	trust	믿다 신용하다	\N	\N	\N		하
1548	others	다른 사람들	\N	\N	\N		하
1549	hardworking	열심히 일하는	\N	\N	\N		하
1550	practical	현실적인	\N	\N	\N		하
1551	prefer	을 더 좋아하다	\N	\N	\N		하
1552	physically	신체적으로	\N	\N	\N		하
1553	active	활동적인	\N	\N	\N		하
1556	agreeable	기분 좋은 쾌적한 마음에 드는	\N	\N	\N		하
1557	view A as B A B	를 로 여기다	\N	\N	\N		기타
1558	attractive	매력적인	\N	\N	\N		하
1559	taste	기호 취향	\N	\N	\N		하
1560	theory	이론	\N	\N	\N		하
1561	profession	직업	\N	\N	\N		하
1562	personality	성격	\N	\N	\N		하
1564	performance	공연	\N	\N	\N		하
1565	worst bad	의 최상급	\N	\N	\N		기타
1566	fate	운명	\N	\N	\N		하
1568	go out	불이 꺼지다	\N	\N	\N		기타
1569	lock	잠그다	\N	\N	\N		하
1570	whip	채찍	\N	\N	\N		하
1571	protection	보호	\N	\N	\N		하
1572	circumstances	상황	\N	\N	\N		하
1573	survive	살아남다	\N	\N	\N		하
1574	calmly	침착하게	\N	\N	\N		하
1576	act	공연	\N	\N	\N		하
1577	rest	나머지	\N	\N	\N		하
1578	audience	청중	\N	\N	\N		하
1579	cage	우리	\N	\N	\N		하
1580	highlight	강조하다	\N	\N	\N		하
1581	suspense	긴장 불안	\N	\N	\N		하
1582	skillfully	능숙하게	\N	\N	\N		하
1583	treat	다루다	\N	\N	\N		하
1585	admit	인정하다	\N	\N	\N		하
1586	fear	두려움	\N	\N	\N		하
1587	situation	상황	\N	\N	\N		하
1588	chilling	오싹하게 하는	\N	\N	\N		하
1589	point out	지적하다	\N	\N	\N		기타
1590	although	에도 불구하고	\N	\N	\N		하
1592	keep ing ing	계속해서 하다	\N	\N	\N		기타
1593	crack	찰싹 때리다	\N	\N	\N		하
1594	drunk driving	음주 운전	\N	\N	\N		기타
1595	headache	두통 골칫거리	\N	\N	\N		하
1596	modern	현대의	\N	\N	\N		하
1597	suffer from	로 고통 받다	\N	\N	\N		기타
1599	unnecessarily	필요 없이	\N	\N	\N		하
1600	include	포함하다	\N	\N	\N		하
1601	innocent	죄 없는	\N	\N	\N		하
1602	passenger	승객	\N	\N	\N		하
1603	pedestrian	보행자	\N	\N	\N		하
1604	unable	할 수 없는	\N	\N	\N		하
1605	control	통제하다	\N	\N	\N		하
1606	vehicle	수송 수단 차량	\N	\N	\N		하
1607	carry out	시행하다	\N	\N	\N		기타
1608	random	무작위의	\N	\N	\N		하
1609	breath	호흡 숨	\N	\N	\N		하
1611	at any time	언제라도	\N	\N	\N		기타
1612	as a result	그 결과	\N	\N	\N		기타
1613	sharply	급격하게	\N	\N	\N		하
1614	convince	납득시키다	\N	\N	\N		하
1615	debate	토론 논쟁	\N	\N	\N		하
1617	of no use	쓸모없는 무익한	\N	\N	\N		기타
1618	for some time	얼마동안	\N	\N	\N		기타
1619	fall	감소	\N	\N	\N		하
1620	figure	숫자 합계	\N	\N	\N		하
1621	distinguish	구별하다	\N	\N	\N		하
1622	effect	효과	\N	\N	\N		하
1623	accompanying	동시에 시행되는	\N	\N	\N		하
1624	advertising	광고	\N	\N	\N		하
1626	regularly	규칙적으로	\N	\N	\N		하
1627	record	기록	\N	\N	\N		하
1628	basically	기본적으로	\N	\N	\N		하
1629	store	저장하다	\N	\N	\N		하
1630	display	보여주다	\N	\N	\N		하
1631	income	소득	\N	\N	\N		하
1632	nowadays	요즘	\N	\N	\N		하
1633	dolphin	돌고래	\N	\N	\N		하
1634	remain	남다	\N	\N	\N		하
1635	alone	혼자서	\N	\N	\N		하
1637	shallow	얕은	\N	\N	\N		하
1638	shore	해안	\N	\N	\N		하
1639	encouragement	격려	\N	\N	\N		하
1640	forget	잊다	\N	\N	\N		하
1641	appreciate	감사하다	\N	\N	\N		하
1642	effort	노력	\N	\N	\N		하
1643	retirement	퇴직	\N	\N	\N		하
1644	connection	관련	\N	\N	\N		하
1509	approach	접근하다 다가서다	\N	\N	\N		하
1510	along	을 따라서	\N	\N	\N		하
1650	annoying	성가신	\N	\N	\N		하
1651	make sense	일리가 있다	\N	\N	\N		기타
1652	editorinchief	편집장	\N	\N	\N		기타
1653	educator	교육자	\N	\N	\N		하
1655	imagination	상상	\N	\N	\N		하
1656	physically	신체적으로	\N	\N	\N		하
1657	develop	발달하다	\N	\N	\N		하
1658	get along with	와 잘 지내다	\N	\N	\N		기타
1660	appear	나타나다	\N	\N	\N		하
1661	gain	얻다	\N	\N	\N		하
1662	knowledge	지식	\N	\N	\N		하
1663	normal	보통의	\N	\N	\N		하
1664	go through	겪다	\N	\N	\N		기타
1665	whole	전체의	\N	\N	\N		하
1666	process	과정	\N	\N	\N		하
1667	throughout	에 걸쳐서	\N	\N	\N		하
1669	fail to	하지 못하다	\N	\N	\N		기타
1670	instead of	대신에	\N	\N	\N		기타
1671	satisfy	만족시키다	\N	\N	\N		하
1672	merely	단지	\N	\N	\N		하
1673	researcher	연구자	\N	\N	\N		하
1674	wrinkle	주름	\N	\N	\N		하
1675	bald	대머리의	\N	\N	\N		하
1676	gray	회색의	\N	\N	\N		하
1678	situation	상황	\N	\N	\N		하
1679	hairdressing salon	미용실	\N	\N	\N		기타
1680	attractive	매력적인	\N	\N	\N		하
1681	attitude	태도	\N	\N	\N		하
1682	damage	손상시키다	\N	\N	\N		하
1683	doubt	의심	\N	\N	\N		하
1685	repair	수리하다	\N	\N	\N		하
1686	convenience food	인스턴트식품	\N	\N	\N		기타
1687	package	포장하다	\N	\N	\N		하
1688	reach into	속으로 손을 뻗다	\N	\N	\N		기타
1689	method	방법	\N	\N	\N		하
1690	number	번호를 매기다	\N	\N	\N		하
1692	tip	끝	\N	\N	\N		하
1693	place	두다 배치하다	\N	\N	\N		하
1694	represent	나타내다	\N	\N	\N		하
1695	remaining	남아 있는	\N	\N	\N		하
1696	rosebud	장미 봉오리	\N	\N	\N		하
1697	bloom	개화하다	\N	\N	\N		하
1699	explain	설명하다	\N	\N	\N		하
1700	receive	받다	\N	\N	\N		하
1701	response	반응 대답	\N	\N	\N		하
1702	respond	반응하다 대답하다	\N	\N	\N		하
1703	score	득점하다	\N	\N	\N		하
1704	detail	세부 사항	\N	\N	\N		하
1706	evenly	균등하게	\N	\N	\N		하
1707	narrow	좁은	\N	\N	\N		하
1708	achieve	성취하다	\N	\N	\N		하
1709	suggest	시사하다	\N	\N	\N		하
1710	customer	고객	\N	\N	\N		하
1711	avoid	회피하다	\N	\N	\N		하
1712	dig	파다	\N	\N	\N		하
1713	scene	장면	\N	\N	\N		하
1714	openly	공개적으로	\N	\N	\N		하
1716	run	운영하다	\N	\N	\N		하
1717	sight	시력 시각	\N	\N	\N		하
1718	cliff	절벽	\N	\N	\N		하
1719	distant	먼	\N	\N	\N		하
1721	attend	출석하다	\N	\N	\N		하
1723	obey	따르다	\N	\N	\N		하
1724	get into trouble	어려움에 처하다	\N	\N	\N		기타
1725	constant	지속적인	\N	\N	\N		하
1726	the instant	주어동사 하는 순간에	\N	\N	\N		기타
1727	desire	욕구	\N	\N	\N		하
1728	matter	중요하다	\N	\N	\N		하
1729	convenient	편리한	\N	\N	\N		하
1731	accomplish	달성하다	\N	\N	\N		하
1732	available	이용할 수 있는	\N	\N	\N		하
1733	plenty	많음 다수	\N	\N	\N		하
1734	invention	발명	\N	\N	\N		하
1735	electric	전기의	\N	\N	\N		하
1736	dawn	새벽	\N	\N	\N		하
1737	various	다양한	\N	\N	\N		하
1738	wellpaid	보수가 좋은	\N	\N	\N		기타
1740	opportunity	기회	\N	\N	\N		하
1741	present	현재의	\N	\N	\N		하
1742	Antarctica the South Pole	남극	\N	\N	\N		기타
1743	amazingly	놀랍게도	\N	\N	\N		하
1744	valley	골짜기	\N	\N	\N		하
1745	coast	해변 해안	\N	\N	\N		하
1746	log	통나무	\N	\N	\N		하
1747	blanket	담요	\N	\N	\N		하
1749	athlete	운동선수	\N	\N	\N		하
1750	stretch	뻗다 늘이다	\N	\N	\N		하
1751	muscle	근육	\N	\N	\N		하
1752	crash	쿵 떨어지다	\N	\N	\N		하
1753	bitter	쓴	\N	\N	\N		하
1754	blame	탓하다	\N	\N	\N		하
1755	gene	유전자	\N	\N	\N		하
1757	flavor	맛 향	\N	\N	\N		하
1758	unpleasantly	불쾌하게	\N	\N	\N		중
1759	decision	결정	\N	\N	\N		하
1760	place an order	주문을 하다	\N	\N	\N		기타
1761	according to	에 따르면	\N	\N	\N		기타
1763	actual	실제의	\N	\N	\N		하
1764	compare	비교하다	\N	\N	\N		하
1765	advertise	광고하다	\N	\N	\N		하
1766	exchange	교환하다	\N	\N	\N		하
1767	product	상품	\N	\N	\N		하
1768	merchant	상인	\N	\N	\N		하
1769	feed	먹이다	\N	\N	\N		하
1771	nail	못	\N	\N	\N		하
1772	color	색칠하다	\N	\N	\N		하
1773	outline	윤곽선	\N	\N	\N		하
1774	zebra	얼룩말	\N	\N	\N		하
1775	uneasy	불안한	\N	\N	\N		하
1777	direction	지시	\N	\N	\N		하
1778	hang hanghunghung	걸다	\N	\N	\N		기타
1779	disappointed	실망한	\N	\N	\N		하
1780	pleased	기쁜	\N	\N	\N		하
1781	popular	인기 있는	\N	\N	\N		하
1782	engage inA A	에 참여하다	\N	\N	\N		기타
1784	withinA A	이내에	\N	\N	\N		기타
1785	be good at	을 잘하다	\N	\N	\N		기타
1786	individually	개인적으로	\N	\N	\N		하
1646	accept	받아들이다	\N	\N	\N		하
1647	describe	묘사하다	\N	\N	\N		하
1648	consider	여기다	\N	\N	\N		하
1720	recently	최근에	\N	\N	\N		하
1792	appeal	호소 매력	\N	\N	\N		하
1793	opportunity	기회	\N	\N	\N		하
1795	vary	다양하다	\N	\N	\N		하
1796	bait	미끼	\N	\N	\N		하
1797	line	낚싯줄	\N	\N	\N		하
1798	danger	위험	\N	\N	\N		하
1799	endangered	위험에 처한	\N	\N	\N		하
1801	fearless	겁 없는	\N	\N	\N		하
1802	predator	약탈자	\N	\N	\N		하
1803	expert	전문가	\N	\N	\N		하
1804	specially	특별히 특히	\N	\N	\N		하
1805	stuffed	박제한	\N	\N	\N		하
1807	excellent	뛰어난 훌륭한	\N	\N	\N		하
1808	pleasure	기쁨 즐거움	\N	\N	\N		하
1809	Now that SV	때문에	\N	\N	\N		기타
1810	pressure	압박	\N	\N	\N		하
1812	management	관리 경영	\N	\N	\N		하
1813	extremely	매우	\N	\N	\N		하
1814	deal with	처리하다 다루다 취급하다	\N	\N	\N		기타
1815	peer	동료 급우	\N	\N	\N		하
1816	make sure that SV	을 확신하다	\N	\N	\N		기타
1817	balance	균형	\N	\N	\N		하
1818	relaxation	휴식	\N	\N	\N		하
1819	success	성공	\N	\N	\N		하
1820	theory	가설 이론	\N	\N	\N		하
1821	bacteria	세균	\N	\N	\N		하
1822	dose	회분 복용량	\N	\N	\N		하
1823	beneficial	유익한	\N	\N	\N		하
1825	hospital	병원	\N	\N	\N		하
1826	pill	알약	\N	\N	\N		하
1827	effect	효과 영향 결과	\N	\N	\N		하
1828	risk	위험	\N	\N	\N		하
1829	diarrhea	설사	\N	\N	\N		하
1830	southern	남부의 남쪽의	\N	\N	\N		하
1831	amaze	깜짝 놀라게 하다	\N	\N	\N		하
1832	ancient	고대의	\N	\N	\N		하
1833	temple	사원	\N	\N	\N		하
1835	date back	거슬러 올라가다	\N	\N	\N		기타
1836	hide	숨기다 은닉하다	\N	\N	\N		하
1837	exist	존재하다	\N	\N	\N		하
1838	spread spreadspread	퍼지다	\N	\N	\N		기타
1840	enormous	거대한	\N	\N	\N		하
1841	several	몇몇의	\N	\N	\N		하
1842	stage	단계	\N	\N	\N		하
1843	marvelous	놀라운 기적적인	\N	\N	\N		하
1844	tomb	무덤	\N	\N	\N		하
1845	function	기능	\N	\N	\N		하
1846	popular	인기 있는	\N	\N	\N		하
1847	fantastic	환상적인	\N	\N	\N		하
1848	efficient	효율적인	\N	\N	\N		하
1849	lecture	강연 강의	\N	\N	\N		하
1851	suit	에 어울리다 맞추다 남자 정장 한 벌	\N	\N	\N		하
1852	pause	중단 정지	\N	\N	\N		하
1853	silence	침묵	\N	\N	\N		하
1854	tone	어조	\N	\N	\N		하
1855	pitch	높이 고저	\N	\N	\N		하
1856	emphasize	강조하다	\N	\N	\N		하
1858	avoid	피하다	\N	\N	\N		하
1860	make full use of	을 최대한 이용하다	\N	\N	\N		기타
1861	resources	자료	\N	\N	\N		하
1862	audiovisual aid	시청각 도구	\N	\N	\N		기타
1863	illustrate	설명하다	\N	\N	\N		하
1864	enhance	강조하다 강화하다	\N	\N	\N		하
1865	tool	방법 도구	\N	\N	\N		하
1867	reduce	줄이다 감소하다	\N	\N	\N		하
1868	surrender	굴복하다 항복하다	\N	\N	\N		하
1869	be on ones way to A A	로 가는 중이다	\N	\N	\N		기타
1870	appointment	약속	\N	\N	\N		하
1871	traffic	교통	\N	\N	\N		하
1872	roadwork	도로공사	\N	\N	\N		중
1874	upset	화난	\N	\N	\N		하
1876	physical action	신체적 반응	\N	\N	\N		기타
1877	turn red	얼굴이 붉어지다	\N	\N	\N		기타
1878	stomach	위 배	\N	\N	\N		하
1879	stir	뒤틀리다 휘젓다 꿈틀거리다	\N	\N	\N		하
1880	headache	두통	\N	\N	\N		하
1882	unreasonable	비이성적인	\N	\N	\N		하
1883	reaction	반응	\N	\N	\N		하
1884	take a deep breath	심호흡을 하다	\N	\N	\N		기타
1885	accept	받아들이다 수용하다	\N	\N	\N		하
1886	powerlessness	무력함	\N	\N	\N		중
1888	be busy ing	하느라 바쁘다	\N	\N	\N		기타
1889	shop	쇼핑하다	\N	\N	\N		하
1890	happen toV	우연히 하다	\N	\N	\N		기타
1891	foreigner	외국인	\N	\N	\N		하
1892	preference	선호 애호	\N	\N	\N		하
1893	ignore	무시하다	\N	\N	\N		하
1894	compelling	강압적인 강제적인	\N	\N	\N		하
1896	closely	면밀히 세밀히	\N	\N	\N		하
1897	immediately	즉시	\N	\N	\N		하
1898	obey	복종하다	\N	\N	\N		하
1899	realize	깨닫다 알다	\N	\N	\N		하
1900	intended	의도된	\N	\N	\N		하
1901	ancient	고대의	\N	\N	\N		하
1903	disease	질병	\N	\N	\N		하
1904	punishment	처벌	\N	\N	\N		하
1905	cause	일으키다 초래하다	\N	\N	\N		하
1906	viruses	바이러스 병균	\N	\N	\N		하
1907	microorganism	미생물	\N	\N	\N		중
1909	largely	대체로 일반적으로	\N	\N	\N		하
1910	responsibility	책임감	\N	\N	\N		하
1911	practice	실행하다	\N	\N	\N		하
1912	preventive medicine	예방약	\N	\N	\N		기타
1913	healthy	건강한	\N	\N	\N		하
1914	exercise	운동	\N	\N	\N		하
1915	prevent	예방하다 막다	\N	\N	\N		하
1916	illness	병	\N	\N	\N		하
1917	machine	기계	\N	\N	\N		하
1918	regular	규칙적인	\N	\N	\N		하
1919	effective	효과적인	\N	\N	\N		하
1921	pass	넘겨주다 건네주다	\N	\N	\N		하
1922	by word of mouth	구두로 말로	\N	\N	\N		기타
1789	hook	낚싯바늘	\N	\N	\N		하
1790	regardless of	와 상관없이	\N	\N	\N		기타
1791	income	수입 소득	\N	\N	\N		하
1873	accident	사건 사고	\N	\N	\N		하
1927	storyteller	이야기꾼	\N	\N	\N		하
1928	appoint	지명하다	\N	\N	\N		하
1929	specific	특별한	\N	\N	\N		하
1931	retell	다시 말하다	\N	\N	\N		중
1932	educate	교육시키다	\N	\N	\N		하
1934	lodging	숙박	\N	\N	\N		하
1935	As often happens	흔히 그렇듯이	\N	\N	\N		기타
1936	orally	구두로	\N	\N	\N		하
1937	details	세부사항	\N	\N	\N		하
1938	result	결과	\N	\N	\N		하
1939	version	각색 번역 편곡	\N	\N	\N		하
1940	culture	문화	\N	\N	\N		하
1941	sculptor	조각가	\N	\N	\N		하
1942	appear	인 것 같다 나타나다	\N	\N	\N		하
1943	garbage	쓰레기	\N	\N	\N		하
1945	empty beer bottle	빈 맥주병	\N	\N	\N		기타
1946	ashtray	재떨이	\N	\N	\N		하
1947	throw threwthrown	던지다 버리다	\N	\N	\N		기타
1948	trash	쓰레기	\N	\N	\N		하
1949	sigh	한숨을 쉬다	\N	\N	\N		하
1950	mass	덩어리	\N	\N	\N		하
1951	mess	엉망진창	\N	\N	\N		하
1953	grasp	이해하다 알다 움켜잡다	\N	\N	\N		하
1954	estimate	평가하다	\N	\N	\N		하
1955	fortunately	다행히도	\N	\N	\N		하
1956	art gallery	미술관	\N	\N	\N		기타
1957	rescue	구하다	\N	\N	\N		하
1958	item	물건 품목	\N	\N	\N		하
1960	exhibit	전시	\N	\N	\N		하
1961	photograph	사진	\N	\N	\N		하
1962	traditional	전통적인	\N	\N	\N		하
1964	granite stone	화강암	\N	\N	\N		기타
1965	support	지탱하다	\N	\N	\N		하
1966	mound	둔덕 흙무덤	\N	\N	\N		하
1967	be covered with	으로 덮여있다	\N	\N	\N		기타
1968	oiled paper	기름 장판지	\N	\N	\N		기타
1970	hole	구멍	\N	\N	\N		하
1971	kitchen	부엌	\N	\N	\N		하
1972	direct	향하게 하다	\N	\N	\N		하
1973	stone	돌	\N	\N	\N		하
1974	radiate	방출하다 빛을 발하다	\N	\N	\N		하
1975	flow out	흘러나오다	\N	\N	\N		기타
1976	chimney	굴뚝	\N	\N	\N		하
1977	unusually	몹시 대단히	\N	\N	\N		하
1978	tap	두드리다	\N	\N	\N		하
1979	shift	근무 교대 순번	\N	\N	\N		하
1981	ride	탈것에타다	\N	\N	\N		하
1982	secretly	몰래	\N	\N	\N		하
1983	pedal	자전거 페달	\N	\N	\N		하
1984	manage toV	가까스로 하다	\N	\N	\N		기타
1985	oddest	가장 기괴한	\N	\N	\N		중
1986	breathe	호흡하다	\N	\N	\N		하
1987	in spite of A A	에도 불구하고	\N	\N	\N		기타
1988	complexity	복잡성	\N	\N	\N		하
1989	amazingly	놀랍게도	\N	\N	\N		하
1990	daughter	딸	\N	\N	\N		하
15590	knowledgeable	ad . ( 사람 수식 ) 아는 것이 많은 . 잘 아는	\N	\N	\N	toeic	하
15611	connecting flight	연결편	\N	\N	\N	toeic	기타
15613	demanding boss	까다로운 / 힘든 상사	\N	\N	\N	toeic	기타
15618	encouraging remark	격려 의 / 고무 적인 말	\N	\N	\N	toeic	기타
15631	detailed information	자세한 정보	\N	\N	\N	toeic	기타
15641	monitoring system	검열 체계	\N	\N	\N	toeic	기타
15658	widening gap	큰 격차	\N	\N	\N	toeic	기타
15698	be accustomed to N/-ing	~에 익숙하다	\N	\N	\N	toeic	기타
15701	contribute to N/-ing	~에 기여하다	\N	\N	\N	toeic	기타
15709	reply/respond/react to N/-ing	~에 응답하다 반응하다	\N	\N	\N	toeic	기타
15726	put off -ing	연기하다	\N	\N	\N	toeic	기타
15729	finish -ing	끝내다	\N	\N	\N	toeic	기타
15758	be about to v	막 ~ 하려고 하다	\N	\N	\N	toeic	기타
15761	encouraged/urged to V	~ 하도록 권고되다	\N	\N	\N	toeic	기타
15764	concentration	집중 	\N	\N	\N	toeic	하
15770	attire	의복	\N	\N	\N	toeic	하
15776	cause 결과	~ 을 초래 하다	\N	\N	\N	toeic	기타
15779	soak	v.- 을 홈뻑 적시다	\N	\N	\N	toeic	하
15782	relocate	이전 하다	\N	\N	\N	toeic	하
15785	eligible	adj . 자격 이 있는 	\N	\N	\N	toeic	하
15805	profile	v . 프로필 을 알려주 다 ( 작성 하다 ] n . 측면 : 프로필 	\N	\N	\N	toeic	하
15808	appointee	n . 지명 된 사람	\N	\N	\N	toeic	하
15835	an assortment of 복수 명사	여러 가지의	\N	\N	\N	toeic	기타
15838	encourage 목적어 to V	- 하도록 권장 하다 장려 하다	\N	\N	\N	toeic	기타
15856	characteristic	n . 특징	\N	\N	\N	toeic	하
15859	specifics	n . 세부 사항	\N	\N	\N	toeic	하
15862	effective	ad ( 법률 	\N	\N	\N	toeic	하
15893	release	v . 공개 하다 . 발표 하다 . 출시 하다 n . 발표 	\N	\N	\N	toeic	하
15896	detailed	adj . 자세한 	\N	\N	\N	toeic	하
15911	endeavor	n . 노력 	\N	\N	\N	toeic	하
15923	numerous	adj . 매우 많은	\N	\N	\N	toeic	하
15930	boost	n . 증가 	\N	\N	\N	toeic	하
15951	resume	v . 다시 시작 하다 	\N	\N	\N	toeic	하
15961	resolve	v . 해결 하다 .	\N	\N	\N	toeic	하
15975	affordability	n . 저렴한 비용	\N	\N	\N	toeic	하
15997	enough	adj. 충분한 adv . 충분히	\N	\N	\N	toeic	하
16007	accustomed	adj.- 에 익숙한	\N	\N	\N	toeic	하
16020	given	prep.- 를 고려 해볼 때 	\N	\N	\N	toeic	하
16023	influx	n . 유입 	\N	\N	\N	toeic	하
16026	interfere with	v . 방해 하다 ; 간섭 하다	\N	\N	\N	toeic	기타
16029	stress	v . 강조 하다 n . 강조 	\N	\N	\N	toeic	하
16037	entry	n . ( 경기 등 의 ) 참가자 : 출품물 	\N	\N	\N	toeic	하
16053	markedly	adv . 현저 하게 	\N	\N	\N	toeic	하
16069	glowing	adj . 빛나는 : 극찬 하는	\N	\N	\N	toeic	하
1923	hand down	건네주다	\N	\N	\N		기타
1924	generation	세대	\N	\N	\N		하
1926	professional	전문적인	\N	\N	\N		하
15660	estimated arrival time	도착 예정 시간	\N	\N	\N	toeic	기타
15663	established company	확고한 중견 기업	\N	\N	\N	toeic	기타
15668	guided tour	가이드 여행	\N	\N	\N	toeic	기타
15671	newly purchased item	새롭게 구입 한 IT	\N	\N	\N	toeic	기타
15678	selected candidate	선택된 후보	\N	\N	\N	toeic	기타
15684	written exam	필기 시험	\N	\N	\N	toeic	기타
15687	feel like - ing	~ 하고 싶어 하다	\N	\N	\N	toeic	기타
15695	in -ing	- 함에 있어서	\N	\N	\N	toeic	기타
15717	advise - ing	조언 	\N	\N	\N	toeic	기타
15720	keep - ing	계속 하다	\N	\N	\N	toeic	기타
15731	dislike - ing	싫어 하다	\N	\N	\N	toeic	기타
15769	quarterly sales	분기 별 매출	\N	\N	\N	toeic	기타
15772	as a result of	- 의 결과 원인	\N	\N	\N	toeic	기타
15775	lead to 결과	~ 을 초래 하다	\N	\N	\N	toeic	기타
15778	markedly	adv . 현저 하게 	\N	\N	\N	toeic	하
15784	delay	n . 지연 	\N	\N	\N	toeic	하
15821	maintain	v . 유지 하다 . 보수 하다	\N	\N	\N	toeic	하
15827	retrieve luggage	수화물 ( 짐 ) 을 찾다	\N	\N	\N	toeic	기타
15833	destination	n . 행선지 	\N	\N	\N	toeic	하
15843	nomalize	v . 정상화 되다	\N	\N	\N	toeic	기타
15845	conveniently	adv . 편리 하게	\N	\N	\N	toeic	하
15848	reputation	n . 평판 	\N	\N	\N	toeic	하
15851	enhance	v . 향상 시키다 . 강화 하다	\N	\N	\N	toeic	하
15867	retain	v . 보유 하다 . 유지 하다	\N	\N	\N	toeic	하
15873	utility bills	phr . 공과금	\N	\N	\N	toeic	기타
15876	conform to	v . 지키다 . 준수 하다	\N	\N	\N	toeic	기타
15879	subscribe to	v . 구독 하다	\N	\N	\N	toeic	기타
15888	compliance	n . ( 법 / 규칙 의 ) 준수 	\N	\N	\N	toeic	하
15891	a handful of	phr . 소수 의 	\N	\N	\N	toeic	기타
15894	deficit	n . 적자 	\N	\N	\N	toeic	하
15912	construction	n . 건설 	\N	\N	\N	toeic	하
15915	numerous	adj . 매우 많은	\N	\N	\N	toeic	하
15921	serve	v . ( 상품 / 서비스 를 ) 제공 하다 . 근무 하다 	\N	\N	\N	toeic	하
15928	readership	n . 독자 수 ( 중 ]	\N	\N	\N	toeic	하
15931	at one's earliest convenience	phr . 되도록 일찍	\N	\N	\N	toeic	기타
15940	benefit	v . 혜택 ( 이득 ) 을 보다 유익 하다 n . 혜택 	\N	\N	\N	toeic	하
15943	earn	v . ( 금전 을 ) 벌다 . ( 평판 을 ) 얻다	\N	\N	\N	toeic	하
15946	admission	n . 입장 : 입학	\N	\N	\N	toeic	하
15956	expenditure	n . 지출 	\N	\N	\N	toeic	하
15968	overbook	v . 예약 을 한도 이상 으로 받다	\N	\N	\N	toeic	기타
15980	rigorous	adj . 철저한 	\N	\N	\N	toeic	하
15989	slightly	adv . 약간 	\N	\N	\N	toeic	하
15992	immediately	adv . 즉시 	\N	\N	\N	toeic	하
16002	update	n . 업데이트 	\N	\N	\N	toeic	하
16005	receive	v . 받다	\N	\N	\N	toeic	하
16013	statement	n . 성명 ( 서 ) : 명세서 	\N	\N	\N	toeic	하
16021	specify	v . 구체적으로 명시하다	\N	\N	\N	toeic	하
16030	advancement	n . 진보 : 승진	\N	\N	\N	toeic	하
16033	withdraw	v . 빼내다 . 인출 하다 . 철수 시키다	\N	\N	\N	toeic	하
16045	referral	n . 소개 	\N	\N	\N	toeic	하
16064	grant	n . ( 정부 ) 보조금 v . 주다 . 수여 하다	\N	\N	\N	toeic	하
16082	exactly	adv . 정확하게	\N	\N	\N	toeic	하
16095	satisfaction	n . 만족 	\N	\N	\N	toeic	하
16104	apply for	phr . 지원 하다	\N	\N	\N	toeic	기타
16138	categorize	v . 분류 하다	\N	\N	\N	toeic	하
16151	closely	adv . 면밀 하게 	\N	\N	\N	toeic	하
16158	capacity	n . 정원 	\N	\N	\N	toeic	하
16164	accumulate	v . 축적 하다 ; ( 이자 	\N	\N	\N	toeic	하
16169	notable	adj . 유명한 	\N	\N	\N	toeic	하
16179	invent	v . 발명하다 . 고안하다	\N	\N	\N	toeic	하
16214	analysis	n . 분석 	\N	\N	\N	toeic	하
16221	likely	adj.- 할 것 같은	\N	\N	\N	toeic	하
16231	term	n . 조건 : 임기 	\N	\N	\N	toeic	하
16234	typically	adv . 보통 	\N	\N	\N	toeic	하
16258	replace	v . 대체하다 . 교체하다	\N	\N	\N	toeic	하
16264	handle	v . 다루다 . 처리하다	\N	\N	\N	toeic	하
16280	submission	n . ( 서류 · 제안서 등 의 ) 제출 ( 물 )	\N	\N	\N	toeic	하
16284	largely	adv . 주로 	\N	\N	\N	toeic	하
16303	conduct	v . ( 업무 따위 를 ) 실시 하다 	\N	\N	\N	toeic	하
16306	contain	v.- 이 들어 있다 . 포함 하다	\N	\N	\N	toeic	하
16316	relinquish one's right	권리를 포기하다	\N	\N	\N	toeic	기타
16363	distribute	v . 유통 시키다 	\N	\N	\N	toeic	하
16366	specification	n . 설명서 	\N	\N	\N	toeic	하
16379	instructor	n . 강사 	\N	\N	\N	toeic	하
16382	complimentary	adj . 무료의	\N	\N	\N	toeic	하
16387	awareness	n . ( - 의 중요성 에 대한 ) 의식 	\N	\N	\N	toeic	하
16396	support	n . 지지 	\N	\N	\N	toeic	하
16399	predecessor	n . 전임자	\N	\N	\N	toeic	하
16408	appraisal	n . 평가 	\N	\N	\N	toeic	하
16415	recruiter	n . 모집 자 	\N	\N	\N	toeic	하
16418	timely	ad ) 시기 적절한 	\N	\N	\N	toeic	하
16437	Insurance	n . 보험 : 보험금 	\N	\N	\N	toeic	하
16446	reimburse	n . 변제 하다 	\N	\N	\N	toeic	하
16451	protective	adj . 보호 하는 	\N	\N	\N	toeic	하
16454	introduce	v . 소개 하다 ; 도입 하다 . ( 상품 을 ) 선보이다	\N	\N	\N	toeic	하
16457	process	v . 처리 하다 : 가공 하다 n . 과정 	\N	\N	\N	toeic	하
16461	appearance	n . ( 걸 ) 모습 	\N	\N	\N	toeic	하
16476	manual	n . 설명서 	\N	\N	\N	toeic	하
16481	commercial	n . ( TV- 라디오 ) 광고 adj . 상업 의	\N	\N	\N	toeic	하
16484	anticipate	v . 예상 하다 . 예측 하다	\N	\N	\N	toeic	하
16487	revenue	n . 수익 	\N	\N	\N	toeic	하
15597	knowledgeably	adv . 박식 하게	\N	\N	\N	toeic	중
15623	attached document	첨부 된 문서	\N	\N	\N	toeic	기타
15633	developed country	선진국	\N	\N	\N	toeic	기타
15628	customized/personalized products	주문 제작 / 맞춤형 제품	\N	\N	\N	toeic	기타
15630	designated area/spots	지정된 지역 / 장소	\N	\N	\N	toeic	기타
15635	distinguished/renowned architect	뛰어난 / 유명한 건축가	\N	\N	\N	toeic	기타
15640	missing luggage (=misplaced	 lost)	\N	\N	\N	toeic	기타
15649	recurring problem	반복 하는 문제	\N	\N	\N	toeic	기타
15657	weakening economy	경제 약세	\N	\N	\N	toeic	기타
15662	extended working hours	연장 근무 시간	\N	\N	\N	toeic	기타
15667	finished product	완제품	\N	\N	\N	toeic	기타
15676	recycled paper	재활용 종이	\N	\N	\N	toeic	기타
15702	be opposed to N/-ing	~에 반대하다	\N	\N	\N	toeic	기타
15710	lead to N / -ing	~ 를 초래 하다 . 야기 하다	\N	\N	\N	toeic	기타
15722	enjoy -ing	즐기다	\N	\N	\N	toeic	기타
15724	deny - ing	부인 하다	\N	\N	\N	toeic	기타
15727	put off-ing	연기하다	\N	\N	\N	toeic	기타
15730	stop -ing	멈추다	\N	\N	\N	toeic	기타
15738	spending	지출 	\N	\N	\N	toeic	하
15753	plan to V	- 할 계획	\N	\N	\N	toeic	기타
15789	distributor	n . 유통 업자 [ 체 ] 	\N	\N	\N	toeic	하
15809	appointment	n . 임명 	\N	\N	\N	toeic	하
15812	incorporation	n . 포함 법인 설립 	\N	\N	\N	toeic	하
15815	adjacent to 장소	- 에 인접한	\N	\N	\N	toeic	기타
15818	colleague	n . 동료	\N	\N	\N	toeic	하
15857	whereas	반면에	\N	\N	\N	toeic	하
15863	in addition	phr . 덧붙여 	\N	\N	\N	toeic	기타
15900	underestimate	v . 과소 평가 하다 n . 과소 평가	\N	\N	\N	toeic	하
15934	by oneself	phr . 혼자서	\N	\N	\N	toeic	기타
15949	misplace	v . 잃어 버리다 . 제자리 에 두지 않다	\N	\N	\N	toeic	하
15952	potential	adj . 가능성 이 있는 	\N	\N	\N	toeic	하
15959	significant	adj . 상당한 	\N	\N	\N	toeic	하
15965	property	n . 재산 : 부동산 	\N	\N	\N	toeic	하
15977	deliberate	adj . 고의적 인 : 신중한 v . 심사숙고 하다	\N	\N	\N	toeic	하
15983	rigorous	adj . 철저한 	\N	\N	\N	toeic	하
15996	carefully	adv . 조심 스럽게 	\N	\N	\N	toeic	하
16011	actively	adv . 적극적으로	\N	\N	\N	toeic	하
16016	opposite	adj . 맞은 편의 반대 의 prep. 20 (across from)	\N	\N	\N	toeic	하
16019	vacant	ad . 공석의 	\N	\N	\N	toeic	하
16022	conflict	n . 갈등	\N	\N	\N	toeic	하
16025	subsequent	adj . 차후의	\N	\N	\N	toeic	하
16031	wealth	n . 재산 	\N	\N	\N	toeic	하
16040	funding	n . 자금 : 자금 제공 [ 재정 지원 ]	\N	\N	\N	toeic	하
16043	relief	n . 안도 	\N	\N	\N	toeic	하
16049	representative	n . 직원 	\N	\N	\N	toeic	하
16058	entry	n . ( 경기 등 의 ) 참가자 : 출품물 	\N	\N	\N	toeic	하
16067	referral	n . 소개 	\N	\N	\N	toeic	하
16079	proceedings	n . 회의록 	\N	\N	\N	toeic	하
16086	accurate	adj . 정확한	\N	\N	\N	toeic	하
16089	compatibilty	n . 호환성	\N	\N	\N	toeic	중
16098	pertaining to	prep.- 에 관련된	\N	\N	\N	toeic	기타
16111	volunteer	n . 자원 봉사자 v . 자진 하다 . 자원 봉사 하다	\N	\N	\N	toeic	하
16117	correspond to	phr.- 와 일치 하다	\N	\N	\N	toeic	기타
16123	stretch	n . ( 길게 뻗은 ) 구간 	\N	\N	\N	toeic	하
16129	challenge	n . 도전 	\N	\N	\N	toeic	하
16132	influence	v . 영향 을 주다 n . 영향 ( 력 )	\N	\N	\N	toeic	하
16135	reverse	v . 뒤집다 	\N	\N	\N	toeic	하
16145	resolution	n . 해결 	\N	\N	\N	toeic	하
16148	resolution	n . 해결 	\N	\N	\N	toeic	하
16154	portable	adj . 휴대가 쉬운 	\N	\N	\N	toeic	하
16173	rely (on=upon)	v . ~ 에 의존 / 의지 하다	\N	\N	\N	toeic	기타
16176	respected	adj . 홀륭한	\N	\N	\N	toeic	하
16180	expense	n . 비용 	\N	\N	\N	toeic	하
16195	compensation	n . 보상 ( 금 ) 	\N	\N	\N	toeic	하
16198	position	n . 일자리 	\N	\N	\N	toeic	하
16211	confidential	ad . 기밀의 	\N	\N	\N	toeic	하
16218	financially	adv . 재정적 으로 	\N	\N	\N	toeic	하
16237	based	adj . ( ~ 에 ) 기반을 둔 : 본사를 둔	\N	\N	\N	toeic	하
16247	admirable	adj . 감탄 할만한	\N	\N	\N	toeic	하
16250	ethical	adj . 윤리적인	\N	\N	\N	toeic	하
16253	humidity	n . 습도 	\N	\N	\N	toeic	하
16270	previously	adv . 이전에	\N	\N	\N	toeic	하
16273	until further notice	추후 공지 가 있을 때 까지	\N	\N	\N	toeic	기타
16287	refer A to B	A 를 B 에 소개 하다	\N	\N	\N	toeic	기타
16294	affordable	adj . ( 가격 등 이 ) 알맞은 	\N	\N	\N	toeic	하
16300	be contingent on	~ 에 달려 있다	\N	\N	\N	toeic	기타
16323	hypothesis	n . 가설 	\N	\N	\N	toeic	하
16329	diverse	adj . 다양한	\N	\N	\N	toeic	하
16332	state	v . 말하다 . 진술 하다 : ( 문서 에 ) 명시 하다	\N	\N	\N	toeic	하
16347	flexible	adj . 융통성 이 있는 	\N	\N	\N	toeic	하
16354	inquire	1V . 질문 하다	\N	\N	\N	toeic	하
16370	mutually	adv . 서로 	\N	\N	\N	toeic	하
16373	errand	n . 심부름 	\N	\N	\N	toeic	하
16376	mind	v . 꺼리다 . 싫어 하다	\N	\N	\N	toeic	하
16384	confidence	n . 신뢰 	\N	\N	\N	toeic	하
16393	since	prep.- 이래로 conj.- 이래로 : - 때문에 adv . 그 ( 때 ) 이후 로	\N	\N	\N	toeic	하
16404	field	n . 분야 	\N	\N	\N	toeic	하
16411	productivity	n . 생산성	\N	\N	\N	toeic	하
16427	Insurance	n . 보험 : 보험금 	\N	\N	\N	toeic	하
16448	inquiry	n . 문의 : 조사	\N	\N	\N	toeic	하
16464	chemical	adj . 화학 의 	\N	\N	\N	toeic	하
16470	shift	n . 교대조 	\N	\N	\N	toeic	하
15614	differing/varying opinion	차이 가 나는 의견	\N	\N	\N	toeic	기타
15625	classified ad	구인 [ 구직 ] 광고	\N	\N	\N	toeic	기타
16430	evident	adj . 분명한 	\N	\N	\N	toeic	하
15794	costly	adj . 비용 이 많이 드는 	\N	\N	\N	toeic	하
15797	timely	시기 적절한	\N	\N	\N	toeic	하
15800	issue	v . 지급 ( 발급 ] 하다 	\N	\N	\N	toeic	하
15820	maintenance	n . 보수 관리 	\N	\N	\N	toeic	하
15823	commitment	n . 전념 	\N	\N	\N	toeic	하
16210	spare	adj . 여분의 	\N	\N	\N	toeic	하
15829	in agreement of	~ 에 동의 하는	\N	\N	\N	toeic	기타
15832	culinary	adj 요리의	\N	\N	\N	toeic	하
15842	past	prep . 지나서 adj . 지난 	\N	\N	\N	toeic	하
15844	normality	n . 정상 상태	\N	\N	\N	toeic	하
15866	track	v . ( 전개 / 진행 과정 을 ) 추적 하다 n . 궤도 	\N	\N	\N	toeic	하
15884	promote	v . 홍보 하다 . 승진 시키다 ; 증진 / 촉진시키다	\N	\N	\N	toeic	하
15909	correspondence	n . ( 남과 주고 받는 ) 서신 [ 편지 ] . 서신 왕래	\N	\N	\N	toeic	하
15917	acknowledge	v . 인정 하다 : ~ 에게 감사 를 표하다 . 받았음 을 알리다	\N	\N	\N	toeic	하
15924	solely	adv . 오로지 	\N	\N	\N	toeic	하
15927	engrave	v . 새기다 . 조각 하다	\N	\N	\N	toeic	하
15945	appliance	n . ( 가정용 ) 기기 	\N	\N	\N	toeic	하
15955	devise	v . 고안 하다 . 발명 하다	\N	\N	\N	toeic	하
15970	dedicated	adj . 전념 하는 	\N	\N	\N	toeic	하
15976	equivalent	adj . 해당 하는 	\N	\N	\N	toeic	하
15995	recommend	v . 추천 하다	\N	\N	\N	toeic	하
16018	assure	v . 장담 하다 	\N	\N	\N	toeic	하
16038	pay off	phr . 성과 를 올리다 . 성공 하다	\N	\N	\N	toeic	기타
16054	purpose	n . 목적	\N	\N	\N	toeic	하
16066	duplicate	v . 복사 하다 . 복제 하다 n . 사본 	\N	\N	\N	toeic	하
16071	Instructional	adj . 교육용의	\N	\N	\N	toeic	하
16078	proceed	v . 계속 해서 ~ 하다 . 진행 되다 . 나아가다	\N	\N	\N	toeic	하
16081	rate	n . 요금 : 속도 : 비율 v . 평가 하다	\N	\N	\N	toeic	하
16088	compatible	adj . 호환 이 되는 	\N	\N	\N	toeic	하
16094	attentively	adv . 주의 깊게 	\N	\N	\N	toeic	하
16097	applicable	adj . 해당 되는 	\N	\N	\N	toeic	하
16113	respective	adj . 각각의 	\N	\N	\N	toeic	하
16116	installation	n . 설치	\N	\N	\N	toeic	하
16119	separately	adv . 따로 따로 	\N	\N	\N	toeic	하
16125	emphasize	v . 강조 하다	\N	\N	\N	toeic	하
16134	draw	v . 끌다 . 끌어 들이다 . 이용 하다 . 의지 하다	\N	\N	\N	toeic	하
16141	consider	v . 고려 하다 . 숙고 하다	\N	\N	\N	toeic	하
16161	modification	n . 변경 	\N	\N	\N	toeic	하
16182	cater	v . ( 사업 으로 행사 에 ) 음식 을 공급 [ 조달 ] 하다	\N	\N	\N	toeic	하
16188	appropriate	adj . 적절한 	\N	\N	\N	toeic	하
16197	deteriorate	v . 악화 되다 . 더 나 빠지다	\N	\N	\N	toeic	하
16203	divert	v . 방향을 바꾸게 하다 	\N	\N	\N	toeic	하
16207	customary	adj . 관례 적인 	\N	\N	\N	toeic	하
16217	dependent	adj . ~ 에 의존 하는 ( on )	\N	\N	\N	toeic	하
16240	marginally	adv . 아주 조금 	\N	\N	\N	toeic	하
16243	regretfully	adv . 유감 스럽게도	\N	\N	\N	toeic	중
16255	stable	adj . 안정된 	\N	\N	\N	toeic	하
16267	publication	n . 간행물 	\N	\N	\N	toeic	하
16276	compete with 사람 for 목적	vi . 경쟁 하다	\N	\N	\N	toeic	기타
16290	concerning	prep.- 에 관한 	\N	\N	\N	toeic	하
16293	approximately	adv . 약 	\N	\N	\N	toeic	하
16350	in advance	phr . 미리 	\N	\N	\N	toeic	기타
16296	maintenance	n . 유지 : ( 보수 ) 관리	\N	\N	\N	toeic	하
16309	immediately	adv . 즉시 	\N	\N	\N	toeic	하
16312	casually	adv . 이따금 	\N	\N	\N	toeic	하
16319	expose	v . 드러내다 . 노출 시키다	\N	\N	\N	toeic	하
16335	assistant	n . 조력자 	\N	\N	\N	toeic	하
16341	motivate	v . 동기 를 부여 하다 	\N	\N	\N	toeic	하
16344	eliminate	v . 없애다 . 제거 하다	\N	\N	\N	toeic	하
16401	particularly	adv . 특히 	\N	\N	\N	toeic	하
16414	recruitment	n . 신규 모집	\N	\N	\N	toeic	하
16421	consideration	n . 고려 ( 사항 ) 	\N	\N	\N	toeic	하
16479	contractor	n . 계약자 	\N	\N	\N	toeic	하
16485	financial	adj . 재정 의 	\N	\N	\N	toeic	하
16424	accomplished	adj . ( 기량 이 ) 뛰어난 	\N	\N	\N	toeic	하
16440	eliminate	v . 없애다 . 제거 하다	\N	\N	\N	toeic	하
16443	statistical	adj . 통계 ( 상 ) 의	\N	\N	\N	toeic	하
16500	commitment	n . 전념 	\N	\N	\N	toeic	하
15593	provide	v . 제공 하다 . 주다	\N	\N	\N	toeic	하
15600	realize	인식 하다 확실히 이해 하다	\N	\N	\N	toeic	하
15602	recognizable	adj . 인식 할 수 있는 	\N	\N	\N	toeic	하
15622	accomplished mission/musician	성취 된 미션 / 숙달 된 음악가	\N	\N	\N	toeic	기타
15642	neighboring area	인근 지역	\N	\N	\N	toeic	기타
15654	striking agreement	인상적인 합의	\N	\N	\N	toeic	기타
15659	convincing argument	설득력 있는 주장	\N	\N	\N	toeic	기타
15685	be busy - ing	~ 하느라 바쁘다	\N	\N	\N	toeic	기타
15688	refrain from - ing	삼가다	\N	\N	\N	toeic	기타
15699	be familiar with	~에 익숙하다	\N	\N	\N	toeic	기타
15705	be subject to N/-ing	~ 의 대상이다 ~의 영향을 받기 쉽다	\N	\N	\N	toeic	기타
15713	aporeciate -ing	감사 하다	\N	\N	\N	toeic	기타
15736	advertising	광고 ( 업 )	\N	\N	\N	toeic	하
15740	accounting	회계	\N	\N	\N	toeic	하
15743	cleaning	청소	\N	\N	\N	toeic	하
15746	hearing	청각 / 공청회	\N	\N	\N	toeic	하
15756	way to V	- 할 방법	\N	\N	\N	toeic	기타
15759	be willing to V	기꺼이 ~ 하다	\N	\N	\N	toeic	기타
15762	concentrate	v . 집중 하다	\N	\N	\N	toeic	하
15777	result from 원인	- 로부터 발생 하다	\N	\N	\N	toeic	기타
15780	indefinitely	adv . 무 ( 기 ) 한 으로	\N	\N	\N	toeic	하
15791	distribution	n . 배포 	\N	\N	\N	toeic	하
15826	retrieve	v . 되찾다 . 회수 하다 : 정보 를 검색 하다	\N	\N	\N	toeic	하
15646	pressing matter	긴박한 문제	\N	\N	\N	toeic	기타
15653	surrounding area	주변 환경	\N	\N	\N	toeic	기타
15661	estimated delivery date	예상 배송일	\N	\N	\N	toeic	기타
15669	handcrafted piece	수 제품	\N	\N	\N	toeic	기타
15672	newly appointed C.E.O.	새롭게 임명 된C.E.O.	\N	\N	\N	toeic	기타
15679	skilled/experienced/seasoned	숙련 된 직원	\N	\N	\N	toeic	기타
15682	valued customer	가치 있는 고객	\N	\N	\N	toeic	기타
15696	for N / -ing	~ 를 위해 	\N	\N	\N	toeic	기타
15721	practice - ing	연습 하다	\N	\N	\N	toeic	기타
15732	mind -ing	꺼리다	\N	\N	\N	toeic	기타
15752	ability to V	- 할 수 있는 능력	\N	\N	\N	toeic	기타
15755	effort to V	하기 위한 노력	\N	\N	\N	toeic	기타
15788	enforce	v . 강요 하다 ; 시행 하다	\N	\N	\N	toeic	하
15811	incorporate	일부로 포함 하다	\N	\N	\N	toeic	하
15817	occupancy	n . 사용 	\N	\N	\N	toeic	하
15831	expeditious	adj . 신속한	\N	\N	\N	toeic	하
15847	promising	adv . 유망한 	\N	\N	\N	toeic	하
15853	associate	n . ( 사업 / 직장 ) 동료 : 직원 v . 관련 시키다	\N	\N	\N	toeic	하
15872	pending	adj . 미결인 	\N	\N	\N	toeic	하
15875	conservation	보존	\N	\N	\N	toeic	하
15881	consist of	v.- 로 구성 되다	\N	\N	\N	toeic	기타
15887	submit	v . 제출 하다 . 제기 하다	\N	\N	\N	toeic	하
15890	permit	n . 허가증 v . 허가 / 허용 하다	\N	\N	\N	toeic	하
15903	reliable	ad . 믿을 만한 	\N	\N	\N	toeic	하
15920	construction	n . 건설 	\N	\N	\N	toeic	하
15933	payment	n . 결제 	\N	\N	\N	toeic	하
15936	nomination	n . 임명 	\N	\N	\N	toeic	하
15939	offset	v . 상쇄 하다 . 메우다 n . 차감 계산 	\N	\N	\N	toeic	하
15942	promotion	n . 승진 	\N	\N	\N	toeic	하
15948	reimbursement	n . 환급 	\N	\N	\N	toeic	하
15958	significance	n . 중요성	\N	\N	\N	toeic	하
15967	comply with	v . 준수 하다	\N	\N	\N	toeic	기타
15973	assist	v . 도와 주다 n . 원조 	\N	\N	\N	toeic	하
15982	punctual	ad 	\N	\N	\N	toeic	하
15985	challenging	adj . 어려운 	\N	\N	\N	toeic	하
15988	officially	adv . 공식적 으로 	\N	\N	\N	toeic	하
15998	transport	v . 수송 하다 . 운송 하다 n . 수송 	\N	\N	\N	toeic	하
16001	prospective	adj . 장래 의 	\N	\N	\N	toeic	하
16010	schedule	v . 일정을 잡다 n . 일정	\N	\N	\N	toeic	하
16015	be credited with	phr . ~ 로 인정 받다 . 신뢰 를 얻다	\N	\N	\N	toeic	기타
16032	noticeable	adj . 눈 에 띄는 	\N	\N	\N	toeic	하
16041	operate	v . 운영 하다 : 작동 하다	\N	\N	\N	toeic	하
16044	duplicate	v . 복사 하다 . 복제 하다 n . 사본 	\N	\N	\N	toeic	하
16070	obligation	n . 의무	\N	\N	\N	toeic	하
16074	significant	adj . 중요한 	\N	\N	\N	toeic	하
16077	follow up on	phr . ~ 에 대해 후속 조치 하다 ; ~ 을 계속 주구 / 이행 하다	\N	\N	\N	toeic	기타
16103	incurrence	n . ( 손해 를 ) 입음 	\N	\N	\N	toeic	중
16124	term	n . 조건 : 기간 : 용어	\N	\N	\N	toeic	하
16137	widen	v . 확장 하다 . 넓히다	\N	\N	\N	toeic	하
16153	consult	v . 상의 하다 	\N	\N	\N	toeic	하
16166	steady	adj 끊임 없는 	\N	\N	\N	toeic	하
16168	clarify	v . 명확 하게 하다	\N	\N	\N	toeic	하
16178	respond	v . ( ~ 에 ) 반응 / 응답 하다	\N	\N	\N	toeic	하
16220	expand	v . 확장 하다 . 확대 하다 . 늘리다	\N	\N	\N	toeic	하
16227	abundant	adj . 풍부한 	\N	\N	\N	toeic	하
16236	adjustment	n . ( 약간 의 ) 수정 	\N	\N	\N	toeic	하
16246	upcoming	adj . 다가오는 	\N	\N	\N	toeic	하
16249	additional	adj . 주가 의 	\N	\N	\N	toeic	하
16263	attached	adj . 첨부된	\N	\N	\N	toeic	하
16279	directly	adv . 곧바로 [ 즉시 ) 	\N	\N	\N	toeic	하
16283	availability	n . 유효성 	\N	\N	\N	toeic	하
16299	depend	v . 의존 하다 : ~ 에 달려 있다	\N	\N	\N	toeic	하
16322	insulation	n . 절연체 : 단열 	\N	\N	\N	toeic	하
16325	hypothetical	adj . 가정 의 	\N	\N	\N	toeic	하
16328	supervisor	n . 상사 	\N	\N	\N	toeic	하
16338	be ideal for- 에 required	adj. 필수의	\N	\N	\N	toeic	기타
16346	cover expenses	비용 을 대다 . 충당 하다	\N	\N	\N	toeic	기타
16360	leading	adj . 주요한 	\N	\N	\N	toeic	하
16369	merger	n . ( 회사 의 ) 합병	\N	\N	\N	toeic	하
16372	mutuality	n . 상호 관계	\N	\N	\N	toeic	중
16375	maximize	v . 극대화 하다 . 최대한 활용 하다	\N	\N	\N	toeic	하
16381	instruction	n . 교육 	\N	\N	\N	toeic	하
16389	transfer	v . 옮기다 	\N	\N	\N	toeic	하
16398	resourceful	adj . 기지 가 있는 	\N	\N	\N	toeic	하
16417	evident	adj . 분명한 	\N	\N	\N	toeic	하
16436	operation	n . 사업 	\N	\N	\N	toeic	하
16442	flexible	adj . 융통성 이 있는 	\N	\N	\N	toeic	하
16445	renovate	v . 개조 하다 . 보수 하다	\N	\N	\N	toeic	하
16463	subscribe	v . ( 신문 · 잡지 등 을 ) 구독 하다	\N	\N	\N	toeic	하
16475	extension	n . ( 기한 ) 연장 : 내선 ( 번호 ) 	\N	\N	\N	toeic	하
16491	relocate	v . 이동 하다 . 이전 하다	\N	\N	\N	toeic	하
16497	purchase	n . 구입 ( 한 것 ) v . 구입 하다 . 사다	\N	\N	\N	toeic	하
16503	contribute	v . 기여 하다 . 기부 하다 : 기고 하다	\N	\N	\N	toeic	하
16506	revise	v . 수정 하다 . 변경 하다	\N	\N	\N	toeic	하
16514	entrance	n . 입구 : 문 들어가기 	\N	\N	\N	toeic	하
16521	dispose	v . 처리 하다 . 처분 하다 ( of )	\N	\N	\N	toeic	하
16531	philanthropic	adj . 자선 의 	\N	\N	\N	toeic	하
15594	regulation	n . 규제 	\N	\N	\N	toeic	하
15606	advertising agency	광고 업체	\N	\N	\N	toeic	기타
15637	enclosed parking garage	실내 주차장	\N	\N	\N	toeic	기타
16353	manufacture	v . 제조 하다 . 생산 하다 n . 제조 	\N	\N	\N	toeic	하
15615	developing country	| 개발 도상국가	\N	\N	\N	toeic	기타
15626	combined efforts	결합 된 노력	\N	\N	\N	toeic	기타
15636	enclosed document	동봉 된 문서	\N	\N	\N	toeic	기타
15643	ongoing matter	진행중인 일	\N	\N	\N	toeic	기타
15655	overwhelming order	압도적 인 주문	\N	\N	\N	toeic	기타
15683	written consent/permission	서면 동의 / 허가	\N	\N	\N	toeic	기타
15692	prior to N / Hing	~ 하기 전에	\N	\N	\N	toeic	기타
15697	be used to N/-ing	~에 익숙하다	\N	\N	\N	toeic	기타
15708	look forward to N/-ing	~를 기대하다	\N	\N	\N	toeic	기타
15716	recommend - ing	추천 하다	\N	\N	\N	toeic	기타
15733	avoid -ing	피하다	\N	\N	\N	toeic	기타
15750	training	훈련	\N	\N	\N	toeic	하
15765	concentrative	집중적인	\N	\N	\N	toeic	기타
15774	result in 결과	~ 을 초래 하다	\N	\N	\N	toeic	기타
15783	relocation	재배치	\N	\N	\N	toeic	하
15806	keep [ maintain ] a low profile	겸손 함 을 유지 하다 . 몸 을 사리다	\N	\N	\N	toeic	기타
15836	unanimous	adj . 만장일치의	\N	\N	\N	toeic	하
15839	be encouraged to V	- 하도록 권장 받다	\N	\N	\N	toeic	기타
15854	enclosed	adj . 동봉 된 : 둘러싸인 	\N	\N	\N	toeic	하
15870	appreciation	n . 감사	\N	\N	\N	toeic	하
15882	attempt	n . 시도 v . 시도 하다 . 노력 하다	\N	\N	\N	toeic	하
15885	factor	n . 요소 	\N	\N	\N	toeic	하
15901	estimation	n . 판단 ( 평가 ] 	\N	\N	\N	toeic	하
15907	occasionally	adv . 때때로 	\N	\N	\N	toeic	하
15963	affiliate	n . 계열사 v.- 와 제휴 시키다 	\N	\N	\N	toeic	하
15966	load	v . ( 짐을 ) 싣다 . 적재 하다 n . 적하 	\N	\N	\N	toeic	하
15986	restoration	n . ( 낡은 건물 · 그림 의 ) 복원 	\N	\N	\N	toeic	하
15999	exceptional	adj . 예외적 인 : ( 이례적 일 정도로 ) 뛰어난	\N	\N	\N	toeic	하
16008	aspire	v . 열망 하다	\N	\N	\N	toeic	하
16024	nonrefundable	adj . 환불 되지 않는	\N	\N	\N	toeic	하
16027	flyer	n . 전단지	\N	\N	\N	toeic	하
16036	now that	conj.- 이기 때문에 	\N	\N	\N	toeic	기타
16048	locate	v . 위치 시키다 : ( - 의 정확한 위치를 ) 찾아 내다	\N	\N	\N	toeic	하
16051	throughout	prep . 내내 	\N	\N	\N	toeic	하
16057	expert	n . 전문가	\N	\N	\N	toeic	하
16060	surplus	n . 잉여 ( 물 ) 	\N	\N	\N	toeic	하
16063	operate	v . 운영 하다 : 작동 하다	\N	\N	\N	toeic	하
16084	restrict	v . 제한 하다 . 한정 하다	\N	\N	\N	toeic	하
16091	chief	adj . 주된	\N	\N	\N	toeic	하
16100	incur	v . ( 비용 을 ) 발생 시키다 . 초래 하다	\N	\N	\N	toeic	하
16106	apply for	지원 하다	\N	\N	\N	toeic	기타
16112	obtain	v . 얻다	\N	\N	\N	toeic	하
16118	available	adj . ( 사람이 ) 시간 이 있는 	\N	\N	\N	toeic	하
16130	rather	adv . 꽤 	\N	\N	\N	toeic	하
16146	assessment	n . 평가 	\N	\N	\N	toeic	하
16149	assessment	n . 평가 	\N	\N	\N	toeic	하
16156	a series of	phr . 일련 의	\N	\N	\N	toeic	기타
16171	expire	vi . 만료 되다 . 끝나다	\N	\N	\N	toeic	하
16184	soon	adv . 곧 	\N	\N	\N	toeic	하
16190	particular	adj . 특정한	\N	\N	\N	toeic	하
16196	receipt	n . 영수증 ( 가산 명사 ) : 수령 ( 불가 산 명사 )	\N	\N	\N	toeic	하
16219	deliberation	n . 심사숙고 : 토의 	\N	\N	\N	toeic	하
16226	pick up	phr . 집어 들다 . 찾아 가다 : [ 사람 을 ] 태우 러 가다 . : 좋아 지다 	\N	\N	\N	toeic	기타
16245	enormously	adv . 엄청나게 	\N	\N	\N	toeic	하
16254	lucrative	adj . 수익성이 있는 	\N	\N	\N	toeic	하
16262	incredible	adj . 엄청난	\N	\N	\N	toeic	하
16266	recognition	n . 인정 	\N	\N	\N	toeic	하
16275	competitor	n . 경쟁 업체 	\N	\N	\N	toeic	하
16278	atmosphere	n . 분위기	\N	\N	\N	toeic	하
16282	disappointing	adj . 실망 스러운 	\N	\N	\N	toeic	하
16289	appointment	n . ( 공적 ) 약속 	\N	\N	\N	toeic	하
16295	auditor	n . 회계 감사관	\N	\N	\N	toeic	하
16311	capability	n . 능력 	\N	\N	\N	toeic	하
16314	coverage	n . ( 적용 ) 범위 	\N	\N	\N	toeic	하
16318	efficiently	adv . 능률적 으로 	\N	\N	\N	toeic	하
16337	be ideal for	에 이상적 이다	\N	\N	\N	toeic	기타
16349	reimbursement	v . 변상 	\N	\N	\N	toeic	하
16356	refreshing	adj . 신선한 	\N	\N	\N	toeic	하
16362	cancellation	n . 취소 	\N	\N	\N	toeic	하
16365	look forward to	phr.- 을 고대 하다 . 기다리다	\N	\N	\N	toeic	기타
16403	hire	v . 고용 하다 n . 신입 직원	\N	\N	\N	toeic	하
16406	duty	n . 직무 	\N	\N	\N	toeic	하
16413	recommendation	n . 추천 ( 서 ) 	\N	\N	\N	toeic	하
16426	operation	n . 사업 	\N	\N	\N	toeic	하
16429	listing	n . ( 공식적인 ) 목록 	\N	\N	\N	toeic	하
16432	consistently	adv . 항상 	\N	\N	\N	toeic	하
16439	statistics	n . 통계 ( 학 ) 	\N	\N	\N	toeic	하
16453	deliver	v . 배달 하다 . 배송 하다 : ( 연설 을 ) 하다	\N	\N	\N	toeic	하
16460	appear	v.- 인 것 같다 . 나타나다 나오다 	\N	\N	\N	toeic	하
16478	assignment	n . 임무 [ 업무 ] 	\N	\N	\N	toeic	하
16489	nutrition	n . 영양물 	\N	\N	\N	toeic	하
16495	corporate	adj . 법인 ( 체 ) 의 	\N	\N	\N	toeic	하
16507	historic	adj . 역사적인 	\N	\N	\N	toeic	하
16516	occupy	v . 차지 하다 	\N	\N	\N	toeic	하
16529	decade	n. 10 년	\N	\N	\N	toeic	하
16538	congratulate	v . 축하 하다	\N	\N	\N	toeic	하
16544	replacement	n . 교체 	\N	\N	\N	toeic	하
16547	conserve	v . 보호 하다 . 보존 하다	\N	\N	\N	toeic	하
16557	inconvenience	n . 불편 ( 한 것 )	\N	\N	\N	toeic	하
15599	honor	명예 를 주다	\N	\N	\N	toeic	하
15603	be recognized for	~로 인정 받다	\N	\N	\N	toeic	기타
15608	approaching storm	다가오는 폭풍	\N	\N	\N	toeic	기타
15632	dedicated/devoted/committed staff	헌신적인 직원	\N	\N	\N	toeic	기타
15651	rewarding effort	보람 있는 노력	\N	\N	\N	toeic	기타
15664	experienced people	능숙한 사람	\N	\N	\N	toeic	기타
15675	processed foods	가공 식품	\N	\N	\N	toeic	기타
15693	on ( upon ] N / -ing	~ 하자마자	\N	\N	\N	toeic	기타
15704	oppose N/-ing	~에 반대하다	\N	\N	\N	toeic	기타
15707	be resistant to N/-ing	~에 저항하다 강하다	\N	\N	\N	toeic	기타
15712	contribute to N / -ing	~ 에 기여 하다	\N	\N	\N	toeic	기타
15718	include -ing	포함 하다	\N	\N	\N	toeic	기타
15723	admit - ing	인정 하다	\N	\N	\N	toeic	기타
15735	resist - ing	저항 하다	\N	\N	\N	toeic	기타
15739	funding	자금 조달	\N	\N	\N	toeic	하
15742	planning	계획	\N	\N	\N	toeic	하
15745	processing	처리 / 절차 / 가공	\N	\N	\N	toeic	하
15749	staffing	직원 배치	\N	\N	\N	toeic	하
15773	release survey results	설문 결과 를 공개 하다	\N	\N	\N	toeic	기타
15793	distribute A to B	A 를 B 에게 배포 하다	\N	\N	\N	toeic	기타
15796	likely	가능성 있는	\N	\N	\N	toeic	하
15799	be given preference	phr . 우대 를 받다	\N	\N	\N	toeic	기타
15830	expedite	v . 신속히 처리 하다 . 진척 시키다	\N	\N	\N	toeic	하
15840	easily	adv . 쉽게 	\N	\N	\N	toeic	하
15858	distribution	n . 배포 	\N	\N	\N	toeic	하
15861	increment	n . ( 양적 ) 증가 임금 인상	\N	\N	\N	toeic	하
15877	evaluate	v . 평가 하다	\N	\N	\N	toeic	하
15892	notify	v.- 에게 알리다 . 통지 하다	\N	\N	\N	toeic	하
15916	solely	adv . 오로지 	\N	\N	\N	toeic	하
15919	endeavor	n . 노력 	\N	\N	\N	toeic	하
15922	treat	v . 대접 하다 : ( 특정한 태도 로 ) 대하다 . 처리 하다 ; 치료 하다 n . 특별한 대접	\N	\N	\N	toeic	하
15941	Instruction	n . 가르침 : 지시 사항 	\N	\N	\N	toeic	하
15950	editorial	adj . 편집 의 n . 사설 	\N	\N	\N	toeic	하
15953	device	n . 기기 	\N	\N	\N	toeic	하
15960	incrementally	adv . 점진적 으로 	\N	\N	\N	toeic	하
15971	waive	v . 적용 하지 않다 	\N	\N	\N	toeic	하
15974	testimonial	n . 추천 글 	\N	\N	\N	toeic	하
15978	prominent	adj . 중요한 	\N	\N	\N	toeic	하
15981	selective	adj . 까다로운 	\N	\N	\N	toeic	하
15990	substantially	adv . 상당히 	\N	\N	\N	toeic	하
15993	enrollment	n . 등록	\N	\N	\N	toeic	하
16003	suitable	adj . 적합한 	\N	\N	\N	toeic	하
16006	demand	n . 수요 . 요구 v . 요구 하다 	\N	\N	\N	toeic	하
16039	surplus	n . 잉여 ( 물 ) 	\N	\N	\N	toeic	하
16052	negotiate	v . 협상 하다	\N	\N	\N	toeic	하
16068	worsen	v . 악화 되다 : 악화 시키다	\N	\N	\N	toeic	하
16075	ample	adj . 많은 	\N	\N	\N	toeic	하
16085	recently	adv . 최근에	\N	\N	\N	toeic	하
16092	forum	n . 포럼 	\N	\N	\N	toeic	하
16101	groundbreaking	adj . 획기적인 n . 착공 	\N	\N	\N	toeic	하
16107	apply to	적용 하다	\N	\N	\N	toeic	기타
16122	proximity	n . 가까움 	\N	\N	\N	toeic	하
16128	acclaimed	adj 칭찬 [ 호평 ] 을 받고 있는	\N	\N	\N	toeic	하
16131	confirm	v . 확인 하다 . 확정 하다	\N	\N	\N	toeic	하
16144	discontinue	v . 생산을 중단하다	\N	\N	\N	toeic	하
16147	assess	v.- 을 평가 하다	\N	\N	\N	toeic	하
16157	arguably	adv . ( 최상급 앞에서 ) 거의 틀림 없이 	\N	\N	\N	toeic	하
16167	overdue	adj . 기한이 지난 	\N	\N	\N	toeic	하
16183	policy	n . 정책 	\N	\N	\N	toeic	하
16186	instead	adv . 그 대신	\N	\N	\N	toeic	하
16192	perishable	adv . 신속히 	\N	\N	\N	toeic	하
16201	comparison	n . 비교 비유	\N	\N	\N	toeic	하
16205	advocate	n . 지지자 	\N	\N	\N	toeic	하
16208	customarily	adv . 관례 ( 습관 ] 적 으로	\N	\N	\N	toeic	하
16215	generate	v . 발생 시키다 	\N	\N	\N	toeic	하
16222	allow	v . 허락 하다 . 허용 하다	\N	\N	\N	toeic	하
16225	relevant	adj . 관련 있는 	\N	\N	\N	toeic	하
16244	incomplete	adj . 미완성의 	\N	\N	\N	toeic	하
16256	disruption	n . 중단 	\N	\N	\N	toeic	하
16268	reflect	v . 반영 하다 	\N	\N	\N	toeic	하
16271	inspect	v . 점검 하다	\N	\N	\N	toeic	하
16281	specialize	v . 전문 으로 하다	\N	\N	\N	toeic	하
16285	refer	v . 보내다 . 소개 하다 언급 하다 . 참고 하다	\N	\N	\N	toeic	하
16292	waterfront	n . ( 도시 의 ) 해안가 물가 	\N	\N	\N	toeic	하
16301	overhaul	v . 점검 하다 n . 점검	\N	\N	\N	toeic	하
16324	complete	v . 완료 하다 . 끝 마치다 adj . 완벽한 완전한	\N	\N	\N	toeic	하
16327	supervisor	n . 상사 	\N	\N	\N	toeic	하
16330	arrangement	n . 준비 	\N	\N	\N	toeic	하
16333	district	n . 지구 ( 지역 ) 	\N	\N	\N	toeic	하
16342	profit	n. 수익 이익 	\N	\N	\N	toeic	하
16355	banquet	n . ( 공식 ) 연회 	\N	\N	\N	toeic	하
16359	registration	n . 등록 	\N	\N	\N	toeic	하
16371	mutual	ad . 상호간의	\N	\N	\N	toeic	하
16374	imperative	adj . 반드시 해야 하는 	\N	\N	\N	toeic	하
16377	individual	n . 개인 	\N	\N	\N	toeic	하
16385	advantage	n . 장점 	\N	\N	\N	toeic	하
16394	transfer	v . 옮기다 	\N	\N	\N	toeic	하
16402	limited	ad 	\N	\N	\N	toeic	하
16405	dependable	adj . 믿을 수 있는 	\N	\N	\N	toeic	하
16409	skill	n . 기술 	\N	\N	\N	toeic	하
16419	evidence	n . 증거 	\N	\N	\N	toeic	하
16435	applicant	n . 지원자 	\N	\N	\N	toeic	하
16444	statistically	adv . 통계적 으로 	\N	\N	\N	toeic	하
15609	boarding ticket	탑승권	\N	\N	\N	toeic	기타
15619	existing equipment	기존 장비	\N	\N	\N	toeic	기타
15627	completed form	작성된 양식 / 문서	\N	\N	\N	toeic	기타
15864	redeem	v . 되찾다 . ( 상품권 등 을 ) 상품 이나 현금 으로 교환 하다	\N	\N	\N	toeic	하
15620	increasing pressure	증가 하는 압력	\N	\N	\N	toeic	기타
15638	lasting impression	지속적인 인상	\N	\N	\N	toeic	기타
15645	ordering procedures	주문 절차	\N	\N	\N	toeic	기타
15647	promising member	유망한 회원	\N	\N	\N	toeic	기타
15652	rising/increasing cost	증가 하는 비용	\N	\N	\N	toeic	기타
15673	preferred means	선호 되는 수단	\N	\N	\N	toeic	기타
15677	qualified applicant	적격 인 지원자	\N	\N	\N	toeic	기타
15680	unbiased advice	편견 없는 조언	\N	\N	\N	toeic	기타
15686	be worth - ing	~ 할 가치 가 있다	\N	\N	\N	toeic	기타
15689	spend 시간 / 돈 ing	~ 하는 데 ( 시간 / 돈 ) 을 쓰다	\N	\N	\N	toeic	기타
15694	by - ing	~ 함으로써	\N	\N	\N	toeic	기타
15711	object to N / -ing	~ 에 반대 하다	\N	\N	\N	toeic	기타
15728	discontinue(=quit) -ing	중단하다	\N	\N	\N	toeic	기타
15737	boarding	탑승	\N	\N	\N	toeic	하
15741	housing	주택 ( 공급 )	\N	\N	\N	toeic	하
15747	pricing	가격 책정	\N	\N	\N	toeic	하
15757	discussion to V	- 할 수 있다	\N	\N	\N	toeic	기타
15760	be eligible/entitled/qualified to V	할 자격 이 있다	\N	\N	\N	toeic	기타
15763	concentrated	농축 된 : 밀집된	\N	\N	\N	toeic	하
15781	managerial	관리 의	\N	\N	\N	toeic	하
15786	eligibility	n . 적임 	\N	\N	\N	toeic	하
15795	leisurely	한가로운 	\N	\N	\N	toeic	하
15798	credential	n . 홀륭 한 경력 	\N	\N	\N	toeic	하
15801	diligently	adv . 부지런히 	\N	\N	\N	toeic	하
15804	supplementary	adj . 보충 의 	\N	\N	\N	toeic	하
15807	reportedly	adv . 보도 에 의하면 	\N	\N	\N	toeic	하
15822	committed	ad . 헌신적 인 	\N	\N	\N	toeic	하
15825	simplify	v . 간소화 하다 	\N	\N	\N	toeic	하
15828	agreement	n . 동의 	\N	\N	\N	toeic	하
15834	assortment	n . 모음	\N	\N	\N	toeic	하
15846	review	v . 검토 하다 	\N	\N	\N	toeic	하
15865	priority	n . 우선 사항 	\N	\N	\N	toeic	하
15883	similar	adj . 비슷한 	\N	\N	\N	toeic	하
15902	estimative	ad 평가의 	\N	\N	\N	toeic	기타
15905	stimulate	v . 자극 하다 . 격려 하다	\N	\N	\N	toeic	하
15908	occasional	adj 	\N	\N	\N	toeic	하
15926	alert	adj . 경계 하는 	\N	\N	\N	toeic	하
15947	travel expenses	phr . 여행 경비	\N	\N	\N	toeic	기타
15957	shortfall	n . 부족액 	\N	\N	\N	toeic	하
15969	malfunction	n . 고장 v . 오작동 하다	\N	\N	\N	toeic	하
15984	selective	adj . 까다로운 	\N	\N	\N	toeic	하
15987	officially	adv . 공식적 으로 	\N	\N	\N	toeic	하
16000	proof	n . 증명 ( 서 ) 	\N	\N	\N	toeic	하
16009	accompany	v . 동행 하다 : 동반 하다	\N	\N	\N	toeic	하
16014	solicitation	n . 간청	\N	\N	\N	toeic	하
16028	party	n . 단체 : 정당	\N	\N	\N	toeic	하
16034	withdraw	v . 빼내다 . 인출 하다 . 철수 시키다	\N	\N	\N	toeic	하
16046	worsen	v . 악화 되다 : 악화 시키다	\N	\N	\N	toeic	하
16062	submission	n . ( 서류 / 제안서 등 의 ) 제출	\N	\N	\N	toeic	하
16076	commission	n . 수수료 	\N	\N	\N	toeic	하
16093	thrilling	adj . 스릴 있는 	\N	\N	\N	toeic	하
16108	quarterly	adj . 분기 별 의 	\N	\N	\N	toeic	하
16126	cooperation	n . 협력 	\N	\N	\N	toeic	하
16136	stipulate	v . 규정 하다 . 명기 하다	\N	\N	\N	toeic	하
16152	extend	v . 연장 하다 	\N	\N	\N	toeic	하
16159	urgent	adj . 긴급한 	\N	\N	\N	toeic	하
16162	authentic	adj . 진짜인 	\N	\N	\N	toeic	하
16165	precise	adj . 정확한	\N	\N	\N	toeic	하
16170	rental	n . 임대 	\N	\N	\N	toeic	하
16177	highly	adv . 매우 	\N	\N	\N	toeic	하
16189	exceed	v . 초과하다 . 넘어서다	\N	\N	\N	toeic	하
16199	comparable	adj . 비슷한 	\N	\N	\N	toeic	하
16202	diversionn	. 전환 	\N	\N	\N	toeic	기타
16206	contemporary	adj . 현대의 	\N	\N	\N	toeic	하
16209	customs	n 	\N	\N	\N	toeic	하
16216	within	prep.- 이내에	\N	\N	\N	toeic	하
16223	plentiful	adj . 풍부한 	\N	\N	\N	toeic	하
16229	inventive	adj . 창의적인 	\N	\N	\N	toeic	하
16248	experience	n . 경험 v . 경험 하다 . 겪다	\N	\N	\N	toeic	하
16251	absolute	adj . 절대적인	\N	\N	\N	toeic	하
16304	dramatic	adj . 극적인 	\N	\N	\N	toeic	하
16307	devoted	adj . 현신 적인 	\N	\N	\N	toeic	하
16317	evenly	adv . 고르게 	\N	\N	\N	toeic	하
16351	adjustable	adj . 조절 가능한	\N	\N	\N	toeic	하
16412	recruit	n . 신입 사원 	\N	\N	\N	toeic	하
16425	applicant	n . 지원자 	\N	\N	\N	toeic	하
16431	consideration	n . 고려 ( 사항 ) 	\N	\N	\N	toeic	하
16434	accomplished	adj . ( 기량 이 ) 뛰어난 	\N	\N	\N	toeic	하
16458	involve	v . 수반 ( 포함 ] 하다 . 연루 [ 참여 ] 시키다	\N	\N	\N	toeic	하
16465	decline	n . 감소 	\N	\N	\N	toeic	하
16471	deadline	n . 기한 	\N	\N	\N	toeic	하
16493	ongoing	adj . ( 계속 ) 진행 중인	\N	\N	\N	toeic	하
16496	for free	phr . 공짜 로 	\N	\N	\N	toeic	기타
16505	entire	adj . 전체 의 	\N	\N	\N	toeic	하
16526	assembly	n . ( 기계 의 ) 조립 	\N	\N	\N	toeic	하
16542	accurate	adj . 정확한 정밀한	\N	\N	\N	toeic	하
16550	analyze	v . 분석 하다 	\N	\N	\N	toeic	하
16553	institute	v . ( 정책 등 을 ) 하다 	\N	\N	\N	toeic	하
16562	prestigious	ad . 명성 있는 	\N	\N	\N	toeic	하
16574	community	n . 지역 사회 	\N	\N	\N	toeic	하
16583	publisher	n . 출판인 	\N	\N	\N	toeic	하
16586	container	n . 그릇 	\N	\N	\N	toeic	하
16601	attention	n . 주의 	\N	\N	\N	toeic	하
15607	approaching date	다가오는 날짜	\N	\N	\N	toeic	기타
15610	challenging task	힘든 과제	\N	\N	\N	toeic	기타
15617	emerging market/company	신흥 시장 / 회사	\N	\N	\N	toeic	기타
15849	permission	n . 허가 	\N	\N	\N	toeic	하
15639	leading company	일류 / 선도 하는 회사	\N	\N	\N	toeic	기타
15648	promising location	유망한 장소	\N	\N	\N	toeic	기타
15656	presiding officer	사회자	\N	\N	\N	toeic	기타
15674	proposed/suggested plan	제안 된 계획	\N	\N	\N	toeic	기타
15703	object to N/-ing	~에 반대하다	\N	\N	\N	toeic	기타
15706	be capable of N/-ing	~할 수 있다	\N	\N	\N	toeic	기타
15714	consider - ing	고려 하다	\N	\N	\N	toeic	기타
15725	postpone -ing	연기하다	\N	\N	\N	toeic	기타
15734	give up - ing	포기 하다	\N	\N	\N	toeic	기타
15744	widening	확장 	\N	\N	\N	toeic	하
15748	opening	공석 	\N	\N	\N	toeic	하
15751	sightseeing	관광	\N	\N	\N	toeic	하
15754	initiative to V	- 할 계획	\N	\N	\N	toeic	기타
15787	candidate	n . 지원자 	\N	\N	\N	toeic	하
15790	distribute	v . 배포 하다 . 배급 하다	\N	\N	\N	toeic	하
15810	appointment	n . 임명 	\N	\N	\N	toeic	하
15813	incorporated	adj . 법인 조직의	\N	\N	\N	toeic	하
15816	personnel	n . 직원 들 	\N	\N	\N	toeic	하
15837	encouragement	n . 격려 	\N	\N	\N	toeic	하
15855	feature	v . ~ 을 특징 으로 하다 	\N	\N	\N	toeic	하
15868	monitor	v . 주시 [ 모니터 ] 하다 	\N	\N	\N	toeic	하
15871	immediate	ad . 즉각적인 	\N	\N	\N	toeic	하
15874	conserve	v . 아껴 쓰다 	\N	\N	\N	toeic	하
15880	fund	n . 자금 v . 자금 을 대다	\N	\N	\N	toeic	하
15889	probation period	phr . 수습 기간	\N	\N	\N	toeic	기타
15895	address	v . ( 문제 등 을 ) 다루다 	\N	\N	\N	toeic	하
15898	total	adj . 전체 의 	\N	\N	\N	toeic	하
15904	thus far (=so far	 since)	\N	\N	\N	toeic	기타
15910	setback	n . 차질	\N	\N	\N	toeic	하
15929	interact	v . 소통 하다 	\N	\N	\N	toeic	하
15935	specifically	adv . 특별히 	\N	\N	\N	toeic	하
15938	demonstrator	n . 시범 자 	\N	\N	\N	toeic	하
15944	complaint	n . 불만 사항 	\N	\N	\N	toeic	하
15954	voucher	n . 쿠폰 	\N	\N	\N	toeic	하
15964	be affiliated with	v.- 와 제휴 를 맺다 . ~ 와 관계 가 있다	\N	\N	\N	toeic	기타
15979	punctual	ad 	\N	\N	\N	toeic	하
15991	nearly	adv . 거의	\N	\N	\N	toeic	하
15994	requirement	n . 필요 조건	\N	\N	\N	toeic	하
16004	seek	v . 찾다 . 구하다	\N	\N	\N	toeic	하
16012	extensive	adj . 광범위한 	\N	\N	\N	toeic	하
16017	accessible	adj . 접근 가능한 	\N	\N	\N	toeic	하
16047	fully	adv . 완전히 	\N	\N	\N	toeic	하
16050	gathering	n . 모임 	\N	\N	\N	toeic	하
16056	expertise	n . 전문 지식 [ 기술 ] . 불가 산 명사	\N	\N	\N	toeic	하
16059	pay off	phr . 성과 를 올리다 . 성공 하다	\N	\N	\N	toeic	기타
16065	relief	n . 안도 	\N	\N	\N	toeic	하
16080	demonstration	n . 시범 설명 	\N	\N	\N	toeic	하
16087	volume	n . 양	\N	\N	\N	toeic	하
16096	basis	n . 기준 	\N	\N	\N	toeic	하
16099	variety	n . 다양 함 	\N	\N	\N	toeic	하
16109	figure	n . 수치 : 인물 	\N	\N	\N	toeic	하
16115	enthusiasm	n . 열광 	\N	\N	\N	toeic	하
16127	periodically	adv . 정기적 으로	\N	\N	\N	toeic	하
16140	category	n . 범주	\N	\N	\N	toeic	하
16143	inspection	n . 점검 	\N	\N	\N	toeic	하
16160	urgency	n. 긴급함	\N	\N	\N	toeic	하
16163	cooperatively	adv . 협력 하여	\N	\N	\N	toeic	하
16172	clarification	n . 설명 	\N	\N	\N	toeic	하
16175	respected	adj . 홀륭한	\N	\N	\N	toeic	하
16185	share	v . 공유 하다 . 나누다 n . 몫 	\N	\N	\N	toeic	하
16191	range	n . 다양성 	\N	\N	\N	toeic	하
16200	compare	v . 비교 하다 . 견주다	\N	\N	\N	toeic	하
16213	exceptionally	adv . 예외적 으로 	\N	\N	\N	toeic	하
16233	amount	n . 양 	\N	\N	\N	toeic	하
16239	vast	adj . 어마 어마한 	\N	\N	\N	toeic	하
16242	maximum	ad . 최대의	\N	\N	\N	toeic	하
16257	disruption	n . 중단 	\N	\N	\N	toeic	하
16260	indeed	adv . 확실히 	\N	\N	\N	toeic	하
16269	reflectionn	n. 반영 : 심사숙고	\N	\N	\N	toeic	기타
16272	notice	n . 공지 	\N	\N	\N	toeic	하
16286	refer to 명사	언급 하다 . ~ 을 참고 하다	\N	\N	\N	toeic	기타
16298	in light of	prep.- 에 비추어 	\N	\N	\N	toeic	기타
16302	persuade	v . 설득 하다	\N	\N	\N	toeic	하
16305	method	n . 방법 	\N	\N	\N	toeic	하
16308	container	n . 용기 : ( 화물 ) 컨테이너	\N	\N	\N	toeic	하
16315	relinquish	v . ( 권리 등 을 ) 포기 [ 양도 ] 하다	\N	\N	\N	toeic	하
16340	advance	v . 승진 하다 . 출세 하다 n . 진보 	\N	\N	\N	toeic	하
16343	statistics	n 통계 ( 학 ) 	\N	\N	\N	toeic	하
16352	inquiry	n . 문의 : 조사	\N	\N	\N	toeic	하
16368	fluctuation	n . 변동 	\N	\N	\N	toeic	하
16378	determine	v . 결정 하다	\N	\N	\N	toeic	하
16386	rise	n . 증가 	\N	\N	\N	toeic	하
16392	awareness	n . ( - 의 중요성 에 대한 ) 의식 	\N	\N	\N	toeic	하
16410	renew	v . 연장 하다 	\N	\N	\N	toeic	하
16420	evidently	adv . 분명히 	\N	\N	\N	toeic	하
16423	clerical	adj . 사무직의	\N	\N	\N	toeic	하
16450	contagious	adj . 전염성 의 : 퍼지기 쉬운	\N	\N	\N	toeic	하
16456	concern	n . 우려 	\N	\N	\N	toeic	하
16459	attract	v . ( 사람 / 관심 ) 끌다 . 끌어 모으다	\N	\N	\N	toeic	하
16466	preparation	n . 준비 	\N	\N	\N	toeic	하
16469	security	n . 보안 	\N	\N	\N	toeic	하
16472	document	n . 서류 	\N	\N	\N	toeic	하
16480	performance	n . 수행 	\N	\N	\N	toeic	하
16483	annually	adv . 매년 	\N	\N	\N	toeic	하
15852	enroll	v . 등록 하다	\N	\N	\N	toeic	하
15624	celebrated landmarks	유명한 관광 명소	\N	\N	\N	toeic	기타
15629	damaged items	손상된 물건	\N	\N	\N	toeic	기타
16102	intend	v . 의도 하다 . ~ 하려고 생각 하다	\N	\N	\N	toeic	하
16105	local	ad . 지역 의 	\N	\N	\N	toeic	하
16139	marked	adj . 뚜렷한 	\N	\N	\N	toeic	하
16142	impression	n . 인상 	\N	\N	\N	toeic	하
16155	coordinate	v . 조정 하다 	\N	\N	\N	toeic	하
16174	initiate	v . 개시 [ 시작 ] 하다 . 착수 하다	\N	\N	\N	toeic	하
16181	sizable	adj . 상당한 ( 크기 의 ) 	\N	\N	\N	toeic	하
16187	instead of	~대신에	\N	\N	\N	toeic	기타
16193	differentiate	v . 구분 짓다 . 구별 하다	\N	\N	\N	toeic	하
16212	confidentiality	n . 비밀 	\N	\N	\N	toeic	하
16232	inexpensive	adj . 비싸지 않은	\N	\N	\N	toeic	하
16238	certify	v . ( 특히 서면 으로 ) 증명 하다 . 자 격증 을 교부 하다	\N	\N	\N	toeic	하
16259	brief	adj . 간략한 	\N	\N	\N	toeic	하
16261	plenty	n . 풍부한 양	\N	\N	\N	toeic	하
16265	celebratory	adj . 축하 하는 	\N	\N	\N	toeic	하
16274	initial	adj . 처음 의 	\N	\N	\N	toeic	하
16288	adequate	adj . 충분한 : 적절한	\N	\N	\N	toeic	하
16291	launch	n . 개시 	\N	\N	\N	toeic	하
16297	contribution	n . 기여 	\N	\N	\N	toeic	하
16310	accumulation	n . 축적 	\N	\N	\N	toeic	하
16313	component	n . 부품 	\N	\N	\N	toeic	하
16320	client	n . 고객 	\N	\N	\N	toeic	하
16336	ideal	adj . 이상적인 	\N	\N	\N	toeic	하
16339	qualify	v.- 에게 자격 을 주다 . 적임 으로 하다	\N	\N	\N	toeic	하
16345	cover	v . ( 비용 따위 를 ) 충당 하다 . 대다 ; 다루다 . 포함 하다 : ( 보험 으로 ) 보장 하다	\N	\N	\N	toeic	하
16348	renovate	v . 개조 하다 . 보수 하다	\N	\N	\N	toeic	하
16364	invoice	n . 송장 	\N	\N	\N	toeic	하
16367	take effect	phr . 발효 하다 . 효력을 나타내다	\N	\N	\N	toeic	기타
16380	instruct	v . 가르치다 ; 지시 하다	\N	\N	\N	toeic	하
16383	employment	n . 취업 	\N	\N	\N	toeic	하
16388	since	prep.- 이래로 conj.- 이래로 : - 때문에 adv . 그 ( 때 ) 이후 로	\N	\N	\N	toeic	하
16391	stance	n . 입장 	\N	\N	\N	toeic	하
16397	retire	v . 은퇴 하다 . 퇴직 하다	\N	\N	\N	toeic	하
16400	praise	v . 칭찬 하다 n . 칭찬	\N	\N	\N	toeic	하
16416	listing	n . ( 공식적인 ) 목록 	\N	\N	\N	toeic	하
16422	consistently	adv . 항상 	\N	\N	\N	toeic	하
16428	distraction	n . 주의 산만 기분 전환	\N	\N	\N	toeic	하
16438	distraction	n . 주의 산만 기분 전환	\N	\N	\N	toeic	하
16452	predict	v . 예측 하다 . 예견 하다	\N	\N	\N	toeic	하
16455	shipment	n . 수송 	\N	\N	\N	toeic	하
16462	Itinerary	n . 여행 일정 ( 표 )	\N	\N	\N	toeic	하
16468	reduce	v . 줄이다 	\N	\N	\N	toeic	하
16482	resident	n . 거주자 	\N	\N	\N	toeic	하
16490	established	adj 	\N	\N	\N	toeic	하
16508	passenger	n . 승객 	\N	\N	\N	toeic	하
16511	close	adj . 가까운 	\N	\N	\N	toeic	하
16517	biologist	n . 생물 학자	\N	\N	\N	toeic	하
16527	instruction	n . 가르침 : 지시 	\N	\N	\N	toeic	하
16530	on-site	adj . 현장 의 	\N	\N	\N	toeic	기타
16539	survey	n . ( 설문 ) 조사 v . ( 설문 ) 조사 하다	\N	\N	\N	toeic	하
16554	procedure	n . 절차 	\N	\N	\N	toeic	하
16569	industry	n . 산업 	\N	\N	\N	toeic	하
16584	diagnosis	n . ( 병원 ) 진단 	\N	\N	\N	toeic	하
16598	forward	v . 보내다 . 전달 하다	\N	\N	\N	toeic	하
16604	informative	ad . 유익한 	\N	\N	\N	toeic	하
16607	related	adj . 관련 있는 	\N	\N	\N	toeic	하
16618	popular	adj . 인기 있는 	\N	\N	\N	toeic	하
16624	gratitude	n . 감사	\N	\N	\N	toeic	하
16633	independent	adj . 독립된 	\N	\N	\N	toeic	하
16644	repair	n . 수리 	\N	\N	\N	toeic	하
16660	bring	v . 가져 오다 . 데려 오다	\N	\N	\N	toeic	하
16665	delay	v . 미루다 	\N	\N	\N	toeic	하
16668	positive	adj . 긍정적 인 	\N	\N	\N	toeic	하
16674	confident	adj . 자신감 있는 	\N	\N	\N	toeic	하
16684	augment	v.- 을 증가 시키기다	\N	\N	\N	toeic	하
16698	lay off	phr . ( 정리 ) 해고 하다	\N	\N	\N	toeic	기타
16701	redundancy	n . 과잉 	\N	\N	\N	toeic	하
16707	flaw	n . ( 사물 의 ) 결함	\N	\N	\N	toeic	하
16740	enrollment	n . 등록 	\N	\N	\N	toeic	하
16747	complication	n . 복잡한 상태 [ 문제 1 : 합병증	\N	\N	\N	toeic	하
16764	observant	adj . 관찰력 있는 	\N	\N	\N	toeic	하
16770	significantly	adv . 상당히 	\N	\N	\N	toeic	하
16780	humble	v . 겸허 [ 겸손 ] 하게 하다 adj 검손 한	\N	\N	\N	toeic	하
16800	wear	n . ( 많이 사용 되어 ) 닮음 	\N	\N	\N	toeic	하
16813	pledge	n . 약속 	\N	\N	\N	toeic	하
16817	function	v . 작동 하다 n 	\N	\N	\N	toeic	하
16820	magnify	v . 확대 하다	\N	\N	\N	toeic	하
16824	locals	n . 지역 주민 	\N	\N	\N	toeic	하
16838	exterior	n . 외부 	\N	\N	\N	toeic	하
16841	personally	adv . 직접 	\N	\N	\N	toeic	하
16864	thought-provoking	adj . 시사 하는 바가 많은	\N	\N	\N	toeic	기타
16867	amenity	n . 생활 편의 시설	\N	\N	\N	toeic	하
16877	periodicals	n . 정기 간행물	\N	\N	\N	toeic	하
16880	attitude	n . 태도 	\N	\N	\N	toeic	하
16896	inventory	n . 재고 ( 품 ) 	\N	\N	\N	toeic	하
16899	intriguing	adj 	\N	\N	\N	toeic	하
16909	resonate	v . 반향 을 불러 일으키다	\N	\N	\N	toeic	하
16917	fortune	n . 재산 	\N	\N	\N	toeic	하
16929	fulfillment	n . 이행 	\N	\N	\N	toeic	하
16934	flurry	n . 눈보라 : ( 잠시 한바탕 벌어지는 ) 부산 	\N	\N	\N	toeic	하
7030	ubiquitous	도처에 존재하는	\N	\N	\N	gongmuwon	하
16083	fairly	adj 꽤 	\N	\N	\N	toeic	하
16090	compatible with-	- 와 호환 이 되는	\N	\N	\N	toeic	기타
16704	streamline	v . ( 일 / 조직 등 을 ) 간소화 ( 능률화 ] 하다	\N	\N	\N	toeic	하
16488	significant	ad . 상당한 중요한	\N	\N	\N	toeic	하
16494	donate	v . 기부 하다 	\N	\N	\N	toeic	하
16509	executive	n . 간부 	\N	\N	\N	toeic	하
16512	construction	n . 건설 	\N	\N	\N	toeic	하
16515	facility	n . 시설 	\N	\N	\N	toeic	하
16518	renovation	n . 보수 공사 	\N	\N	\N	toeic	하
16528	register	v . 등록 하다 : 기록 하다	\N	\N	\N	toeic	하
16537	manage	v . 운영 ( 경영 ] 하다 	\N	\N	\N	toeic	하
16543	equipment	n . 장비 	\N	\N	\N	toeic	하
16549	appreciate	v . 감사 하다 . 감상 하다	\N	\N	\N	toeic	하
16552	defective	adj . 결함 이 있는	\N	\N	\N	toeic	하
16561	attend	v . 참석 하다	\N	\N	\N	toeic	하
16576	production	n . ( 영화 등 의 ) 제작 	\N	\N	\N	toeic	하
16582	identification	n . 신분 증명 ( 서 )	\N	\N	\N	toeic	하
16588	arrange	v . 준비 하다 . 마련 하다 	\N	\N	\N	toeic	하
16590	administrative	adj . 관리 상의 	\N	\N	\N	toeic	하
16593	insufficient	adj 불충분 한 	\N	\N	\N	toeic	하
16596	revision	n . 수정 ( 사항 ) : 수정본 	\N	\N	\N	toeic	하
16605	strategy	n . 전략 	\N	\N	\N	toeic	하
16612	patron	n. 고객 	\N	\N	\N	toeic	하
16619	artifact	n . 인공물 	\N	\N	\N	toeic	하
16625	personal	adj . 개인적인 	\N	\N	\N	toeic	하
16628	lead	v . 지휘 하다 	\N	\N	\N	toeic	하
16631	celebrate	v . 기념 하다 . 축하 하다	\N	\N	\N	toeic	하
16637	borrow	v . 빌리다 . 차용 하다	\N	\N	\N	toeic	하
16653	keep	v . 유지 하다 	\N	\N	\N	toeic	하
16659	decisive	adj . 결정적인 : 결단력 있는	\N	\N	\N	toeic	하
16664	welcome	adj . 환영 받는 : ~ 해도 좋은 v . 환영 하다 : 기꺼이 받아 들이다 n . 환영 	\N	\N	\N	toeic	하
16680	exclusively	adv . 독점적 으로 	\N	\N	\N	toeic	하
16694	suited	adj . 적합한 	\N	\N	\N	toeic	하
16697	lay off	phr . ( 정리 ) 해고 하다	\N	\N	\N	toeic	기타
16700	need	n . 필요 	\N	\N	\N	toeic	하
16703	repeatedly	adv . 되풀이 하여 	\N	\N	\N	toeic	하
16706	yield	v . ( 수익 / 결과 등 을 ) 내다 . 산출 하다 n . 산출 	\N	\N	\N	toeic	하
16719	place an order	phr . 주문 하다	\N	\N	\N	toeic	기타
16725	accommodate	v . 숙박 을 제공 하다 	\N	\N	\N	toeic	하
16739	wing	n . ( 건물 의 ) 동 	\N	\N	\N	toeic	하
16742	environment	n . 환경 	\N	\N	\N	toeic	하
16756	addition	n . 추가 ( 된 것 ) 	\N	\N	\N	toeic	하
16799	resonate	v . 반향 을 불러 일으키다	\N	\N	\N	toeic	하
16806	outsell	v.- 보다 더 많이 팔리다	\N	\N	\N	toeic	중
16809	fortune	n . 재산 	\N	\N	\N	toeic	하
16812	recycled	adj . 재활용 된	\N	\N	\N	toeic	하
16819	malfunction	v . 오작동 하다 n . 고장	\N	\N	\N	toeic	하
16830	simply	adv . 간단히 	\N	\N	\N	toeic	하
16840	name	v . 명명 하다 . 지명 하다 . 임명 하다 n . 이름 : 평판	\N	\N	\N	toeic	하
16843	domestically	adv . 국내 에서	\N	\N	\N	toeic	하
16856	found	v . 설립 하다 	\N	\N	\N	toeic	하
16863	mark	v . 흔적 을 남기다 . 기념 하다 n . 자국 	\N	\N	\N	toeic	하
16876	periodically	adv . 정기적 으로	\N	\N	\N	toeic	하
16885	amenity	n . 생활 편의 시설	\N	\N	\N	toeic	하
16914	alternate	adj . 대체 의 	\N	\N	\N	toeic	하
16928	glare at-	- 을 노려 보다	\N	\N	\N	toeic	기타
16933	conspicuously	adv . 눈 에 띄게 	\N	\N	\N	toeic	하
16938	last-minute	adj 마지막 순간 의 	\N	\N	\N	toeic	기타
3411	affliction	고통	\N	\N	\N	toefl	하
7121	viable	실행 가능한	\N	\N	\N	gongmuwon	하
6922	store	따로 떼어두다	\N	\N	\N	gongmuwon	하
16447	in advance	phr . 미리 	\N	\N	\N	toeic	기타
7001	trail	지나간 자국	\N	\N	\N	gongmuwon	하
7010	transport	운송하다; 추방하다; 황홀하게 하다	\N	\N	\N	gongmuwon	하
7096	uphold	받쳐 올리다; 지지하다; 격려하다; 확정하다	\N	\N	\N	gongmuwon	하
7236	approach	v. *접근하다*	\N	\N	\N	suneung	하
7252	generate	v. *일으키다	\N	\N	\N	suneung	하
7281	reflect	v. *반영하다	\N	\N	\N	suneung	하
7009	transitory	일시적인	\N	\N	\N	gongmuwon	하
7089	unulfilled	이루어지지 않은 이행되지 않은	\N	\N	\N	gongmuwon	기타
7298	active	a. *활동적인	\N	\N	\N	suneung	하
7512	v. *서류철을 작성하다	* (소송 등을) 제기하다	\N	\N	\N	suneung	기타
7718	legal	a. *법률의	\N	\N	\N	suneung	하
7321	disabled	a. *무능력의	\N	\N	\N	suneung	하
7414	motivate	v. *동기를 부여하다*	\N	\N	\N	suneung	하
7575	fulfill	v. *달성하다	\N	\N	\N	suneung	하
7681	sensible	a. *분별 있는	\N	\N	\N	suneung	하
7319	flood	n. *홍수*	\N	\N	\N	suneung	하
7352	quantity	n. *양*	\N	\N	\N	suneung	하
7404	qualify	v. *자격을 얻다*	\N	\N	\N	suneung	하
7428	passion	n. *열정*	\N	\N	\N	suneung	하
7520	admit	v. *인정하다	\N	\N	\N	suneung	하
7731	desperate	a. *필사적인	\N	\N	\N	suneung	하
7732	remote	a. *멀리 떨어진	\N	\N	\N	suneung	하
7792	coincidence	n. *우연의 일치	\N	\N	\N	suneung	하
7849	virtual	a. *가상의	\N	\N	\N	suneung	하
8032	genre	n. *장르	\N	\N	\N	suneung	하
8021	exist	v. *존재하다	\N	\N	\N	suneung	하
8022	combat	n. *전투*	\N	\N	\N	suneung	하
8070	investigate	n. *조사하다	\N	\N	\N	suneung	하
8100	v. *부식하다	 쇠퇴하다*	\N	\N	\N	suneung	기타
1089	perfect grade	완벽한 성적	\N	\N	\N		기타
1282	sensation	반향 센세이션	\N	\N	\N		하
16474	payable	adj . 지불 해야 하는 	\N	\N	\N	toeic	하
16749	waste	n . 쓰레기 	\N	\N	\N	toeic	하
16477	resolve	v . 해결 하다 . 풀다	\N	\N	\N	toeic	하
11502	suit	에 어울리다 맞추다 남자 정장 한 벌	\N	\N	\N	gtelp	하
11535	take a deep breath	심호흡을 하다	\N	\N	\N	gtelp	기타
11604	grasp	이해하다 알다 움켜잡다	\N	\N	\N	gtelp	하
11631	notice	알다 주의하다 알아차리다	\N	\N	\N	gtelp	하
16519	renovator	n . 혁신자	\N	\N	\N	toeic	중
16522	tenant	n . 세입자 : 거주자 v . ( 토지 / 가옥 등 을 ) 빌려 쓰다	\N	\N	\N	toeic	하
16532	quality time	n . ( 가족 / 친구 와 보내는 ) 즐거운 시간 	\N	\N	\N	toeic	기타
16535	applicable	ad . 해당 [ 적용 1 되는	\N	\N	\N	toeic	하
16541	status	n . ( 진행 과정 상의 ) 상황 	\N	\N	\N	toeic	하
16556	inconvenience	n . 불편 ( 한 것 )	\N	\N	\N	toeic	하
16565	retail	adj 소매 의 	\N	\N	\N	toeic	하
16577	currently	adv . 현재 	\N	\N	\N	toeic	하
16622	unavailable	adj . ( 사물 / 사람 이 ) 이용할 수 없는 	\N	\N	\N	toeic	하
16642	installment	할부	\N	\N	\N	toeic	하
16658	decision	n . 결정 : 결단력	\N	\N	\N	toeic	하
16685	clement	adj. 날씨가 좋은	\N	\N	\N	toeic	하
16688	agenda	n . 안건 	\N	\N	\N	toeic	하
16715	termination	n . 종료	\N	\N	\N	toeic	하
16755	frequently	adv . 자주 	\N	\N	\N	toeic	하
7538	v. *파도타기를 하다	* 인터넷 상의 정보를 찾아 다니다	\N	\N	\N	suneung	기타
16884	unfurnished	v . 가구 가 비치 되지 않은	\N	\N	\N	toeic	하
16907	premier	n . ( 영화 의 ) 개봉 	\N	\N	\N	toeic	하
16916	blunder	n . 실수 	\N	\N	\N	toeic	하
16922	commendation	n . 칭찬 	\N	\N	\N	toeic	하
16931	experiential	adj . 경험 에 의한 	\N	\N	\N	toeic	하
16936	stellar	adj . 뛰어난	\N	\N	\N	toeic	하
7151	relationship	n. *관계*	\N	\N	\N	suneung	하
6921	stock	자본금	\N	\N	\N	gongmuwon	하
7189	consume	v. *소비하다*	\N	\N	\N	suneung	하
6953	surrounding	주변의 상황	\N	\N	\N	gongmuwon	하
6979	testify	증명하다; 증거가 되다	\N	\N	\N	gongmuwon	하
7064	unexpurgated	삭제되지 않은	\N	\N	\N	gongmuwon	상
7109	vain	자만심이 강한; 허영적인; 뽐내는	\N	\N	\N	gongmuwon	하
7142	withhold	보류하다; 억제하다; 원천 징수하다	\N	\N	\N	gongmuwon	하
16580	reservation	n . 예약 ( = booking ) : ( 계획 · 생각 에 대한 ) 의구심 [ 거리낌 ]	\N	\N	\N	toeic	하
16589	productive	adj . 생산 적인 	\N	\N	\N	toeic	하
16609	technician	n . 기술자 	\N	\N	\N	toeic	하
16615	recipe	n . 조리법 	\N	\N	\N	toeic	하
7177	v. *강조하다*	 압력을 주다	\N	\N	\N	suneung	기타
7229	proud	a. *자랑스러워하는	\N	\N	\N	suneung	하
7306	electricity	n. *전기*	\N	\N	\N	suneung	하
7419	depress	v. *우울하게 하다	\N	\N	\N	suneung	하
7461	mere	a. *단지 ~에 불과한*	\N	\N	\N	suneung	하
7646	restrict	v. *제한하다	\N	\N	\N	suneung	하
7684	swing	v. *흔들(리)다	\N	\N	\N	suneung	하
7307	shadow	n. *그림자*	\N	\N	\N	suneung	하
7361	incredible	a. (믿기 어려울 만큼) *굉장한*	\N	\N	\N	suneung	하
7407	n. *상기	* 철회	\N	\N	\N	suneung	기타
7479	committee	n. (상급 기관에 소속된) *위원회*	\N	\N	\N	suneung	하
16473	attentive	adj 	\N	\N	\N	toeic	하
16498	reschedule	v . 일정 을 변경 하다	\N	\N	\N	toeic	하
16718	description	. n . 서술 	\N	\N	\N	toeic	하
16721	stock	n . 재고 ( 품 ) 	\N	\N	\N	toeic	하
16724	accommodation	n . 숙박 시설	\N	\N	\N	toeic	하
16745	consciousness	n . 의식 	\N	\N	\N	toeic	하
16748	patent	v . 특허 를 받다 n . 특허 ( 권 ) ad 특허 의	\N	\N	\N	toeic	하
16781	encourage	v . 권장 하다 . 고무 하다	\N	\N	\N	toeic	하
16791	familiarity	n . 익숙 함 	\N	\N	\N	toeic	하
16801	worm	adj 닮은 	\N	\N	\N	toeic	하
16805	hastily	adv . 서둘러서 [ = hurriedly)	\N	\N	\N	toeic	하
16811	public speaking	phr . 공개 연설	\N	\N	\N	toeic	기타
16829	retailer	n . 소매업 자 	\N	\N	\N	toeic	하
16836	sapling	n . 묘목	\N	\N	\N	toeic	중
16868	amenity	n . 생활 편의 시설	\N	\N	\N	toeic	하
16504	contribute	v . 기여 하다 . 기부 하다 : 기고 하다	\N	\N	\N	toeic	하
16525	improve	v . 개선 하다 . 향상 시키다	\N	\N	\N	toeic	하
16546	conservation	n . ( 환경 / 문화재 등 의 ) 보호 	\N	\N	\N	toeic	하
16559	summarize	v . 요약 하다 . 개괄 하다	\N	\N	\N	toeic	하
16568	consumer	n . 소비자	\N	\N	\N	toeic	하
16571	convenient	adj . 편리한 가까운 	\N	\N	\N	toeic	하
16591	at all times	phr . 항상 	\N	\N	\N	toeic	기타
16597	editor	n . 편집자 	\N	\N	\N	toeic	하
16610	commemorate	v . 기념 하다 . 축하 하다	\N	\N	\N	toeic	하
16623	generosity	n . 너그러움 	\N	\N	\N	toeic	하
16629	proposal	n . 제안 ( 서 ) 	\N	\N	\N	toeic	하
16643	installation	n . 설치 	\N	\N	\N	toeic	하
16662	progress	n . 진행 	\N	\N	\N	toeic	하
16670	evict	v . 쫓아 내다 	\N	\N	\N	toeic	하
16678	experiment	v . 시도 하다 . 실험 삼아 해보다 n . ( 과학 적인 ) 실험	\N	\N	\N	toeic	하
16686	inclement	adj. 날씨가 좋지 않은	\N	\N	\N	toeic	하
16691	join	v.- 에 합류 하다 . 	\N	\N	\N	toeic	하
16693	excluding	prep.- 을 제외 하고	\N	\N	\N	toeic	하
16709	exemplary	adj . 모범적 인 	\N	\N	\N	toeic	하
16716	private	adj . 민간 의 	\N	\N	\N	toeic	하
16722	warranty	n . 보증 ( 서 ) 	\N	\N	\N	toeic	하
16732	depart	v . 떠나다 	\N	\N	\N	toeic	하
16746	proficiency	n . 숙달 	\N	\N	\N	toeic	하
16759	assumable	adj 	\N	\N	\N	toeic	중
16763	observance	n . ( 법률 의 ) 준수	\N	\N	\N	toeic	하
16775	lease	n . ( 토지 / 가옥 의 ) 임대차 계약 v . 임대 [ 임차 ] 하다	\N	\N	\N	toeic	하
16795	always	adv . 늘 	\N	\N	\N	toeic	하
16798	downside	n . 불리한 면 	\N	\N	\N	toeic	하
16802	weary	adj . 지친	\N	\N	\N	toeic	하
16815	commend	v . 칭찬 하다	\N	\N	\N	toeic	하
16822	precaution	n . 예방책 	\N	\N	\N	toeic	하
16826	intriguing	adj 	\N	\N	\N	toeic	하
16833	typical	adj . 전형적인 	\N	\N	\N	toeic	하
16846	market	n . 시장 	\N	\N	\N	toeic	하
16849	consistency	n . 한결 같음 	\N	\N	\N	toeic	하
16852	loyalty	n . 충성 ( 심 ) : 충실	\N	\N	\N	toeic	하
16859	periodic	adj . 주기 적인 	\N	\N	\N	toeic	하
16869	versatile	adj . 다재 다능 한 다용도 의	\N	\N	\N	toeic	하
16872	propose	v . 제안 하다 	\N	\N	\N	toeic	하
16875	period	n . 기간 	\N	\N	\N	toeic	하
16882	thought-provoking	adj . 시사 하는 바가 많은	\N	\N	\N	toeic	기타
16888	majority	n . 다수 	\N	\N	\N	toeic	하
16891	preferential	ad 우선권 ( 특혜 ) 을 주는	\N	\N	\N	toeic	하
16901	economic	adj . 경제 의	\N	\N	\N	toeic	하
16904	concession stand	n . 구내 매점	\N	\N	\N	toeic	기타
16913	outsell	v.- 보다 더 많이 팔리다 [5. Iterneit)	\N	\N	\N	toeic	중
16919	public speaking	phr . 공개 연설	\N	\N	\N	toeic	기타
16927	glare	n ( 불쾌 하게 ) 환한 빛 	\N	\N	\N	toeic	하
16932	preregister	v . 사전 등록 하다	\N	\N	\N	toeic	중
16937	visibility	n . 눈 에 잘 보임 	\N	\N	\N	toeic	하
4613	intrepid	겁 없는	\N	\N	\N	toefl	하
4949	penchant	강한 기호	\N	\N	\N	toefl	하
4950	penetrate	침투하다	\N	\N	\N	toefl	하
4953	penury	가난	\N	\N	\N	toefl	중
4954	perceive	인지하다	\N	\N	\N	toefl	하
4962	permeate	스며들다	\N	\N	\N	toefl	하
4963	pernicious	치명적인	\N	\N	\N	toefl	하
4969	persistent	끊임없는	\N	\N	\N	toefl	하
4970	personalize	개인의 취향에 맞추다	\N	\N	\N	toefl	하
4971	perspicuous	A. (언어/문체 등이) 명쾌한	\N	\N	\N	toefl	중
4974	perturb	마음을 불안하고 초조하게 만들다	\N	\N	\N	toefl	중
4977	pester	괴롭히다	\N	\N	\N	toefl	중
4978	petrified	극도로 무서워하는	\N	\N	\N	toefl	하
7187	comfort	v. *편안하게 하다	\N	\N	\N	suneung	하
6963	tactile	촉각의; 촉각을 가지고 있는	\N	\N	\N	gongmuwon	하
16486	raise	vt 올리다 . 인상 하다 n . ( 임금 ) 인상 	\N	\N	\N	toeic	하
16646	deposit	n . 계약금 	\N	\N	\N	toeic	하
7173	ability	n. *능력*	\N	\N	\N	suneung	하
7347	entertain	v. *즐겁게 하다*	\N	\N	\N	suneung	하
7376	embarrassed	a. *당황한*	\N	\N	\N	suneung	하
7498	journey	n. *여행*	\N	\N	\N	suneung	하
7665	rescue	v. *구조하다*	\N	\N	\N	suneung	하
7349	apologize	v. *사과하다*	\N	\N	\N	suneung	하
7516	include	v. *포함하다*	\N	\N	\N	suneung	하
7531	target	n. *목표*	\N	\N	\N	suneung	하
7564	artificial	a. *인공적인	\N	\N	\N	suneung	하
7623	perceive	v. *인지하다	\N	\N	\N	suneung	하
7813	spice	n. *향신료	\N	\N	\N	suneung	하
8005	dispose	v. *배치하다	\N	\N	\N	suneung	하
7724	annual	a. *연례의	\N	\N	\N	suneung	하
7766	arrive	v. *도착하다*	\N	\N	\N	suneung	하
7865	abandon	v. *버리다	\N	\N	\N	suneung	하
7886	extraordinary	a. *비상한	\N	\N	\N	suneung	하
7985	fame	n. *명성*	\N	\N	\N	suneung	하
7809	equilibrium	n. *평형	\N	\N	\N	suneung	하
7839	receipt	n. *영수증*	\N	\N	\N	suneung	하
7923	barrier	n. *방벽	\N	\N	\N	suneung	하
7998	crush	v. *분쇄하다	\N	\N	\N	suneung	하
8159	superior	a. *우월한*	\N	\N	\N	suneung	하
8219	passage	n. *통행	\N	\N	\N	suneung	하
1141	unique	독특한 고유한	\N	\N	\N		하
16492	article	n . ( 신문 / 잡지 ) 등 의 글 	\N	\N	\N	toeic	하
16501	temporarily	adv . 일시적 으로 	\N	\N	\N	toeic	하
7389	revolution	n. *혁명	\N	\N	\N	suneung	하
16641	install	v . 설치 하다 . ( 프로그램 을 ) 깔다	\N	\N	\N	toeic	하
11353	respond	반응하다 대답하다	\N	\N	\N	gtelp	하
11467	make sure that SV	을 확신하다	\N	\N	\N	gtelp	기타
11515	enhance	강조하다 강화하다	\N	\N	\N	gtelp	하
16581	charity	n . 자선 ( 단체 ) ; 구호 기금	\N	\N	\N	toeic	하
13547	To be poor at something (V)	못 하다	\N	\N	\N	kr-en-basic	기타
13388	Forty	마흔	\N	\N	\N	kr-en-basic	하
16563	prestige	n . 명성 	\N	\N	\N	toeic	하
4614	courageous	용기 있는	\N	\N	\N	toefl	하
4628	invariant	불변의	\N	\N	\N	toefl	하
4629	invidious	비위에 거슬리는	\N	\N	\N	toefl	중
4630	invigorating	a. 기운나게 하는	\N	\N	\N	toefl	하
4635	irreconcilable	화해할 수 없는	\N	\N	\N	toefl	중
4636	irrelevant	관계가 없는	\N	\N	\N	toefl	하
4640	irritate	화나게 하다	\N	\N	\N	toefl	하
4645	jaunt	소풍	\N	\N	\N	toefl	중
4648	jeopardy	위험	\N	\N	\N	toefl	하
4651	judicious	현명한	\N	\N	\N	toefl	하
4656	kidnap	유괴하다	\N	\N	\N	toefl	하
4657	kindle	(불을) 붙이다; (관심	\N	\N	\N	toefl	중
4663	knavery	부정행위	\N	\N	\N	toefl	상
4664	labyrinth	미로	\N	\N	\N	toefl	하
4669	languid	늘어진	\N	\N	\N	toefl	중
4676	launching	발사	\N	\N	\N	toefl	하
4677	lavish	사치스런; 아낌없는	\N	\N	\N	toefl	하
4678	law-abiding	법을 준수하는	\N	\N	\N	toefl	기타
4682	legerdemain	요술	\N	\N	\N	toefl	중
4683	legitimate	합법적인	\N	\N	\N	toefl	하
4684	lenient	너그러운	\N	\N	\N	toefl	하
4688	lethargic	A. 무기력한	\N	\N	\N	toefl	중
4692	levy	징수하다	\N	\N	\N	toefl	하
4697	libel	N. (문서에 의한) 명예 훼손; 비방(죄)	\N	\N	\N	toefl	하
4699	licensed	허가를 받은	\N	\N	\N	toefl	하
4702	limp	절뚝거리다	\N	\N	\N	toefl	하
4709	loathing	n. 혐오	\N	\N	\N	toefl	하
4710	locomotion	운동	\N	\N	\N	toefl	하
4714	lucid	명백하여 이해하기 쉬운	\N	\N	\N	toefl	하
4715	lucidly	알기 쉽게	\N	\N	\N	toefl	중
4719	luminous	빛나는	\N	\N	\N	toefl	하
4725	makeshift	A.임시변통의	\N	\N	\N	toefl	하
4729	malediction	저주	\N	\N	\N	toefl	중
4730	malevolent	악의적인	\N	\N	\N	toefl	하
4732	malign	~을 헐뜯다	\N	\N	\N	toefl	중
4736	mandatory	의무적인	\N	\N	\N	toefl	하
4740	masquerade	v. 가장하다	\N	\N	\N	toefl	하
4741	material	재료	\N	\N	\N	toefl	하
4742	matriarch	여자 가장	\N	\N	\N	toefl	중
4744	mawkishness	몹시 감상적임 / 역겨움	\N	\N	\N	toefl	기타
4745	maxim	격언	\N	\N	\N	toefl	하
4746	meager	빈약한	\N	\N	\N	toefl	하
4751	meditative	명상에 잠긴	\N	\N	\N	toefl	하
4752	medium	매체	\N	\N	\N	toefl	하
4755	meet	만나다	\N	\N	\N	toefl	하
4756	melt	녹다	\N	\N	\N	toefl	하
4757	memento	기념물	\N	\N	\N	toefl	하
4758	mendicant	거지; 거지의	\N	\N	\N	toefl	중
4759	beggar	거지	\N	\N	\N	toefl	하
4760	menial	하인의	\N	\N	\N	toefl	중
4761	merciless	무자비한	\N	\N	\N	toefl	하
4767	middle of the road	중도의	\N	\N	\N	toefl	기타
4768	migrate	이동하다	\N	\N	\N	toefl	하
4776	mired	곤경에 빠진	\N	\N	\N	toefl	하
4777	misdemeanor	경범죄	\N	\N	\N	toefl	하
4779	miserly	A. 구두쇠 같은	\N	\N	\N	toefl	중
4782	misgivings	의심	\N	\N	\N	toefl	하
4788	moist	습한	\N	\N	\N	toefl	하
4797	moody	우울한	\N	\N	\N	toefl	하
4798	moribund	소멸	\N	\N	\N	toefl	중
4802	mourn	슬퍼하다	\N	\N	\N	toefl	하
4803	mournful	슬픔에 잠긴	\N	\N	\N	toefl	하
4804	moving	감동시키는	\N	\N	\N	toefl	하
4806	mull over	~을 숙고하다	\N	\N	\N	toefl	기타
4811	muster	모으다	\N	\N	\N	toefl	하
4812	mutable	변하기 쉬운	\N	\N	\N	toefl	하
4815	myopic	근시의	\N	\N	\N	toefl	하
4819	narrative	이야기	\N	\N	\N	toefl	하
4820	narrow	폭이 좁은	\N	\N	\N	toefl	하
4827	negligence	부주의	\N	\N	\N	toefl	하
4829	negotiation	협상	\N	\N	\N	toefl	하
4836	nominal	이름만의	\N	\N	\N	toefl	하
4838	nonchalant	태연한	\N	\N	\N	toefl	중
4842	noted	저명한	\N	\N	\N	toefl	하
4844	notorious	소문난	\N	\N	\N	toefl	하
4851	obediently	고분고분하게	\N	\N	\N	toefl	중
4857	obliquely	비스듬히	\N	\N	\N	toefl	중
4858	obliterate	지우다	\N	\N	\N	toefl	중
4862	obscure	애매한	\N	\N	\N	toefl	하
4865	obstinacy	완고	\N	\N	\N	toefl	중
4866	obstinate	완고한	\N	\N	\N	toefl	하
4867	obtain	얻다	\N	\N	\N	toefl	하
4872	odor	냄새	\N	\N	\N	toefl	하
4875	off hand	즉석에서	\N	\N	\N	toefl	기타
4876	officious	참견하기 좋아하는	\N	\N	\N	toefl	중
4880	2. 습격	 공격	\N	\N	\N	toefl	기타
4883	physician	내과의사	\N	\N	\N	toefl	하
4886	orthopedist	정형외과 의사	\N	\N	\N	toefl	중
4890	veterinarian	n. 수의사	\N	\N	\N	toefl	하
4904	originate	비롯되다	\N	\N	\N	toefl	하
4910	outcome	결과	\N	\N	\N	toefl	하
4911	outdistance	~을 훨씬 앞서다	\N	\N	\N	toefl	기타
4917	outright	철저한	\N	\N	\N	toefl	하
4918	outspoken	솔직한	\N	\N	\N	toefl	하
4919	outstanding	뛰어난	\N	\N	\N	toefl	하
4925	page	이름을 불러 사람을 찾다	\N	\N	\N	toefl	하
4929	panacea	N. 만병통치약	\N	\N	\N	toefl	하
4930	pandemonium	대혼란	\N	\N	\N	toefl	하
4935	parity	동등	\N	\N	\N	toefl	하
4937	partiality	편애	\N	\N	\N	toefl	중
4941	2. 생각의 기원	 근원	\N	\N	\N	toefl	기타
4944	pathetic	애처로운	\N	\N	\N	toefl	하
4946	pecuniary	A. 금전(상)의	\N	\N	\N	toefl	하
4947	pedagogical	교육학적인	\N	\N	\N	toefl	하
16502	trial	n . 무료 체험 : 시험 	\N	\N	\N	toeic	하
16523	leadership	n . 지도력 	\N	\N	\N	toeic	하
4652	juice	활력	\N	\N	\N	toefl	하
16551	anniversary	n . 기념일	\N	\N	\N	toeic	하
3341	abandon	버리다	\N	\N	\N	toefl	하
16579	reasonable	adi . ( 가격 이 ) 적정한 	\N	\N	\N	toeic	하
7621	n. *석방	* 발표	\N	\N	\N	suneung	기타
3376	be acquainted with a	a 에 정통하다 익숙하다	\N	\N	\N	toefl	기타
3377	acquire	얻다	\N	\N	\N	toefl	하
3378	acquiesce	(마지못해) 순응하다	\N	\N	\N	toefl	중
3379	acquit	석방하다	\N	\N	\N	toefl	중
3381	activate	활성화하다	\N	\N	\N	toefl	하
3382	acutely	날카롭게	\N	\N	\N	toefl	하
3383	adamant	단호한	\N	\N	\N	toefl	하
3384	addictive	중독성의	\N	\N	\N	toefl	하
3385	address	주소	\N	\N	\N	toefl	하
3386	adduce	제시하다	\N	\N	\N	toefl	중
3387	adept	능숙한	\N	\N	\N	toefl	하
3388	ad-hoc	임시의	\N	\N	\N	toefl	기타
16690	advisor	n . 고문 	\N	\N	\N	toeic	하
3390	adequate	적절한	\N	\N	\N	toefl	하
3391	adjust	조절하다	\N	\N	\N	toefl	하
3392	admit	인정하다	\N	\N	\N	toefl	하
3393	adorn	꾸미다	\N	\N	\N	toefl	하
3394	adornment	장식	\N	\N	\N	toefl	중
3395	ornamentation	장식	\N	\N	\N	toefl	하
3396	adroit	솜씨 좋은	\N	\N	\N	toefl	중
3397	adult	성인	\N	\N	\N	toefl	하
3400	advance	진보하다	\N	\N	\N	toefl	하
3401	advent	출현	\N	\N	\N	toefl	하
3402	adverse	부정적인	\N	\N	\N	toefl	하
3403	advocate	옹호하다	\N	\N	\N	toefl	하
3405	affable	상냥한	\N	\N	\N	toefl	중
3406	affect	~에 영향을 미치다	\N	\N	\N	toefl	하
3407	affect ignorance	모르는체 하다	\N	\N	\N	toefl	기타
3408	affecting	감동시키는	\N	\N	\N	toefl	하
3409	affirm	단언	\N	\N	\N	toefl	하
3410	afflict	괴롭히다	\N	\N	\N	toefl	중
7699	poverty	n. *빈곤	\N	\N	\N	suneung	하
16617	transportation	n . 운송 	\N	\N	\N	toeic	하
16626	access	v . ~ 에 들어가다 . 접근 하다 : 접속 하다 n . 접근 ( 권 ) 	\N	\N	\N	toeic	하
16634	further	adj . 더 이상의 	\N	\N	\N	toeic	하
16639	presentation	n . 발표 	\N	\N	\N	toeic	하
16647	perfectly	adv . 완전히 	\N	\N	\N	toeic	하
16655	holder	n . 소지자 	\N	\N	\N	toeic	하
16661	definitely	adv . 분명히 	\N	\N	\N	toeic	하
16666	invitation	n . 초대 : 초대장	\N	\N	\N	toeic	하
16669	reserve	v . 예약 하다 ( -book ) 	\N	\N	\N	toeic	하
16672	layout	n . 레이아웃 	\N	\N	\N	toeic	하
16675	diligence	n . 근면 	\N	\N	\N	toeic	하
16714	terminate	v . 끝내다 . 종료 하다	\N	\N	\N	toeic	하
16727	assort	v . 분류 하다	\N	\N	\N	toeic	중
16730	spacious	adj . 넓은 	\N	\N	\N	toeic	하
16734	commission	n . 수수료 	\N	\N	\N	toeic	하
3349	abiding	지속적인	\N	\N	\N	toefl	하
16744	conscious	adj . 의식 하는 	\N	\N	\N	toeic	하
16751	suggestion	n . 제안 	\N	\N	\N	toeic	하
3348	have an abhorrence of	~을 몹시 싫어하다	\N	\N	\N	toefl	기타
3350	abide	살다	\N	\N	\N	toefl	하
3351	abolish	폐지하다	\N	\N	\N	toefl	하
3352	aboration	n. 유산	\N	\N	\N	toefl	기타
3353	abound in	~이 많다	\N	\N	\N	toefl	기타
3355	abscond	몰래 떠나다	\N	\N	\N	toefl	중
3356	abstain	삼가다	\N	\N	\N	toefl	하
3357	abstract	추상적인	\N	\N	\N	toefl	하
3358	abstruse	난해한	\N	\N	\N	toefl	중
3359	absurd	터무니없는	\N	\N	\N	toefl	하
3360	abundance	풍부	\N	\N	\N	toefl	하
3361	abundant	풍부한	\N	\N	\N	toefl	하
3362	abuse	남용하다	\N	\N	\N	toefl	하
3363	abysmal	심연의	\N	\N	\N	toefl	하
3365	accentuate	강조하다	\N	\N	\N	toefl	하
3366	accept	받아들이다	\N	\N	\N	toefl	하
3367	accessible	접근하기 쉬운	\N	\N	\N	toefl	하
3368	accidental	우연의	\N	\N	\N	toefl	하
3369	accomplice	n. 공범자	\N	\N	\N	toefl	하
3370	accomplishment	성취	\N	\N	\N	toefl	하
3372	accumulate	축적하다	\N	\N	\N	toefl	하
3373	acme	절정	\N	\N	\N	toefl	하
3374	acquaint	익히다	\N	\N	\N	toefl	하
16570	competitive	adj . 경쟁력 있는 	\N	\N	\N	toeic	하
3375	acquaint a with b	A에게 B를 알리다	\N	\N	\N	toefl	기타
16761	observe	v . 관찰 하다 . 주시 하다 준수 하다	\N	\N	\N	toeic	하
16765	apologize	v . 사과 하다 사죄 하다	\N	\N	\N	toeic	하
16771	significant	adj. 중요한	\N	\N	\N	toeic	하
16774	improvement	n . 개량 	\N	\N	\N	toeic	하
16778	regional	adj . 지방 의	\N	\N	\N	toeic	하
16785	intensive	adj . 집중적 인 	\N	\N	\N	toeic	하
16788	material	n . 재료 	\N	\N	\N	toeic	하
16808	blunder	n . 실수 	\N	\N	\N	toeic	하
16814	commendation	n . 칭찬 	\N	\N	\N	toeic	하
16821	personify	v . ~ 를 의인화 하다 ; 전형적 으로 보여 주다 . ~ 의 화신 이다	\N	\N	\N	toeic	중
16832	tourist	n . 관광객 	\N	\N	\N	toeic	하
16844	international flights	X4	\N	\N	\N	toeic	기타
16854	versatile	adj . 다재 다능 한 다용도 의	\N	\N	\N	toeic	하
16893	magnify	v . 확대 하다	\N	\N	\N	toeic	하
16912	haste	n . ( 시간 부족 으로 ) 서두름 	\N	\N	\N	toeic	하
16915	alternative	n . 대안 adj . 대신 하는 	\N	\N	\N	toeic	하
16921	pledge	n . 약속 	\N	\N	\N	toeic	하
16540	entertainment	n . 오락 	\N	\N	\N	toeic	하
3342	abate	줄이다	\N	\N	\N	toefl	하
3343	abbreviate	생략하다	\N	\N	\N	toefl	중
3344	abbreviation	생략	\N	\N	\N	toefl	하
3345	aberrant	정도를 벗어난	\N	\N	\N	toefl	하
3346	abhor	몹시 싫어하다	\N	\N	\N	toefl	중
3347	abhorrence	혐오	\N	\N	\N	toefl	중
16573	culinary	adj . 요리 의 	\N	\N	\N	toeic	하
16555	inconvenience	n . 불편 ( 한 것 )	\N	\N	\N	toeic	하
3426	slightly open	조금 열린	\N	\N	\N	toefl	기타
3427	alienate	소원하게	\N	\N	\N	toefl	하
3431	assuage	달래다	\N	\N	\N	toefl	중
3434	all-out	총력을 기울인	\N	\N	\N	toefl	기타
3438	aloof	쌀쌀맞은	\N	\N	\N	toefl	하
3442	altercate	격렬하게 논쟁하다	\N	\N	\N	toefl	기타
3446	substitute	대체하다	\N	\N	\N	toefl	하
3447	altruism	이타주의	\N	\N	\N	toefl	하
3449	amalgam	혼합물	\N	\N	\N	toefl	하
3454	incredible	놀라운	\N	\N	\N	toefl	하
3455	ambience	환경	\N	\N	\N	toefl	하
3458	ambiguous	모호한	\N	\N	\N	toefl	하
3459	uncertain	확신이 없는	\N	\N	\N	toefl	하
3469	amity	우호	\N	\N	\N	toefl	하
3472	sufficient	충분한	\N	\N	\N	toefl	하
3474	analogous	유사한	\N	\N	\N	toefl	하
3476	anchor	닻	\N	\N	\N	toefl	하
3481	antagonistic	적대적인	\N	\N	\N	toefl	하
3485	foresee	예견하다	\N	\N	\N	toefl	하
3491	appall	오싹하게	\N	\N	\N	toefl	상
3497	apparently	명백히	\N	\N	\N	toefl	하
3503	apprehend	체포하다; 이해하다; 두려워하다	\N	\N	\N	toefl	하
3504	apprehension	불안	\N	\N	\N	toefl	하
3507	apprise inform A of B	A에게 B를 알리다	\N	\N	\N	toefl	기타
3512	aqueduct	n. 수로	\N	\N	\N	toefl	하
3513	water canal	수로	\N	\N	\N	toefl	기타
3516	arbitrate	v. 중재하다	\N	\N	\N	toefl	중
3517	archaic	고대의	\N	\N	\N	toefl	하
3521	argument	주장	\N	\N	\N	toefl	하
3524	armchair	안락의자	\N	\N	\N	toefl	하
3526	arrange	배열하다	\N	\N	\N	toefl	하
3533	a skilled worker	숙련공	\N	\N	\N	toefl	기타
3534	aspiration	열망	\N	\N	\N	toefl	하
3536	assertion	주장	\N	\N	\N	toefl	하
3537	assertive	자기주장이 강한	\N	\N	\N	toefl	하
3542	atheism	n. 무신론	\N	\N	\N	toefl	하
3550	ascribe	~의 탓으로 돌리다	\N	\N	\N	toefl	하
3554	audible	들리는	\N	\N	\N	toefl	하
3562	autocratic	독재적인	\N	\N	\N	toefl	하
3568	avert	피하다	\N	\N	\N	toefl	하
3569	avoid	피하다	\N	\N	\N	toefl	하
3573	awkward	어색한	\N	\N	\N	toefl	하
3576	bachelor	미혼 남자	\N	\N	\N	toefl	하
3578	backwater	침체상태	\N	\N	\N	toefl	하
3580	balm	진통제	\N	\N	\N	toefl	하
3582	ban	금지하다	\N	\N	\N	toefl	하
3583	prohibit	금지하다	\N	\N	\N	toefl	하
3589	barren	불모의	\N	\N	\N	toefl	하
3592	tolerate	참다	\N	\N	\N	toefl	하
3594	beat-up	낡은	\N	\N	\N	toefl	기타
3596	bedrock	근본	\N	\N	\N	toefl	하
3597	beforehand	미리	\N	\N	\N	toefl	하
3599	belated	a. 늦어진	\N	\N	\N	toefl	하
3603	warlike	전쟁의	\N	\N	\N	toefl	하
3605	benediction	축복	\N	\N	\N	toefl	하
3607	partron	후원자	\N	\N	\N	toefl	기타
3609	benevolent	자비심 많은	\N	\N	\N	toefl	하
3611	benign	친절한	\N	\N	\N	toefl	하
3612	bent	경향	\N	\N	\N	toefl	하
3627	brandish	휘두르다	\N	\N	\N	toefl	중
3629	blatant	노골적인	\N	\N	\N	toefl	하
3630	bleak	암울한	\N	\N	\N	toefl	하
3633	block	막다	\N	\N	\N	toefl	하
3634	blue	우울한	\N	\N	\N	toefl	하
3646	bountiful	풍부한	\N	\N	\N	toefl	하
3647	brag	자랑하다	\N	\N	\N	toefl	하
3653	brilliantly	찬란히	\N	\N	\N	toefl	하
3657	bulk	크기	\N	\N	\N	toefl	하
3659	bulwark	'성채	\N	\N	\N	toefl	중
3661	burglar	강도	\N	\N	\N	toefl	하
3663	burrow	굴	\N	\N	\N	toefl	하
3665	buttress	부벽; 지탱하다	\N	\N	\N	toefl	하
3667	cardaverous	시체같은	\N	\N	\N	toefl	기타
3675	cancel	v. 취소하다	\N	\N	\N	toefl	하
3678	candor	솔직	\N	\N	\N	toefl	하
3683	capricious	잘 변하는	\N	\N	\N	toefl	하
3687	careless	부주의한	\N	\N	\N	toefl	하
3689	casualties	사상자수 (fatalities)	\N	\N	\N	toefl	하
3695	celebrated	유명한	\N	\N	\N	toefl	하
3699	censure	비난하다; 비난	\N	\N	\N	toefl	하
3702	centennial	100년마다의	\N	\N	\N	toefl	하
3704	chagrin	원통함	\N	\N	\N	toefl	하
3705	charge	충전하다	\N	\N	\N	toefl	하
3710	chestnut	진부한 이야기	\N	\N	\N	toefl	하
3712	chronic	만성적인	\N	\N	\N	toefl	하
3716	circumference	원주	\N	\N	\N	toefl	하
3720	clemency	자비	\N	\N	\N	toefl	하
3722	clientele	(집합적) 고객들	\N	\N	\N	toefl	하
3723	clog	막다	\N	\N	\N	toefl	하
3729	coherence	일관성	\N	\N	\N	toefl	하
3731	coincide	동시에 일어나다	\N	\N	\N	toefl	하
3734	collaboration	협력	\N	\N	\N	toefl	하
3737	breakdown	고장	\N	\N	\N	toefl	하
3742	colony	식민지	\N	\N	\N	toefl	하
3743	colossal	거대한	\N	\N	\N	toefl	하
3746	comely	잘생긴	\N	\N	\N	toefl	중
3747	commence	시작하다	\N	\N	\N	toefl	하
3755	compelling	주목하지 않을 수 없는	\N	\N	\N	toefl	하
3760	compliance	준수	\N	\N	\N	toefl	하
3761	compliant	유순한	\N	\N	\N	toefl	하
3762	comply	v. 따르다	\N	\N	\N	toefl	하
3768	compulsory	강제적인	\N	\N	\N	toefl	하
3773	concerted	협동/협의에 의한	\N	\N	\N	toefl	하
3776	conciliatory	달래는	\N	\N	\N	toefl	중
3777	concise	간결한	\N	\N	\N	toefl	하
3778	concurrently	동시에	\N	\N	\N	toefl	하
3781	conduct	행동	\N	\N	\N	toefl	하
3412	misery	고통	\N	\N	\N	toefl	하
3416	agenda	의제	\N	\N	\N	toefl	하
3417	aggravate	악화시키다	\N	\N	\N	toefl	하
3538	asset	자산	\N	\N	\N	toefl	하
3435	all-out strike	총파업	\N	\N	\N	toefl	기타
3436	allowance	용돈	\N	\N	\N	toefl	하
3440	change	바꾸다	\N	\N	\N	toefl	하
3443	altercation	언쟁	\N	\N	\N	toefl	하
3448	altruistic	이타적인	\N	\N	\N	toefl	하
3453	amazing	놀랄 만한	\N	\N	\N	toefl	하
3457	ambient	사방을 둘러싸는	\N	\N	\N	toefl	하
3461	desire to succed	개선하다	\N	\N	\N	toefl	기타
3464	ameliorate	개선하다	\N	\N	\N	toefl	하
3466	amiable	상냥한	\N	\N	\N	toefl	하
3468	friendly	우호적인	\N	\N	\N	toefl	하
3471	extensive	광범위한	\N	\N	\N	toefl	하
3473	anachronism	n. 시대착오	\N	\N	\N	toefl	중
3475	analogy	유사	\N	\N	\N	toefl	하
3480	anorexia	거식증	\N	\N	\N	toefl	하
3484	anticipate	예상하다	\N	\N	\N	toefl	하
3487	anxiety	걱정	\N	\N	\N	toefl	하
3488	apathetic	무감각한	\N	\N	\N	toefl	하
3494	apparel	의복	\N	\N	\N	toefl	하
3495	apparent	분명한	\N	\N	\N	toefl	하
3501	appraise	평가하다	\N	\N	\N	toefl	하
3505	apprehensive	걱정하는	\N	\N	\N	toefl	하
3508	approbation	승인	\N	\N	\N	toefl	하
3511	apt	~하는 경향이 있는	\N	\N	\N	toefl	하
3515	arbitrary	임의적인; 독재적인	\N	\N	\N	toefl	하
3518	archipelago	군도	\N	\N	\N	toefl	하
3522	controversy	논쟁	\N	\N	\N	toefl	하
3527	arrogance	거만	\N	\N	\N	toefl	하
3532	artisan	장인	\N	\N	\N	toefl	하
3540	astonish	깜짝 놀라게 하다	\N	\N	\N	toefl	중
3545	attenuate	가늘게 하다	\N	\N	\N	toefl	중
3546	attest	증명하다	\N	\N	\N	toefl	하
3547	attract	끌다	\N	\N	\N	toefl	하
3548	lure	꾀다	\N	\N	\N	toefl	하
3552	bold	대담한	\N	\N	\N	toefl	하
3553	audacity	대담함	\N	\N	\N	toefl	하
3556	enlarge	크게 하다	\N	\N	\N	toefl	하
3557	auspicious	길조의	\N	\N	\N	toefl	하
3560	autocracy	독재정치	\N	\N	\N	toefl	중
3561	tyranny	폭정	\N	\N	\N	toefl	하
3567	greedy	탐욕스러운	\N	\N	\N	toefl	하
3570	turn aside	비켜나다	\N	\N	\N	toefl	기타
3571	avid	열심인	\N	\N	\N	toefl	하
3575	awry	휘어진	\N	\N	\N	toefl	하
3581	balmy	온화한	\N	\N	\N	toefl	하
3586	insolvent	파산한	\N	\N	\N	toefl	하
3587	Bankruptcy	파산	\N	\N	\N	toefl	하
3600	tardy	지각한	\N	\N	\N	toefl	하
3601	bellicose	호전적인	\N	\N	\N	toefl	중
3604	bemused	당황한	\N	\N	\N	toefl	중
3608	beneficial	유익한	\N	\N	\N	toefl	하
3613	bereave	(가족을) 잃다	\N	\N	\N	toefl	상
3615	blockade	차단하다	\N	\N	\N	toefl	하
3618	beverage	음료	\N	\N	\N	toefl	하
3620	prejudice	편견	\N	\N	\N	toefl	하
3621	bibliophile	애서가	\N	\N	\N	toefl	중
3623	bemused	당황한	\N	\N	\N	toefl	중
3624	biennially	2년마다	\N	\N	\N	toefl	중
3625	bizarre	기괴한	\N	\N	\N	toefl	하
3628	blankly	멍하게	\N	\N	\N	toefl	중
3631	blend	섞다	\N	\N	\N	toefl	하
3637	board	탑승하다	\N	\N	\N	toefl	하
3638	bolster	지탱하다	\N	\N	\N	toefl	하
3643	bond	유대	\N	\N	\N	toefl	하
3648	brandish	휘두르다	\N	\N	\N	toefl	중
3649	brawl	말다툼	\N	\N	\N	toefl	하
3652	brevity	간결함	\N	\N	\N	toefl	하
3654	bristle	화내다	\N	\N	\N	toefl	하
3660	burgeon	급성장하다	\N	\N	\N	toefl	중
3662	thief	강도 도둑	\N	\N	\N	toefl	하
3664	bustle	활기찬	\N	\N	\N	toefl	하
3669	caliber	가치	\N	\N	\N	toefl	하
3671	callow	미성숙한	\N	\N	\N	toefl	중
3672	immature	미숙한	\N	\N	\N	toefl	하
3673	camouflage	위장하다	\N	\N	\N	toefl	하
3674	campaign	운동	\N	\N	\N	toefl	하
3679	capacity	능력	\N	\N	\N	toefl	하
3680	capital	수도	\N	\N	\N	toefl	하
3684	capsize	뒤집히다	\N	\N	\N	toefl	중
3688	carnage	대학살	\N	\N	\N	toefl	하
3693	catholic	(취향이) 폭넓은	\N	\N	\N	toefl	하
3694	cavernous	동굴같은	\N	\N	\N	toefl	하
3697	celerity	신속	\N	\N	\N	toefl	중
3700	blame	비난하다	\N	\N	\N	toefl	하
3703	one hunderedth	백년마다	\N	\N	\N	toefl	기타
3714	chronology	연대순	\N	\N	\N	toefl	하
3715	circulate	순환하다	\N	\N	\N	toefl	하
3718	cite	인용하다	\N	\N	\N	toefl	하
3719	clandestine	비밀의	\N	\N	\N	toefl	하
3724	clue	단서	\N	\N	\N	toefl	하
3726	coerce	강요하다	\N	\N	\N	toefl	하
3728	be cognizant of	~을 알고 있다	\N	\N	\N	toefl	기타
3730	coherent	일관성 있는	\N	\N	\N	toefl	하
3733	work together	함께 일하다	\N	\N	\N	toefl	기타
3736	collapse	무너지다	\N	\N	\N	toefl	하
3738	colleague	동료	\N	\N	\N	toefl	하
3739	co-worker	동료	\N	\N	\N	toefl	기타
3748	commensurate	동등한	\N	\N	\N	toefl	하
3749	comment	논평	\N	\N	\N	toefl	하
3750	commodity	상품	\N	\N	\N	toefl	하
3757	complacency	자기만족	\N	\N	\N	toefl	하
3758	complacent	자기만족에 빠진	\N	\N	\N	toefl	하
3764	compose	구성하다	\N	\N	\N	toefl	하
3767	compulsively	강제적으로	\N	\N	\N	toefl	중
3770	conceited	자부심이 강한	\N	\N	\N	toefl	중
3771	concentrate on	~에 집중하다	\N	\N	\N	toefl	기타
3775	compromise	타협하다	\N	\N	\N	toefl	하
3779	condense	농축하다	\N	\N	\N	toefl	하
3782	confederation	연합	\N	\N	\N	toefl	하
3785	verify	확인하다	\N	\N	\N	toefl	하
3421	agitation	불안	\N	\N	\N	toefl	하
3430	alleviate	완화하다	\N	\N	\N	toefl	하
3433	allocate	할당하다	\N	\N	\N	toefl	하
3432	relieve	완화시키다	\N	\N	\N	toefl	하
3437	pocket money	용돈	\N	\N	\N	toefl	기타
3441	alternation	교대	\N	\N	\N	toefl	하
3444	alternate	번갈아 일어나다	\N	\N	\N	toefl	하
3445	alternative	대안	\N	\N	\N	toefl	하
3451	combine	결합시키다	\N	\N	\N	toefl	하
3452	amass	모으다	\N	\N	\N	toefl	중
3456	atmostphere	분위기	\N	\N	\N	toefl	기타
3460	ambition	야망	\N	\N	\N	toefl	하
3463	ambush	n. 매복	\N	\N	\N	toefl	하
3465	amenities	편의시설	\N	\N	\N	toefl	하
3470	ample	충분한	\N	\N	\N	toefl	하
3477	secure	안전한	\N	\N	\N	toefl	하
3478	annual	해마다의 yearly	\N	\N	\N	toefl	하
3482	antecedent	앞서는	\N	\N	\N	toefl	하
3483	prior to	~에 앞서	\N	\N	\N	toefl	기타
3486	antiquated	낡은	\N	\N	\N	toefl	하
3490	apiarist	양봉가 beekeeper	\N	\N	\N	toefl	기타
3492	apologetic	사과의	\N	\N	\N	toefl	하
3493	appalling	A.1.소름 끼치는	\N	\N	\N	toefl	하
3496	obvious	명백한	\N	\N	\N	toefl	하
3498	seemingly	외견상으로	\N	\N	\N	toefl	하
3499	appease	달래다	\N	\N	\N	toefl	하
3509	appropriate	적절한	\N	\N	\N	toefl	하
3510	approximate	대략적인	\N	\N	\N	toefl	하
3514	arable	경작할 수 있는	\N	\N	\N	toefl	하
3519	ardent	열렬한	\N	\N	\N	toefl	하
3520	arduous	힘든	\N	\N	\N	toefl	하
3525	armistice	휴전	\N	\N	\N	toefl	하
3528	arrogant	거만한	\N	\N	\N	toefl	하
3529	articulate	분명히 표현하다	\N	\N	\N	toefl	하
3535	assailant	공격자	\N	\N	\N	toefl	하
3541	astronomy	n. 천문학	\N	\N	\N	toefl	하
3543	unbelief	불신	\N	\N	\N	toefl	하
3544	atrocities	잔학한 행위	\N	\N	\N	toefl	하
3551	audacious	대담한	\N	\N	\N	toefl	하
3555	augment	늘리다	\N	\N	\N	toefl	하
3558	austere	엄격한	\N	\N	\N	toefl	하
3559	authorization	권한 부여	\N	\N	\N	toefl	하
3563	autograph	서명	\N	\N	\N	toefl	하
3564	autonomous	자치의	\N	\N	\N	toefl	하
3572	awash	물에 뒤덮인/넘쳐 나는	\N	\N	\N	toefl	하
3574	awkwardly	어색하게	\N	\N	\N	toefl	하
3577	backlash	반발	\N	\N	\N	toefl	하
3579	balk	방해	\N	\N	\N	toefl	하
3584	forbid	금지하다	\N	\N	\N	toefl	하
3585	bankrupt	파산한	\N	\N	\N	toefl	하
3588	banner	현수막	\N	\N	\N	toefl	하
3591	bear	참다	\N	\N	\N	toefl	하
3593	beatific	기쁨이 넘치는	\N	\N	\N	toefl	중
3598	beguile	매혹시키다	\N	\N	\N	toefl	중
3602	belligerent	호전적인; 전쟁중인	\N	\N	\N	toefl	하
3606	benefactor	은인	\N	\N	\N	toefl	하
3614	besiege	포위하다	\N	\N	\N	toefl	중
3619	bias	편견	\N	\N	\N	toefl	하
3626	blanch	v. 희게 하다	\N	\N	\N	toefl	중
3632	blithe	명랑한	\N	\N	\N	toefl	중
3636	blurred	흐릿한	\N	\N	\N	toefl	하
3645	boost	증대시키다	\N	\N	\N	toefl	하
3650	break	밝히다	\N	\N	\N	toefl	하
3651	breakthrough	돌파구; (과학 등) 큰 발전	\N	\N	\N	toefl	하
3655	brittle	깨지기 쉬운	\N	\N	\N	toefl	하
3656	brochure	소책자	\N	\N	\N	toefl	하
3666	cacophony	불협화음	\N	\N	\N	toefl	중
3670	callous	무관심한	\N	\N	\N	toefl	하
3676	candid	솔직한	\N	\N	\N	toefl	하
3677	candidate	후보자	\N	\N	\N	toefl	하
3681	capitalize	v. 이용하다[on]	\N	\N	\N	toefl	하
3682	capitulate	항복하다	\N	\N	\N	toefl	중
3686	cardinal	기본적인	\N	\N	\N	toefl	하
3690	categorize	분류하다	\N	\N	\N	toefl	하
3691	catastrophe	대참사	\N	\N	\N	toefl	하
3692	cathy	사람의 마음을 끄는	\N	\N	\N	toefl	하
3698	censorship	n. 검열	\N	\N	\N	toefl	하
3701	census	인구조사	\N	\N	\N	toefl	하
3706	charitable	자비로운	\N	\N	\N	toefl	하
3709	check	저지하다	\N	\N	\N	toefl	하
3713	chronologically	연대순으로(=according to a time sequence)	\N	\N	\N	toefl	하
3717	circumvent	피하다	\N	\N	\N	toefl	하
3721	client	의뢰인	\N	\N	\N	toefl	하
3725	coagulate	(혈액 등) 응고하다	\N	\N	\N	toefl	중
3727	cognizant	알고 있는	\N	\N	\N	toefl	하
3732	collaborate	협력하다	\N	\N	\N	toefl	하
3735	cooperation	협력	\N	\N	\N	toefl	하
3740	collision	충돌	\N	\N	\N	toefl	하
3744	coma	혼수상태	\N	\N	\N	toefl	하
3751	commotion	소란	\N	\N	\N	toefl	하
3752	compartment	칸막이	\N	\N	\N	toefl	하
3753	compatible	양립하는	\N	\N	\N	toefl	하
3756	competent	유능한	\N	\N	\N	toefl	하
3759	complexity	n. 복잡성	\N	\N	\N	toefl	하
3763	component	구성요소	\N	\N	\N	toefl	하
3766	compromise	타협하다	\N	\N	\N	toefl	하
3769	concede	인정하다	\N	\N	\N	toefl	하
3774	concession	양보	\N	\N	\N	toefl	하
3780	condone	묵과하다	\N	\N	\N	toefl	하
3783	confined	한정된	\N	\N	\N	toefl	하
3786	conflicting	서로 싸우는	\N	\N	\N	toefl	하
3794	connoisseur	감식가	\N	\N	\N	toefl	하
3795	consanguineous	혈족의	\N	\N	\N	toefl	중
3800	consign	위임	\N	\N	\N	toefl	중
3803	construe	해석하다	\N	\N	\N	toefl	하
3806	comtempt	경멸	\N	\N	\N	toefl	기타
3811	contract	계약하다	\N	\N	\N	toefl	하
3816	contrite	죄를 뉘우치는	\N	\N	\N	toefl	중
3819	conventional	전통적인	\N	\N	\N	toefl	하
3420	agitate	선동하다	\N	\N	\N	toefl	중
3424	agreeable	기분 좋은	\N	\N	\N	toefl	하
3635	blunder	큰 실수	\N	\N	\N	toefl	하
3425	ajar	문이 조금 열린	\N	\N	\N	toefl	중
3467	amicable	우호적인	\N	\N	\N	toefl	하
3799	considerably	상당히	\N	\N	\N	toefl	하
3804	contagious	전염성의	\N	\N	\N	toefl	하
3813	deny	부인하다	\N	\N	\N	toefl	하
3815	contravene	위반하다 모순되다 반박하다	\N	\N	\N	toefl	하
3818	convalescence	요양	\N	\N	\N	toefl	중
3822	convince	확신시키다	\N	\N	\N	toefl	하
3825	cordially	정중히	\N	\N	\N	toefl	하
3827	correspond	일치하다	\N	\N	\N	toefl	하
3828	corroborate	확인하다	\N	\N	\N	toefl	하
3830	count	중요하다	\N	\N	\N	toefl	하
3833	courier	n. 급송 택배	\N	\N	\N	toefl	하
3834	crafty	교활한	\N	\N	\N	toefl	하
3839	craven	비겁한	\N	\N	\N	toefl	하
3842	critical	대단히 중요한	\N	\N	\N	toefl	하
3845	crow	까마귀	\N	\N	\N	toefl	하
3846	crowd	군중	\N	\N	\N	toefl	하
3850	reduce to tiny bits	힘없이 무너지다	\N	\N	\N	toefl	기타
3855	cultivate	경작하다	\N	\N	\N	toefl	하
3858	restrict	한정하다	\N	\N	\N	toefl	하
3862	currently	현재	\N	\N	\N	toefl	하
3863	curse	저주하다	\N	\N	\N	toefl	하
3868	cutting-edge	최첨단의	\N	\N	\N	toefl	기타
3871	dank	축축한	\N	\N	\N	toefl	하
3872	dart	돌진하다	\N	\N	\N	toefl	하
3877	dearth	부족	\N	\N	\N	toefl	하
3878	debase	(가치	\N	\N	\N	toefl	중
3880	debris	부스러기	\N	\N	\N	toefl	하
3882	deceased	사망한	\N	\N	\N	toefl	하
3885	decimate	많은 사람을 죽이다	\N	\N	\N	toefl	중
3891	decriminalize	처벌대상에서 제외하다	\N	\N	\N	toefl	중
3893	dedicated	전념하는	\N	\N	\N	toefl	하
3898	defeat	패배시키다	\N	\N	\N	toefl	하
3900	defective	결함이 있는	\N	\N	\N	toefl	하
3906	deforestation	삼림 파괴	\N	\N	\N	toefl	하
3907	deftly	능숙하게	\N	\N	\N	toefl	하
3913	delegate	위임하다; (회의) 대표로 파견하다	\N	\N	\N	toefl	하
3914	delete	삭제하다	\N	\N	\N	toefl	하
3919	delineate	묘사하다	\N	\N	\N	toefl	하
3923	demolish	파괴하다	\N	\N	\N	toefl	하
3925	denizen	주민	\N	\N	\N	toefl	중
3928	denounce	맹렬히 비난하다	\N	\N	\N	toefl	하
3929	condemn	비난하다	\N	\N	\N	toefl	하
3931	heavily	몹시	\N	\N	\N	toefl	하
3937	deport	강제 추방하다	\N	\N	\N	toefl	하
3941	deride	조롱하다	\N	\N	\N	toefl	중
3944	descent	하강	\N	\N	\N	toefl	하
3945	desert	사막	\N	\N	\N	toefl	하
3951	despotic	전제적인	\N	\N	\N	toefl	중
3952	despotism	독재정치	\N	\N	\N	toefl	하
3956	detached	무심한	\N	\N	\N	toefl	하
3957	detainment	억류	\N	\N	\N	toefl	중
3962	deterioration	악화	\N	\N	\N	toefl	하
3964	determine	결심하다	\N	\N	\N	toefl	하
3968	detrimental	해로운	\N	\N	\N	toefl	하
3969	devastating	황폐시키는	\N	\N	\N	toefl	하
3972	dexterity	N. 손재주 있음	\N	\N	\N	toefl	하
3976	rambling	어스렁거리는	\N	\N	\N	toefl	하
3979	dilute	묽게 하다	\N	\N	\N	toefl	하
3984	discard	버리다	\N	\N	\N	toefl	하
3992	disclaimer	권리 포기 각서	\N	\N	\N	toefl	하
4009	disinclination	기분이 내키지 않음	\N	\N	\N	toefl	중
4010	disintegrate	해체시키다	\N	\N	\N	toefl	중
4017	disparate	다른	\N	\N	\N	toefl	하
4018	disparity	격차	\N	\N	\N	toefl	하
4019	dispassionate	감정에 휘둘리지 않는; 객관적인	\N	\N	\N	toefl	중
4020	dispatch	급파하다	\N	\N	\N	toefl	하
4023	disposition	성질	\N	\N	\N	toefl	하
4027	dissipate	흩뜨리다	\N	\N	\N	toefl	하
4031	2. 집중을 방해하는 것	 산만함	\N	\N	\N	toefl	기타
4034	diverse	다양한	\N	\N	\N	toefl	하
4039	docile	유순한	\N	\N	\N	toefl	중
4040	doctor	조작하다	\N	\N	\N	toefl	하
4044	tame	길들여진	\N	\N	\N	toefl	하
4046	dormant	활동이 없는	\N	\N	\N	toefl	하
4048	dote	맹목적으로 좋아하다	\N	\N	\N	toefl	중
4054	down to earth	현실적인	\N	\N	\N	toefl	기타
4056	sleep lightly	꾸벅꾸벅 졸다	\N	\N	\N	toefl	기타
4061	drastic	격렬한	\N	\N	\N	toefl	하
4064	severe	심한	\N	\N	\N	toefl	하
4071	dub	~라고 부르다	\N	\N	\N	toefl	하
4072	dubious	의심하는	\N	\N	\N	toefl	하
4073	ductile	(금속이) 연성이 있는	\N	\N	\N	toefl	하
4076	duplicity	이중성	\N	\N	\N	toefl	중
4077	durable	내구성이 있는	\N	\N	\N	toefl	하
4085	economize	절약하다	\N	\N	\N	toefl	중
4093	elastic	탄력 있는	\N	\N	\N	toefl	하
4094	elasticity	탄력	\N	\N	\N	toefl	하
4097	elevate	높이다	\N	\N	\N	toefl	하
4099	eligible	자격이 있는	\N	\N	\N	toefl	하
4100	eliminate	제거하다	\N	\N	\N	toefl	하
4104	emancipate	해방하다	\N	\N	\N	toefl	중
4105	embark	착수하다	\N	\N	\N	toefl	하
4106	embargo	n. (특정 상품의) 무역 금지	\N	\N	\N	toefl	하
4108	emblem	상징	\N	\N	\N	toefl	하
4109	embolden	대담하게 만들다	\N	\N	\N	toefl	중
4115	emigrant	이민	\N	\N	\N	toefl	하
4116	emissary	사절	\N	\N	\N	toefl	중
4119	empower	~에게 권한을 부여하다	\N	\N	\N	toefl	하
4123	encroach	침입하다	\N	\N	\N	toefl	중
4126	endorse	승인하다	\N	\N	\N	toefl	하
4142	entail	~을 수반하다	\N	\N	\N	toefl	하
4143	enthrall	매혹하다	\N	\N	\N	toefl	중
4149	epitome	전형	\N	\N	\N	toefl	하
4152	equanimity	침착	\N	\N	\N	toefl	중
4153	with equanimity	침착하게	\N	\N	\N	toefl	기타
4158	equivocal	애매모호한	\N	\N	\N	toefl	중
3787	confront	직면하다	\N	\N	\N	toefl	하
3791	congregate	V. 모이다	\N	\N	\N	toefl	하
3798	consequence	결과	\N	\N	\N	toefl	하
3797	consecutive	연속적인	\N	\N	\N	toefl	하
3802	conspicuous	눈에 잘 띄는	\N	\N	\N	toefl	하
3805	contemporary	현대의	\N	\N	\N	toefl	하
3807	contention	논쟁	\N	\N	\N	toefl	하
3810	contiguity	인접	\N	\N	\N	toefl	중
3812	contradict	반박하다	\N	\N	\N	toefl	하
3814	contrary	(ADV) 반대로	\N	\N	\N	toefl	하
3817	controversial	논란의 여지가 있는	\N	\N	\N	toefl	하
3820	convert	변형시키다	\N	\N	\N	toefl	하
3821	conviction	확신	\N	\N	\N	toefl	하
3824	copious	풍부한	\N	\N	\N	toefl	하
3829	council	협의회	\N	\N	\N	toefl	하
3837	crave	열망하다	\N	\N	\N	toefl	하
3844	cross-current	역류	\N	\N	\N	toefl	기타
3852	culmination	정점	\N	\N	\N	toefl	하
3857	curb	억제	\N	\N	\N	toefl	하
3860	restore health to	치료하다	\N	\N	\N	toefl	기타
3867	customarily	관례상	\N	\N	\N	toefl	하
3870	dally	꾸물거리다	\N	\N	\N	toefl	중
3874	deadlock	교착상태	\N	\N	\N	toefl	하
3875	standstill	정지한	\N	\N	\N	toefl	하
3876	deadly	치명적인	\N	\N	\N	toefl	하
3881	decade	10년	\N	\N	\N	toefl	하
3883	decent	괜찮은	\N	\N	\N	toefl	하
3890	decorously	예의바르게	\N	\N	\N	toefl	기타
3896	deduct	공제하다	\N	\N	\N	toefl	하
3897	deem	~라고 여기다	\N	\N	\N	toefl	하
3903	boldly	대담하게	\N	\N	\N	toefl	하
3910	defy	도전하다	\N	\N	\N	toefl	하
3915	deleterious	해로운	\N	\N	\N	toefl	하
3916	noxious	유해한	\N	\N	\N	toefl	하
3920	portray	그리다	\N	\N	\N	toefl	하
3921	delivery	n. 배달	\N	\N	\N	toefl	하
3922	demise	죽음	\N	\N	\N	toefl	하
3930	densely	밀집하여	\N	\N	\N	toefl	하
3933	false teeth	틀니	\N	\N	\N	toefl	기타
3938	deprecate	반대하다	\N	\N	\N	toefl	중
3939	deprivation	박탈	\N	\N	\N	toefl	하
3942	ridicule	조롱하다	\N	\N	\N	toefl	하
3943	derision	조소	\N	\N	\N	toefl	하
3947	designate	지정하다	\N	\N	\N	toefl	하
3949	despicable	경멸스러운	\N	\N	\N	toefl	하
3955	detached	분리된	\N	\N	\N	toefl	하
3960	deter a from ~ing	A로 하여금 ~하지 못하게 하다	\N	\N	\N	toefl	기타
3963	aggravation	악화	\N	\N	\N	toefl	하
3965	deterrent	억제책	\N	\N	\N	toefl	하
3970	devour	게걸스레 먹다	\N	\N	\N	toefl	하
3971	devout	헌신적인	\N	\N	\N	toefl	하
3977	dilapidated	황폐한	\N	\N	\N	toefl	하
3978	dilate	넓히다	\N	\N	\N	toefl	중
3982	din	소음	\N	\N	\N	toefl	하
3983	dire	무서운	\N	\N	\N	toefl	하
3985	discern	식별하다	\N	\N	\N	toefl	하
3990	N. 짐부리기; 방전; 해방	 면제; 면직	\N	\N	\N	toefl	기타
3993	discomfit	당황하게 하다	\N	\N	\N	toefl	기타
3998	discrepancy	불일치	\N	\N	\N	toefl	하
3999	discrete	분리된	\N	\N	\N	toefl	하
4000	discretion	신중함; 자유재량	\N	\N	\N	toefl	하
4001	discriminating	1. 식별력 있는	\N	\N	\N	toefl	하
4003	discrimination	N. 1. 구별	\N	\N	\N	toefl	하
4005	disdain	경멸하다	\N	\N	\N	toefl	하
4006	disembark	v. (배	\N	\N	\N	toefl	중
4011	disintegration	N. 분해	\N	\N	\N	toefl	하
4014	dismiss	해고하다	\N	\N	\N	toefl	하
4015	dismount	(말 등에서) 내리다	\N	\N	\N	toefl	중
4021	dispensary	약국	\N	\N	\N	toefl	하
4024	dissect	해부하다	\N	\N	\N	toefl	하
4035	divine	신의	\N	\N	\N	toefl	하
4036	divine right	신성불가침의 원리	\N	\N	\N	toefl	기타
4037	divulge	누설하다	\N	\N	\N	toefl	하
4041	doleful	애절한	\N	\N	\N	toefl	중
4042	melancholy	우울	\N	\N	\N	toefl	하
4045	domination	지배	\N	\N	\N	toefl	하
4055	doze	꾸벅꾸벅 졸다	\N	\N	\N	toefl	중
4058	draft	초고	\N	\N	\N	toefl	하
4059	manuscript	손으로 쓴 것	\N	\N	\N	toefl	하
4062	drastically	심하게	\N	\N	\N	toefl	하
4063	drawback	결점	\N	\N	\N	toefl	하
4067	drenched	흠뻑 적시다	\N	\N	\N	toefl	하
4068	drone	(꿀벌의) 수벌	\N	\N	\N	toefl	하
4069	drop	떨어뜨리다	\N	\N	\N	toefl	하
4070	drudgery	힘들고 단조로운 일	\N	\N	\N	toefl	중
4074	dumb	벙어리의	\N	\N	\N	toefl	하
4075	duplicate	복사하다	\N	\N	\N	toefl	하
4081	ebullient	쾌활한	\N	\N	\N	toefl	중
4082	eccentric	괴상한	\N	\N	\N	toefl	하
4087	edify	교화하다	\N	\N	\N	toefl	중
4092	elapse	(시간이) 경과하다	\N	\N	\N	toefl	중
4095	resilience	탄력	\N	\N	\N	toefl	하
4098	elicit	이끌어내다	\N	\N	\N	toefl	하
4101	elmination	제거	\N	\N	\N	toefl	기타
4107	embellish	장식하다	\N	\N	\N	toefl	하
4112	emerge	나오다	\N	\N	\N	toefl	하
4113	emergence	출현	\N	\N	\N	toefl	하
4114	emergent	떠오르는	\N	\N	\N	toefl	하
4120	emulate	모방하다	\N	\N	\N	toefl	하
4129	engender	낳다	\N	\N	\N	toefl	하
4130	engross	몰두	\N	\N	\N	toefl	중
4131	be engrossed in	~에 열중하다	\N	\N	\N	toefl	기타
4138	enormously	대단히	\N	\N	\N	toefl	하
4139	en route	(어디로 가는) 도중에	\N	\N	\N	toefl	기타
4140	ensue	(일	\N	\N	\N	toefl	하
4144	enticing	마음을 끄는	\N	\N	\N	toefl	하
4147	ephemeral	일시적인	\N	\N	\N	toefl	하
4151	epoch	신기원	\N	\N	\N	toefl	하
4156	equity	공평	\N	\N	\N	toefl	하
3793	conjugal	부부간의	\N	\N	\N	toefl	중
3843	criticize	비판[비난]하다	\N	\N	\N	toefl	하
3796	consecrate	신성하게 하다	\N	\N	\N	toefl	중
3904	deflect	방향을 바꾸다	\N	\N	\N	toefl	하
3838	desire	바라다	\N	\N	\N	toefl	하
3840	criteria	기준	\N	\N	\N	toefl	하
3841	criterion	표준	\N	\N	\N	toefl	하
3847	crucial	중대한	\N	\N	\N	toefl	하
3848	crude	가공하지 않은	\N	\N	\N	toefl	하
3851	cryptic	숨은	\N	\N	\N	toefl	하
3854	culprit	범인	\N	\N	\N	toefl	하
3856	cumbersome	성가신	\N	\N	\N	toefl	하
3859	cure	치료하다	\N	\N	\N	toefl	하
3861	currency	통화	\N	\N	\N	toefl	하
3865	cursory	서두르는	\N	\N	\N	toefl	하
3869	dabble	(물) 튀기다; 재미삼아 ~ 하다	\N	\N	\N	toefl	중
3873	daunting	벅찬	\N	\N	\N	toefl	하
3879	debatable	논쟁의 여지가 있는	\N	\N	\N	toefl	하
3886	decipher	(암호	\N	\N	\N	toefl	하
3887	declare	선언하다	\N	\N	\N	toefl	하
3888	decline	거절하다	\N	\N	\N	toefl	하
3894	devote	바치다	\N	\N	\N	toefl	하
3895	deduce	연역하다	\N	\N	\N	toefl	하
3899	conquer	극복하다	\N	\N	\N	toefl	하
3901	deference	존중	\N	\N	\N	toefl	하
3908	defuse	(긴장 등을) 완화시키다	\N	\N	\N	toefl	하
3911	degrade	강등시키다	\N	\N	\N	toefl	하
3912	deign	황송하게도 (자신을 낮추어) ~해주다	\N	\N	\N	toefl	중
3917	deliberately	고의적으로	\N	\N	\N	toefl	하
3918	delicate	섬세한	\N	\N	\N	toefl	하
3924	raze	완전히 파괴하다	\N	\N	\N	toefl	중
3926	denote	나타내다	\N	\N	\N	toefl	하
3932	denture	틀니	\N	\N	\N	toefl	하
3934	dependable	신뢰할 수 있는	\N	\N	\N	toefl	하
3936	deplorable	비참한	\N	\N	\N	toefl	하
3940	derelict	버려진	\N	\N	\N	toefl	하
3946	arid	매우 건조한	\N	\N	\N	toefl	하
3948	desolate	황량한	\N	\N	\N	toefl	하
3953	destitute	빈곤한	\N	\N	\N	toefl	하
3958	detect	발견하다	\N	\N	\N	toefl	하
3959	deter	단념시키다	\N	\N	\N	toefl	하
3961	deteriorate	악화시키다	\N	\N	\N	toefl	하
3967	detriment	손해	\N	\N	\N	toefl	하
3973	dichotomy	이분법	\N	\N	\N	toefl	하
3974	differentiate	구별하다	\N	\N	\N	toefl	하
3981	diminutive	소형의	\N	\N	\N	toefl	하
3986	discernible	A. 인식[식별]할 수 있는	\N	\N	\N	toefl	하
3991	discipline	훈련	\N	\N	\N	toefl	하
3994	thwart	막다	\N	\N	\N	toefl	하
3996	discreet	신중한	\N	\N	\N	toefl	하
3997	prudent	현명한	\N	\N	\N	toefl	하
4004	2. 차별	 차별대우	\N	\N	\N	toefl	기타
4007	disgraced	수치스러운	\N	\N	\N	toefl	하
4008	disguise	변장하다	\N	\N	\N	toefl	하
4012	dismal	음산한	\N	\N	\N	toefl	하
4013	dismay	실망	\N	\N	\N	toefl	하
4016	disparaging	얕보는; 험담하는	\N	\N	\N	toefl	중
4022	dispose	배치하다	\N	\N	\N	toefl	하
4026	dissenting	반대하는	\N	\N	\N	toefl	하
4029	distinguished	유명한	\N	\N	\N	toefl	하
4030	distraction	N. 1. 기분 전환	\N	\N	\N	toefl	하
4032	diurnal	a. 낮의	\N	\N	\N	toefl	하
4033	divergently	갈라지게	\N	\N	\N	toefl	기타
4038	reveal	드러내다	\N	\N	\N	toefl	하
4043	domesticate	길들이다	\N	\N	\N	toefl	중
4050	sullen	성질 더러운	\N	\N	\N	toefl	하
4051	dowdy	단정치 못한	\N	\N	\N	toefl	중
4052	downpouring	억수같이 비가 오는	\N	\N	\N	toefl	기타
4057	drab	a. 단조로운 / 생기 없는	\N	\N	\N	toefl	하
4060	drag	끌다	\N	\N	\N	toefl	하
4065	dread	공포	\N	\N	\N	toefl	하
4079	earmark	(자금	\N	\N	\N	toefl	중
4083	eccentricity	기이한 행동	\N	\N	\N	toefl	하
4084	ecological	생태계의	\N	\N	\N	toefl	하
4088	eerie	무시무시한	\N	\N	\N	toefl	하
4090	egregious	지독한	\N	\N	\N	toefl	하
4091	eject	~을 쫓아내다	\N	\N	\N	toefl	하
4111	embryonic	초기 상태의	\N	\N	\N	toefl	하
4117	emission	배기가스	\N	\N	\N	toefl	하
4118	emit	방출하다	\N	\N	\N	toefl	하
4124	encroachment	잠식	\N	\N	\N	toefl	하
4125	endemic	고유한	\N	\N	\N	toefl	하
4127	enforce	시행하다	\N	\N	\N	toefl	하
4128	engaging	'매력적인	\N	\N	\N	toefl	하
4132	enhance	향상시키다	\N	\N	\N	toefl	하
4133	enigma	N. 수수께끼	\N	\N	\N	toefl	하
4134	enigmatic	수수께끼 같은	\N	\N	\N	toefl	하
4136	enmesh	v. (곤경 등에)빠뜨리다	\N	\N	\N	toefl	기타
4141	ensuring	뒤이은	\N	\N	\N	toefl	하
4145	entrepreneur	사업가	\N	\N	\N	toefl	하
4146	enterpriser	기업가	\N	\N	\N	toefl	기타
4148	enumerate	v. 열거하다	\N	\N	\N	toefl	하
4150	epitomize	요약하다; 전형이 되다	\N	\N	\N	toefl	중
4154	equilibrium	평형상태	\N	\N	\N	toefl	하
4155	equitable	공정한	\N	\N	\N	toefl	하
4160	eradicate	근절하다	\N	\N	\N	toefl	하
4162	erroneous	잘못된	\N	\N	\N	toefl	하
4166	eschew	피하다	\N	\N	\N	toefl	중
4167	shun	v. 피하다	\N	\N	\N	toefl	하
4175	칭송	 찬양	\N	\N	\N	toefl	기타
4177	evacuate	대피시키다	\N	\N	\N	toefl	하
4178	evaporate	증발하다	\N	\N	\N	toefl	하
4179	evince	분명히 나타내다	\N	\N	\N	toefl	중
4181	evolve	진화하다	\N	\N	\N	toefl	하
4186	excced	Vt. 1. 능가하다	\N	\N	\N	toefl	기타
4554	infectious	전염되는	\N	\N	\N	toefl	하
3831	counterfeit	위조의	\N	\N	\N	toefl	하
4089	efface	지우다	\N	\N	\N	toefl	중
3835	cunning	교활한; 교활함	\N	\N	\N	toefl	하
4049	dour	시무룩한	\N	\N	\N	toefl	중
3836	crash	충돌하다	\N	\N	\N	toefl	하
4183	aggravate	악화시키다	\N	\N	\N	toefl	하
4194	exhort	강요하다	\N	\N	\N	toefl	중
4197	exonerate	용서하다	\N	\N	\N	toefl	중
4198	exorbitant	엄청난	\N	\N	\N	toefl	하
4202	explicit	명백한	\N	\N	\N	toefl	하
4204	explosive	폭발적인	\N	\N	\N	toefl	하
4207	exposure	노출	\N	\N	\N	toefl	하
4211	extempore	즉흥적인	\N	\N	\N	toefl	중
4213	extensive	광범위한	\N	\N	\N	toefl	하
4215	extinct	멸종된	\N	\N	\N	toefl	하
4216	extiction	멸종	\N	\N	\N	toefl	기타
4220	extravagance	사치	\N	\N	\N	toefl	하
4223	fable	우화	\N	\N	\N	toefl	하
4229	facet	측면	\N	\N	\N	toefl	하
4236	far-fetched	믿기지 않는	\N	\N	\N	toefl	기타
4239	fascinating	매혹적인	\N	\N	\N	toefl	하
4240	fascination	매혹	\N	\N	\N	toefl	하
4241	fashionable	유행하는	\N	\N	\N	toefl	하
4242	fashion-conscious	유행에 민감한	\N	\N	\N	toefl	기타
4243	fatal	치명적인	\N	\N	\N	toefl	하
4246	fatuous	어리석은	\N	\N	\N	toefl	중
4249	feasible	실행 가능한	\N	\N	\N	toefl	하
4253	weak	약한	\N	\N	\N	toefl	하
4256	savage	야만적인	\N	\N	\N	toefl	하
4257	fertile	비옥한	\N	\N	\N	toefl	하
4265	firsthand	직접	\N	\N	\N	toefl	하
4267	fix	수리하다	\N	\N	\N	toefl	하
4269	flagship	기함	\N	\N	\N	toefl	하
4271	flank	옆구리	\N	\N	\N	toefl	하
4274	flattery	아첨	\N	\N	\N	toefl	하
4276	fledgling	풋나기(의)	\N	\N	\N	toefl	하
4277	flee	도망치다	\N	\N	\N	toefl	하
4279	flimsy	약한	\N	\N	\N	toefl	하
4284	vary	다양하다	\N	\N	\N	toefl	하
4287	foliage	나뭇잎	\N	\N	\N	toefl	하
4291	forage	(식량) 찾아 헤매다	\N	\N	\N	toefl	하
4293	foreboding	불길한 예감	\N	\N	\N	toefl	중
4295	foresee	예견[예지]하다	\N	\N	\N	toefl	하
4299	formidable	겁먹게 하는	\N	\N	\N	toefl	하
4303	courage	용기	\N	\N	\N	toefl	하
4304	fortuitous	우연한	\N	\N	\N	toefl	중
4305	fortuitously	우연히	\N	\N	\N	toefl	중
4311	quarrel	말다툼	\N	\N	\N	toefl	하
4312	fragile	깨지기 쉬운	\N	\N	\N	toefl	하
4315	frail	약한	\N	\N	\N	toefl	하
4316	frank	솔직한	\N	\N	\N	toefl	하
4325	friction	마찰	\N	\N	\N	toefl	하
4327	frivolous	가벼운	\N	\N	\N	toefl	하
4331	fruition	결실	\N	\N	\N	toefl	하
4333	frustration	좌절	\N	\N	\N	toefl	하
4336	2. 덧없는	 일시적인	\N	\N	\N	toefl	기타
4337	furious	성난	\N	\N	\N	toefl	하
4344	gallant	용감한; 정중한	\N	\N	\N	toefl	하
4346	garner	얻다	\N	\N	\N	toefl	하
4352	gelid	얼음같은	\N	\N	\N	toefl	기타
4353	gem	보석	\N	\N	\N	toefl	하
4354	generic	일반적인	\N	\N	\N	toefl	하
4355	generous	관대한	\N	\N	\N	toefl	하
4356	genial	친절하고 쾌활한	\N	\N	\N	toefl	하
4360	germinate	싹트다	\N	\N	\N	toefl	중
4364	glamorize	미화하다	\N	\N	\N	toefl	중
4369	gorgeous	화려한	\N	\N	\N	toefl	하
4373	gratifying	만족스러운	\N	\N	\N	toefl	하
4374	gratis	무료로	\N	\N	\N	toefl	하
4375	gratuitous	무료의	\N	\N	\N	toefl	하
4382	ground	기초	\N	\N	\N	toefl	하
4386	grueling	몹시 힘든	\N	\N	\N	toefl	하
4387	gruesome	소름끼치는	\N	\N	\N	toefl	하
4389	guts	용기	\N	\N	\N	toefl	하
4392	hail	불러 세우다	\N	\N	\N	toefl	하
4394	hallow	거룩히 여기다	\N	\N	\N	toefl	중
4401	hangover	n. 숙취	\N	\N	\N	toefl	하
4405	harass	~을 괴롭히다	\N	\N	\N	toefl	하
4406	hardship	고난	\N	\N	\N	toefl	하
4408	harry	괴롭히다	\N	\N	\N	toefl	하
4411	haughtiness	건방짐	\N	\N	\N	toefl	중
4415	headstrong	완고한	\N	\N	\N	toefl	중
4424	genetics	유전학	\N	\N	\N	toefl	하
4425	heresy	이단	\N	\N	\N	toefl	하
4431	hiatus	중단	\N	\N	\N	toefl	하
4439	hole	구멍	\N	\N	\N	toefl	하
4442	horrid	무서운	\N	\N	\N	toefl	하
4446	howling	짖는	\N	\N	\N	toefl	하
4451	humiliate	굴욕감을 주다	\N	\N	\N	toefl	하
4452	hush	고요함	\N	\N	\N	toefl	하
4464	illuminate	밝게 비추다	\N	\N	\N	toefl	하
4465	illustration	설명	\N	\N	\N	toefl	하
4466	imbibe	(술	\N	\N	\N	toefl	중
4472	imminent	임박한	\N	\N	\N	toefl	하
4473	immune	면역의; 면제된	\N	\N	\N	toefl	하
4476	impact	충격	\N	\N	\N	toefl	하
4477	impair	손상시키다	\N	\N	\N	toefl	하
4480	impassioned	열정적인	\N	\N	\N	toefl	하
4482	impatient	A. 1. 성급한	\N	\N	\N	toefl	하
4486	impediment	방해	\N	\N	\N	toefl	하
4493	imperil	위태롭게 하다	\N	\N	\N	toefl	중
4494	imperturbable	차분한	\N	\N	\N	toefl	중
4495	impervious	불침투성의; 영향을 받지 않는	\N	\N	\N	toefl	하
4499	implacable	화해할 수 없는	\N	\N	\N	toefl	중
4500	implausible	믿기 어려운	\N	\N	\N	toefl	하
4501	implement	실행하다	\N	\N	\N	toefl	하
4502	implode	내파하다	\N	\N	\N	toefl	하
4509	improvise	즉흥 연주를 하다	\N	\N	\N	toefl	하
4513	impulsive	충동적인	\N	\N	\N	toefl	하
4516	inaccessible	접근하기 어려운	\N	\N	\N	toefl	하
4517	inactive	활동하지 않는	\N	\N	\N	toefl	하
4555	infer	추론하다	\N	\N	\N	toefl	하
4164	erudite	A. 학식 있는	\N	\N	\N	toefl	하
4170	estate	소유지	\N	\N	\N	toefl	하
4176	accolade	 panegyric	\N	\N	\N	toefl	하
4230	faint	희미한	\N	\N	\N	toefl	하
4173	etymologist	어원학자	\N	\N	\N	toefl	기타
4184	exaggeration	과장된 표현	\N	\N	\N	toefl	하
4185	exasperate	몹시 화나게 하다	\N	\N	\N	toefl	중
4189	exclusively	독점적으로	\N	\N	\N	toefl	하
4190	excretion	n. 배설	\N	\N	\N	toefl	하
4191	exhaustive	포괄적인; 철저한	\N	\N	\N	toefl	하
4192	exhaustively	ad. 철저하게	\N	\N	\N	toefl	중
4196	exhume	발굴하다	\N	\N	\N	toefl	중
4199	exotic	이국적인	\N	\N	\N	toefl	하
4203	exploit	위업	\N	\N	\N	toefl	하
4206	expostulation	충고	\N	\N	\N	toefl	중
4208	expound	상세히 설명하다	\N	\N	\N	toefl	중
4217	extirpate	제거하다	\N	\N	\N	toefl	중
4221	extravagant	낭비하는	\N	\N	\N	toefl	하
4232	fallacious	잘못된	\N	\N	\N	toefl	중
4233	fallout	n. 방사능 낙진	\N	\N	\N	toefl	하
4237	far-reaching	광범위한	\N	\N	\N	toefl	기타
4247	favorite	가장 좋아하는	\N	\N	\N	toefl	하
4248	adored	좋아하다	\N	\N	\N	toefl	하
4251	banquet	연회	\N	\N	\N	toefl	하
4252	feeble	아주 약한	\N	\N	\N	toefl	하
4259	fickle	변덕스러운	\N	\N	\N	toefl	하
4260	fictitious	가짜의	\N	\N	\N	toefl	하
4263	finite	한정된	\N	\N	\N	toefl	하
4266	fit		\N	\N	\N	toefl	하
4268	flagrant	극악한	\N	\N	\N	toefl	하
4270	flamboyant	눈부신	\N	\N	\N	toefl	하
4281	flippant	경박한	\N	\N	\N	toefl	중
4285	fluorescent	형광성의	\N	\N	\N	toefl	하
4289	folly	어리석음	\N	\N	\N	toefl	하
4294	forerunner	선구자	\N	\N	\N	toefl	하
4297	formal	공식적인	\N	\N	\N	toefl	하
4300	forsake	저버리다	\N	\N	\N	toefl	하
4301	fortify	강화하다	\N	\N	\N	toefl	하
4308	founder	설립자	\N	\N	\N	toefl	하
4309	fowl	가금	\N	\N	\N	toefl	하
4310	fracas	싸움	\N	\N	\N	toefl	중
4313	breakable	깨지기 쉬운	\N	\N	\N	toefl	중
4317	fraternal	형제의	\N	\N	\N	toefl	하
4320	freaked	화난	\N	\N	\N	toefl	하
4321	frenzied	열광적인	\N	\N	\N	toefl	하
4326	frigid	몹시 추운	\N	\N	\N	toefl	하
4328	frolic	장난치다	\N	\N	\N	toefl	하
4329	frown	눈살을 찌푸리다	\N	\N	\N	toefl	하
4335	A. 1. 도망하는	 망명의	\N	\N	\N	toefl	기타
4338	furor	격렬한 감격	\N	\N	\N	toefl	중
4342	fussy	까다로운	\N	\N	\N	toefl	하
4348	gastronomy	'미식법	\N	\N	\N	toefl	하
4350	gauge	측정하다	\N	\N	\N	toefl	하
4357	genocidal	대량(집단)학살의	\N	\N	\N	toefl	하
4358	genuine	진짜의	\N	\N	\N	toefl	하
4366	gluttony	대식	\N	\N	\N	toefl	중
4367	goad	자극하다	\N	\N	\N	toefl	하
4368	gorge	협곡	\N	\N	\N	toefl	하
4370	grapple	움켜쥐다	\N	\N	\N	toefl	하
4376	green light	허가	\N	\N	\N	toefl	기타
4379	grievance	N. 불만	\N	\N	\N	toefl	하
4383	grown-up	성인	\N	\N	\N	toefl	기타
4391	haggard	야윈	\N	\N	\N	toefl	하
4397	obstruct	막다	\N	\N	\N	toefl	하
4398	handout	지원금	\N	\N	\N	toefl	하
4399	handy	유용한	\N	\N	\N	toefl	하
4400	hanger	격납고	\N	\N	\N	toefl	하
4404	hapless	불운한	\N	\N	\N	toefl	하
4417	odious	 wicked	\N	\N	\N	toefl	하
4418	helm	n. (the ~) 지배	\N	\N	\N	toefl	하
4422	2. 상속권에 의한	 세습의	\N	\N	\N	toefl	기타
4433	hideous	무시무시한	\N	\N	\N	toefl	하
4169	establish	설립하다	\N	\N	\N	toefl	하
4434	hierarchy	계급	\N	\N	\N	toefl	하
4435	hilarious	유쾌한	\N	\N	\N	toefl	하
4437	hinder	Vt. 방해하다	\N	\N	\N	toefl	하
4438	hoarse	(목소리가) 거친	\N	\N	\N	toefl	하
4445	hostile	적대적인	\N	\N	\N	toefl	하
4450	humid	습기 있는	\N	\N	\N	toefl	하
4453	hyperbole	과장된 말	\N	\N	\N	toefl	하
4454	hypocrite	N. 위선자	\N	\N	\N	toefl	하
4455	hypodermic	a. 피하(皮下)의	\N	\N	\N	toefl	중
4459	ignominious	불명예스러운	\N	\N	\N	toefl	중
4460	ignore	무시하다	\N	\N	\N	toefl	하
4467	imitation	모방	\N	\N	\N	toefl	하
4468	immaculate	A. 1. 티없는	\N	\N	\N	toefl	하
4474	immunity	면역성	\N	\N	\N	toefl	하
4475	immutable	변경할 수 없는	\N	\N	\N	toefl	하
4479	impasse	궁지	\N	\N	\N	toefl	하
4487	impelling	추진하는	\N	\N	\N	toefl	중
4488	impending	임박한	\N	\N	\N	toefl	하
4491	2. 미세한	 경미한	\N	\N	\N	toefl	기타
4492	imperceptibly	감지 할수 없게	\N	\N	\N	toefl	중
4496	impetuous	성급한	\N	\N	\N	toefl	중
4498	impiety	경건하지 않음	\N	\N	\N	toefl	중
4506	impoverish	가난하게 하다	\N	\N	\N	toefl	중
4508	impromptu	즉흥적인; 즉흥연주	\N	\N	\N	toefl	하
4514	impute a to b	A를 B 탓으로 하다 (= ascribe A to B)	\N	\N	\N	toefl	기타
4518	inadequate	부적당한	\N	\N	\N	toefl	하
4520	inadvertently	무심코	\N	\N	\N	toefl	하
4525	incidence	발생 정도	\N	\N	\N	toefl	하
4528	inconceivable	상상도 못할	\N	\N	\N	toefl	하
4529	inconspicuous	눈에 띄지 않는	\N	\N	\N	toefl	중
4531	incredible	믿어지지 않는	\N	\N	\N	toefl	하
4532	incumbent	현직의; (의무의 일부로) 필요한 (해야하는)	\N	\N	\N	toefl	하
4540	indigenous	지역 고유의	\N	\N	\N	toefl	하
4541	indigent	가난한	\N	\N	\N	toefl	하
4545	indolence	게으름	\N	\N	\N	toefl	중
4547	induce	유도하다	\N	\N	\N	toefl	하
4168	essential	필수적인	\N	\N	\N	toefl	하
4172	estimate	평가하다	\N	\N	\N	toefl	하
4388	gullible	잘 속는	\N	\N	\N	toefl	하
4421	hereditary	A. 1. 유전성의	\N	\N	\N	toefl	하
4423	heredity	유전	\N	\N	\N	toefl	하
4428	hesitate	주저하다	\N	\N	\N	toefl	하
4429	heterogeneous	잡다한	\N	\N	\N	toefl	하
4430	heyday	N. 한창(때)	\N	\N	\N	toefl	하
4432	hiccup	딸꾹질/ 와해	\N	\N	\N	toefl	하
4436	hind	뒤쪽의	\N	\N	\N	toefl	하
4440	homogeneous	동종의	\N	\N	\N	toefl	하
4443	hospitable	친절한	\N	\N	\N	toefl	하
4444	hospitality	환대	\N	\N	\N	toefl	하
4447	hub	중심지	\N	\N	\N	toefl	하
4448	hubris	지나친 자신감	\N	\N	\N	toefl	하
4456	identical	동일한	\N	\N	\N	toefl	하
4457	idiosyncrasy	특유의 성질	\N	\N	\N	toefl	중
4462	illicit	A. .불법[부정]의; 무허가의	\N	\N	\N	toefl	하
4463	illiterate	문맹의	\N	\N	\N	toefl	하
4470	immaterial	중요하지 않는	\N	\N	\N	toefl	하
4244	fathom	헤아리다; 수심을 재다	\N	\N	\N	toefl	하
4471	immediate	직접의	\N	\N	\N	toefl	하
4478	impartial	공정한	\N	\N	\N	toefl	하
4481	impassive	무표정한	\N	\N	\N	toefl	중
4484	impeccable	결함없는	\N	\N	\N	toefl	하
4485	impede	저해하다	\N	\N	\N	toefl	하
4497	impetus	추진력	\N	\N	\N	toefl	하
4503	imply	암시하다	\N	\N	\N	toefl	하
4504	impose	부과하다	\N	\N	\N	toefl	하
4505	impotent	' 무기력한	\N	\N	\N	toefl	하
4511	impudent	무례한	\N	\N	\N	toefl	중
4521	inappropriate	부적절한	\N	\N	\N	toefl	하
4523	incapacitate	v.무능력[무력	\N	\N	\N	toefl	중
4524	inchoate	초기단계의	\N	\N	\N	toefl	중
4527	incompetent	무능한	\N	\N	\N	toefl	하
4530	incontrovertible	논쟁의 여지가 없는	\N	\N	\N	toefl	중
4537	indict	기소하다	\N	\N	\N	toefl	중
4538	indifferent	A. 1. 무관심한	\N	\N	\N	toefl	하
4542	indignation	분노	\N	\N	\N	toefl	하
4543	indiscriminate	무차별의	\N	\N	\N	toefl	하
4544	indispensable	필수불가결의	\N	\N	\N	toefl	하
4549	industrious	근면한	\N	\N	\N	toefl	하
4550	inept	서투른	\N	\N	\N	toefl	하
4556	infest	들끓다	\N	\N	\N	toefl	중
4557	infidelity	간통	\N	\N	\N	toefl	하
4558	infinitesimal	극소의 	\N	\N	\N	toefl	하
4559	inflexible	마음을 바꾸지 않는 융통성이 없는	\N	\N	\N	toefl	하
4562	infringe	위반하다	\N	\N	\N	toefl	하
4566	ingenuity	독창성	\N	\N	\N	toefl	하
4569	inherent	타고난	\N	\N	\N	toefl	하
4188	excel	뛰어나다	\N	\N	\N	toefl	하
4193	exhilarating	기분을 돋우는	\N	\N	\N	toefl	하
4200	expeditiously	신속하게	\N	\N	\N	toefl	하
4201	expire	만기가 되다	\N	\N	\N	toefl	하
4205	exponent	주창자	\N	\N	\N	toefl	하
4210	exquisite	정교한	\N	\N	\N	toefl	하
4214	exterminator	근절자	\N	\N	\N	toefl	중
4218	extract	추출하다	\N	\N	\N	toefl	하
4222	extricate	(위험	\N	\N	\N	toefl	중
4226	face	얼굴	\N	\N	\N	toefl	하
4227	confront	직면하다	\N	\N	\N	toefl	하
4228	facility	시설	\N	\N	\N	toefl	하
4231	fair	박람회	\N	\N	\N	toefl	하
4235	fancy	공상	\N	\N	\N	toefl	하
4238	fascinate	매혹하다	\N	\N	\N	toefl	중
4245	fatigue	피로	\N	\N	\N	toefl	하
4250	feast	연회	\N	\N	\N	toefl	하
4255	ferocious	사나운	\N	\N	\N	toefl	하
4258	fiat	명령	\N	\N	\N	toefl	하
4262	dirty	더러운	\N	\N	\N	toefl	하
4264	limited	한정된	\N	\N	\N	toefl	하
4407	harness	이용하다	\N	\N	\N	toefl	하
4272	flat	평평한	\N	\N	\N	toefl	하
4409	harsh	거친	\N	\N	\N	toefl	하
4410	harvest	수확	\N	\N	\N	toefl	하
4413	hazard	위험	\N	\N	\N	toefl	하
4416	heinous	(행동) 극악한	\N	\N	\N	toefl	하
4273	flatter	아첨하다	\N	\N	\N	toefl	하
4275	flaw	흠	\N	\N	\N	toefl	하
4283	fluctuate	변동하다	\N	\N	\N	toefl	하
4286	flush	(얼굴을) 붉히다	\N	\N	\N	toefl	하
4288	leaves	잎들	\N	\N	\N	toefl	하
4292	forbidden	금지된	\N	\N	\N	toefl	하
4296	forge	위조하다	\N	\N	\N	toefl	하
4298	formerly	이전에	\N	\N	\N	toefl	하
4302	fortitude	용기	\N	\N	\N	toefl	하
4307	found	설립하다	\N	\N	\N	toefl	하
4314	fragmentary	단편적인	\N	\N	\N	toefl	하
4318	fratricide	형제살해	\N	\N	\N	toefl	중
4319	fraught	가득한	\N	\N	\N	toefl	하
4322	frequent	자주 일어나는	\N	\N	\N	toefl	하
4323	fret	초조해 하다	\N	\N	\N	toefl	하
4330	frugality	절약	\N	\N	\N	toefl	중
4334	fugitive	N. 도망자	\N	\N	\N	toefl	하
4340	furtively	ad. 남몰래	\N	\N	\N	toefl	중
4341	fusion	융합	\N	\N	\N	toefl	하
4343	futile	쓸모없는	\N	\N	\N	toefl	하
4347	garrulous	수다스러운	\N	\N	\N	toefl	중
4349	gateway	통로	\N	\N	\N	toefl	하
4361	sprout	싹	\N	\N	\N	toefl	하
4362	gingerly	신중하게	\N	\N	\N	toefl	중
4365	gloomy	어두운	\N	\N	\N	toefl	하
4371	grasp	붙잡다	\N	\N	\N	toefl	하
4372	gratified	만족한	\N	\N	\N	toefl	하
4377	greet	인사하다	\N	\N	\N	toefl	하
4380	grim	엄격한	\N	\N	\N	toefl	하
4381	grimly	엄하게	\N	\N	\N	toefl	중
4384	grudge	원한	\N	\N	\N	toefl	하
4385	grudgingly	ad. 마지못해	\N	\N	\N	toefl	중
4390	habitat	서식지	\N	\N	\N	toefl	하
4396	hamper	막다	\N	\N	\N	toefl	하
4402	haphazard	아무렇게나	\N	\N	\N	toefl	하
4419	be at the helm of	~의 실권을 잡다	\N	\N	\N	toefl	기타
4420	henceforth	지금부터는	\N	\N	\N	toefl	하
4536	indelibly	지울 수 없게	\N	\N	\N	toefl	중
4546	indolent	게으른	\N	\N	\N	toefl	중
4548	indulge	빠지다	\N	\N	\N	toefl	하
4552	inextricable	빠져나갈 수 없는	\N	\N	\N	toefl	중
4553	infamous	A. 악명 높은	\N	\N	\N	toefl	하
4560	influx	유입	\N	\N	\N	toefl	하
4563	infuriate	몹시 화나게 하다	\N	\N	\N	toefl	중
4564	ingenious	독창적인	\N	\N	\N	toefl	하
4567	ingratiating	알랑거리는	\N	\N	\N	toefl	중
4568	ingredient	재료	\N	\N	\N	toefl	하
4571	inhibit	억제하다	\N	\N	\N	toefl	하
4574	inimitable	독특한	\N	\N	\N	toefl	하
4578	injurious	해로운	\N	\N	\N	toefl	하
4584	inscribe	새기다	\N	\N	\N	toefl	중
4585	insert	삽입하다	\N	\N	\N	toefl	하
4589	insipid	맛없는; 재미없는	\N	\N	\N	toefl	중
4593	installment	n. 할부	\N	\N	\N	toefl	하
4596	institute	연구소	\N	\N	\N	toefl	하
4600	intact	손상되지 않은	\N	\N	\N	toefl	하
4604	interim	임시의	\N	\N	\N	toefl	하
4612	intractable	유순하지 않는	\N	\N	\N	toefl	하
4615	intricate	복잡한	\N	\N	\N	toefl	하
4617	intrigued	흥미를 느끼는	\N	\N	\N	toefl	하
4620	intrude	침범하다	\N	\N	\N	toefl	하
4621	inundate	물에 잠기게 하다	\N	\N	\N	toefl	중
4631	invincible	이길 수 없는	\N	\N	\N	toefl	하
4634	irksome	짜증나는	\N	\N	\N	toefl	중
4638	irritable	화를 잘 내는	\N	\N	\N	toefl	하
4639	irritant	자극물	\N	\N	\N	toefl	하
4646	javelin	던지는 창	\N	\N	\N	toefl	하
4649	jostle	난폭하게 밀다	\N	\N	\N	toefl	중
4654	creative juice	창의력	\N	\N	\N	toefl	기타
4655	keen	열렬한	\N	\N	\N	toefl	하
4660	dipsomaniac	알콜중독자	\N	\N	\N	toefl	기타
4661	pyromaniac	방화광	\N	\N	\N	toefl	중
4667	lamentable	슬픈	\N	\N	\N	toefl	중
4670	lanky	마르고 키 큰	\N	\N	\N	toefl	중
4673	lateral	옆의	\N	\N	\N	toefl	하
4674	laud	칭찬하다	\N	\N	\N	toefl	중
4679	layoff	일시 해고	\N	\N	\N	toefl	하
4681	leap-frogging	목마 넘기를 하는	\N	\N	\N	toefl	기타
4689	lethargically	혼수상태로	\N	\N	\N	toefl	기타
4690	level	수준	\N	\N	\N	toefl	하
4696	liabilities	부채	\N	\N	\N	toefl	하
4700	licentious	음란한	\N	\N	\N	toefl	중
4703	liquidate	v. (회사를) 정리하다	\N	\N	\N	toefl	하
4707	loath	~하기를 꺼리는	\N	\N	\N	toefl	중
4711	loophole	(법률 등의) 허점	\N	\N	\N	toefl	하
4716	lucrative	a. 수익성 있는	\N	\N	\N	toefl	하
4717	ludicrous	웃기는	\N	\N	\N	toefl	하
4718	lukewarm	(물) 미지근한; 열의없는	\N	\N	\N	toefl	하
4722	maelstrom	큰 소용돌이	\N	\N	\N	toefl	하
4723	magnitude	정도	\N	\N	\N	toefl	하
4724	maintain	유지하다	\N	\N	\N	toefl	하
4733	악의 있는	 해로운	\N	\N	\N	toefl	기타
4734	malnourished	영양실조의	\N	\N	\N	toefl	하
4735	mandate	요구하다	\N	\N	\N	toefl	하
4743	maul	상처를 입히다	\N	\N	\N	toefl	하
4747	mean	의미하다	\N	\N	\N	toefl	하
4748	mediocre	보통의	\N	\N	\N	toefl	하
4749	meditate	명상하다	\N	\N	\N	toefl	하
4750	mediate	중재하다	\N	\N	\N	toefl	하
4754	humble	겸손한	\N	\N	\N	toefl	하
4762	merge	합병하다	\N	\N	\N	toefl	하
4765	meticulous	꼼꼼한	\N	\N	\N	toefl	하
4766	mettle	용기	\N	\N	\N	toefl	하
4769	milestone	이정표	\N	\N	\N	toefl	하
4774	minuscule	아주 작은	\N	\N	\N	toefl	중
4775	minute	미세한	\N	\N	\N	toefl	하
4783	misnomer	잘못된 명칭	\N	\N	\N	toefl	하
4784	mite	약간	\N	\N	\N	toefl	하
4785	mock	조롱하다	\N	\N	\N	toefl	하
4787	modify	변경하다	\N	\N	\N	toefl	하
4790	mold	만들다	\N	\N	\N	toefl	하
4791	moldiness	곰팡이가 핀 상태	\N	\N	\N	toefl	기타
4805	muggy	무더운	\N	\N	\N	toefl	중
4810	muse	명상하다	\N	\N	\N	toefl	하
4814	mutiny	반항	\N	\N	\N	toefl	하
4823	nebulous	흐릿한	\N	\N	\N	toefl	중
4824	needle	바늘	\N	\N	\N	toefl	하
4825	nefarious	사악한	\N	\N	\N	toefl	하
4826	negate	부정하다	\N	\N	\N	toefl	하
4833	nimble	빠른	\N	\N	\N	toefl	하
4834	nimbleness	민첩함	\N	\N	\N	toefl	상
4835	nocturnal	밤의	\N	\N	\N	toefl	하
4840	nonpartisan	객관적인	\N	\N	\N	toefl	하
4841	nosy	참견하기 좋아하는	\N	\N	\N	toefl	중
4845	novelty	새로움	\N	\N	\N	toefl	하
4848	nullify	무효로 하다	\N	\N	\N	toefl	하
4850	nutty	미친	\N	\N	\N	toefl	하
4852	obese	뚱뚱한	\N	\N	\N	toefl	하
4856	obligation	의무	\N	\N	\N	toefl	하
4861	obnoxious	아주 싫은	\N	\N	\N	toefl	하
4863	obscurity	애매함	\N	\N	\N	toefl	하
4873	odorous	(a) 냄새가 나는	\N	\N	\N	toefl	중
4874	offensive	공격적인	\N	\N	\N	toefl	하
4878	omniscient	전지의	\N	\N	\N	toefl	하
4882	ophthalmologist	n. 안과의사	\N	\N	\N	toefl	하
4885	pediatrician	n. 소아과 의사	\N	\N	\N	toefl	하
4888	gynecologist	부인과 의사	\N	\N	\N	toefl	하
4889	psychiatrist	n. 정신과 의사	\N	\N	\N	toefl	하
4893	urologist	비뇨기과 의사	\N	\N	\N	toefl	중
4894	podiatrist	족병 치료학자	\N	\N	\N	toefl	하
4900	opulence	부유	\N	\N	\N	toefl	하
4901	opulent	부유한	\N	\N	\N	toefl	하
4902	orbit	궤도	\N	\N	\N	toefl	하
4534	indefinitely	무기한으로	\N	\N	\N	toefl	하
4535	indelible	지울 수 없는; 잊을 수 없는	\N	\N	\N	toefl	하
4801	motivation	동기부여	\N	\N	\N	toefl	하
4575	initial	처음의	\N	\N	\N	toefl	하
4582	inoperable	수술 불가능한	\N	\N	\N	toefl	하
4583	insatiable	만족할 줄 모르는	\N	\N	\N	toefl	하
4586	insight	통찰력	\N	\N	\N	toefl	하
4590	insolent	무례한	\N	\N	\N	toefl	중
4591	insolvency	지불불능	\N	\N	\N	toefl	하
4594	instantaneous	순간적인	\N	\N	\N	toefl	하
4597	institution	제도	\N	\N	\N	toefl	하
4602	intercede	중재하다	\N	\N	\N	toefl	중
4608	intertwine	뒤얽히다	\N	\N	\N	toefl	중
4609	intimate	친밀한	\N	\N	\N	toefl	하
4610	intimidate	위협하다	\N	\N	\N	toefl	하
4616	intrigue	음모를 꾸미다	\N	\N	\N	toefl	하
4619	intrinsic	본질적인	\N	\N	\N	toefl	하
4622	inure	(어려움 따위에) 익숙하게 하다	\N	\N	\N	toefl	중
4623	be inured to	~에 익숙해지다	\N	\N	\N	toefl	기타
4626	invaild	무효한	\N	\N	\N	toefl	기타
4627	invaluable	매우 귀중한	\N	\N	\N	toefl	하
4633	involved	관계된	\N	\N	\N	toefl	하
4637	irrevocable	돌이킬 수 없는	\N	\N	\N	toefl	하
4641	irritating	짜증나는	\N	\N	\N	toefl	하
4642	iterate	되풀이하다	\N	\N	\N	toefl	하
4643	itinerary	n. 여행 일정	\N	\N	\N	toefl	하
4647	jeopardize	위태롭게 하다	\N	\N	\N	toefl	하
4650	judicial	사법의	\N	\N	\N	toefl	하
4653	junk	폐물	\N	\N	\N	toefl	하
4659	kleptomaniac	병적 도벽이 있는 사람	\N	\N	\N	toefl	중
4662	nymphomaniac	음란증	\N	\N	\N	toefl	중
4665	laconic	간결한	\N	\N	\N	toefl	중
4666	Laissez-faire	자유방임주의	\N	\N	\N	toefl	기타
4668	land	착륙하다	\N	\N	\N	toefl	하
4671	lassitude	피곤	\N	\N	\N	toefl	중
4672	latent	잠재적인	\N	\N	\N	toefl	하
4675	laudatory	칭찬하는	\N	\N	\N	toefl	중
4680	leading	가장 중요한	\N	\N	\N	toefl	하
4685	leniently	인자하게	\N	\N	\N	toefl	중
4686	lethal	A. 매우 위험한	\N	\N	\N	toefl	하
4687	lethal dose	치사량	\N	\N	\N	toefl	기타
4691	level headed	신중한	\N	\N	\N	toefl	기타
4693	impose	부과하다	\N	\N	\N	toefl	하
4694	lewd	음탕한	\N	\N	\N	toefl	하
4701	likeness	유사성	\N	\N	\N	toefl	하
4706	load	짐을 싣다	\N	\N	\N	toefl	하
4708	loathe	vt.몹시 싫어하다;질색하다(dislike	\N	\N	\N	toefl	하
4712	lower	낮추다	\N	\N	\N	toefl	하
4713	lubricant	윤활유	\N	\N	\N	toefl	하
4720	lunatic	정신이상의	\N	\N	\N	toefl	하
4721	insane	제정신이 아닌	\N	\N	\N	toefl	하
4726	N. 미봉책	 일시적인 방편	\N	\N	\N	toefl	기타
4727	malady	질병	\N	\N	\N	toefl	하
4731	malicious	악의(적의)있는	\N	\N	\N	toefl	하
4737	manifest	뚜렷한	\N	\N	\N	toefl	하
4738	manipulate	조종하다	\N	\N	\N	toefl	하
4763	merit	장점	\N	\N	\N	toefl	하
4764	mercurial	변덕스러운	\N	\N	\N	toefl	하
4770	milk	돈 정보 짜내다 	\N	\N	\N	toefl	하
4771	millennia	수 천년의 기간	\N	\N	\N	toefl	하
4778	miser	구두쇠	\N	\N	\N	toefl	하
4780	miserable	비참한	\N	\N	\N	toefl	하
4786	modest	겸손한	\N	\N	\N	toefl	하
4789	moisture	습기	\N	\N	\N	toefl	하
4792	momentous	중대한	\N	\N	\N	toefl	하
4793	momentary	순간의	\N	\N	\N	toefl	하
4794	monolingual	하나의 언어를 사용하는	\N	\N	\N	toefl	중
4795	monotonous	단조로운	\N	\N	\N	toefl	하
4796	monumental	기념비적인	\N	\N	\N	toefl	하
4800	mortifying	굴욕적인	\N	\N	\N	toefl	중
4808	mumble	중얼거리다	\N	\N	\N	toefl	중
4809	mundane	평범한	\N	\N	\N	toefl	하
4813	mutual	서로의	\N	\N	\N	toefl	하
4816	myth	신화	\N	\N	\N	toefl	하
4821	nascent	초기의	\N	\N	\N	toefl	하
4830	nepotism	친족등용	\N	\N	\N	toefl	중
4831	nerve	신경	\N	\N	\N	toefl	하
4832	niggardly	인색한	\N	\N	\N	toefl	중
4839	no-nonsense	장난을 용납하지 않는	\N	\N	\N	toefl	기타
4843	notify	~에게 통지하다	\N	\N	\N	toefl	하
4846	novice	초심자	\N	\N	\N	toefl	하
4847	noxious	유해한	\N	\N	\N	toefl	하
4853	obesity	N. 비만	\N	\N	\N	toefl	하
4859	oblivion	망각	\N	\N	\N	toefl	하
4860	oblivious to	의식하지 않은	\N	\N	\N	toefl	기타
4864	obsolete	시대에 뒤떨어진	\N	\N	\N	toefl	하
4868	obtrude	강요하다	\N	\N	\N	toefl	기타
4869	obvious	명백한	\N	\N	\N	toefl	하
4870	occult	숨겨진	\N	\N	\N	toefl	하
4877	omnipotent	전능한	\N	\N	\N	toefl	하
4881	ooze	v. 스며 나오다	\N	\N	\N	toefl	하
4884	surgeon	n. 외과 의사	\N	\N	\N	toefl	하
4887	obstetrician	산부인과 의사	\N	\N	\N	toefl	중
4891	cardiologist	심장병 전문의	\N	\N	\N	toefl	하
4896	opportune	(시기	\N	\N	\N	toefl	하
4897	opt	선택하다	\N	\N	\N	toefl	하
4898	optimistic	낙관적인	\N	\N	\N	toefl	하
4899	optimum	최적의	\N	\N	\N	toefl	하
4906	ornate	장식한	\N	\N	\N	toefl	하
4909	ostracize	추방하다	\N	\N	\N	toefl	중
4914	outrage	N. 1. 격분	\N	\N	\N	toefl	하
4926	palliate	(병을 치료하지는 않고) 증상만 완화시키다	\N	\N	\N	toefl	중
4927	palpable	손으로 만질 수 있는	\N	\N	\N	toefl	하
4928	pamphlet	소책자	\N	\N	\N	toefl	하
4938	pastoral	전원적인	\N	\N	\N	toefl	하
4942	patrimony	세습재산	\N	\N	\N	toefl	중
4945	peculiar	독특한	\N	\N	\N	toefl	하
4565	ingenuous	순진한	\N	\N	\N	toefl	중
4739	manuscript	원고	\N	\N	\N	toefl	하
4572	inhibition	금지	\N	\N	\N	toefl	하
4573	inimical	해로운	\N	\N	\N	toefl	중
4595	instill	(점차적으로) 주입하다	\N	\N	\N	toefl	하
4598	instrument	기구	\N	\N	\N	toefl	하
4601	interact	상호작용하다	\N	\N	\N	toefl	하
4603	interference	간섭	\N	\N	\N	toefl	하
4605	interject	말참견을 하다	\N	\N	\N	toefl	중
4607	interrupt	방해하다	\N	\N	\N	toefl	하
4611	intimidating	위협적인	\N	\N	\N	toefl	하
4905	ornamental	장식적인	\N	\N	\N	toefl	하
4907	ostensible	표면상의	\N	\N	\N	toefl	중
4908	ostentatious	과시하는	\N	\N	\N	toefl	중
4912	outlet	배출구	\N	\N	\N	toefl	하
4913	output	생산	\N	\N	\N	toefl	하
4920	outweigh	~보다 중요하다	\N	\N	\N	toefl	하
4922	overlook	간과하다	\N	\N	\N	toefl	하
4923	overweening	자만한	\N	\N	\N	toefl	중
4924	pace	속도	\N	\N	\N	toefl	하
4931	paralysis	마비	\N	\N	\N	toefl	하
4932	paralyze	마비시키다	\N	\N	\N	toefl	중
4933	paramount	가장 중요한; 최고의	\N	\N	\N	toefl	하
4939	paterfamilia	가부장	\N	\N	\N	toefl	기타
4940	paternity	N. 1. 부권	\N	\N	\N	toefl	하
4943	patron	후원자	\N	\N	\N	toefl	하
4948	peer	또래	\N	\N	\N	toefl	하
4952	pensively	생각에 잠긴듯이	\N	\N	\N	toefl	중
4955	perennially	1년 내내	\N	\N	\N	toefl	중
4956	perforation	N. (위 등의) 천공	\N	\N	\N	toefl	하
4957	performance	행동	\N	\N	\N	toefl	하
4958	perfunctory	형식적인	\N	\N	\N	toefl	중
4959	perish	죽다	\N	\N	\N	toefl	하
4960	perjury	위증	\N	\N	\N	toefl	하
4961	permanent	영구적인	\N	\N	\N	toefl	하
4964	perpendicular	똑바로선	\N	\N	\N	toefl	하
4965	perpetrate	(범죄	\N	\N	\N	toefl	중
4966	perpetual	영구의	\N	\N	\N	toefl	하
4967	perplex	혼란스럽게 하다	\N	\N	\N	toefl	중
4968	persist	고집하다	\N	\N	\N	toefl	하
4973	pertinent	관련된	\N	\N	\N	toefl	하
4975	pervasive	널리 퍼져있는	\N	\N	\N	toefl	하
4976	perverse	'외고집의	\N	\N	\N	toefl	하
4979	petrifying	극도로 겁에 질리게 하는	\N	\N	\N	toefl	기타
4980	phase	단계	\N	\N	\N	toefl	하
4981	phenomenal	놀랄만한	\N	\N	\N	toefl	하
4982	phony	가짜의	\N	\N	\N	toefl	하
4983	pierce	관통하다	\N	\N	\N	toefl	하
4985	placate	달래다	\N	\N	\N	toefl	중
4986	placid	평온한	\N	\N	\N	toefl	하
4987	plainly	솔직히	\N	\N	\N	toefl	하
4988	plaintive	슬픈	\N	\N	\N	toefl	중
4989	plangent	(소리) 울려 퍼지는	\N	\N	\N	toefl	기타
4990	plausible	그럴듯한	\N	\N	\N	toefl	하
4991	pledge	맹세하다	\N	\N	\N	toefl	하
4992	plenary	총회의	\N	\N	\N	toefl	하
4993	pliant	유연한	\N	\N	\N	toefl	중
4994	plight	곤경	\N	\N	\N	toefl	하
4996	plutocracy	금권정치	\N	\N	\N	toefl	중
4997	ply	정기적으로 왕복하다	\N	\N	\N	toefl	하
4998	poignancy	날카로움	\N	\N	\N	toefl	중
4999	point-blank	단도직입적인	\N	\N	\N	toefl	기타
5000	poisonous	유독한	\N	\N	\N	toefl	하
5001	poll	여론조사	\N	\N	\N	toefl	하
5002	pollutant	n. 오염 물질	\N	\N	\N	toefl	하
5003	pompous	(태도	\N	\N	\N	toefl	하
5004	ponder	숙고하다	\N	\N	\N	toefl	하
5006	portal	대문	\N	\N	\N	toefl	하
5007	portent	전조	\N	\N	\N	toefl	중
5008	posterity	자손	\N	\N	\N	toefl	하
5009	posthumously	사후에	\N	\N	\N	toefl	하
5011	potable	마실 수 있는	\N	\N	\N	toefl	하
5012	portable	휴대용의	\N	\N	\N	toefl	하
5013	potentiality	가능성	\N	\N	\N	toefl	중
5014	practically	사실상	\N	\N	\N	toefl	하
5015	pragmatic	실용적인	\N	\N	\N	toefl	하
5016	precarious	위태로운	\N	\N	\N	toefl	하
5017	precariously	불안정하게	\N	\N	\N	toefl	중
5018	precaution	조심	\N	\N	\N	toefl	하
5019	precedent	선례	\N	\N	\N	toefl	하
5020	precipitate	재촉하다	\N	\N	\N	toefl	하
5021	precise	정확한	\N	\N	\N	toefl	하
5022	precision	정확	\N	\N	\N	toefl	하
5023	predilection	애호	\N	\N	\N	toefl	중
5024	preferment	승진	\N	\N	\N	toefl	중
5025	premise	전제	\N	\N	\N	toefl	하
5026	prepared	준비가 되어 있는	\N	\N	\N	toefl	하
5027	preposterous	A. 앞뒤가 뒤바뀐	\N	\N	\N	toefl	하
5028	prerequisite	필요조건	\N	\N	\N	toefl	하
5029	prescribe	규정하다	\N	\N	\N	toefl	하
5031	pressing	긴급한	\N	\N	\N	toefl	하
5032	prestigious	훌륭한	\N	\N	\N	toefl	하
5033	presumably	아마	\N	\N	\N	toefl	하
5034	presume	추정하다	\N	\N	\N	toefl	하
5035	presumptous	건방진	\N	\N	\N	toefl	기타
5037	pretext	구실	\N	\N	\N	toefl	하
5038	prevail	우세하다	\N	\N	\N	toefl	하
5039	prevailing	우세한	\N	\N	\N	toefl	하
5040	prevalent	일반적인	\N	\N	\N	toefl	하
5041	prey	먹이	\N	\N	\N	toefl	하
5042	prime	가장 중요한	\N	\N	\N	toefl	하
5043	primarily	주로	\N	\N	\N	toefl	하
5044	privatize	민영화하다	\N	\N	\N	toefl	하
5045	privation	결핍	\N	\N	\N	toefl	중
5046	prize	상	\N	\N	\N	toefl	하
5047	probity	정직	\N	\N	\N	toefl	중
5049	process	처리하다	\N	\N	\N	toefl	하
5050	procrastinate	미루다	\N	\N	\N	toefl	중
5051	procure	얻다	\N	\N	\N	toefl	하
5052	prodigious	거대한	\N	\N	\N	toefl	하
5053	profile	옆모습으로	\N	\N	\N	toefl	하
5054	profligate	탕진하는	\N	\N	\N	toefl	중
5057	offspring	자식	\N	\N	\N	toefl	하
4580	innovation	혁신	\N	\N	\N	toefl	하
4587	insightful	통찰력 있는	\N	\N	\N	toefl	하
4588	insinuate	넌지시 말하다	\N	\N	\N	toefl	중
5065	prologue	머리말	\N	\N	\N	toefl	하
5072	prone	~하기 쉬운	\N	\N	\N	toefl	하
5073	propensity	경향	\N	\N	\N	toefl	하
5076	propound	제시하다	\N	\N	\N	toefl	중
5083	protract	(시간을) 오래끌다	\N	\N	\N	toefl	상
5089	prowess	훌륭한 솜씨	\N	\N	\N	toefl	하
5093	prying	호기심이 강한	\N	\N	\N	toefl	하
5095	psychology	심리	\N	\N	\N	toefl	하
5099	pundit	전문가	\N	\N	\N	toefl	하
5104	put-on	~을 입다	\N	\N	\N	toefl	기타
5106	quaint	기이한	\N	\N	\N	toefl	하
5108	quandary	난처함	\N	\N	\N	toefl	하
5114	rampant	만연하는	\N	\N	\N	toefl	하
5115	rancid	(부패로) 악취나는	\N	\N	\N	toefl	하
5116	randomly	임의로	\N	\N	\N	toefl	하
5123	ration	배급하다	\N	\N	\N	toefl	하
5124	rattled	당황한	\N	\N	\N	toefl	하
5128	reaffirm	재차 단언하다	\N	\N	\N	toefl	하
5129	recalcitrant	권위에 저항하는	\N	\N	\N	toefl	중
5133	recede	물러나다; 감소하다	\N	\N	\N	toefl	하
5134	receptive	수용적인	\N	\N	\N	toefl	하
5135	reciprocal	상호간의	\N	\N	\N	toefl	하
5136	reckless	무모한	\N	\N	\N	toefl	하
5140	reconcile	화해시키다	\N	\N	\N	toefl	하
5144	recycle	재활용하다	\N	\N	\N	toefl	하
5146	redundant	과잉의	\N	\N	\N	toefl	하
5148	refuse	거절하다	\N	\N	\N	toefl	하
5163	reminisce	추억하다	\N	\N	\N	toefl	하
5164	remiss	태만한	\N	\N	\N	toefl	중
5168	remuneration	보수	\N	\N	\N	toefl	하
5174	reprehensible	비난받아 마땅한	\N	\N	\N	toefl	하
5175	reprimand	비난하다	\N	\N	\N	toefl	하
5179	requisite	필요한	\N	\N	\N	toefl	하
5186	reservation	의구심	\N	\N	\N	toefl	하
5187	residual	남은	\N	\N	\N	toefl	하
5194	resume	다시 시작하다	\N	\N	\N	toefl	하
5197	retard	지체시키다	\N	\N	\N	toefl	하
5203	retrieve	되찾다	\N	\N	\N	toefl	하
5204	retrogress	후퇴하다	\N	\N	\N	toefl	기타
5207	reveal	드러내다	\N	\N	\N	toefl	하
5212	rip-off	n. 도둑질	\N	\N	\N	toefl	기타
5213	riveting	A. <영/구어> 매혹적인	\N	\N	\N	toefl	하
5219	rowdiness	떠들썩함	\N	\N	\N	toefl	상
5220	rudimentary	미발달의	\N	\N	\N	toefl	하
5224	rummage	뒤지다	\N	\N	\N	toefl	중
5225	run	운영하다	\N	\N	\N	toefl	하
5226	run-down	닳다	\N	\N	\N	toefl	기타
5234	salient	중요한	\N	\N	\N	toefl	하
5235	salutary	유익한	\N	\N	\N	toefl	중
5236	sanction	허가하다	\N	\N	\N	toefl	하
5243	saunter	산책하다	\N	\N	\N	toefl	중
5244	save	구하다	\N	\N	\N	toefl	하
5245	savvy	N. (실용적인) 지식	\N	\N	\N	toefl	하
5249	scathing	냉혹한	\N	\N	\N	toefl	하
5254	scrupulously	양심적으로	\N	\N	\N	toefl	중
5255	scrutinize	자세히 조사하다	\N	\N	\N	toefl	하
5260	secluded	외딴	\N	\N	\N	toefl	하
5263	sedentary	앉아서 일하는	\N	\N	\N	toefl	하
5265	seizure	붙잡음	\N	\N	\N	toefl	하
5266	self-possessed	침착한	\N	\N	\N	toefl	기타
5268	sentient	감각이 있는	\N	\N	\N	toefl	하
5273	severed	절단된	\N	\N	\N	toefl	하
5277	sheer	순전한	\N	\N	\N	toefl	하
5281	shrewd	영리한	\N	\N	\N	toefl	하
5284	shrill	(소리가) 날카로운	\N	\N	\N	toefl	하
5293	skid	v. 미끄러지다	\N	\N	\N	toefl	하
5294	skim	대충 훑어보다	\N	\N	\N	toefl	하
5295	skimping	절약	\N	\N	\N	toefl	중
5296	skinny	마른	\N	\N	\N	toefl	하
5310	sober	술 취하지 않은	\N	\N	\N	toefl	하
5311	soggy	흠뻑 젖은	\N	\N	\N	toefl	하
5321	spacious	널찍한	\N	\N	\N	toefl	하
5329	spinoff	파생효과	\N	\N	\N	toefl	하
5330	spirally	나선형(모양)으로	\N	\N	\N	toefl	중
5333	spoil	망치다	\N	\N	\N	toefl	하
5334	spontaneity	자발성	\N	\N	\N	toefl	하
5339	spotless	a. 아주 깨끗한	\N	\N	\N	toefl	하
5344	squeamish	비위가 약한; 너무 까다로운	\N	\N	\N	toefl	중
5345	squeeze	짜내다; 	\N	\N	\N	toefl	하
5347	stagger	비틀거리다	\N	\N	\N	toefl	하
5349	stand	(범률 명령) 유효하다	\N	\N	\N	toefl	하
5350	standoff	교착상태	\N	\N	\N	toefl	하
5355	state-of-the art	최신식의	\N	\N	\N	toefl	기타
5361	steadily	꾸준히	\N	\N	\N	toefl	하
5362	stealthy	은밀한	\N	\N	\N	toefl	하
5368	stimulate	자극하다	\N	\N	\N	toefl	하
5369	stipulate	규정하다	\N	\N	\N	toefl	하
5373	stray	(있어야할 곳을 벗어나) 헤매다	\N	\N	\N	toefl	하
5379	stringent	엄격한	\N	\N	\N	toefl	하
5380	strive	노력하다	\N	\N	\N	toefl	하
5385	stuck up	거만한	\N	\N	\N	toefl	기타
5386	abandon	그만두다	\N	\N	\N	gongmuwon	하
5387	aberrant	정도를 벗어난	\N	\N	\N	gongmuwon	하
5393	abortive	실패한	\N	\N	\N	gongmuwon	중
5394	abreast	나란히; ~와 병행하여	\N	\N	\N	gongmuwon	하
5395	abridge	요약하다	\N	\N	\N	gongmuwon	중
5401	abstain	삼가다	\N	\N	\N	gongmuwon	하
5402	abstract	발췌	\N	\N	\N	gongmuwon	하
5404	absurd	어리석은; 우스꽝스러운	\N	\N	\N	gongmuwon	하
5405	abundant	풍부한	\N	\N	\N	gongmuwon	하
5408	accessible	접근하기 쉬운	\N	\N	\N	gongmuwon	하
5409	accidental	우연의	\N	\N	\N	gongmuwon	하
5414	accumulate	축적하다	\N	\N	\N	gongmuwon	하
5415	accuse	고발(기소	\N	\N	\N	gongmuwon	하
5061	project	프로젝트	\N	\N	\N	toefl	하
5063	proliferation	급증	\N	\N	\N	toefl	하
5064	prolix	(말이나 글이) 장황한	\N	\N	\N	toefl	중
5079	prose	n. 산문	\N	\N	\N	toefl	하
5080	proscribe	법으로 금지하다	\N	\N	\N	toefl	중
5085	provided	만약 ~이라면	\N	\N	\N	toefl	하
5086	provisional	임시의	\N	\N	\N	toefl	하
5087	provocation	성나게 함	\N	\N	\N	toefl	하
5088	provoke	유발하다	\N	\N	\N	toefl	하
5097	punctual	시간을 엄수하는	\N	\N	\N	toefl	하
5102	put-down	진압하다	\N	\N	\N	toefl	기타
5105	puzzling	당혹스럽게 만드는	\N	\N	\N	toefl	하
5110	queasy	메스꺼운	\N	\N	\N	toefl	중
5121	rare	드문	\N	\N	\N	toefl	하
5122	ratify	비준하다	\N	\N	\N	toefl	하
5137	reclaim	간척하다	\N	\N	\N	toefl	하
5141	rectify	고치다	\N	\N	\N	toefl	하
5142	rectitude	정직	\N	\N	\N	toefl	중
5151	regional	지방의	\N	\N	\N	toefl	하
5153	reimburse	변제하다	\N	\N	\N	toefl	하
5154	reiterate	되풀이하다	\N	\N	\N	toefl	하
5159	relinquish	포기하다	\N	\N	\N	toefl	하
5160	reluctant	꺼리는	\N	\N	\N	toefl	하
5161	remedial	치료	\N	\N	\N	toefl	하
5165	remnant	유물	\N	\N	\N	toefl	하
5166	remorse	후회	\N	\N	\N	toefl	하
5169	renowned	유명한	\N	\N	\N	toefl	하
5170	repeal	Vt. (법률 등을) 폐지[폐기]하다	\N	\N	\N	toefl	하
5171	N. (법률 등의) 폐지	 폐기; 취소	\N	\N	\N	toefl	기타
5181	requite	보답하다	\N	\N	\N	toefl	중
5184	resent	분개하다	\N	\N	\N	toefl	하
5185	resentment	분노	\N	\N	\N	toefl	하
5192	restive	안절부절 못하는; 통제하기 힘든	\N	\N	\N	toefl	중
5193	restrain	제한하다	\N	\N	\N	toefl	하
5195	resurrection	부활	\N	\N	\N	toefl	하
5198	reticent	말이 없는	\N	\N	\N	toefl	중
5199	retirement benefit	퇴직연금	\N	\N	\N	toefl	기타
5200	retract	취소하다	\N	\N	\N	toefl	하
5205	revamp	개정하다	\N	\N	\N	toefl	하
5208	revere	존경하다	\N	\N	\N	toefl	하
5210	revision	수정	\N	\N	\N	toefl	하
5211	rigorous	엄격한	\N	\N	\N	toefl	하
5214	roam	돌아다니다	\N	\N	\N	toefl	하
5216	rookie	신참	\N	\N	\N	toefl	하
5217	roughly	대략	\N	\N	\N	toefl	하
5218	routine	일상적인	\N	\N	\N	toefl	하
5221	rudiments	기초	\N	\N	\N	toefl	중
5229	ruthless	A.무자비한	\N	\N	\N	toefl	하
5233	sagacious	현명한	\N	\N	\N	toefl	중
5237	sanctuary	피난처	\N	\N	\N	toefl	하
5238	sanctum	신성한 장소	\N	\N	\N	toefl	하
5242	sapient	슬기로운	\N	\N	\N	toefl	중
5247	V. <속어>알다	 이해하다	\N	\N	\N	toefl	기타
5248	scanty	적은	\N	\N	\N	toefl	중
5257	seal	밀봉하다	\N	\N	\N	toefl	하
5258	seasoning	양념	\N	\N	\N	toefl	하
5262	security	안전	\N	\N	\N	toefl	하
5271	setback	패배	\N	\N	\N	toefl	하
5272	sever	자르다	\N	\N	\N	toefl	하
5275	shabby	초라한	\N	\N	\N	toefl	하
5276	sheen	윤기	\N	\N	\N	toefl	하
5279	shift	이동하다	\N	\N	\N	toefl	하
5280	shifting	이동하는	\N	\N	\N	toefl	하
5285	shrub	관목	\N	\N	\N	toefl	하
5288	sidestep	옆으로 비키다	\N	\N	\N	toefl	하
5289	simultaneously	동시에	\N	\N	\N	toefl	하
5290	sip	조금씩 마시다	\N	\N	\N	toefl	하
5291	skeptical	의심 많은	\N	\N	\N	toefl	하
5292	skepticism	회의	\N	\N	\N	toefl	하
5297	slacken	느슨하게 만들다	\N	\N	\N	toefl	중
5298	sleuth	탐정	\N	\N	\N	toefl	하
5299	slightly	약간	\N	\N	\N	toefl	하
5305	smudge	V. 1. (잉크·페인트를 문질러) 번지[게 하]다	\N	\N	\N	toefl	하
5309	soak	흠뻑적시다	\N	\N	\N	toefl	하
5313	N. (일시적인) 체류	 체재	\N	\N	\N	toefl	기타
5314	solace	위안	\N	\N	\N	toefl	하
5318	soothe	달래다	\N	\N	\N	toefl	하
5319	sophisticated	정교한	\N	\N	\N	toefl	하
5320	soporific	수면성의	\N	\N	\N	toefl	중
5323	specific	특정한	\N	\N	\N	toefl	하
5328	speed	속도를 높이다	\N	\N	\N	toefl	하
5342	squalid	지저분한	\N	\N	\N	toefl	중
5343	squander	탕진하다	\N	\N	\N	toefl	중
5346	stack	더미	\N	\N	\N	toefl	하
5348	staggering	A. (너무 엄청나서) 충격적인	\N	\N	\N	toefl	하
5354	famine	기근	\N	\N	\N	toefl	하
5356	station	신분	\N	\N	\N	toefl	하
5357	stationary	움직이지 않는	\N	\N	\N	toefl	하
5363	stem	줄기	\N	\N	\N	toefl	하
5364	sterile	불모의	\N	\N	\N	toefl	하
5370	stocky	땅딸막한	\N	\N	\N	toefl	중
5371	stoically	냉철하게	\N	\N	\N	toefl	중
5377	strict	엄한	\N	\N	\N	toefl	하
5378	strikingly	두드러지게	\N	\N	\N	toefl	하
5383	stubborn	완고한	\N	\N	\N	toefl	하
5392	abolish	(법률	\N	\N	\N	gongmuwon	하
5396	abrogate	폐지하다	\N	\N	\N	gongmuwon	중
5399	absent	자리를 비운	\N	\N	\N	gongmuwon	하
5400	absorb	열중시키다	\N	\N	\N	gongmuwon	하
5410	acclaim	갈채하다	\N	\N	\N	gongmuwon	하
5412	accordingly	따라서	\N	\N	\N	gongmuwon	하
5416	accustom	길들게 하다; 익숙하게 하다	\N	\N	\N	gongmuwon	중
5422	acquire	취득하다	\N	\N	\N	gongmuwon	하
5429	adapt	~을 적응시키다	\N	\N	\N	gongmuwon	하
5434	adept	숙련자	\N	\N	\N	gongmuwon	하
5437	admittedly	널리 인정되고 있는바와 같이; 명백히	\N	\N	\N	gongmuwon	하
5441	advantageous	이로운	\N	\N	\N	gongmuwon	하
5442	adventitious	우연한	\N	\N	\N	gongmuwon	중
5062	prolific	다산의	\N	\N	\N	toefl	하
5075	proponent	제안자	\N	\N	\N	toefl	하
5078	prosaic	평범한	\N	\N	\N	toefl	중
5118	rankle	마음을 괴롭히다	\N	\N	\N	toefl	중
5071	promulgate	(법	\N	\N	\N	toefl	하
5074	propitious	유리한	\N	\N	\N	toefl	중
5077	propriety	적절성	\N	\N	\N	toefl	하
5081	protean	변화무쌍한	\N	\N	\N	toefl	중
5082	=versatile(다용도의	 다목적의)	\N	\N	\N	toefl	기타
5084	provenance	기원	\N	\N	\N	toefl	하
5090	prowl	배회하다	\N	\N	\N	toefl	하
5092	prudent	현명한	\N	\N	\N	toefl	하
5094	pseudonym	(작가) 필명	\N	\N	\N	toefl	하
5098	punctuality	N.시간 엄수	\N	\N	\N	toefl	하
5101	purport	의미	\N	\N	\N	toefl	하
5109	quarterly	분기별의	\N	\N	\N	toefl	하
5112	quiver	떨다	\N	\N	\N	toefl	하
5113	racism	인종차별주의	\N	\N	\N	toefl	하
5117	ramification	(사건의) 결과	\N	\N	\N	toefl	중
5120	rapport	(관계) 조화로움	\N	\N	\N	toefl	하
5125	ravage	파괴하다	\N	\N	\N	toefl	중
5130	recant	철회하다	\N	\N	\N	toefl	중
5131	recapitulate	요약하다 (<다시 머리가 될 만한 내용만 따서)	\N	\N	\N	toefl	중
5138	recluse	속세를 떠난	\N	\N	\N	toefl	하
5139	recollect	생각해내다	\N	\N	\N	toefl	하
5145	redeem	보상하다	\N	\N	\N	toefl	하
5147	refrain	그만두다	\N	\N	\N	toefl	하
5149	refute	논박하다	\N	\N	\N	toefl	하
5150	regard	간주하다	\N	\N	\N	toefl	하
5155	release	풀어주다	\N	\N	\N	toefl	하
5157	relevant	관련된	\N	\N	\N	toefl	하
5158	reliant	의존하는	\N	\N	\N	toefl	하
5162	remedy	치료	\N	\N	\N	toefl	하
5167	remote	먼	\N	\N	\N	toefl	하
5173	replenish	다시 채우다	\N	\N	\N	toefl	하
5176	reproach	비난하다	\N	\N	\N	toefl	하
5177	repulsive	불쾌감을 주는	\N	\N	\N	toefl	하
5178	repercussion	영향	\N	\N	\N	toefl	중
5180	requisition	요구서	\N	\N	\N	toefl	하
5182	rescind	폐지	\N	\N	\N	toefl	하
5190	resolve	해결하다	\N	\N	\N	toefl	하
5196	retain	보유하다	\N	\N	\N	toefl	하
5201	retreat	(군대) 후퇴하다	\N	\N	\N	toefl	하
5202	retribution	보복	\N	\N	\N	toefl	하
5206	reverberate	반향하다	\N	\N	\N	toefl	중
5215	robust	튼튼한	\N	\N	\N	toefl	하
5222	rugged	울퉁불퉁한	\N	\N	\N	toefl	하
5223	ruin	파괴하다	\N	\N	\N	toefl	하
5231	sacred	신성한	\N	\N	\N	toefl	하
5232	sag	v. 휘다	\N	\N	\N	toefl	하
5239	sanguine	낙관적인	\N	\N	\N	toefl	하
5240	sanitary	위생의	\N	\N	\N	toefl	하
5241	sap	약화시키다	\N	\N	\N	toefl	하
5250	scrap	파편	\N	\N	\N	toefl	하
5252	scribe	저술가	\N	\N	\N	toefl	하
5256	scrutiny	정밀조사	\N	\N	\N	toefl	하
5261	secular	비종교적인	\N	\N	\N	toefl	하
5264	segment	부분	\N	\N	\N	toefl	하
5267	sensible	분별 있는	\N	\N	\N	toefl	하
5269	sepulchral	무덤의	\N	\N	\N	toefl	중
5270	sepulcher	n. 무덤	\N	\N	\N	toefl	중
5274	severity	엄격함	\N	\N	\N	toefl	하
5278	shield	방패	\N	\N	\N	toefl	하
5283	shrewdly	기민하게	\N	\N	\N	toefl	중
5287	shun	피하다	\N	\N	\N	toefl	하
5302	slovenly	지저분한	\N	\N	\N	toefl	중
5303	sluggish	둔한	\N	\N	\N	toefl	하
5304	smack	세게 때리다	\N	\N	\N	toefl	하
5307	N. (더러운) 자국	 얼룩	\N	\N	\N	toefl	기타
5308	sneer	비웃다	\N	\N	\N	toefl	하
5315	solidify	단결시키다	\N	\N	\N	toefl	하
5316	somber	어둠침침한	\N	\N	\N	toefl	하
5317	somnolent	졸린	\N	\N	\N	toefl	중
5322	spawn	알을 낳다	\N	\N	\N	toefl	하
5325	specimen	견본	\N	\N	\N	toefl	하
5326	specious	그럴듯한	\N	\N	\N	toefl	중
5327	spectrum	스펙트럼	\N	\N	\N	toefl	하
5331	splendor	장려함	\N	\N	\N	toefl	하
5336	spooky	유령 같은	\N	\N	\N	toefl	하
5337	sporadic	산발적인	\N	\N	\N	toefl	하
5338	sporadically	산발적으로	\N	\N	\N	toefl	하
5340	spurious	가짜의	\N	\N	\N	toefl	하
5351	staple	주요한	\N	\N	\N	toefl	하
5353	starvation	기아	\N	\N	\N	toefl	하
5358	status	지위	\N	\N	\N	toefl	하
5359	statute	법령	\N	\N	\N	toefl	하
5360	steadfastly	확고하게	\N	\N	\N	toefl	하
5366	stigma	N.1.치욕	\N	\N	\N	toefl	하
5367	2.(병의)증후	증상;반점	\N	\N	\N	toefl	기타
5374	streamline	(일	\N	\N	\N	toefl	하
5375	strenuously	정력적으로	\N	\N	\N	toefl	중
5376	stricken	맞은	\N	\N	\N	toefl	하
5381	stroke	쓰다듬다	\N	\N	\N	toefl	하
5384	stubbornly	완고하게	\N	\N	\N	toefl	하
5389	ability	능력	\N	\N	\N	gongmuwon	하
5390	ablaze	밝은 빛으로 빛나는	\N	\N	\N	gongmuwon	하
5397	abruptly	갑자기	\N	\N	\N	gongmuwon	하
5398	abscond	몰래 도주하다	\N	\N	\N	gongmuwon	중
5407	accept	받아들이다	\N	\N	\N	gongmuwon	하
5411	accomplice	공범자	\N	\N	\N	gongmuwon	하
5417	acerbate	화나게 하다	\N	\N	\N	gongmuwon	기타
5418	achieve	성취하다	\N	\N	\N	gongmuwon	하
5419	acknowledge	(잘못	\N	\N	\N	gongmuwon	하
5420	acquaint	정통하게 하다	\N	\N	\N	gongmuwon	하
5423	acquit	무죄라고 하다	\N	\N	\N	gongmuwon	중
5426	active	활동적인	\N	\N	\N	gongmuwon	하
5427	acute	뾰족한	\N	\N	\N	gongmuwon	하
5430	added	여분의	\N	\N	\N	gongmuwon	하
5431	addict	중독되다	\N	\N	\N	gongmuwon	하
5440	advance	진보하다; 승진하다	\N	\N	\N	gongmuwon	하
5446	affiliation	합병	\N	\N	\N	gongmuwon	하
5068	promiscuous	무차별한	\N	\N	\N	toefl	하
5069	promote	승진시키다	\N	\N	\N	toefl	하
5070	promptly	즉시	\N	\N	\N	toefl	하
5107	qualms	양심의 가책	\N	\N	\N	toefl	하
5435	adjacent	인접한	\N	\N	\N	gongmuwon	하
5438	admonish	충고하다	\N	\N	\N	gongmuwon	중
5439	adulterate	불순하게 하다	\N	\N	\N	gongmuwon	중
5443	adverse	반대하는	\N	\N	\N	gongmuwon	하
5444	affable	사귀기 쉬운; 상냥한	\N	\N	\N	gongmuwon	중
5445	affect	~에 영향을 미치다	\N	\N	\N	gongmuwon	하
5448	afford	주다	\N	\N	\N	gongmuwon	하
5455	agreeable	기분 좋은	\N	\N	\N	gongmuwon	하
5456	alarm	공포	\N	\N	\N	gongmuwon	하
5457	alias	가명	\N	\N	\N	gongmuwon	하
5464	allowance	허락	\N	\N	\N	gongmuwon	하
5465	almighty	전능한	\N	\N	\N	gongmuwon	하
5471	amass	모으다	\N	\N	\N	gongmuwon	중
5486	annex	(소국	\N	\N	\N	gongmuwon	하
5487	annual	해마다의	\N	\N	\N	gongmuwon	하
5490	anthropology	인류학	\N	\N	\N	gongmuwon	하
5495	aperture	구멍	\N	\N	\N	gongmuwon	하
5498	applause	박수갈채	\N	\N	\N	gongmuwon	하
5499	appliance	가구	\N	\N	\N	gongmuwon	하
5507	arduous	(일이) 힘드는	\N	\N	\N	gongmuwon	하
5512	arrogant	거만한	\N	\N	\N	gongmuwon	하
5513	articulate	(말	\N	\N	\N	gongmuwon	하
5514	artificial	인조의	\N	\N	\N	gongmuwon	하
5515	aspire	열망하다	\N	\N	\N	gongmuwon	하
5516	assemble	모으다	\N	\N	\N	gongmuwon	하
5520	assiduous	부지런한	\N	\N	\N	gongmuwon	중
5526	atrocity	잔악한 행위; 흉악	\N	\N	\N	gongmuwon	하
5531	attribute	속성	\N	\N	\N	gongmuwon	하
5539	autonomous	자치권이 있는	\N	\N	\N	gongmuwon	하
5540	avaricious	탐욕스러운	\N	\N	\N	gongmuwon	중
5541	average	평균(치)	\N	\N	\N	gongmuwon	하
5542	avert	(위험	\N	\N	\N	gongmuwon	하
5544	backbone	중추; 척추	\N	\N	\N	gongmuwon	하
5546	banal	진부한	\N	\N	\N	gongmuwon	하
5552	beam	빛나다	\N	\N	\N	gongmuwon	하
5557	behalf	이익	\N	\N	\N	gongmuwon	하
5566	beset	~을 괴롭히다	\N	\N	\N	gongmuwon	하
5567	besiege	~을 포위하다	\N	\N	\N	gongmuwon	중
5570	bigotry	편협(한 행위)	\N	\N	\N	gongmuwon	하
5571	bilateral	쌍방의	\N	\N	\N	gongmuwon	하
5572	biochemistry	생화학	\N	\N	\N	gongmuwon	하
5585	blush	붉어지다; 부끄러워하다	\N	\N	\N	gongmuwon	하
5586	bluster	고함치다; 위협하다	\N	\N	\N	gongmuwon	중
5596	brag	자랑하다(of/about)	\N	\N	\N	gongmuwon	하
5599	brilliant	빛나는	\N	\N	\N	gongmuwon	하
5605	bulky	부피가 큰; 커서 다루기 힘든	\N	\N	\N	gongmuwon	하
5606	burgeon	갑자기 출현(발전)하다	\N	\N	\N	gongmuwon	중
5607	bury	묻다	\N	\N	\N	gongmuwon	하
5613	caliber	재능; 도량	\N	\N	\N	gongmuwon	하
5623	cargo	화물	\N	\N	\N	gongmuwon	하
5624	caricature	풍자만화; 서투른 모방	\N	\N	\N	gongmuwon	하
5632	central	주요한	\N	\N	\N	gongmuwon	하
5637	channel	(관심	\N	\N	\N	gongmuwon	하
5638	chaotic	혼란한	\N	\N	\N	gongmuwon	하
5645	chisel	끌	\N	\N	\N	gongmuwon	하
5649	circumspect	신중한	\N	\N	\N	gongmuwon	중
5651	cite	인용하다	\N	\N	\N	gongmuwon	하
5657	claustrophobic	폐쇄(밀실) 공포증의	\N	\N	\N	gongmuwon	중
5663	clone	복제 인간(생물)	\N	\N	\N	gongmuwon	하
5664	cluster	밀집시키다	\N	\N	\N	gongmuwon	하
5665	clutch	꽉 붙잡다; 권력을 쥐다	\N	\N	\N	gongmuwon	하
5666	coalition	연합	\N	\N	\N	gongmuwon	하
5669	coherent	일관성 있는	\N	\N	\N	gongmuwon	하
5670	coincide	동시에 일어나다	\N	\N	\N	gongmuwon	하
5676	colossal	거대한	\N	\N	\N	gongmuwon	하
5685	compatible	양립할 수 있는	\N	\N	\N	gongmuwon	하
5686	compel	~시키다	\N	\N	\N	gongmuwon	하
5692	compliance	유순	\N	\N	\N	gongmuwon	하
5693	complicity	공범; 공모	\N	\N	\N	gongmuwon	하
5697	comprehensive	포괄적인	\N	\N	\N	gongmuwon	하
5701	conceal	숨기다	\N	\N	\N	gongmuwon	하
5702	concede	인정하다	\N	\N	\N	gongmuwon	하
5711	confer	협의(의논)하다(with)	\N	\N	\N	gongmuwon	하
5719	congest	붐비다	\N	\N	\N	gongmuwon	상
5725	consecutive	논리가 일관된	\N	\N	\N	gongmuwon	하
5730	consonant	일치하는	\N	\N	\N	gongmuwon	하
5732	constructive	건설적인	\N	\N	\N	gongmuwon	하
5736	contemplate	심사숙고하다	\N	\N	\N	gongmuwon	하
5737	contemporary	현대의	\N	\N	\N	gongmuwon	하
5738	contempt	경멸	\N	\N	\N	gongmuwon	하
5740	context	문맥	\N	\N	\N	gongmuwon	하
5744	contradict	부정하다	\N	\N	\N	gongmuwon	하
5748	control	지배하다	\N	\N	\N	gongmuwon	하
5749	conventional	관습적인	\N	\N	\N	gongmuwon	하
5754	copious	풍부한	\N	\N	\N	gongmuwon	하
5755	cordial	마음에서 우러난	\N	\N	\N	gongmuwon	하
5756	corpulent	뚱뚱한	\N	\N	\N	gongmuwon	중
5761	cosmetic	겉치레의; 표면적인	\N	\N	\N	gongmuwon	하
5765	count	중요하다	\N	\N	\N	gongmuwon	하
5767	counteract	거스르다	\N	\N	\N	gongmuwon	하
7025	turbulent	거친	\N	\N	\N	gongmuwon	하
7026	turmoil	소란	\N	\N	\N	gongmuwon	하
7027	twig	작은 가지	\N	\N	\N	gongmuwon	하
7037	uncanny	초자연적인; 이상한	\N	\N	\N	gongmuwon	하
7047	underneath	~의 아래에; ~에 숨어서	\N	\N	\N	gongmuwon	하
7053	underway	진행 중인; 움직이고 있는	\N	\N	\N	gongmuwon	하
7054	underwrite	서명하다; 보험에 가입하다; 인수하다	\N	\N	\N	gongmuwon	하
5425	acronym	두문자	\N	\N	\N	gongmuwon	하
5428	adamant	양보할 줄 모르는	\N	\N	\N	gongmuwon	하
5432	address	주소; 연설	\N	\N	\N	gongmuwon	하
5462	alleviate	(고통을) 완화시키다	\N	\N	\N	gongmuwon	하
5466	aloud	큰 소리로	\N	\N	\N	gongmuwon	하
5472	amazing	놀랄 만한	\N	\N	\N	gongmuwon	하
5475	ambush	매복	\N	\N	\N	gongmuwon	하
5477	amenity	생활을 즐겁게 해주는 것	\N	\N	\N	gongmuwon	하
5478	amicable	우호적인	\N	\N	\N	gongmuwon	하
5481	ample	풍부한	\N	\N	\N	gongmuwon	하
5484	anchor	단단히 고정시키다; 닻을 내리다	\N	\N	\N	gongmuwon	하
5488	anonymous	작자 불명의	\N	\N	\N	gongmuwon	하
5489	antarctic	남극 지방	\N	\N	\N	gongmuwon	하
5493	antipathy	반감	\N	\N	\N	gongmuwon	중
5494	apathetic	무감각한	\N	\N	\N	gongmuwon	하
5501	apprehend	뜻을 이해하다; 개닫다	\N	\N	\N	gongmuwon	하
5502	approach	접근하다	\N	\N	\N	gongmuwon	하
5509	armchair	안락의자	\N	\N	\N	gongmuwon	하
5517	assert	단언하다	\N	\N	\N	gongmuwon	하
5522	assure	보증하다	\N	\N	\N	gongmuwon	하
5523	astronomer	천문학자	\N	\N	\N	gongmuwon	하
5524	atheist	무신론자	\N	\N	\N	gongmuwon	하
5530	attractive	마음을 끄는	\N	\N	\N	gongmuwon	하
5534	augment	증가시키다; 증가하다	\N	\N	\N	gongmuwon	하
5535	auspicious	길조의	\N	\N	\N	gongmuwon	하
5545	ban	금지하다	\N	\N	\N	gongmuwon	하
5548	banner	기; 광고용 현수막	\N	\N	\N	gongmuwon	하
5549	barely	거의 ~않다	\N	\N	\N	gongmuwon	하
5554	beat-up	사람이 지친	\N	\N	\N	gongmuwon	기타
5555	becoming	어울리는	\N	\N	\N	gongmuwon	하
5558	belated	뒤늦은	\N	\N	\N	gongmuwon	하
5561	benediction	축복; (식전	\N	\N	\N	gongmuwon	하
5562	benefactor	(학교	\N	\N	\N	gongmuwon	하
5565	bent	기호	\N	\N	\N	gongmuwon	하
5577	bland	온화한	\N	\N	\N	gongmuwon	하
5578	blast	돌풍	\N	\N	\N	gongmuwon	하
5580	blithe	즐거운	\N	\N	\N	gongmuwon	중
5581	block	장애물	\N	\N	\N	gongmuwon	하
5584	blur	흐림	\N	\N	\N	gongmuwon	하
5587	bode	징조가 되다	\N	\N	\N	gongmuwon	하
5595	bout	한 바탕	\N	\N	\N	gongmuwon	하
5603	brute	짐승	\N	\N	\N	gongmuwon	하
5604	budding	눈트기 시작한; 나타나기 시작한	\N	\N	\N	gongmuwon	하
5608	bustle	부산하게 움직이다	\N	\N	\N	gongmuwon	하
5620	capricious	변덕스러운	\N	\N	\N	gongmuwon	하
5628	categorize	분류하다	\N	\N	\N	gongmuwon	하
5631	censure	비난	\N	\N	\N	gongmuwon	하
5639	characteristic	독특한	\N	\N	\N	gongmuwon	하
5640	charitable	관대한	\N	\N	\N	gongmuwon	하
5641	chart	(지도	\N	\N	\N	gongmuwon	하
5642	cheat	속이다	\N	\N	\N	gongmuwon	하
5643	cherish	소중히 여기다	\N	\N	\N	gongmuwon	하
5644	chilling	무서운	\N	\N	\N	gongmuwon	하
5653	clandestine	은밀한	\N	\N	\N	gongmuwon	하
5655	classic	전형적인	\N	\N	\N	gongmuwon	하
5656	classification	분류(법)	\N	\N	\N	gongmuwon	하
5658	cleanse	깨끗이 하다	\N	\N	\N	gongmuwon	하
5661	clip	(털	\N	\N	\N	gongmuwon	하
5672	collapse	무너짐	\N	\N	\N	gongmuwon	하
5673	collide	부딪치다	\N	\N	\N	gongmuwon	하
5674	colloquial	구어(체)의	\N	\N	\N	gongmuwon	하
5675	colonize	식민지로 만들다; 이주시키다	\N	\N	\N	gongmuwon	중
5681	commonplace	평범한	\N	\N	\N	gongmuwon	하
5683	comparatively	비교적	\N	\N	\N	gongmuwon	하
5684	compassion	측은히 여김	\N	\N	\N	gongmuwon	하
5694	complimentary	무료의	\N	\N	\N	gongmuwon	하
5698	comprise	포함하다; ~으로 이루어지다	\N	\N	\N	gongmuwon	하
5699	compromise	타협	\N	\N	\N	gongmuwon	하
5700	compute	계산하다	\N	\N	\N	gongmuwon	하
5705	concert	협조	\N	\N	\N	gongmuwon	하
5706	concoct	(음모등을) 꾸미다	\N	\N	\N	gongmuwon	중
5707	concord	일치	\N	\N	\N	gongmuwon	하
5708	condense	요약하다	\N	\N	\N	gongmuwon	하
5710	conduct	실시하다; 처신하다	\N	\N	\N	gongmuwon	하
5453	agitate	선동하다	\N	\N	\N	gongmuwon	중
5476	amend	(의안을) 수정하다; (행시을) 고치다	\N	\N	\N	gongmuwon	하
5713	configuration	배치; 외형	\N	\N	\N	gongmuwon	하
5715	conflict	대립하다	\N	\N	\N	gongmuwon	하
5716	conform	따르다	\N	\N	\N	gongmuwon	하
5717	confront	직면하다	\N	\N	\N	gongmuwon	하
5726	consensus	총의	\N	\N	\N	gongmuwon	하
5727	conserve	보존하다	\N	\N	\N	gongmuwon	하
5731	conspicuous	두드러진; 뛰어난	\N	\N	\N	gongmuwon	하
5735	contaminate	더럽히다	\N	\N	\N	gongmuwon	하
5745	contrary	반대	\N	\N	\N	gongmuwon	하
5746	contribute	기부하다	\N	\N	\N	gongmuwon	하
5752	convince	확신시키다	\N	\N	\N	gongmuwon	하
5753	cooperate	협력하다	\N	\N	\N	gongmuwon	하
5759	corrosive	부식성의	\N	\N	\N	gongmuwon	하
5762	cosmopolitan	전 세계적인	\N	\N	\N	gongmuwon	하
5763	costly	값비싼	\N	\N	\N	gongmuwon	하
5764	council	푀의	\N	\N	\N	gongmuwon	하
5766	counter	반대하다	\N	\N	\N	gongmuwon	하
7028	twilight	황혼	\N	\N	\N	gongmuwon	하
7035	unbalanced	균형을 잃은	\N	\N	\N	gongmuwon	하
7036	unbearable	차을 수 없는	\N	\N	\N	gongmuwon	하
7038	unceasing	끊임없는	\N	\N	\N	gongmuwon	중
7039	uncertainty	불확실성	\N	\N	\N	gongmuwon	하
7040	uncivilized	미개한	\N	\N	\N	gongmuwon	중
7041	uncomely	예쁘지 않은	\N	\N	\N	gongmuwon	기타
7045	underlying	근원적인	\N	\N	\N	gongmuwon	하
7050	underscore	밑줄을 긋다	\N	\N	\N	gongmuwon	하
5452	agile	민첩한	\N	\N	\N	gongmuwon	하
5588	bold	대담한	\N	\N	\N	gongmuwon	하
5460	all thumbs	서투른	\N	\N	\N	gongmuwon	기타
7033	unanimous	만장일치의	\N	\N	\N	gongmuwon	하
5648	circulate	돌다	\N	\N	\N	gongmuwon	하
5652	civil	예의 바른; 시민의	\N	\N	\N	gongmuwon	하
5654	clasp	고정시키다	\N	\N	\N	gongmuwon	하
5659	clement	온화한	\N	\N	\N	gongmuwon	하
5660	cling	달라붙다	\N	\N	\N	gongmuwon	하
5668	coerce	강제하다	\N	\N	\N	gongmuwon	하
5677	commencement	시작	\N	\N	\N	gongmuwon	하
5678	commensurate	같은 정도의	\N	\N	\N	gongmuwon	하
5679	commiseration	가엾게 여김	\N	\N	\N	gongmuwon	중
5680	commodity	상품; 일용품	\N	\N	\N	gongmuwon	하
5687	compensate	보상하다	\N	\N	\N	gongmuwon	하
5688	competent	유능한	\N	\N	\N	gongmuwon	하
5689	complacent	마음에 흡족한	\N	\N	\N	gongmuwon	하
5690	complain	불평하다	\N	\N	\N	gongmuwon	하
5691	complex	복합의	\N	\N	\N	gongmuwon	하
5695	composure	침착	\N	\N	\N	gongmuwon	하
5703	conceit	자부심	\N	\N	\N	gongmuwon	하
5704	concentrate	집중하다	\N	\N	\N	gongmuwon	하
5712	confidential	기밀의	\N	\N	\N	gongmuwon	하
5714	confine	~을 한정하다	\N	\N	\N	gongmuwon	하
5721	congruous	일치하는	\N	\N	\N	gongmuwon	상
5722	conjugal	부부간의 혼인상의	\N	\N	\N	gongmuwon	중
5723	conscience	양심	\N	\N	\N	gongmuwon	하
5724	conscript	징집하다	\N	\N	\N	gongmuwon	중
5728	considerable	중요한; 고려해야 할	\N	\N	\N	gongmuwon	하
5729	console	위로하다	\N	\N	\N	gongmuwon	하
5733	consumption	소비	\N	\N	\N	gongmuwon	하
5741	continent	육지; 본토	\N	\N	\N	gongmuwon	하
5742	continually	계속적으로	\N	\N	\N	gongmuwon	하
5743	contract	수축하다	\N	\N	\N	gongmuwon	하
5750	converge	모이다	\N	\N	\N	gongmuwon	하
5449	aftermath	결과	\N	\N	\N	gongmuwon	하
5450	agenda	의사일정	\N	\N	\N	gongmuwon	하
5451	aggravate	악화시키다	\N	\N	\N	gongmuwon	하
5454	agonize	몹시 괴롭히다	\N	\N	\N	gongmuwon	중
5459	alike	서로 같은	\N	\N	\N	gongmuwon	하
5461	allege	(증거없이)주장하다	\N	\N	\N	gongmuwon	하
5467	alter	바꾸다	\N	\N	\N	gongmuwon	하
5468	alternative	양자택일	\N	\N	\N	gongmuwon	하
5469	altruistic	이타적인	\N	\N	\N	gongmuwon	하
5473	ambience	분위기	\N	\N	\N	gongmuwon	하
5474	ambiguous	모호한	\N	\N	\N	gongmuwon	하
5479	amid	~의 한복판에	\N	\N	\N	gongmuwon	하
5480	amorphous	무정형의	\N	\N	\N	gongmuwon	하
5483	analogous	유사한	\N	\N	\N	gongmuwon	하
5485	ancient	고대의	\N	\N	\N	gongmuwon	하
5491	anticipate	기대하다	\N	\N	\N	gongmuwon	하
5492	antidote	해독제	\N	\N	\N	gongmuwon	하
5497	appease	달래다	\N	\N	\N	gongmuwon	하
5500	appreciate	사물을 바르게 평가하다	\N	\N	\N	gongmuwon	하
5503	appropriate	적당한	\N	\N	\N	gongmuwon	하
5504	arbitrary	제멋대로인	\N	\N	\N	gongmuwon	하
5505	arboretum	식물원	\N	\N	\N	gongmuwon	하
5506	archaic	고대의; 오래된	\N	\N	\N	gongmuwon	하
5508	arid	마른	\N	\N	\N	gongmuwon	하
5511	arrest	체포하다	\N	\N	\N	gongmuwon	하
5519	asset	자산	\N	\N	\N	gongmuwon	하
5521	assort	분류하다; 조화하다	\N	\N	\N	gongmuwon	중
5525	atmosphere	공기	\N	\N	\N	gongmuwon	하
5528	attach	붙이다	\N	\N	\N	gongmuwon	하
5532	audacious	대담한	\N	\N	\N	gongmuwon	하
5609	buttress	(사람	\N	\N	\N	gongmuwon	하
5533	auditory	귀의	\N	\N	\N	gongmuwon	하
5536	austere	꾸미지 않은	\N	\N	\N	gongmuwon	하
5537	authenticate	입증하다	\N	\N	\N	gongmuwon	하
5538	automation	자동화	\N	\N	\N	gongmuwon	하
5543	aviation	비행(술)	\N	\N	\N	gongmuwon	하
5547	bank	물가	\N	\N	\N	gongmuwon	하
5551	barter	교환하다	\N	\N	\N	gongmuwon	하
5553	bear	운반하다; 낳다	\N	\N	\N	gongmuwon	하
5559	belligerent	호전적인	\N	\N	\N	gongmuwon	하
5560	beneath	~할 가치가 없는; ~보다 낮은	\N	\N	\N	gongmuwon	하
5563	benevolent	인자한	\N	\N	\N	gongmuwon	하
5564	benign	상냥한	\N	\N	\N	gongmuwon	하
5568	bestial	짐승 같은	\N	\N	\N	gongmuwon	하
5569	beverage	마실 것	\N	\N	\N	gongmuwon	하
5573	bizarre	별난; 기묘한	\N	\N	\N	gongmuwon	하
5574	black-out	정전	\N	\N	\N	gongmuwon	기타
5575	blamish	오점	\N	\N	\N	gongmuwon	기타
5576	blanch	~을 희게 하다	\N	\N	\N	gongmuwon	중
5583	blunt	무딘	\N	\N	\N	gongmuwon	하
5589	bolster	보강하다; 지지하다	\N	\N	\N	gongmuwon	하
5590	bombshell	깜짝 놀라게 하는 일(사람)	\N	\N	\N	gongmuwon	하
5591	bondage	속박	\N	\N	\N	gongmuwon	하
5592	boom	갑자기 경기가 좋아지다	\N	\N	\N	gongmuwon	하
5593	boost	경기를 부양하다	\N	\N	\N	gongmuwon	하
5594	bourgeois	중산계급	\N	\N	\N	gongmuwon	하
5597	breed	(새끼를) 낳다	\N	\N	\N	gongmuwon	하
5598	brevity	(문장	\N	\N	\N	gongmuwon	하
5601	bristle	성내다	\N	\N	\N	gongmuwon	하
5602	brittle	부서지기 쉬운	\N	\N	\N	gongmuwon	하
5610	bystander	방관자	\N	\N	\N	gongmuwon	하
5611	cache	은닉처	\N	\N	\N	gongmuwon	하
5616	candor	솔직	\N	\N	\N	gongmuwon	하
5617	capacity	smdfur	\N	\N	\N	gongmuwon	하
5618	capitalize	이용하다	\N	\N	\N	gongmuwon	하
5619	capitulate	항복하다; 굴복하다	\N	\N	\N	gongmuwon	중
5629	caviler	트집쟁이	\N	\N	\N	gongmuwon	기타
5625	carnivorous	육식성의	\N	\N	\N	gongmuwon	하
5626	catastrophe	큰 재해	\N	\N	\N	gongmuwon	하
5630	celebrate	축하하다	\N	\N	\N	gongmuwon	하
5633	certify	증명하다	\N	\N	\N	gongmuwon	하
5647	chronic	상습적인	\N	\N	\N	gongmuwon	하
5646	chop	절단하다	\N	\N	\N	gongmuwon	하
5772	coverage	적용 범위	\N	\N	\N	gongmuwon	하
5774	cozy	아늑한	\N	\N	\N	gongmuwon	하
5775	crackdown	일제 단속; 법률의 엄격한 시행	\N	\N	\N	gongmuwon	하
5776	cramped	답답한	\N	\N	\N	gongmuwon	하
5777	crave	간청하다; 갈망하다	\N	\N	\N	gongmuwon	하
5778	creative	창조적인	\N	\N	\N	gongmuwon	하
5779	credulous	남의 말 등을 잘 믿는	\N	\N	\N	gongmuwon	중
5780	critique	비평	\N	\N	\N	gongmuwon	하
5781	crooked	마음이 비뚤어진	\N	\N	\N	gongmuwon	하
5782	crowd	군중	\N	\N	\N	gongmuwon	하
5783	crucial	결정적인	\N	\N	\N	gongmuwon	하
5784	crude	조잡한	\N	\N	\N	gongmuwon	하
5786	culminate	절정에 이르다	\N	\N	\N	gongmuwon	하
5787	culprit	범인	\N	\N	\N	gongmuwon	하
5788	cultivate	경작하다	\N	\N	\N	gongmuwon	하
5789	cumbersome	방해가 되는	\N	\N	\N	gongmuwon	하
5790	cumulate	쌓아 올리다	\N	\N	\N	gongmuwon	중
5791	curse	재앙의 원인	\N	\N	\N	gongmuwon	하
5793	custody	보호	\N	\N	\N	gongmuwon	하
5794	customarily	습관적으로	\N	\N	\N	gongmuwon	하
5795	cutlery	식탁용 날붙이	\N	\N	\N	gongmuwon	하
5796	dampen	축축해지다	\N	\N	\N	gongmuwon	하
5797	dart	쏘다	\N	\N	\N	gongmuwon	하
5798	deadlock	막다른 상태	\N	\N	\N	gongmuwon	하
5799	dearth	기근	\N	\N	\N	gongmuwon	하
5800	debacle	붕괴; 와해; 폭락	\N	\N	\N	gongmuwon	하
5801	decade	10년간	\N	\N	\N	gongmuwon	하
5805	decide	분명한; 단호한	\N	\N	\N	gongmuwon	하
5806	decipher	해독하다	\N	\N	\N	gongmuwon	하
5807	decline	거절하다	\N	\N	\N	gongmuwon	하
5808	decorate	장식하다	\N	\N	\N	gongmuwon	하
5809	deduct	빼다	\N	\N	\N	gongmuwon	하
5810	deference	존경	\N	\N	\N	gongmuwon	하
5811	defiant	반항적인	\N	\N	\N	gongmuwon	하
5812	deficiency	부족	\N	\N	\N	gongmuwon	하
5813	deft	손재주있는	\N	\N	\N	gongmuwon	하
5815	defuse	위기를 해제하다	\N	\N	\N	gongmuwon	하
5816	degenerate	퇴화하다; 타락하다	\N	\N	\N	gongmuwon	하
5817	degrade	좌천시키다	\N	\N	\N	gongmuwon	하
5818	deign	자신을 낮추어 ~하다	\N	\N	\N	gongmuwon	중
5822	delineate	윤곽을 그리다; 묘사하다	\N	\N	\N	gongmuwon	하
5823	delinquent	(직무)태만자	\N	\N	\N	gongmuwon	하
5824	delusive	현혹적인	\N	\N	\N	gongmuwon	중
5825	delve	철저히 조사하다	\N	\N	\N	gongmuwon	하
5826	demise	서거	\N	\N	\N	gongmuwon	하
5828	demonstrate	시위 운동을 하다	\N	\N	\N	gongmuwon	하
5829	denounce	비난하다	\N	\N	\N	gongmuwon	하
5830	dent	움푹 들어간 곳	\N	\N	\N	gongmuwon	하
5831	deny	부인하다	\N	\N	\N	gongmuwon	하
5832	dependable	신뢰할 수 있는	\N	\N	\N	gongmuwon	하
5833	deplete	다 써버리다	\N	\N	\N	gongmuwon	하
5834	deplorable	매우 나쁜	\N	\N	\N	gongmuwon	하
5835	depredation	약탈	\N	\N	\N	gongmuwon	중
5836	deride	비웃다	\N	\N	\N	gongmuwon	중
5837	descendant	자손	\N	\N	\N	gongmuwon	하
5839	desecrate	신성을 모독하다	\N	\N	\N	gongmuwon	중
5840	desert	사막	\N	\N	\N	gongmuwon	하
5841	designate	지명하다	\N	\N	\N	gongmuwon	하
5842	desolate	황량한	\N	\N	\N	gongmuwon	하
5843	despair	절망하다	\N	\N	\N	gongmuwon	하
5844	desperate	절망적인	\N	\N	\N	gongmuwon	하
5845	despondent	의기소침한	\N	\N	\N	gongmuwon	중
5846	despotic	전제적인	\N	\N	\N	gongmuwon	중
5847	destitute	빈곤한	\N	\N	\N	gongmuwon	하
5849	detach	떼어내다	\N	\N	\N	gongmuwon	하
5850	detain	기다리게 하다	\N	\N	\N	gongmuwon	하
5851	detect	발견하다	\N	\N	\N	gongmuwon	하
5852	deter	방해하다	\N	\N	\N	gongmuwon	하
5853	deteriorate	나쁘게 하다; 악화시키다	\N	\N	\N	gongmuwon	하
5854	detest	혐오하다	\N	\N	\N	gongmuwon	중
5855	detour	우회	\N	\N	\N	gongmuwon	하
5856	detrimental	손해를 입히는	\N	\N	\N	gongmuwon	하
5857	devaluate	가치를 감소시키다; 평가절하하다	\N	\N	\N	gongmuwon	기타
5858	devastate	유린하다	\N	\N	\N	gongmuwon	중
5859	deviate	벗어나다	\N	\N	\N	gongmuwon	하
5860	devour	게걸스레 먹다	\N	\N	\N	gongmuwon	하
5861	diagnosis	진찰	\N	\N	\N	gongmuwon	하
5862	dialect	방언; 지방 사투리; 통용어	\N	\N	\N	gongmuwon	하
5863	dichotomy	이분법	\N	\N	\N	gongmuwon	하
5864	differentiate	구별짓다	\N	\N	\N	gongmuwon	하
5865	diffuse	퍼뜨리다	\N	\N	\N	gongmuwon	하
5867	dilapidate	헐다	\N	\N	\N	gongmuwon	기타
5868	dilate	넓히다	\N	\N	\N	gongmuwon	중
5869	diligently	열심히	\N	\N	\N	gongmuwon	하
5870	dilute	묽게 하다	\N	\N	\N	gongmuwon	하
5871	dip	살짝 담그다	\N	\N	\N	gongmuwon	하
5872	disabled	지체 부자유한	\N	\N	\N	gongmuwon	하
5873	disappear	사라지다	\N	\N	\N	gongmuwon	하
5874	disappoint	실망시키다	\N	\N	\N	gongmuwon	하
5875	disavow	부정하다	\N	\N	\N	gongmuwon	중
5876	disband	해산시키다	\N	\N	\N	gongmuwon	중
5877	discard	버리다	\N	\N	\N	gongmuwon	하
5878	discernible	인식할 수 있는	\N	\N	\N	gongmuwon	하
5879	discharge	해고하다	\N	\N	\N	gongmuwon	하
5880	disciplinary	훈련상의	\N	\N	\N	gongmuwon	하
5757	correct	고치다	\N	\N	\N	gongmuwon	하
5770	courier	급사	\N	\N	\N	gongmuwon	하
5771	courteous	예의바른	\N	\N	\N	gongmuwon	하
5819	deject	낙심시키다	\N	\N	\N	gongmuwon	기타
5820	deleterious	(심신에) 해로운	\N	\N	\N	gongmuwon	하
5906	display	보여주다	\N	\N	\N	gongmuwon	하
5915	dissuade	그만두게 하다	\N	\N	\N	gongmuwon	하
5918	distraction	기분 전환	\N	\N	\N	gongmuwon	하
5923	docile	온순한	\N	\N	\N	gongmuwon	중
5924	dodge	교묘히 회피하다	\N	\N	\N	gongmuwon	하
5927	dominate	지배하다	\N	\N	\N	gongmuwon	하
5928	donate	기부하다; 증여하다	\N	\N	\N	gongmuwon	하
5932	drench	흠뻑 물에 적시다	\N	\N	\N	gongmuwon	중
5933	drift	표류하다	\N	\N	\N	gongmuwon	하
5938	drudgery	고된 일	\N	\N	\N	gongmuwon	중
5941	dwarf	난쟁이	\N	\N	\N	gongmuwon	하
5948	eccentric	별난	\N	\N	\N	gongmuwon	하
5955	elaborate	정성 들인; 잔손질이 많이 간; 정교한	\N	\N	\N	gongmuwon	하
5959	eliminate	~을 제외하다	\N	\N	\N	gongmuwon	하
5960	elucidate	명료하게 하다	\N	\N	\N	gongmuwon	하
5961	elude	교묘히 피하다	\N	\N	\N	gongmuwon	하
5967	emerge	나오다	\N	\N	\N	gongmuwon	하
5970	empower	권한을 부여하다	\N	\N	\N	gongmuwon	하
5976	endangered	멸종 위기에 처한	\N	\N	\N	gongmuwon	하
5977	endeavor	노력하다	\N	\N	\N	gongmuwon	하
5979	endorse	보증하다; 시인하다	\N	\N	\N	gongmuwon	하
5981	endurance	내구력; 인내	\N	\N	\N	gongmuwon	하
5982	enervate	기력을 빼앗다	\N	\N	\N	gongmuwon	기타
5983	enforce	시행하다	\N	\N	\N	gongmuwon	하
5992	ennui	권태	\N	\N	\N	gongmuwon	중
5993	enormous	거대한	\N	\N	\N	gongmuwon	하
5996	entail	일으키다	\N	\N	\N	gongmuwon	하
5999	entice	꾀어서 ~시키다; 부추기다; 유혹하다	\N	\N	\N	gongmuwon	하
6001	entity	실체	\N	\N	\N	gongmuwon	하
6002	entrepreneur	기업가	\N	\N	\N	gongmuwon	하
6014	esteem	존중하다	\N	\N	\N	gongmuwon	하
6015	esthetic	미의; 심미적인	\N	\N	\N	gongmuwon	하
6029	exaggerate	지나치게 강조하다; 과장하다	\N	\N	\N	gongmuwon	하
6032	exception	제외	\N	\N	\N	gongmuwon	하
6038	exert	열심히 노력하다	\N	\N	\N	gongmuwon	하
6039	exhaustively	철저하게	\N	\N	\N	gongmuwon	중
6044	expediency	편법; 편의주의	\N	\N	\N	gongmuwon	하
6047	explicit	명백한	\N	\N	\N	gongmuwon	하
6048	exploit	개척하다	\N	\N	\N	gongmuwon	하
6053	extortion	강요	\N	\N	\N	gongmuwon	하
6055	extraneous	비본질적인	\N	\N	\N	gongmuwon	하
6060	fable	우화	\N	\N	\N	gongmuwon	하
6063	facility	재주	\N	\N	\N	gongmuwon	하
6064	faint	희미한	\N	\N	\N	gongmuwon	하
6065	fairly	꽤	\N	\N	\N	gongmuwon	하
6071	fanatic	열광자	\N	\N	\N	gongmuwon	하
6078	favor	호의	\N	\N	\N	gongmuwon	하
6079	feasible	실행할 수 있는; 가능한	\N	\N	\N	gongmuwon	하
6081	feign	~을 가장하다	\N	\N	\N	gongmuwon	중
6082	felicity	더할 수 없는 행복; 경사	\N	\N	\N	gongmuwon	하
6086	fiasco	큰 실수; 대실패	\N	\N	\N	gongmuwon	하
6088	fictitious	거짓의	\N	\N	\N	gongmuwon	하
6093	firsthand	직젖ㅂ의	\N	\N	\N	gongmuwon	하
6100	flee	도망하다; 피하다	\N	\N	\N	gongmuwon	하
6108	forbear	~을 삼가다; 참다; 억제하다	\N	\N	\N	gongmuwon	중
6111	foreboding	예언	\N	\N	\N	gongmuwon	중
6112	forerunner	선조	\N	\N	\N	gongmuwon	하
6113	forestall	~을 미리 막다	\N	\N	\N	gongmuwon	중
6114	forfeit	상실	\N	\N	\N	gongmuwon	하
6121	fortify	강화하다	\N	\N	\N	gongmuwon	하
6124	founder	실패하다	\N	\N	\N	gongmuwon	하
6129	frenzied	열광적인; 광포한	\N	\N	\N	gongmuwon	하
6134	fruitful	결실이 많은; 비옥한; 수익이 많은	\N	\N	\N	gongmuwon	하
6136	fugitive	도망자	\N	\N	\N	gongmuwon	하
6137	fulfill	이행하다	\N	\N	\N	gongmuwon	하
6141	furnish	공급하다	\N	\N	\N	gongmuwon	하
6142	furthermore	더욱이	\N	\N	\N	gongmuwon	하
6143	furtive	몰래 하는	\N	\N	\N	gongmuwon	중
6147	galvanize	기운이 나게 하다; 격려하여 ~하게 하다	\N	\N	\N	gongmuwon	중
6148	gape	놀라서 입을 딱 벌리다; 하품하다	\N	\N	\N	gongmuwon	중
6150	gasp	헐떡거리다	\N	\N	\N	gongmuwon	하
6156	germane	밀접한 관계가 있는	\N	\N	\N	gongmuwon	하
6157	gestation	임신	\N	\N	\N	gongmuwon	하
6158	giddy	현기증나는	\N	\N	\N	gongmuwon	하
6163	gloat	고소한 듯이 바라보다	\N	\N	\N	gongmuwon	중
6167	grasp	붙잡다	\N	\N	\N	gongmuwon	하
6168	gratification	만족	\N	\N	\N	gongmuwon	하
6172	grip	꽉 잡다	\N	\N	\N	gongmuwon	하
6174	grown-up	어른	\N	\N	\N	gongmuwon	기타
6175	grudge	원한	\N	\N	\N	gongmuwon	하
6177	guarantee	보증하다; 확언하다	\N	\N	\N	gongmuwon	하
6180	haggard	여윈	\N	\N	\N	gongmuwon	하
6181	hail	촨호하며 맞이하다	\N	\N	\N	gongmuwon	하
6193	harmonious	조화된	\N	\N	\N	gongmuwon	하
6196	harsh	거친	\N	\N	\N	gongmuwon	하
6202	hearten	기운나게 하다	\N	\N	\N	gongmuwon	기타
6203	heart-rending	가슴이 찢어질 듯한	\N	\N	\N	gongmuwon	기타
6204	hectic	흥분한	\N	\N	\N	gongmuwon	하
6205	heed	주의하다	\N	\N	\N	gongmuwon	하
6206	hefty	크고 무거운	\N	\N	\N	gongmuwon	하
6209	heresy	이단	\N	\N	\N	gongmuwon	하
6210	hideous	소름끼치는	\N	\N	\N	gongmuwon	하
6211	hierarchy	계급제(도)	\N	\N	\N	gongmuwon	하
6215	horn	뿔; 촉수	\N	\N	\N	gongmuwon	하
6219	hub	축; 중심	\N	\N	\N	gongmuwon	하
6223	hunch	예감	\N	\N	\N	gongmuwon	하
6228	hypnosis	최면 상태; 최면술	\N	\N	\N	gongmuwon	하
6229	hypodermic	피하의	\N	\N	\N	gongmuwon	중
5887	discrimination	구별	\N	\N	\N	gongmuwon	하
5904	disperse	흩뜨리다	\N	\N	\N	gongmuwon	하
5905	displace	바꾸어 놓다	\N	\N	\N	gongmuwon	하
5890	disfigure	외관을 손상하다	\N	\N	\N	gongmuwon	중
5895	disloyal	불충한	\N	\N	\N	gongmuwon	중
5896	dismal	음침한	\N	\N	\N	gongmuwon	하
5897	dismay	실망(낙담)시키다	\N	\N	\N	gongmuwon	하
5902	dispel	헤쳐 없애다	\N	\N	\N	gongmuwon	하
5907	displease	불쾌하게 하다	\N	\N	\N	gongmuwon	중
5908	dispose	배치하다	\N	\N	\N	gongmuwon	하
5909	disqualify	실격시키다	\N	\N	\N	gongmuwon	하
5920	divergent	갈라지는	\N	\N	\N	gongmuwon	하
5921	diversity	다양성	\N	\N	\N	gongmuwon	하
5922	divulge	누설하다	\N	\N	\N	gongmuwon	하
5926	domestic	국내의; 국산의 가정의	\N	\N	\N	gongmuwon	하
5929	dormant	휴면 상태의	\N	\N	\N	gongmuwon	하
5934	drive	몰다	\N	\N	\N	gongmuwon	하
5937	drowsy	졸리는	\N	\N	\N	gongmuwon	하
5950	ecology	생태학; 인간 생태학	\N	\N	\N	gongmuwon	하
5951	edible	먹을 수 있는	\N	\N	\N	gongmuwon	하
5953	effect	결과; 효과	\N	\N	\N	gongmuwon	하
5956	elastic	탄력 있는	\N	\N	\N	gongmuwon	하
5957	elegant	품위있는	\N	\N	\N	gongmuwon	하
5958	eligible	적격의	\N	\N	\N	gongmuwon	하
5962	emancipate	해방하다	\N	\N	\N	gongmuwon	중
5968	eminent	저명한; 훌륭한; (지위	\N	\N	\N	gongmuwon	하
5969	emphasize	강조하다	\N	\N	\N	gongmuwon	하
5971	emulate	~을 흉내내다	\N	\N	\N	gongmuwon	하
5972	encompass	포함하다	\N	\N	\N	gongmuwon	하
5978	endemic	그 지방 특산의	\N	\N	\N	gongmuwon	하
5986	engross	~에 열중하게 하다	\N	\N	\N	gongmuwon	중
5990	enlighten	계몽하다	\N	\N	\N	gongmuwon	하
6000	entitle	권리(자격)을 주다(to)	\N	\N	\N	gongmuwon	하
6003	enumerate	열거하다; 낱낱이 세다; 계산하다	\N	\N	\N	gongmuwon	하
6005	ephemeral	순식간의	\N	\N	\N	gongmuwon	하
6006	epitomize	~의 축도이다	\N	\N	\N	gongmuwon	중
6008	equivalent	동등한	\N	\N	\N	gongmuwon	하
6010	eradicate	뿌리째 뽑다	\N	\N	\N	gongmuwon	하
6011	erode	부식하다	\N	\N	\N	gongmuwon	하
6016	estimate	평가하다	\N	\N	\N	gongmuwon	하
6017	estrangement	이간	\N	\N	\N	gongmuwon	중
6020	ethnic	인종의	\N	\N	\N	gongmuwon	하
6021	euthanasia	안락사	\N	\N	\N	gongmuwon	하
6024	evaporate	수분을 빼다	\N	\N	\N	gongmuwon	하
6028	evolve	서서히 발전시키다	\N	\N	\N	gongmuwon	하
6034	excoriate	혹평하다	\N	\N	\N	gongmuwon	상
6035	excretion	배설	\N	\N	\N	gongmuwon	하
6040	exhilarate	기분을 들뜨게 하다	\N	\N	\N	gongmuwon	기타
6041	exhortation	간곡한 권고	\N	\N	\N	gongmuwon	하
6042	exonerate	무죄임을 입증하다	\N	\N	\N	gongmuwon	중
6045	experimental	실험의	\N	\N	\N	gongmuwon	하
6046	expire	(문서	\N	\N	\N	gongmuwon	하
6051	exterminate	멸종시키다	\N	\N	\N	gongmuwon	중
6056	extreme	극심한	\N	\N	\N	gongmuwon	하
6061	fabricate	만들다	\N	\N	\N	gongmuwon	하
6062	facet	일면	\N	\N	\N	gongmuwon	하
6066	fake	위조하다; 꾸며내다	\N	\N	\N	gongmuwon	하
6072	far-fetched	부자연스러운	\N	\N	\N	gongmuwon	기타
6075	fathom	헤아리다	\N	\N	\N	gongmuwon	하
6076	fatuous	얼빠진; 어리석은	\N	\N	\N	gongmuwon	중
6077	faulty	결점이 있는	\N	\N	\N	gongmuwon	하
6096	flank	옆구리	\N	\N	\N	gongmuwon	하
6101	flippant	경박한	\N	\N	\N	gongmuwon	중
6103	flourish	번창하다	\N	\N	\N	gongmuwon	하
6106	folly	어리석은 행동	\N	\N	\N	gongmuwon	하
6115	forge	위조하다	\N	\N	\N	gongmuwon	하
6116	formative	조형의; 형성되는	\N	\N	\N	gongmuwon	하
6119	forthcoming	곧 올	\N	\N	\N	gongmuwon	하
6122	foster	양육하다	\N	\N	\N	gongmuwon	하
6125	fracture	부러뜨리다; 삐다	\N	\N	\N	gongmuwon	하
6126	fragile	부서지기 쉬운	\N	\N	\N	gongmuwon	하
6127	fraud	사기	\N	\N	\N	gongmuwon	하
6131	frill	사치; 불필요한 것	\N	\N	\N	gongmuwon	중
6132	frivolous	천박한	\N	\N	\N	gongmuwon	하
6145	gainful	벌이가 되는	\N	\N	\N	gongmuwon	중
6149	garrulous	말 많은	\N	\N	\N	gongmuwon	중
6152	gem	보석; 보석처럼 귀중한 것	\N	\N	\N	gongmuwon	하
6159	gingerly	몹시 조심스럽게	\N	\N	\N	gongmuwon	중
6160	gist	요점	\N	\N	\N	gongmuwon	하
6161	glide	미끄러지다	\N	\N	\N	gongmuwon	하
6162	glimpse	흘끗 봄	\N	\N	\N	gongmuwon	하
6166	grandeur	웅장	\N	\N	\N	gongmuwon	하
6169	greed	대식	\N	\N	\N	gongmuwon	하
6170	gregarious	사교적인	\N	\N	\N	gongmuwon	하
6178	gullible	잘 속는; 속기 쉬운	\N	\N	\N	gongmuwon	하
6184	hammer out	애써 생각해 내다; 머리를 짜내 풀다; 해결하다	\N	\N	\N	gongmuwon	기타
6185	hamper	방해하다	\N	\N	\N	gongmuwon	하
6186	handful	한움큼	\N	\N	\N	gongmuwon	하
6190	harassing	괴롭히는	\N	\N	\N	gongmuwon	하
6191	harbor	숨겨 주다; 생각을 품다	\N	\N	\N	gongmuwon	하
6197	harvest	수확하다	\N	\N	\N	gongmuwon	하
6198	haughty	오만한	\N	\N	\N	gongmuwon	하
6199	haven	항구	\N	\N	\N	gongmuwon	하
6200	havoc	파괴	\N	\N	\N	gongmuwon	하
6201	hearsay	소문	\N	\N	\N	gongmuwon	하
6207	helm	지배	\N	\N	\N	gongmuwon	하
5940	dull	지루한	\N	\N	\N	gongmuwon	하
5884	discourteous	무례한	\N	\N	\N	gongmuwon	중
5889	disentangle	얽힌 것을 풀다	\N	\N	\N	gongmuwon	중
5911	disrupt	붕괴시키다; 분열시키다	\N	\N	\N	gongmuwon	하
5912	disseminate	흩뿌리다; 퍼뜨리다	\N	\N	\N	gongmuwon	하
5893	disinformation	허위 정보	\N	\N	\N	gongmuwon	하
5898	dismiss	해고(면직)하다	\N	\N	\N	gongmuwon	하
5900	disparage	얕보다	\N	\N	\N	gongmuwon	중
5901	disparity	서로 다름	\N	\N	\N	gongmuwon	하
5910	disregard	무시하다	\N	\N	\N	gongmuwon	하
5913	dissimilar	~와 비슷하지 않은	\N	\N	\N	gongmuwon	하
5914	dissipate	흩뜨리다	\N	\N	\N	gongmuwon	하
5917	distorted	일그러진	\N	\N	\N	gongmuwon	하
5919	distribute	분배하다	\N	\N	\N	gongmuwon	하
5925	domain	지역	\N	\N	\N	gongmuwon	하
5930	dose	1회 복용량	\N	\N	\N	gongmuwon	하
5931	drastic	격렬한	\N	\N	\N	gongmuwon	하
5936	drizzle	이슬비가 내리다	\N	\N	\N	gongmuwon	하
5939	due	지불 기일이 된; 적정한	\N	\N	\N	gongmuwon	하
5942	dwell	살다	\N	\N	\N	gongmuwon	하
5943	dwindle	줄이다	\N	\N	\N	gongmuwon	중
5946	earmark	지정하다	\N	\N	\N	gongmuwon	중
5952	efface	지우다	\N	\N	\N	gongmuwon	중
5963	embark	착수하다; 종사하다	\N	\N	\N	gongmuwon	하
5964	embellish	아름답게 하다; 장식하다; (문장을)꾸미다	\N	\N	\N	gongmuwon	하
5965	emblem	상징	\N	\N	\N	gongmuwon	하
5966	embrace	포함하다	\N	\N	\N	gongmuwon	하
5974	encroach	침략하다	\N	\N	\N	gongmuwon	중
5975	encumber	방해하다	\N	\N	\N	gongmuwon	중
5980	endow	기금을 기부하다	\N	\N	\N	gongmuwon	중
5985	engender	일으키다	\N	\N	\N	gongmuwon	하
5987	enhance	(질	\N	\N	\N	gongmuwon	하
5988	enigma	수수께끼	\N	\N	\N	gongmuwon	하
5989	enkindle	불을 붙이다; (감정	\N	\N	\N	gongmuwon	기타
5991	enmesh	빠뜨리다	\N	\N	\N	gongmuwon	기타
5994	enrich	부유하게 하다	\N	\N	\N	gongmuwon	하
5995	ensue	뒤이어 일어나다	\N	\N	\N	gongmuwon	하
5998	enthusiastic	열광적인	\N	\N	\N	gongmuwon	하
6004	environment	환경	\N	\N	\N	gongmuwon	하
6007	equanimity	평정; 침착	\N	\N	\N	gongmuwon	중
6012	erudite	학식있는	\N	\N	\N	gongmuwon	하
6013	escape	달아나다	\N	\N	\N	gongmuwon	하
6018	eternal	영원한	\N	\N	\N	gongmuwon	하
6019	ethics	윤리	\N	\N	\N	gongmuwon	하
6022	evacuate	비우다	\N	\N	\N	gongmuwon	하
6023	evade	피하다	\N	\N	\N	gongmuwon	하
6026	evince	명시하다	\N	\N	\N	gongmuwon	중
6027	evoke	되살려내다	\N	\N	\N	gongmuwon	하
6030	exasperate	격분시키다	\N	\N	\N	gongmuwon	중
6031	exceed	(한도를) 넘다	\N	\N	\N	gongmuwon	하
6036	exemplary	본이 되는	\N	\N	\N	gongmuwon	하
6037	exempt	면제하다	\N	\N	\N	gongmuwon	하
6043	exotic	이국적인	\N	\N	\N	gongmuwon	하
6049	exponent	주창자	\N	\N	\N	gongmuwon	하
6052	extinct	멸종된	\N	\N	\N	gongmuwon	하
6054	extract	뽑다	\N	\N	\N	gongmuwon	하
6057	extricate	구해내다	\N	\N	\N	gongmuwon	중
6059	exuberant	(활력	\N	\N	\N	gongmuwon	하
6068	fallout	방사능 낙진	\N	\N	\N	gongmuwon	하
6070	famine	식량부족	\N	\N	\N	gongmuwon	하
6073	fascinate	매혹하다	\N	\N	\N	gongmuwon	중
6074	fastidious	까다로운	\N	\N	\N	gongmuwon	중
6080	feeble	연약한	\N	\N	\N	gongmuwon	하
6085	fervent	열렬한	\N	\N	\N	gongmuwon	하
6089	fidelity	충실	\N	\N	\N	gongmuwon	하
6090	fiery	화염의	\N	\N	\N	gongmuwon	하
6091	figurative	비유적인; 상징적인	\N	\N	\N	gongmuwon	하
6092	figurehead	명목상의 두목	\N	\N	\N	gongmuwon	중
6094	flair	천부적인 재능	\N	\N	\N	gongmuwon	하
6095	flake	얇은 조각	\N	\N	\N	gongmuwon	하
6098	flavor	특징	\N	\N	\N	gongmuwon	하
6099	flaw	결점	\N	\N	\N	gongmuwon	하
6102	flood	범람시키다	\N	\N	\N	gongmuwon	하
6104	fluctuate	변동하다	\N	\N	\N	gongmuwon	하
6105	flush	홍조를 띠다	\N	\N	\N	gongmuwon	하
6107	forage	마초	\N	\N	\N	gongmuwon	하
6110	forebear	조상	\N	\N	\N	gongmuwon	중
6117	formidable	가공할	\N	\N	\N	gongmuwon	하
6118	formulate	체계적으로 말하다	\N	\N	\N	gongmuwon	하
6120	forthright	곧게 나아가는; 솔직한	\N	\N	\N	gongmuwon	하
6123	foul	더러운	\N	\N	\N	gongmuwon	하
6130	frequent	자주 일어나는	\N	\N	\N	gongmuwon	하
6133	frugal	절약하는	\N	\N	\N	gongmuwon	하
6138	full	완전한; 최고조의	\N	\N	\N	gongmuwon	하
6139	full-blown	만발한	\N	\N	\N	gongmuwon	기타
6140	furious	성내어 날뛰는	\N	\N	\N	gongmuwon	하
6144	futile	효과없는; 무익한	\N	\N	\N	gongmuwon	하
6146	galling	짜증나게 하는	\N	\N	\N	gongmuwon	중
6154	genocide	특정 인종	\N	\N	\N	gongmuwon	하
6155	genuine	진짜의	\N	\N	\N	gongmuwon	하
6164	gloomy	우울한	\N	\N	\N	gongmuwon	하
6165	gradual	점차적인	\N	\N	\N	gongmuwon	하
6171	grim	불쾌한	\N	\N	\N	gongmuwon	하
6173	grotesque	괴상한	\N	\N	\N	gongmuwon	하
6176	grueling	녹초로 만드는	\N	\N	\N	gongmuwon	하
6179	habitable	거주할 수 있는	\N	\N	\N	gongmuwon	하
6183	hamlet	작은 마을	\N	\N	\N	gongmuwon	하
6188	hangar	격납고; 곳간	\N	\N	\N	gongmuwon	하
6192	hardy	단련된	\N	\N	\N	gongmuwon	하
6194	harness	동력화하다	\N	\N	\N	gongmuwon	하
6195	harp	같은 말을 자꾸 되풀이 하다	\N	\N	\N	gongmuwon	하
6208	hereditary	유전성의	\N	\N	\N	gongmuwon	하
6213	homogeneous	같은 종류의 것으로 된	\N	\N	\N	gongmuwon	하
6214	horizontal	수평면의; 평면의	\N	\N	\N	gongmuwon	하
6217	hospitable	손님 접대를 잘 하는	\N	\N	\N	gongmuwon	하
5886	discrepancy	모순	\N	\N	\N	gongmuwon	하
5888	disdain	경멸하다	\N	\N	\N	gongmuwon	하
5891	disgrace	불명예	\N	\N	\N	gongmuwon	하
6226	hybrid	잡종의; 혼성의	\N	\N	\N	gongmuwon	하
6232	ignominious	불명예스러운	\N	\N	\N	gongmuwon	중
6240	immortal	죽지 않는; 불멸의	\N	\N	\N	gongmuwon	하
6245	impatient	성급한	\N	\N	\N	gongmuwon	하
6258	impiety	신앙심이 없음; 불경	\N	\N	\N	gongmuwon	중
6259	implacable	달래기 어려운	\N	\N	\N	gongmuwon	중
6260	implement	이행(실행)하다	\N	\N	\N	gongmuwon	하
6266	imprint	도장을 찍다; 깊은 인상을 주다	\N	\N	\N	gongmuwon	하
6270	inactive	활동하지 않는	\N	\N	\N	gongmuwon	하
6272	inadvertently	아무 생각 없이	\N	\N	\N	gongmuwon	하
6276	incapacitate	무능력하게 하다	\N	\N	\N	gongmuwon	중
6281	inconsistent	일치하지 않는	\N	\N	\N	gongmuwon	하
6288	indifferent	무관심한	\N	\N	\N	gongmuwon	하
6292	indoors	옥내에서	\N	\N	\N	gongmuwon	하
6293	induce	권유하다; 설득하여 ~시키다	\N	\N	\N	gongmuwon	하
6295	inept	서투른	\N	\N	\N	gongmuwon	하
6298	inexorable	냉혹한	\N	\N	\N	gongmuwon	중
6299	infer	추론하다	\N	\N	\N	gongmuwon	하
6301	infinite	무한한	\N	\N	\N	gongmuwon	하
6303	infraction	위반	\N	\N	\N	gongmuwon	하
6305	initially	처음에	\N	\N	\N	gongmuwon	하
6309	innuendo	풍자	\N	\N	\N	gongmuwon	하
6316	insidious	잠행성의	\N	\N	\N	gongmuwon	하
6317	insight	통찰력	\N	\N	\N	gongmuwon	하
6318	insignificance	무의미	\N	\N	\N	gongmuwon	중
6322	inspiration	자극	\N	\N	\N	gongmuwon	하
6325	instill	(사상	\N	\N	\N	gongmuwon	하
6329	insuperable	극복하기 어려운	\N	\N	\N	gongmuwon	중
6333	intent	의도	\N	\N	\N	gongmuwon	하
6334	inter	매장하다	\N	\N	\N	gongmuwon	하
6340	interrupt	중단시키다	\N	\N	\N	gongmuwon	하
6341	intertwine	서로 얽히게 하다	\N	\N	\N	gongmuwon	중
6345	intrepid	용맹한	\N	\N	\N	gongmuwon	하
6348	intrinsic	본래 갖추어진	\N	\N	\N	gongmuwon	하
6349	inundate	범람시키다	\N	\N	\N	gongmuwon	중
6352	invaluable	값을 헤아릴 수 없는	\N	\N	\N	gongmuwon	하
6355	invincible	정복할 수 없는	\N	\N	\N	gongmuwon	하
6358	ironic	반어적인	\N	\N	\N	gongmuwon	하
6359	irrational	비이성적인	\N	\N	\N	gongmuwon	하
6367	jam	쑤셔 넣다	\N	\N	\N	gongmuwon	하
6368	jaundiced	편견을 가진; 비뚤어진	\N	\N	\N	gongmuwon	중
6372	justly	바르게	\N	\N	\N	gongmuwon	하
6373	keen	열심인	\N	\N	\N	gongmuwon	하
6383	latent	숨은	\N	\N	\N	gongmuwon	하
6392	legitimate	합법적인	\N	\N	\N	gongmuwon	하
6398	liability	부채	\N	\N	\N	gongmuwon	하
6401	linguist	언어학자; 외국어에 능통한 사람	\N	\N	\N	gongmuwon	하
6405	livelihood	생계	\N	\N	\N	gongmuwon	하
6409	locally	국지적으로	\N	\N	\N	gongmuwon	하
6413	loom	흐릿하게 보이다	\N	\N	\N	gongmuwon	하
6414	loquacious	수다스러운	\N	\N	\N	gongmuwon	중
6419	luster	광택	\N	\N	\N	gongmuwon	하
6420	magnitude	크기	\N	\N	\N	gongmuwon	하
6424	malign	해로운	\N	\N	\N	gongmuwon	중
6425	malnourished	영양 불량(실조)의	\N	\N	\N	gongmuwon	하
6428	manifest	명백히 하다	\N	\N	\N	gongmuwon	하
6432	marshal	정렬시키다	\N	\N	\N	gongmuwon	하
6433	master	정통하다	\N	\N	\N	gongmuwon	하
6434	masterpiece	걸작	\N	\N	\N	gongmuwon	하
6440	meager	meagre/빈약한	\N	\N	\N	gongmuwon	하
6444	meddling	참견하는	\N	\N	\N	gongmuwon	하
6448	menace	위협하다	\N	\N	\N	gongmuwon	하
6449	mendacity	허위	\N	\N	\N	gongmuwon	중
6452	mere	단지 ~에 불과한	\N	\N	\N	gongmuwon	하
6453	merge	병합하다; 융합하다(시키다)	\N	\N	\N	gongmuwon	하
6458	migrate	이동하다	\N	\N	\N	gongmuwon	하
6461	minister	봉사하다	\N	\N	\N	gongmuwon	하
6462	minute	미소한	\N	\N	\N	gongmuwon	하
6468	moan	신음하다	\N	\N	\N	gongmuwon	하
6470	moderate	절제있는	\N	\N	\N	gongmuwon	하
6471	modest	겸손한	\N	\N	\N	gongmuwon	하
6475	momentous	중대한	\N	\N	\N	gongmuwon	하
6476	monetary	금전의; 금융의	\N	\N	\N	gongmuwon	하
6477	monk	수도사; 성직자	\N	\N	\N	gongmuwon	하
6482	mouthful	한 입 가득; 소량; 중요한 말	\N	\N	\N	gongmuwon	하
6487	mute	무언의	\N	\N	\N	gongmuwon	하
6488	mutilate	절단하다	\N	\N	\N	gongmuwon	중
6489	mutual	상호간의; 공동의	\N	\N	\N	gongmuwon	하
6493	neat	정돈된	\N	\N	\N	gongmuwon	하
6495	necessary	필수적인; 필연적인	\N	\N	\N	gongmuwon	하
6496	needy	가난한	\N	\N	\N	gongmuwon	하
6500	nervous	신경질적인	\N	\N	\N	gongmuwon	하
6504	nostalgia	향수	\N	\N	\N	gongmuwon	하
6505	noteworthy	주목할 만한	\N	\N	\N	gongmuwon	하
6509	novice	초심자	\N	\N	\N	gongmuwon	하
6510	nullify	무효로 하다	\N	\N	\N	gongmuwon	하
6513	obliquely	비스듬히	\N	\N	\N	gongmuwon	중
6517	obstinate	완고한	\N	\N	\N	gongmuwon	하
6522	offense	offence/위반	\N	\N	\N	gongmuwon	하
6523	officious	참견하기 좋아하는	\N	\N	\N	gongmuwon	중
6526	onset	착수	\N	\N	\N	gongmuwon	하
6528	opaque	불투명한; 분명하지 않은; 우둔한; 암흑	\N	\N	\N	gongmuwon	하
6530	opposite	마주 보고 있는; 반대편의	\N	\N	\N	gongmuwon	하
6533	opulent	부유한; 풍부한; 무성한	\N	\N	\N	gongmuwon	하
6535	ordeal	시련	\N	\N	\N	gongmuwon	하
6538	ostensible	표면상의	\N	\N	\N	gongmuwon	중
6216	horrid	아주 싫은	\N	\N	\N	gongmuwon	하
6284	increment	증가	\N	\N	\N	gongmuwon	하
6218	hostile	적의 있는	\N	\N	\N	gongmuwon	하
6225	hush	입 다물게 하다	\N	\N	\N	gongmuwon	하
6231	identify	확인하다	\N	\N	\N	gongmuwon	하
6233	illustrious	저명한	\N	\N	\N	gongmuwon	하
6235	imbecility	정신 박약	\N	\N	\N	gongmuwon	중
6236	imbibe	마신다	\N	\N	\N	gongmuwon	중
6237	immaculate	오점이 없는; 결점없는; 순결한	\N	\N	\N	gongmuwon	하
6238	imminent	임박한	\N	\N	\N	gongmuwon	하
6241	immune	면역성의	\N	\N	\N	gongmuwon	하
6243	impair	약화시키다; 해치다	\N	\N	\N	gongmuwon	하
6244	impartial	치우치지 않은	\N	\N	\N	gongmuwon	하
6247	impeccable	죄 없는; 결점 없는 나무랄 데 없는	\N	\N	\N	gongmuwon	하
6251	imperceptible	지가할 수 없는	\N	\N	\N	gongmuwon	중
6252	imperial	제국의	\N	\N	\N	gongmuwon	하
6254	imperturbable	침착한	\N	\N	\N	gongmuwon	중
6255	impervious	통과시키지 않는	\N	\N	\N	gongmuwon	하
6257	impetus	움직이게 하는 힘	\N	\N	\N	gongmuwon	하
6261	imply	암시하다	\N	\N	\N	gongmuwon	하
6262	impolite	버릇없는; 무례한	\N	\N	\N	gongmuwon	중
6269	impute	~의 탓으로 하다	\N	\N	\N	gongmuwon	중
6271	inadequate	부적당한	\N	\N	\N	gongmuwon	하
6275	incalculable	헤아릴 수 없는	\N	\N	\N	gongmuwon	중
6278	incidence	발생	\N	\N	\N	gongmuwon	하
6282	inconstant	일정하지 않은	\N	\N	\N	gongmuwon	중
6283	incontrovertible	논쟁의 여지가 없이 명백한	\N	\N	\N	gongmuwon	중
6287	indelible	지울 수 없는; 잊혀지지 않는	\N	\N	\N	gongmuwon	하
6294	industrious	근면한	\N	\N	\N	gongmuwon	하
6296	inertia	활발치 못함	\N	\N	\N	gongmuwon	하
6300	inferior	열등한	\N	\N	\N	gongmuwon	하
6302	inflate	팽창하다	\N	\N	\N	gongmuwon	하
6304	inhibition	금지	\N	\N	\N	gongmuwon	하
6308	innovation	혁신	\N	\N	\N	gongmuwon	하
6312	ins and outs	세부곡절	\N	\N	\N	gongmuwon	기타
6313	insatiable	만족할 줄 모르는	\N	\N	\N	gongmuwon	하
6320	insolvent	지불 불능한	\N	\N	\N	gongmuwon	하
6328	insulting	모욕적인	\N	\N	\N	gongmuwon	하
6331	intellectual	지적인	\N	\N	\N	gongmuwon	하
6332	intemittent	간헐적인	\N	\N	\N	gongmuwon	기타
6336	intermediate	중간의; 중간에 일어나는	\N	\N	\N	gongmuwon	하
6342	intervene	중재하다; 간섭하다	\N	\N	\N	gongmuwon	하
6343	intimate	암시하다	\N	\N	\N	gongmuwon	하
6344	intimidate	협박하다	\N	\N	\N	gongmuwon	하
6350	inure	익히다	\N	\N	\N	gongmuwon	중
6354	invigorating	기운나게 하는	\N	\N	\N	gongmuwon	하
6357	iridescence	무지개 빛깔(보는 각도에 따라 색이 변함)	\N	\N	\N	gongmuwon	중
6364	irritate	화나게 하다	\N	\N	\N	gongmuwon	하
6369	jeopardy	위험	\N	\N	\N	gongmuwon	하
6370	jot	간단히 적어두다	\N	\N	\N	gongmuwon	하
6374	kidnap	유괴하다	\N	\N	\N	gongmuwon	하
6375	kitschy	천박한; 대중에게 영합하는	\N	\N	\N	gongmuwon	중
6376	knockabout	소형 요트	\N	\N	\N	gongmuwon	중
6380	languid	나른한	\N	\N	\N	gongmuwon	중
6382	lash	묶다	\N	\N	\N	gongmuwon	하
6390	leftover	나머지	\N	\N	\N	gongmuwon	하
6391	legible	읽기 쉬운	\N	\N	\N	gongmuwon	하
6393	leisurely	느긋한	\N	\N	\N	gongmuwon	하
6397	lethargic	무기력한	\N	\N	\N	gongmuwon	중
6400	lifeless	생명이 없는	\N	\N	\N	gongmuwon	하
6402	listless	생기가 없는	\N	\N	\N	gongmuwon	중
6406	liver	간장	\N	\N	\N	gongmuwon	하
6407	load	적재 화물	\N	\N	\N	gongmuwon	하
6408	loathe	몹시 싫어하다; 질색하다	\N	\N	\N	gongmuwon	하
6410	logic	논리학	\N	\N	\N	gongmuwon	하
6411	longevity	장수	\N	\N	\N	gongmuwon	하
6422	maladroit	서투른	\N	\N	\N	gongmuwon	중
6423	malady	병	\N	\N	\N	gongmuwon	하
6426	manage	경영하다	\N	\N	\N	gongmuwon	하
6429	manifold	가지각색의	\N	\N	\N	gongmuwon	하
6439	maximum	최대한	\N	\N	\N	gongmuwon	하
6441	mean	비열한	\N	\N	\N	gongmuwon	하
6442	measure	측정하다	\N	\N	\N	gongmuwon	하
6443	mechanism	기계 장치	\N	\N	\N	gongmuwon	하
6445	meditate	숙고하다	\N	\N	\N	gongmuwon	하
6446	meet	만족시키다	\N	\N	\N	gongmuwon	하
6447	memorable	기억할 만한	\N	\N	\N	gongmuwon	하
6454	messy	어질러진	\N	\N	\N	gongmuwon	하
6455	metamorphosis	변형	\N	\N	\N	gongmuwon	하
6459	milestone	이정표	\N	\N	\N	gongmuwon	하
6460	minimize	최소화하다	\N	\N	\N	gongmuwon	하
6463	misconception	잘못된 생각	\N	\N	\N	gongmuwon	하
6464	miserly	인색한	\N	\N	\N	gongmuwon	중
6467	mnemonic	기억을 돕는; 기억(술)의	\N	\N	\N	gongmuwon	하
6481	moribund	다 죽어가는	\N	\N	\N	gongmuwon	중
6485	mustache	코밑수염	\N	\N	\N	gongmuwon	하
6486	mutable	변하기 쉬운	\N	\N	\N	gongmuwon	하
6490	nadir	밑바닥	\N	\N	\N	gongmuwon	하
6491	narrate	이야기하다	\N	\N	\N	gongmuwon	중
6497	negation	부정	\N	\N	\N	gongmuwon	하
6498	negligence	태만	\N	\N	\N	gongmuwon	하
6499	neighboring	이웃의	\N	\N	\N	gongmuwon	하
6506	notion	의견; 개념	\N	\N	\N	gongmuwon	하
6507	notorious	유명한	\N	\N	\N	gongmuwon	하
6518	obviate	제거하다	\N	\N	\N	gongmuwon	중
6519	occupation	직업	\N	\N	\N	gongmuwon	하
6520	occur	(일이) 일어나다	\N	\N	\N	gongmuwon	하
6221	humble	겸손한	\N	\N	\N	gongmuwon	하
6227	hyperbole	과장(법)	\N	\N	\N	gongmuwon	하
6230	ideal	이상적인	\N	\N	\N	gongmuwon	하
6249	impel	몰아대다	\N	\N	\N	gongmuwon	중
6250	imperative	피할 수 없는	\N	\N	\N	gongmuwon	하
6263	impoverished	가난해진	\N	\N	\N	gongmuwon	하
6264	imprecise	부정확한	\N	\N	\N	gongmuwon	하
6265	impregnable	난공불락의	\N	\N	\N	gongmuwon	중
6268	impromptu	즉석에서의	\N	\N	\N	gongmuwon	하
6273	inalienable	양도할 수 없는; 빼앗을 수 없는	\N	\N	\N	gongmuwon	하
6274	inane	어리석은	\N	\N	\N	gongmuwon	하
6277	incessantly	끊임없이	\N	\N	\N	gongmuwon	하
6279	incomparable	비교할 수 없는	\N	\N	\N	gongmuwon	하
6286	incurable	불치의; 교정 불능의	\N	\N	\N	gongmuwon	하
6289	indigenous	토착의	\N	\N	\N	gongmuwon	하
6290	indignation	분개	\N	\N	\N	gongmuwon	하
6291	indolent	게으른; 무활동의	\N	\N	\N	gongmuwon	중
6297	inevitable	피할 수 없는	\N	\N	\N	gongmuwon	하
6307	innocuous	해가 없는	\N	\N	\N	gongmuwon	하
6310	inordinate	지나친	\N	\N	\N	gongmuwon	하
6314	insecure	불안정한; 위태로운; 확신이 없는	\N	\N	\N	gongmuwon	하
6315	inseparable	분리할 수 없는; 떨어질 수 없는	\N	\N	\N	gongmuwon	하
6319	insincere	성의없는	\N	\N	\N	gongmuwon	중
6324	instantaneous	순간의	\N	\N	\N	gongmuwon	하
6327	insulate	분리시키다	\N	\N	\N	gongmuwon	하
6330	intact	thseowl 않은	\N	\N	\N	gongmuwon	하
6335	interchangeable	호환성이 있는	\N	\N	\N	gongmuwon	하
6338	internment	(포로 등의) 유치	\N	\N	\N	gongmuwon	하
6339	interpret	설명하다	\N	\N	\N	gongmuwon	하
6346	intricate	얽힌	\N	\N	\N	gongmuwon	하
6347	intrigue	당혹케 하다	\N	\N	\N	gongmuwon	하
6353	investigate	조사하다	\N	\N	\N	gongmuwon	하
6356	involved	복잡한	\N	\N	\N	gongmuwon	하
6361	irreparable	고칠 수 없는	\N	\N	\N	gongmuwon	하
6362	irreplaceable	바꿀 수 없는	\N	\N	\N	gongmuwon	하
6366	jack up	(차 등을) 잭으로 들어 올리다	\N	\N	\N	gongmuwon	기타
6371	judicious	사려 분별이 있는	\N	\N	\N	gongmuwon	하
6377	knowingly	알고서	\N	\N	\N	gongmuwon	하
6378	laconic	간결한	\N	\N	\N	gongmuwon	중
6379	laden	(짐을)실은	\N	\N	\N	gongmuwon	하
6384	lateral	옆의	\N	\N	\N	gongmuwon	하
6385	laudatory	칭찬(찬미)의	\N	\N	\N	gongmuwon	중
6386	launch	(사업을)착수하다	\N	\N	\N	gongmuwon	하
6387	lavish	낭비벽이 있는	\N	\N	\N	gongmuwon	하
6388	leading	선도하는	\N	\N	\N	gongmuwon	하
6395	lenient	너그러운	\N	\N	\N	gongmuwon	하
6399	libel	중상	\N	\N	\N	gongmuwon	하
6404	litigate	소송을 제기하다; 법정에서 다투다	\N	\N	\N	gongmuwon	중
6412	longing	갈망	\N	\N	\N	gongmuwon	하
6415	lucrative	이익이 있는	\N	\N	\N	gongmuwon	하
6416	lukewarm	미지근한	\N	\N	\N	gongmuwon	하
6417	luminous	빛나는	\N	\N	\N	gongmuwon	하
6418	lure	유인하다; 유혹하다	\N	\N	\N	gongmuwon	하
6427	mandatory	강제의	\N	\N	\N	gongmuwon	하
6430	marginal	주변적인	\N	\N	\N	gongmuwon	하
6435	match	경쟁시키다	\N	\N	\N	gongmuwon	하
6436	material	중요한	\N	\N	\N	gongmuwon	하
6437	maturity	성숙(기)	\N	\N	\N	gongmuwon	하
6450	merchandise	상품	\N	\N	\N	gongmuwon	하
6451	merciless	무자비한	\N	\N	\N	gongmuwon	하
6457	microbe	미생물	\N	\N	\N	gongmuwon	하
6465	misgiving	의심	\N	\N	\N	gongmuwon	중
6483	multiracial	다민족의	\N	\N	\N	gongmuwon	하
6494	nebulous	희미한	\N	\N	\N	gongmuwon	중
6501	nevertheless	그럼에도 불구하고	\N	\N	\N	gongmuwon	하
6502	nocturnal	밤의	\N	\N	\N	gongmuwon	하
6503	nominal	명목상의	\N	\N	\N	gongmuwon	하
6508	notwithstanding	~에도 불구하고	\N	\N	\N	gongmuwon	하
6511	objection	반대	\N	\N	\N	gongmuwon	하
6514	oblivious	알아채지 못하는	\N	\N	\N	gongmuwon	하
6515	obscure	분명치 않은	\N	\N	\N	gongmuwon	하
6524	ominous	불길한	\N	\N	\N	gongmuwon	하
6525	omniscient	전지의; 박식한	\N	\N	\N	gongmuwon	하
6532	option	선택	\N	\N	\N	gongmuwon	하
6536	ordinary	보통의	\N	\N	\N	gongmuwon	하
6539	outbreak	(전쟁등의)발발; 발생	\N	\N	\N	gongmuwon	하
6542	outcry	울부짖음	\N	\N	\N	gongmuwon	하
6546	outlaw	범죄자	\N	\N	\N	gongmuwon	하
6547	outlay	경비	\N	\N	\N	gongmuwon	하
6548	outrageous	난폭한	\N	\N	\N	gongmuwon	하
6549	outstanding	눈에 띄는	\N	\N	\N	gongmuwon	하
6558	overstate	과장하다	\N	\N	\N	gongmuwon	중
6564	owing to	~때문에	\N	\N	\N	gongmuwon	기타
6565	pace	걸음걸이	\N	\N	\N	gongmuwon	하
6567	panacea	만병 통치약	\N	\N	\N	gongmuwon	하
6568	pandemonium	대혼란	\N	\N	\N	gongmuwon	하
6569	paralysis	무기력	\N	\N	\N	gongmuwon	하
6571	paraphrase	바꾸어 말하다	\N	\N	\N	gongmuwon	하
6574	parlor	응접실	\N	\N	\N	gongmuwon	하
6577	partake	참여하다	\N	\N	\N	gongmuwon	하
6578	patent	명백한	\N	\N	\N	gongmuwon	하
6579	pathetic	측은한	\N	\N	\N	gongmuwon	하
6580	pattern	도안	\N	\N	\N	gongmuwon	하
6591	perjury	위증; 위증죄	\N	\N	\N	gongmuwon	하
6595	pertinent	적절한	\N	\N	\N	gongmuwon	하
6598	pharmaceutical(s)	제약의	\N	\N	\N	gongmuwon	기타
6600	picturesque	그림같이 아름다운	\N	\N	\N	gongmuwon	하
6601	pinnacle	정상	\N	\N	\N	gongmuwon	하
6242	impact	영향	\N	\N	\N	gongmuwon	하
6587	peril	위험	\N	\N	\N	gongmuwon	하
6246	impeach	탄핵하다	\N	\N	\N	gongmuwon	하
6389	lease	임차하다	\N	\N	\N	gongmuwon	하
6248	impede	늦추다	\N	\N	\N	gongmuwon	하
6365	issue	발행; 유출; 논쟁; 문제점	\N	\N	\N	gongmuwon	하
6540	outburst	폭발	\N	\N	\N	gongmuwon	하
6541	outcast	쫓겨난	\N	\N	\N	gongmuwon	하
6544	outing	소풍	\N	\N	\N	gongmuwon	하
6550	outstrip	~을 능가하다	\N	\N	\N	gongmuwon	중
6551	overcome	이기다	\N	\N	\N	gongmuwon	하
6552	overhaul	철저히(자세히) 조사하다	\N	\N	\N	gongmuwon	하
6554	override	우위에 서다; 유린하다	\N	\N	\N	gongmuwon	하
6555	oversee	감독하다	\N	\N	\N	gongmuwon	하
6556	overshadow	~을 가리다	\N	\N	\N	gongmuwon	중
6557	oversight	간과	\N	\N	\N	gongmuwon	하
6566	painstaking	근면한; 노고를 아끼지 않는	\N	\N	\N	gongmuwon	하
6572	parcel	분할하다	\N	\N	\N	gongmuwon	하
6573	parenthesis	소괄호; 삽화	\N	\N	\N	gongmuwon	하
6576	parsimony	지나친 절약; 인색	\N	\N	\N	gongmuwon	중
6583	peak	정점	\N	\N	\N	gongmuwon	하
6584	penniless	무일푼의	\N	\N	\N	gongmuwon	중
6585	pensive	생각에 잠긴	\N	\N	\N	gongmuwon	하
6589	periphery	(정치의)소수파	\N	\N	\N	gongmuwon	하
6592	permeation	침투	\N	\N	\N	gongmuwon	중
6596	pervasive	널리 퍼지는; 보급력이 있는	\N	\N	\N	gongmuwon	하
6609	placid	평온한	\N	\N	\N	gongmuwon	하
6611	plain	명백한	\N	\N	\N	gongmuwon	하
6618	plentiful	풍부한	\N	\N	\N	gongmuwon	하
6619	plight	곤경	\N	\N	\N	gongmuwon	하
6623	politic	분별 있는	\N	\N	\N	gongmuwon	하
6624	poll	투표	\N	\N	\N	gongmuwon	하
6628	porter	짐꾼; 운반인; 청소부; 문지기	\N	\N	\N	gongmuwon	하
6631	posthumous	사후의	\N	\N	\N	gongmuwon	하
6632	posture	자세; 몸가짐; 마음가짐	\N	\N	\N	gongmuwon	하
6634	pound	마구 치다	\N	\N	\N	gongmuwon	하
6637	preach	설교하다	\N	\N	\N	gongmuwon	하
6638	precarious	불확실한	\N	\N	\N	gongmuwon	하
6639	precedent	선례	\N	\N	\N	gongmuwon	하
6641	precise	정확한	\N	\N	\N	gongmuwon	하
6642	predicament	곤경	\N	\N	\N	gongmuwon	하
6645	premeditated	미리 계획된	\N	\N	\N	gongmuwon	중
6648	prerogative	특권	\N	\N	\N	gongmuwon	하
6649	prescription	처방(전); 처방약	\N	\N	\N	gongmuwon	하
6650	presence	존재	\N	\N	\N	gongmuwon	하
6655	pretend	가장하다	\N	\N	\N	gongmuwon	하
6656	prevail	유행하다	\N	\N	\N	gongmuwon	하
6661	prized	중요한	\N	\N	\N	gongmuwon	하
6665	profound	깊은; 심원한; 난해한	\N	\N	\N	gongmuwon	하
6675	prone	~하는 경향이 있는	\N	\N	\N	gongmuwon	하
6677	propaganda	선전	\N	\N	\N	gongmuwon	하
6683	protect	보호하다	\N	\N	\N	gongmuwon	하
6684	protest	항의하다	\N	\N	\N	gongmuwon	하
6686	proverb	속담	\N	\N	\N	gongmuwon	하
6689	proxy	대리	\N	\N	\N	gongmuwon	하
6691	psyche	영혼	\N	\N	\N	gongmuwon	하
6697	purpose	목적	\N	\N	\N	gongmuwon	하
6698	putative	추정되고 있는	\N	\N	\N	gongmuwon	하
6700	questionable	의심스러운	\N	\N	\N	gongmuwon	하
6703	ragged	초라한	\N	\N	\N	gongmuwon	하
6706	random	마구잡이의	\N	\N	\N	gongmuwon	하
6708	ratify	인가하다; 비준하다	\N	\N	\N	gongmuwon	하
6711	raze	파괴하다	\N	\N	\N	gongmuwon	중
6714	realistic	현실주의의	\N	\N	\N	gongmuwon	하
6717	reasonable	이치에 맞는	\N	\N	\N	gongmuwon	하
6720	recall	상기하다	\N	\N	\N	gongmuwon	하
6723	reclaim	개간하다; 메우다	\N	\N	\N	gongmuwon	하
6726	recuperate	회복하다	\N	\N	\N	gongmuwon	중
6727	recurring	되풀이해서 일어나는	\N	\N	\N	gongmuwon	하
6728	redeem	교환하다	\N	\N	\N	gongmuwon	하
6731	reengineering	조직 재충전	\N	\N	\N	gongmuwon	하
6732	reexamine	재검토하다	\N	\N	\N	gongmuwon	중
6733	refined	세련된	\N	\N	\N	gongmuwon	하
6736	refrigerate	냉각시키다	\N	\N	\N	gongmuwon	하
6740	rehearse	예행연습을 하다	\N	\N	\N	gongmuwon	하
6743	rejuvenate	원기를 회복하다	\N	\N	\N	gongmuwon	하
6746	relevant	관련된; 적절한	\N	\N	\N	gongmuwon	하
6747	reliable	믿을 수 있는	\N	\N	\N	gongmuwon	하
6750	remainder	나머지	\N	\N	\N	gongmuwon	하
6754	remote	먼	\N	\N	\N	gongmuwon	하
6758	renown	명성	\N	\N	\N	gongmuwon	하
6759	repay	갚다	\N	\N	\N	gongmuwon	하
6762	replay	경기를 다시하다	\N	\N	\N	gongmuwon	하
6765	represent	상징하다	\N	\N	\N	gongmuwon	하
6766	reprimand	꾸짖다	\N	\N	\N	gongmuwon	하
6772	reserve	남겨두다	\N	\N	\N	gongmuwon	하
6778	restrain	억제하다	\N	\N	\N	gongmuwon	하
6779	resume	다시 시작하다	\N	\N	\N	gongmuwon	하
6786	retrieve	되찾다	\N	\N	\N	gongmuwon	하
6787	retrospect	회고하다	\N	\N	\N	gongmuwon	하
6790	reverse	역	\N	\N	\N	gongmuwon	하
6793	revival	재생	\N	\N	\N	gongmuwon	하
6801	risky	위험한	\N	\N	\N	gongmuwon	하
6802	roam	돌아다니다	\N	\N	\N	gongmuwon	하
6803	roar	고함치다; 으르렁거리다	\N	\N	\N	gongmuwon	하
6809	rotten	썩은	\N	\N	\N	gongmuwon	하
6810	rough	울퉁불퉁한; 거친	\N	\N	\N	gongmuwon	하
6811	rouse	깨우다	\N	\N	\N	gongmuwon	하
6812	row	열	\N	\N	\N	gongmuwon	하
6815	rupture	파열	\N	\N	\N	gongmuwon	하
6821	sanguine	붉은	\N	\N	\N	gongmuwon	하
6822	sap	약화시키다	\N	\N	\N	gongmuwon	하
6826	scold	꾸짖다	\N	\N	\N	gongmuwon	중
6830	scrape	문지르다	\N	\N	\N	gongmuwon	하
6835	seasoning	양념	\N	\N	\N	gongmuwon	하
6838	sedative	진정제	\N	\N	\N	gongmuwon	하
6527	ooze	스며 나오다	\N	\N	\N	gongmuwon	하
6534	orbit	생활의 궤도	\N	\N	\N	gongmuwon	하
6537	organ	(생물의)기관	\N	\N	\N	gongmuwon	하
6563	overwrought	너무 흥분한	\N	\N	\N	gongmuwon	중
6575	parody	패러디	\N	\N	\N	gongmuwon	하
6582	peaceful	평온한	\N	\N	\N	gongmuwon	하
6586	perfunctory	마지못해 하는	\N	\N	\N	gongmuwon	중
6590	perish	죽다	\N	\N	\N	gongmuwon	하
6593	personnel	직원	\N	\N	\N	gongmuwon	하
6594	perspicuous	명쾌한	\N	\N	\N	gongmuwon	중
6597	petrify	돌처럼 굳게 하다; 석질로 만들다	\N	\N	\N	gongmuwon	중
6599	philosopher	철학자; 철인	\N	\N	\N	gongmuwon	하
6602	pinpoint	핀 끝; 하찮은 것; 조금	\N	\N	\N	gongmuwon	하
6604	pit	겨루게 하다	\N	\N	\N	gongmuwon	하
6606	pittance	약간의 수당; 소량	\N	\N	\N	gongmuwon	중
6607	pivotal	중추적인	\N	\N	\N	gongmuwon	하
6608	placate	달래다	\N	\N	\N	gongmuwon	중
6614	plea	청원	\N	\N	\N	gongmuwon	하
6615	plead	변호하다	\N	\N	\N	gongmuwon	하
6616	pleasing	유쾌한	\N	\N	\N	gongmuwon	하
6617	pledge	맹세	\N	\N	\N	gongmuwon	하
6622	polish	닦다	\N	\N	\N	gongmuwon	하
6627	portable	들고 다닐 수 있는	\N	\N	\N	gongmuwon	하
6629	portion	부분; 몫	\N	\N	\N	gongmuwon	하
6635	pragmatic	실용적인	\N	\N	\N	gongmuwon	하
6643	predicate	입각하다	\N	\N	\N	gongmuwon	하
6644	prejudice	편견	\N	\N	\N	gongmuwon	하
6652	presume	가정하다	\N	\N	\N	gongmuwon	하
6657	prevalent	일반적으로 행하여지는	\N	\N	\N	gongmuwon	하
6662	proceed	나아가다	\N	\N	\N	gongmuwon	하
6663	procrastinate	늑장부리다	\N	\N	\N	gongmuwon	중
6670	proliferation	급증; 확산	\N	\N	\N	gongmuwon	하
6671	prolific	다산의	\N	\N	\N	gongmuwon	하
6673	promote	증진하다	\N	\N	\N	gongmuwon	하
6678	prophetic	예언적인	\N	\N	\N	gongmuwon	하
6682	protagonist	주인공	\N	\N	\N	gongmuwon	하
6687	provided	만약 ~이라면	\N	\N	\N	gongmuwon	하
6693	publish	발표하다	\N	\N	\N	gongmuwon	하
6695	punitive	형벌의	\N	\N	\N	gongmuwon	하
6704	rampant	(식물이)만연하는	\N	\N	\N	gongmuwon	하
6709	ravel	얽히게 하다	\N	\N	\N	gongmuwon	하
6712	reach	구역	\N	\N	\N	gongmuwon	하
6715	reap	수확하다; 획득하다	\N	\N	\N	gongmuwon	하
6561	overweenig	지나치게 자신만만한	\N	\N	\N	gongmuwon	기타
6666	progenitor	선구자	\N	\N	\N	gongmuwon	하
6716	rear	기르다	\N	\N	\N	gongmuwon	하
6719	rebuke	비난하다	\N	\N	\N	gongmuwon	하
6724	reconcile	화해시키다	\N	\N	\N	gongmuwon	하
6729	redress	보상	\N	\N	\N	gongmuwon	하
6737	refute	논박하다	\N	\N	\N	gongmuwon	하
6738	regional	지역의; 특정 지방의; 국부의	\N	\N	\N	gongmuwon	하
6741	reimburse	상환하다	\N	\N	\N	gongmuwon	하
6744	release	석방하다	\N	\N	\N	gongmuwon	하
6745	relegate	내쫓다	\N	\N	\N	gongmuwon	중
6751	remarkable	주목할 만한	\N	\N	\N	gongmuwon	하
6752	remit	보내다	\N	\N	\N	gongmuwon	하
6763	replenish	다시 채우다	\N	\N	\N	gongmuwon	하
6769	research	조사하다	\N	\N	\N	gongmuwon	하
6770	resemble	닮다	\N	\N	\N	gongmuwon	하
6771	resentment	분개	\N	\N	\N	gongmuwon	하
6775	resort	의지하다	\N	\N	\N	gongmuwon	하
6776	resource	자원	\N	\N	\N	gongmuwon	하
6777	respect	존경	\N	\N	\N	gongmuwon	하
6781	resuscitation	소생	\N	\N	\N	gongmuwon	하
6782	retain	보유하다	\N	\N	\N	gongmuwon	하
6783	retaliate	보복하다	\N	\N	\N	gongmuwon	하
6789	revenue	세입; 수익	\N	\N	\N	gongmuwon	하
6792	revitalize	생기를 회복시키다	\N	\N	\N	gongmuwon	하
6796	reward	보수	\N	\N	\N	gongmuwon	하
6797	ridicule	비웃다	\N	\N	\N	gongmuwon	하
6798	rife	유행하는	\N	\N	\N	gongmuwon	하
6813	rudimentary	원리의	\N	\N	\N	gongmuwon	하
6814	rugged	울퉁불퉁한	\N	\N	\N	gongmuwon	하
6817	sagacious	현명한	\N	\N	\N	gongmuwon	중
6820	sanction	재가	\N	\N	\N	gongmuwon	하
6829	scour	탐색하다	\N	\N	\N	gongmuwon	하
6831	screen	방충망; 체	\N	\N	\N	gongmuwon	하
6832	scrub	문지르다	\N	\N	\N	gongmuwon	하
6833	scruple	망설임; 양심의 가책	\N	\N	\N	gongmuwon	중
6836	sect	분파	\N	\N	\N	gongmuwon	하
6837	secular	이승의	\N	\N	\N	gongmuwon	하
6844	semblance	외관	\N	\N	\N	gongmuwon	하
6853	shatter	산산이 부수다	\N	\N	\N	gongmuwon	하
6854	shed	흘리다; 벗다	\N	\N	\N	gongmuwon	하
6855	sheer	완전한	\N	\N	\N	gongmuwon	하
6862	shortly	곧; 간단히; 무뚝뚝하게	\N	\N	\N	gongmuwon	하
6863	shred	찢다	\N	\N	\N	gongmuwon	하
6864	shrewd	영리한	\N	\N	\N	gongmuwon	하
6869	sizable	상당한 크기의	\N	\N	\N	gongmuwon	하
6870	skeleton	골격; 해골; 뼈대	\N	\N	\N	gongmuwon	하
6876	slander	중상	\N	\N	\N	gongmuwon	하
6877	slope	경사	\N	\N	\N	gongmuwon	하
6884	sociable	사교적인	\N	\N	\N	gongmuwon	하
6885	sojourn	묵다	\N	\N	\N	gongmuwon	하
6886	solemn	엄숙한	\N	\N	\N	gongmuwon	하
6892	span	한 뼘; 기간	\N	\N	\N	gongmuwon	하
6895	spatial	공간의	\N	\N	\N	gongmuwon	하
6896	specific	명확한	\N	\N	\N	gongmuwon	하
6901	spoil	망치다	\N	\N	\N	gongmuwon	하
6903	sporadic	때때로 일어나는	\N	\N	\N	gongmuwon	하
6904	spot	얼룩점	\N	\N	\N	gongmuwon	하
6908	stagnant	정체된	\N	\N	\N	gongmuwon	하
6919	still	정지한	\N	\N	\N	gongmuwon	하
6920	stipulate	규정하다	\N	\N	\N	gongmuwon	하
6560	overturn	뒤집다	\N	\N	\N	gongmuwon	하
6562	overweight	중량 초과의; 과체중의	\N	\N	\N	gongmuwon	하
6748	relinquish	그만두다	\N	\N	\N	gongmuwon	하
6753	remnant	찌꺼기	\N	\N	\N	gongmuwon	하
6755	remuneration	보수	\N	\N	\N	gongmuwon	하
6756	rend	째다	\N	\N	\N	gongmuwon	하
6760	repeal	무효로 하다	\N	\N	\N	gongmuwon	하
6761	repent	후회하다	\N	\N	\N	gongmuwon	하
6764	report	보고	\N	\N	\N	gongmuwon	하
6767	repugnant	싫은	\N	\N	\N	gongmuwon	하
6773	reset	눈금을 고쳐 놓다; 리셋하다	\N	\N	\N	gongmuwon	하
6774	resolve	결심하다; 결의하다	\N	\N	\N	gongmuwon	하
6784	retirement	은퇴	\N	\N	\N	gongmuwon	하
6785	retract	취소하다	\N	\N	\N	gongmuwon	하
6788	reveal	드러내다	\N	\N	\N	gongmuwon	하
6791	revision	개정	\N	\N	\N	gongmuwon	하
6794	revolve	회전하다	\N	\N	\N	gongmuwon	하
6795	revulsion	강한 혐오감	\N	\N	\N	gongmuwon	중
6799	rigidly	엄격하게	\N	\N	\N	gongmuwon	하
6800	rip-off	도둑질	\N	\N	\N	gongmuwon	기타
6804	robust	강건한	\N	\N	\N	gongmuwon	하
6805	role	역할	\N	\N	\N	gongmuwon	하
6806	rooted	뿌리 깊은	\N	\N	\N	gongmuwon	하
6807	roster	명부	\N	\N	\N	gongmuwon	하
6808	rotate	회전하다; 교대하다	\N	\N	\N	gongmuwon	하
6818	salutary	유익한	\N	\N	\N	gongmuwon	중
6823	satellite	위성; 인공위성; 위성방송	\N	\N	\N	gongmuwon	하
6824	scant	부족한	\N	\N	\N	gongmuwon	하
6827	score	얻다	\N	\N	\N	gongmuwon	하
6828	scorn	경멸	\N	\N	\N	gongmuwon	하
6834	scrutinize	세밀히 조사하다	\N	\N	\N	gongmuwon	하
6840	seep	스며 나오다	\N	\N	\N	gongmuwon	하
6841	segregate	격리하다	\N	\N	\N	gongmuwon	하
6842	seize	붙잡다	\N	\N	\N	gongmuwon	하
6846	sensitive	감수성이 예민한	\N	\N	\N	gongmuwon	하
6850	setback	(진보 등의) 방해; 좌절; 패배	\N	\N	\N	gongmuwon	하
6851	settle	놓다	\N	\N	\N	gongmuwon	하
6852	shabby	초라한	\N	\N	\N	gongmuwon	하
6859	short0sighted	근시안적인	\N	\N	\N	gongmuwon	기타
6860	shortage	부족	\N	\N	\N	gongmuwon	하
6861	short-lived	단명하는	\N	\N	\N	gongmuwon	기타
6866	sibling	형제	\N	\N	\N	gongmuwon	하
6868	sinister	불길한	\N	\N	\N	gongmuwon	하
6872	skillful	숙련된	\N	\N	\N	gongmuwon	하
6873	skim	대충(대강) 읽다	\N	\N	\N	gongmuwon	하
6874	skip	깡충 뛰다	\N	\N	\N	gongmuwon	하
6875	slack	느려지다	\N	\N	\N	gongmuwon	하
6881	smuggle	밀수입하다	\N	\N	\N	gongmuwon	하
6882	snatch	와락 붙잡다	\N	\N	\N	gongmuwon	하
6883	sober	술 취하지 않은	\N	\N	\N	gongmuwon	하
6890	sort	분류하다	\N	\N	\N	gongmuwon	하
6893	spare	(시간 등을) 할애하다	\N	\N	\N	gongmuwon	하
6894	spark	불꽃이 튀다; 도화선이 되다	\N	\N	\N	gongmuwon	하
6899	spell	차례	\N	\N	\N	gongmuwon	하
6900	spinach	시금치	\N	\N	\N	gongmuwon	하
6905	sprain	삐다	\N	\N	\N	gongmuwon	하
6909	stale	싱싱하지 못한; 김빠진	\N	\N	\N	gongmuwon	하
6910	stamina	지구력	\N	\N	\N	gongmuwon	하
6911	standard	표준	\N	\N	\N	gongmuwon	하
6912	standing	상비의	\N	\N	\N	gongmuwon	하
6913	staple	요소; 원료	\N	\N	\N	gongmuwon	하
6914	stature	키	\N	\N	\N	gongmuwon	하
6915	stealthy	몰래 하는	\N	\N	\N	gongmuwon	하
6918	stigme	치욕	\N	\N	\N	gongmuwon	기타
6924	strategic	전략의	\N	\N	\N	gongmuwon	하
6929	striking	이목을 끄는	\N	\N	\N	gongmuwon	하
6930	stringent	엄중한	\N	\N	\N	gongmuwon	하
6947	superficial	얕은	\N	\N	\N	gongmuwon	하
6948	supplant	대체하다; 대신하다	\N	\N	\N	gongmuwon	하
6667	prohibitively	엄두도 못낼 만큼	\N	\N	\N	gongmuwon	중
6668	projecting	돌출한	\N	\N	\N	gongmuwon	하
6949	support	지지하다; 부양하다	\N	\N	\N	gongmuwon	하
6610	plagiarism	표절	\N	\N	\N	gongmuwon	하
6612	platonic	관념적인	\N	\N	\N	gongmuwon	하
6621	poise	균형 잡히다	\N	\N	\N	gongmuwon	하
6625	pore	응시하다	\N	\N	\N	gongmuwon	하
6630	portray	묘사하다; 그리다; 역을 맡다	\N	\N	\N	gongmuwon	하
6636	praiseworthy	칭찬할 만한	\N	\N	\N	gongmuwon	중
6646	premium	할증금	\N	\N	\N	gongmuwon	하
6651	prestige	명성	\N	\N	\N	gongmuwon	하
6654	presuppose	~을 전제로 하다; 미리 예상하다	\N	\N	\N	gongmuwon	중
6658	prime	준비시키다; 미리 알려주다	\N	\N	\N	gongmuwon	하
6659	prior	이전의	\N	\N	\N	gongmuwon	하
6660	pristine	원시적인	\N	\N	\N	gongmuwon	하
6669	proletariat	무산계급	\N	\N	\N	gongmuwon	하
6674	prompt	재빠른	\N	\N	\N	gongmuwon	하
6676	proof	증거; 시험	\N	\N	\N	gongmuwon	하
6679	prosaic	무미건조한	\N	\N	\N	gongmuwon	중
6680	prospect	전망	\N	\N	\N	gongmuwon	하
6685	protocol	외교 의례	\N	\N	\N	gongmuwon	하
6696	purchase	얻다	\N	\N	\N	gongmuwon	하
6688	prowess	훌륭한 솜씨	\N	\N	\N	gongmuwon	하
6692	puberty	사춘기	\N	\N	\N	gongmuwon	하
6699	quay	부두	\N	\N	\N	gongmuwon	하
6867	simultaneously	동시에; 일제히	\N	\N	\N	gongmuwon	하
6701	quietly	조용히	\N	\N	\N	gongmuwon	하
6702	radiant	빛나는	\N	\N	\N	gongmuwon	하
6705	rancid	썩은 냄새가 나는; 악취가 나는	\N	\N	\N	gongmuwon	하
6707	rapidly	급속히	\N	\N	\N	gongmuwon	하
6710	raw	가공하지 않은	\N	\N	\N	gongmuwon	하
6713	reaffirm	재차 단언하다	\N	\N	\N	gongmuwon	하
6718	rebellious	반항하는; 반체제의; 반란하는	\N	\N	\N	gongmuwon	하
6722	reckless	무모한	\N	\N	\N	gongmuwon	하
6730	redundant	여분의	\N	\N	\N	gongmuwon	하
6742	reiterate	되풀이하다	\N	\N	\N	gongmuwon	하
6857	shield	보호하다	\N	\N	\N	gongmuwon	하
6858	shipment	선적	\N	\N	\N	gongmuwon	하
6865	shrink	줄어들다	\N	\N	\N	gongmuwon	하
6878	slovenly	부주의한	\N	\N	\N	gongmuwon	중
6879	sluggish	느린	\N	\N	\N	gongmuwon	하
6887	solicit	간청하다	\N	\N	\N	gongmuwon	하
6888	solidify	굳히다	\N	\N	\N	gongmuwon	하
6891	source	근원	\N	\N	\N	gongmuwon	하
6897	spectacular	구경거리의; 장관인	\N	\N	\N	gongmuwon	하
6898	speculate	사색하다	\N	\N	\N	gongmuwon	하
6906	squalid	더러운	\N	\N	\N	gongmuwon	중
6916	stem	생기다	\N	\N	\N	gongmuwon	하
6917	stiff	딱딱한	\N	\N	\N	gongmuwon	하
6925	stray	길을 잃다	\N	\N	\N	gongmuwon	하
6927	strenuous	분투적인	\N	\N	\N	gongmuwon	하
6932	struggle	싸우다	\N	\N	\N	gongmuwon	하
6945	succinct	간결한	\N	\N	\N	gongmuwon	하
6946	succulent	즙이 많은	\N	\N	\N	gongmuwon	하
6950	suppress	억압하다	\N	\N	\N	gongmuwon	하
6957	swift	빠른	\N	\N	\N	gongmuwon	하
6958	syndrome	증후군	\N	\N	\N	gongmuwon	하
6964	takeoff	출발(점); 도약; 이륙; 제거	\N	\N	\N	gongmuwon	하
6967	tangible	만져 알 수 있는; 유형의	\N	\N	\N	gongmuwon	하
6968	tarnish	흐려지다	\N	\N	\N	gongmuwon	하
6969	taunt	조롱하다	\N	\N	\N	gongmuwon	하
6974	tenet	교의	\N	\N	\N	gongmuwon	하
6975	tentative	시험삼아 하는	\N	\N	\N	gongmuwon	하
6976	tenuous	중요치 않은	\N	\N	\N	gongmuwon	하
6978	terse	간결한	\N	\N	\N	gongmuwon	하
6983	thoroughfare	도로	\N	\N	\N	gongmuwon	하
6984	threshold	입구	\N	\N	\N	gongmuwon	하
6988	throng	군중	\N	\N	\N	gongmuwon	하
6992	tiny	작은	\N	\N	\N	gongmuwon	하
6993	tip	끝	\N	\N	\N	gongmuwon	하
6998	trace	자취	\N	\N	\N	gongmuwon	하
7012	treason	반역; 배신	\N	\N	\N	gongmuwon	하
7013	treatment	치료	\N	\N	\N	gongmuwon	하
7018	trifle	시시한 것; 사소한 일	\N	\N	\N	gongmuwon	하
7019	trigger	시작하게 하다	\N	\N	\N	gongmuwon	하
7020	trim	깎아 다듬다	\N	\N	\N	gongmuwon	하
7021	triumph	승리	\N	\N	\N	gongmuwon	하
7022	trivial	하찮은	\N	\N	\N	gongmuwon	하
7023	trump	비방을 써서 이기다	\N	\N	\N	gongmuwon	하
7024	turbid	흐린	\N	\N	\N	gongmuwon	중
7029	tyrant	독재자	\N	\N	\N	gongmuwon	하
7031	ulterior	마음속의	\N	\N	\N	gongmuwon	중
7032	umpire	심판; 판정자; 재정인	\N	\N	\N	gongmuwon	하
7042	uncommon	드문	\N	\N	\N	gongmuwon	하
7043	undergo	겪다	\N	\N	\N	gongmuwon	하
7044	underground	지하조직의	\N	\N	\N	gongmuwon	하
7048	underpinning	토대	\N	\N	\N	gongmuwon	하
7049	underprivileged	혜택을 덜 받고 있는 사람들	\N	\N	\N	gongmuwon	하
7059	unearthly	비현실적인	\N	\N	\N	gongmuwon	중
7063	unexpected	예기치 않은; 뜻밖의	\N	\N	\N	gongmuwon	하
7065	unfamiliar	익숙하지 못한; 정통하지 않은; 생소한	\N	\N	\N	gongmuwon	하
7069	ungainly	꼴 사나운	\N	\N	\N	gongmuwon	중
7072	unjust	불공평한; 부당한	\N	\N	\N	gongmuwon	하
7073	unkempt	깔끔하지 못한	\N	\N	\N	gongmuwon	중
7074	unlawful	불법적인	\N	\N	\N	gongmuwon	하
7075	unlimited	무한한	\N	\N	\N	gongmuwon	하
7078	unnoticed	눈에 띄지 않는	\N	\N	\N	gongmuwon	하
7080	unpleasant	불쾌한	\N	\N	\N	gongmuwon	하
7081	unquestionable	확실한	\N	\N	\N	gongmuwon	중
7083	unrelenting	가차없는	\N	\N	\N	gongmuwon	하
7106	utter	입 밖에 내다; 누설하다; 말하다	\N	\N	\N	gongmuwon	하
7108	vagary	일시적인 기분	\N	\N	\N	gongmuwon	중
7117	verify	증명(입증)하다	\N	\N	\N	gongmuwon	하
7118	versatile	다재다능한	\N	\N	\N	gongmuwon	하
7119	vessel	용기	\N	\N	\N	gongmuwon	하
7120	vest	(권리	\N	\N	\N	gongmuwon	하
7122	vicinity	근처	\N	\N	\N	gongmuwon	하
7128	vital	생명의; 생생한; 치명적인; 극히 중대한	\N	\N	\N	gongmuwon	하
7132	waive	포기하다	\N	\N	\N	gongmuwon	하
7134	ware	제품	\N	\N	\N	gongmuwon	하
7135	warrant	정당화하다; 보증하다	\N	\N	\N	gongmuwon	하
7136	weigh	무게를 달다; 심사숙고하다	\N	\N	\N	gongmuwon	하
7137	well-being	행복	\N	\N	\N	gongmuwon	기타
7146	wound	상처	\N	\N	\N	gongmuwon	하
7150	provide	v. *공급하다	\N	\N	\N	suneung	하
7152	behave	v. (예의바르게) *행동하다*	\N	\N	\N	suneung	하
7159	amount	n. *총계	\N	\N	\N	suneung	하
7161	employ	v. *고용하다*	\N	\N	\N	suneung	하
7162	terrible	a. *무서운	\N	\N	\N	suneung	하
7165	v. *연구하다	 조사하다*	\N	\N	\N	suneung	기타
7172	opportunity	n. *기회*	\N	\N	\N	suneung	하
7175	involve	v. *포함하다	\N	\N	\N	suneung	하
7182	ride	v. (탈것을) *타다*	\N	\N	\N	suneung	하
7188	n. *편안	 위로*	\N	\N	\N	suneung	기타
7193	available	a. *이용 가능한	\N	\N	\N	suneung	하
7194	contain	v. *함유하다	\N	\N	\N	suneung	하
7197	material	n. *재료	\N	\N	\N	suneung	하
7199	positive	a. *긍정적인*	\N	\N	\N	suneung	하
7200	emotion	n. *감정*	\N	\N	\N	suneung	하
7207	benefit	n. *이익*	\N	\N	\N	suneung	하
7215	profession	n. *직업	\N	\N	\N	suneung	하
7217	cell	n. *세포	\N	\N	\N	suneung	하
7222	poetry	n. *시	\N	\N	\N	suneung	하
6848	series	일련	\N	\N	\N	gongmuwon	하
6849	servitude	노예	\N	\N	\N	gongmuwon	하
6856	shelter	피난처; 임시 수용소; 방공호	\N	\N	\N	gongmuwon	하
6926	streamline	간소화하다	\N	\N	\N	gongmuwon	하
6939	subsequent	다음의	\N	\N	\N	gongmuwon	하
6940	subsidize	보조(장려)금을 지급하다	\N	\N	\N	gongmuwon	하
6941	substantial	실질적인	\N	\N	\N	gongmuwon	하
6942	subtle	미묘한	\N	\N	\N	gongmuwon	하
6951	surrender	항복하다	\N	\N	\N	gongmuwon	하
6952	surreptitious	비밀의	\N	\N	\N	gongmuwon	중
6954	surveillance	감시	\N	\N	\N	gongmuwon	하
6955	susceptible	밥기 쉬운	\N	\N	\N	gongmuwon	하
6965	tame	길들여진	\N	\N	\N	gongmuwon	하
6966	tamper	쓸데없는 참견을 하다	\N	\N	\N	gongmuwon	하
6970	tease	기어이 얻어내다	\N	\N	\N	gongmuwon	하
6971	tedious	지루한	\N	\N	\N	gongmuwon	하
6972	temperamental	기질상의	\N	\N	\N	gongmuwon	중
6973	tenacious	고집하는	\N	\N	\N	gongmuwon	하
6986	thrive	번영하다	\N	\N	\N	gongmuwon	하
6987	throe	심한 고통; 진통; 임종의 고통	\N	\N	\N	gongmuwon	기타
6996	tolerance	관용	\N	\N	\N	gongmuwon	하
6997	touchy	과민한; 성 잘 내는	\N	\N	\N	gongmuwon	하
6999	track	~을 쫓아가다	\N	\N	\N	gongmuwon	하
7000	tractable	다루기 쉬운	\N	\N	\N	gongmuwon	하
7002	train	겨누다	\N	\N	\N	gongmuwon	하
7003	trait	특성	\N	\N	\N	gongmuwon	하
7004	traitorous	반역의	\N	\N	\N	gongmuwon	중
7005	trample	짓밟다	\N	\N	\N	gongmuwon	하
7011	travesty	희화화; 희작	\N	\N	\N	gongmuwon	하
7051	understate	숫자를 줄여 말하다	\N	\N	\N	gongmuwon	중
7052	undertake	맡다	\N	\N	\N	gongmuwon	하
7057	undoubtedly	의심할 여지없이; 확실히	\N	\N	\N	gongmuwon	하
7058	unearth	발굴하다	\N	\N	\N	gongmuwon	하
7062	uneven	울퉁불퉁한	\N	\N	\N	gongmuwon	하
7066	unfeigned	거짓 없는	\N	\N	\N	gongmuwon	중
7067	unfortunate	불운한	\N	\N	\N	gongmuwon	하
7068	unfriendly	불친절한	\N	\N	\N	gongmuwon	하
7077	unnatural	부자연한; 초자연적인; 이상한	\N	\N	\N	gongmuwon	하
7084	unreliable	신뢰할 수 없는; 믿을 수 없는	\N	\N	\N	gongmuwon	하
7085	unrestricted	제한이 없는; 자유로운	\N	\N	\N	gongmuwon	하
7091	unwonted	보통이 아닌	\N	\N	\N	gongmuwon	중
7092	upbeat	상승	\N	\N	\N	gongmuwon	하
7097	upkeep	유지	\N	\N	\N	gongmuwon	하
7098	uplift	들어올리다; 향상시키다	\N	\N	\N	gongmuwon	하
7104	utmost	최대한의	\N	\N	\N	gongmuwon	하
7105	utopian	이상향의; 공상적인	\N	\N	\N	gongmuwon	하
7110	valiant	용맹스런	\N	\N	\N	gongmuwon	하
7111	vanish	사라지다	\N	\N	\N	gongmuwon	하
7112	variety	변화	\N	\N	\N	gongmuwon	하
7116	verdict	평결; 판정	\N	\N	\N	gongmuwon	하
7126	virtually	사실상; 거의	\N	\N	\N	gongmuwon	하
7129	voluntarily	자발적으로	\N	\N	\N	gongmuwon	하
7131	vulnerable	상처입기 쉬운	\N	\N	\N	gongmuwon	하
7141	withdraw	물러나다	\N	\N	\N	gongmuwon	하
7143	withstand	저항하다	\N	\N	\N	gongmuwon	하
7144	woo	간청하다	\N	\N	\N	gongmuwon	하
7147	yearn	애타게 바라다	\N	\N	\N	gongmuwon	하
7153	improve	v. *향상시키다	\N	\N	\N	suneung	하
7154	individual	n. *개인*	\N	\N	\N	suneung	하
7158	social	a. *사회의	\N	\N	\N	suneung	하
7164	research	n. *연구*	\N	\N	\N	suneung	하
7169	influence	n. *영향	\N	\N	\N	suneung	하
7174	expense	n. *비용	\N	\N	\N	suneung	하
7178	therefore	ad. *그러므로	\N	\N	\N	suneung	하
7179	average	n. *평균*	\N	\N	\N	suneung	하
7184	local	a. *지방의	\N	\N	\N	suneung	하
7192	impress	v. *~에게 깊은 인상을 주다*	\N	\N	\N	suneung	하
7210	reduce	v. *줄이다	\N	\N	\N	suneung	하
7211	chemistry	n. *화학	\N	\N	\N	suneung	하
7218	focus	n. *초점*	\N	\N	\N	suneung	하
7223	demand	v. *요구하다*	\N	\N	\N	suneung	하
7225	occur	v. (사건이) *일어나다	\N	\N	\N	suneung	하
7233	performance	n. *공연	\N	\N	\N	suneung	하
7234	detail	n. *세부*	\N	\N	\N	suneung	하
7238	participate	v. *참여하다	\N	\N	\N	suneung	하
7239	fashion	n. *유행	\N	\N	\N	suneung	하
7244	career	n. *직업	\N	\N	\N	suneung	하
7245	secure	a. *안전한*	\N	\N	\N	suneung	하
7246	v. *안전하게 하다	* 확보하다	\N	\N	\N	suneung	기타
7247	novel	n. (장편) *소설*	\N	\N	\N	suneung	하
7251	solution	n. *해결	\N	\N	\N	suneung	하
7256	recycle	v. *재활용하다*	\N	\N	\N	suneung	하
7261	public	v. *발표하다	\N	\N	\N	suneung	하
7262	congratulate	v. *축하하다*	\N	\N	\N	suneung	하
7263	compose	v. *구성하다	\N	\N	\N	suneung	하
7264	follow	v. *~의 뒤를 잇다	\N	\N	\N	suneung	하
7265	negative	a. *부정적인*	\N	\N	\N	suneung	하
7266	occasion	n. *경우	\N	\N	\N	suneung	하
7269	term	n. *기간	\N	\N	\N	suneung	하
7270	relieve	v. *경감시키다	\N	\N	\N	suneung	하
7271	describe	v. *묘사하다	\N	\N	\N	suneung	하
7272	biology	n. *생물학*	\N	\N	\N	suneung	하
7273	due	a. *만기의	\N	\N	\N	suneung	하
7274	equipment	n. *장치	\N	\N	\N	suneung	하
7275	account	n. *은행 계좌	\N	\N	\N	suneung	하
7278	constant	a. *일정한	\N	\N	\N	suneung	하
7280	genius	n. *천재	\N	\N	\N	suneung	하
7282	cause	v. *~의 원인이 되다*	\N	\N	\N	suneung	하
7286	steady	a. *안정된	\N	\N	\N	suneung	하
7287	extreme	a. *극단의*	\N	\N	\N	suneung	하
7289	tend	v. *~하는 경향이 있다	\N	\N	\N	suneung	하
7290	insist	v. *주장하다*	\N	\N	\N	suneung	하
6928	stricken	맞은	\N	\N	\N	gongmuwon	하
6931	strive	노력하다	\N	\N	\N	gongmuwon	하
6938	subscribe	기부를 약속하다	\N	\N	\N	gongmuwon	하
7231	contact	n. *접촉*	\N	\N	\N	suneung	하
6961	taboo	금기	\N	\N	\N	gongmuwon	하
6962	tacit	말없는	\N	\N	\N	gongmuwon	하
6980	thesis	논제; 학위 논문	\N	\N	\N	gongmuwon	하
6981	thick	친밀한	\N	\N	\N	gongmuwon	하
6982	thorough	철저한	\N	\N	\N	gongmuwon	하
6985	thriller	스릴을 주는 것	\N	\N	\N	gongmuwon	하
6989	thwart	~을 방해하다	\N	\N	\N	gongmuwon	하
6990	tide	경향	\N	\N	\N	gongmuwon	하
6991	timid	겁많은	\N	\N	\N	gongmuwon	하
6994	titular	명의뿐인	\N	\N	\N	gongmuwon	하
6995	token	상징	\N	\N	\N	gongmuwon	하
7007	transcript	사본	\N	\N	\N	gongmuwon	하
7008	transfigure	변형하다	\N	\N	\N	gongmuwon	기타
7014	treaty	조약	\N	\N	\N	gongmuwon	하
7015	trenchant	뚜렷한	\N	\N	\N	gongmuwon	중
7016	trend	경향	\N	\N	\N	gongmuwon	하
7055	undesirable	탐탁치 않은	\N	\N	\N	gongmuwon	하
7056	undistinguished	보통의	\N	\N	\N	gongmuwon	중
7060	uneasy	불안한	\N	\N	\N	gongmuwon	하
7061	unequal	불공평한	\N	\N	\N	gongmuwon	하
7070	unintentionally	무심코	\N	\N	\N	gongmuwon	하
7071	unique	유일무이한	\N	\N	\N	gongmuwon	하
7076	unmindful	염두에 두지 않는	\N	\N	\N	gongmuwon	중
7079	unobtrusive	주제넘지 않은; 겸손한	\N	\N	\N	gongmuwon	하
7082	unreasonable	불합리한	\N	\N	\N	gongmuwon	하
7086	unscrupulous	사악한	\N	\N	\N	gongmuwon	하
7087	unshakable	흔들리지 않는	\N	\N	\N	gongmuwon	중
7088	unsophisticated	순박한	\N	\N	\N	gongmuwon	중
7094	upcoming	다가오는; 곧 공개될	\N	\N	\N	gongmuwon	하
7099	uprising	반란	\N	\N	\N	gongmuwon	하
7100	uproot	뿌리째 뽑다; 몰아내다; (악습을)근절하다	\N	\N	\N	gongmuwon	중
7101	upsurge	급증	\N	\N	\N	gongmuwon	하
7102	urbane	도시풍의; 품위 있는	\N	\N	\N	gongmuwon	중
7103	urge	충동; 압박	\N	\N	\N	gongmuwon	하
7107	vacant	빈	\N	\N	\N	gongmuwon	하
7113	veer	방향을 바꾸다; 바귀다	\N	\N	\N	gongmuwon	하
7114	venal	매수할 수 있는	\N	\N	\N	gongmuwon	중
7115	venomous	악의에 찬	\N	\N	\N	gongmuwon	하
7123	vicious	잔인한	\N	\N	\N	gongmuwon	하
7124	vigilant	경계하고 있는	\N	\N	\N	gongmuwon	하
7125	villain	악한	\N	\N	\N	gongmuwon	하
7127	virtue	미덕	\N	\N	\N	gongmuwon	하
7130	voracious	게걸스레 먹는	\N	\N	\N	gongmuwon	하
7133	wane	적어지다; 약해지다	\N	\N	\N	gongmuwon	하
7138	whirl	소용돌이치(게 하)다	\N	\N	\N	gongmuwon	하
7139	whitewash	눈속임	\N	\N	\N	gongmuwon	하
7140	widespread	널리 퍼진	\N	\N	\N	gongmuwon	하
7145	worldly	세속적인; 속세의	\N	\N	\N	gongmuwon	하
7148	inform	v. *알리다	\N	\N	\N	suneung	하
7149	service	n. *봉사	\N	\N	\N	suneung	하
7155	a. *개인의	 개인적인*	\N	\N	\N	suneung	기타
7156	require	v. *필요로 하다	\N	\N	\N	suneung	하
7157	develop	v. *개발하다	\N	\N	\N	suneung	하
7163	attitude	n. *태도	\N	\N	\N	suneung	하
7166	audience	n. *청중	\N	\N	\N	suneung	하
7167	volunteer	n. *자원봉사	\N	\N	\N	suneung	하
7171	international	a. *국제의	\N	\N	\N	suneung	하
7176	stress	n. *강조	\N	\N	\N	suneung	하
7185	encourage	v. *촉구하다	\N	\N	\N	suneung	하
7186	determine	v. *결심하다	\N	\N	\N	suneung	하
7190	object	n. *물체	\N	\N	\N	suneung	하
7195	revenue	n. *수입	\N	\N	\N	suneung	하
7196	recognize	v. *인지하다	\N	\N	\N	suneung	하
7202	level	n. *수준	\N	\N	\N	suneung	하
7205	discover	v. 발견하다	\N	\N	\N	suneung	하
7206	essence	n. (사물의) *본질	\N	\N	\N	suneung	하
7209	affect	v. *~에 영향을 미치다	\N	\N	\N	suneung	하
7212	immediate	a. *직접의	\N	\N	\N	suneung	하
7213	thus	ad. *그러므로	\N	\N	\N	suneung	하
7214	proper	a. *적절한	\N	\N	\N	suneung	하
7216	economic	a. *경제의	\N	\N	\N	suneung	하
7226	complex	a. *복잡한*	\N	\N	\N	suneung	하
7228	difine	v. *정의하다	\N	\N	\N	suneung	기타
7230	aware	a. *인지하는	\N	\N	\N	suneung	하
7241	package	n. *꾸러미	\N	\N	\N	suneung	하
7243	disappear	v. *사라지다*	\N	\N	\N	suneung	하
7249	despite	p. *~에도 불구하고*	\N	\N	\N	suneung	하
7250	background	n. *배경	\N	\N	\N	suneung	하
7253	eventually	ad. *결국*	\N	\N	\N	suneung	하
7257	desire	n. *욕망	\N	\N	\N	suneung	하
7259	balance	n. *균형	\N	\N	\N	suneung	하
7267	replace	v. *대체하다*	\N	\N	\N	suneung	하
7268	expert	n. *전문가*	\N	\N	\N	suneung	하
7284	frequent	a. *빈번한*	\N	\N	\N	suneung	하
7291	extend	v. *연장하다	\N	\N	\N	suneung	하
7292	politics	n. *정치	\N	\N	\N	suneung	하
7293	lonely	a. *외로운*	\N	\N	\N	suneung	하
7294	habitat	n. *서식지	\N	\N	\N	suneung	하
7295	mental	a. *정신의*	\N	\N	\N	suneung	하
7296	factor	n. *요인	\N	\N	\N	suneung	하
7297	exchange	v. *교환하다*	\N	\N	\N	suneung	하
7299	species	n. (생물 분류상의) *종*(種)	\N	\N	\N	suneung	하
7300	athletic	a. *운동의	\N	\N	\N	suneung	하
7301	dental	a. *치아의*	\N	\N	\N	suneung	하
7302	delight	n. *기쁨*	\N	\N	\N	suneung	하
7304	confident	a. *자신 있는*	\N	\N	\N	suneung	하
7305	gradually	ad. *점차	\N	\N	\N	suneung	하
6956	sway	흔들리다	\N	\N	\N	gongmuwon	하
6959	synergy	협력 작용	\N	\N	\N	gongmuwon	하
6960	systemic	조직의; 온몸의	\N	\N	\N	gongmuwon	하
7326	emphasize	v. *강조하다*	\N	\N	\N	suneung	하
7327	astronomy	n. *천문학*	\N	\N	\N	suneung	하
7328	commerce	n. *상업	\N	\N	\N	suneung	하
7335	combine	v. *결합시키다	\N	\N	\N	suneung	하
7336	gene	n. *유전자*	\N	\N	\N	suneung	하
7337	response	n. *응답	\N	\N	\N	suneung	하
7342	frustrate	v. *좌절시키다*	\N	\N	\N	suneung	하
7345	increase	v. (수량이) *늘다*	\N	\N	\N	suneung	하
7356	struggle	v. *싸우다	\N	\N	\N	suneung	하
7357	n. *투쟁	 노력*	\N	\N	\N	suneung	기타
7358	electronic	a. *전자의*	\N	\N	\N	suneung	하
7359	absorb	v. *흡수하다	\N	\N	\N	suneung	하
7369	indicate	v. *지적하다	\N	\N	\N	suneung	하
7370	analyze	v. *분석하다*	\N	\N	\N	suneung	하
7371	labor	n. *노동	\N	\N	\N	suneung	하
7373	remark	n. *의연	\N	\N	\N	suneung	하
7379	stock	n. *재고품	\N	\N	\N	suneung	하
7387	heal	v. *치료하다	\N	\N	\N	suneung	하
7388	stranger	n. *낯선 사람	\N	\N	\N	suneung	하
7396	obtain	v. *획득하다	\N	\N	\N	suneung	하
7397	assist	v. *도움을 주다*	\N	\N	\N	suneung	하
7399	efficient	a. *효율적인	\N	\N	\N	suneung	하
7402	independent	a. *독립적인*	\N	\N	\N	suneung	하
7410	cancer	n. *암	\N	\N	\N	suneung	하
7411	treatment	n. *취급	\N	\N	\N	suneung	하
7422	alarm	n. *놀람	\N	\N	\N	suneung	하
7423	edge	n. *가장자리	\N	\N	\N	suneung	하
7432	consider	v. *숙고하다	\N	\N	\N	suneung	하
7436	purchase	n. *구매*	\N	\N	\N	suneung	하
7440	acquire	v. *습득하다*	\N	\N	\N	suneung	하
7451	severe	a. *심한	\N	\N	\N	suneung	하
7455	leap	v. *뛰다	\N	\N	\N	suneung	하
7462	typical	a. *전형적인	\N	\N	\N	suneung	하
7472	flu	n. *유행성 감기*	\N	\N	\N	suneung	하
7474	surround	v. *둘러싸다*	\N	\N	\N	suneung	하
7481	arrange	v. *정리하다	\N	\N	\N	suneung	하
7482	consult	v. *상담하다	\N	\N	\N	suneung	하
7487	shred	v. *갈기갈기 찢다	\N	\N	\N	suneung	하
7488	downtown	n. *도심*	\N	\N	\N	suneung	하
7491	monster	n. *괴물	\N	\N	\N	suneung	하
7499	plain	a. *명백한	\N	\N	\N	suneung	하
7500	previous	a. *앞의	\N	\N	\N	suneung	하
7504	produce	v. *생산하다	\N	\N	\N	suneung	하
7505	stroke	n. *뇌졸중	\N	\N	\N	suneung	하
7511	file	n. *서류철	\N	\N	\N	suneung	하
7514	instant	a. *즉각의	\N	\N	\N	suneung	하
7515	reveal	v. *드러내다	\N	\N	\N	suneung	하
7521	device	n. *장치	\N	\N	\N	suneung	하
7523	intend	v. *~할 작정이다	\N	\N	\N	suneung	하
7524	award	v. *수여하다*	\N	\N	\N	suneung	하
7535	horizon	n. *수평선	\N	\N	\N	suneung	하
7536	accomnplish	v. *이루다	\N	\N	\N	suneung	기타
7537	surf	n. *파도*	\N	\N	\N	suneung	하
7539	adopt	v. *채택하다	\N	\N	\N	suneung	하
7540	potential	a. *잠재적인*	\N	\N	\N	suneung	하
7544	civilization	n. *문명*	\N	\N	\N	suneung	하
7548	label	n. *꼬리표*	\N	\N	\N	suneung	하
7551	identify	v. *~임을 확인하다	\N	\N	\N	suneung	하
7558	standard	n. *기준	\N	\N	\N	suneung	하
7566	substance	n. *물질	\N	\N	\N	suneung	하
7572	principle	n. *원칙	\N	\N	\N	suneung	하
7576	stink	v. *역겹다	\N	\N	\N	suneung	하
7577	tremendous	a. *굉장한	\N	\N	\N	suneung	하
7578	appliction	n. *적용	\N	\N	\N	suneung	기타
7581	railroad	n. *철도	\N	\N	\N	suneung	하
7591	emergency	n. *비상 사태*	\N	\N	\N	suneung	하
7596	rely	v. *의지하다*	\N	\N	\N	suneung	하
7597	hesitate	v. *주저하다	\N	\N	\N	suneung	하
7603	distribute	v. *분배하다	\N	\N	\N	suneung	하
7606	imterpret	v. *통역하다	\N	\N	\N	suneung	기타
7608	annoy	v. *괴롭히다	\N	\N	\N	suneung	하
7615	entrance	n. *입장	\N	\N	\N	suneung	하
7616	persuade	v. *설득하다*	\N	\N	\N	suneung	하
7617	gear	n. *장비	\N	\N	\N	suneung	하
7618	v. 맞게 하다	 조정하다	\N	\N	\N	suneung	기타
7619	ray	n. *광선*	\N	\N	\N	suneung	하
7620	release	v. *놓아주다	\N	\N	\N	suneung	하
7638	investment	n. *투자*	\N	\N	\N	suneung	하
7639	authority	n. *권위	\N	\N	\N	suneung	하
7643	a. 유아의	 미발달의	\N	\N	\N	suneung	기타
7647	receive	v. *받다*	\N	\N	\N	suneung	하
7648	whereas	c. *~인 반면에*	\N	\N	\N	suneung	하
7649	broad	a. *넓은	\N	\N	\N	suneung	하
7656	chapter	n. (책 · 논문의) *장*(章)	\N	\N	\N	suneung	하
7659	institute	n. *연구소	\N	\N	\N	suneung	하
7664	dense	a. *조밀한	\N	\N	\N	suneung	하
7670	expand	v. *확장하다*	\N	\N	\N	suneung	하
7673	gravity	n. *중력*	\N	\N	\N	suneung	하
7683	conserve	v. *보존하다*	\N	\N	\N	suneung	하
7686	reproduce	v. *재생하다	\N	\N	\N	suneung	하
7688	concept	n. *개념*	\N	\N	\N	suneung	하
7691	formal	a. *공식적인	\N	\N	\N	suneung	하
7692	particle	n. *입자	\N	\N	\N	suneung	하
7698	rite	n. (종교적)*의식	\N	\N	\N	suneung	하
7712	current	n. *해류	\N	\N	\N	suneung	하
7715	trap	n. *함정*	\N	\N	\N	suneung	하
7721	mature	a. *성숙한	\N	\N	\N	suneung	하
7309	access	n. *접근	\N	\N	\N	suneung	하
7316	injure	v. *~에게 상처를 입히다*	\N	\N	\N	suneung	하
7360	advantage	n. *이익	\N	\N	\N	suneung	하
7325	concentrate	v. *집중하다*	\N	\N	\N	suneung	하
7433	salary	n. *급료	\N	\N	\N	suneung	하
7330	fuel	n. *연료*	\N	\N	\N	suneung	하
7338	victim	n. *희생	\N	\N	\N	suneung	하
7339	pressure	n. *압력	\N	\N	\N	suneung	하
7343	construct	v. *건설하다*	\N	\N	\N	suneung	하
7344	dwindle	v. *점점 줄어들다	\N	\N	\N	suneung	중
7350	verdict	n. *판결	\N	\N	\N	suneung	하
7351	sight	n. *시야	\N	\N	\N	suneung	하
7354	donate	v. *기부하다*	\N	\N	\N	suneung	하
7355	personality	n. *개성	\N	\N	\N	suneung	하
7362	enable	v. *가능하게 하다*	\N	\N	\N	suneung	하
7367	variety	n. *다양	\N	\N	\N	suneung	하
7368	confuse	v. *혼동하다	\N	\N	\N	suneung	하
7374	v. *의견을 말하다	* ~에 주목하다	\N	\N	\N	suneung	기타
7375	moral	a. *도덕적인*	\N	\N	\N	suneung	하
7377	claim	v. *주장하다*	\N	\N	\N	suneung	하
7378	n. *요구	 주장*	\N	\N	\N	suneung	기타
7383	interrupt	v. *방해하다	\N	\N	\N	suneung	하
7392	feature	n. *특징	\N	\N	\N	suneung	하
7394	tide	n. *조수*(潮水)	\N	\N	\N	suneung	하
7395	establish	v. *설립하다	\N	\N	\N	suneung	하
7400	terrific	a. *굉장한	\N	\N	\N	suneung	하
7401	react	v. *반응하다	\N	\N	\N	suneung	하
7406	recall	v. *상기하다	\N	\N	\N	suneung	하
7412	specific	a. *구체적인	\N	\N	\N	suneung	하
7413	engage	v. *관여하다	\N	\N	\N	suneung	하
7415	import	v. *수입하다	\N	\N	\N	suneung	하
7420	fascinate	v. *매혹하다	\N	\N	\N	suneung	중
7426	psychology	n. *심리	\N	\N	\N	suneung	하
7435	v. *자세를 취하다	* ~인 체하다	\N	\N	\N	suneung	기타
7460	mood	n. *기분	\N	\N	\N	suneung	하
7463	approve	v. *찬성하다	\N	\N	\N	suneung	하
7467	operation	n. *작업	\N	\N	\N	suneung	하
7471	exhausted	a. *고갈된	\N	\N	\N	suneung	하
7475	display	n. *전시*	\N	\N	\N	suneung	하
7476	v. *전시하다	 나타내다*	\N	\N	\N	suneung	기타
7477	policy	n. *정책	\N	\N	\N	suneung	하
7478	mass	n. *덩어리	\N	\N	\N	suneung	하
7480	accurate	a. *정확한*	\N	\N	\N	suneung	하
7483	reward	n. *보수*	\N	\N	\N	suneung	하
7490	attach	v. *붙이다	\N	\N	\N	suneung	하
7492	enormous	a. *엄청난	\N	\N	\N	suneung	하
7493	domestic	a. *국내의	\N	\N	\N	suneung	하
7494	elementary	a. *초보의	\N	\N	\N	suneung	하
7495	refer	v. *언급하다	\N	\N	\N	suneung	하
7496	gap	n. *격차	\N	\N	\N	suneung	하
7497	Renaissance	n. (14~16세기 유럽의) *문예 부흥 운동	\N	\N	\N	suneung	하
7501	slight	a. *약간의	\N	\N	\N	suneung	하
7502	leisure	n. *여가	\N	\N	\N	suneung	하
7508	muscle	n. *근육	\N	\N	\N	suneung	하
7509	delay	v. *연기하다	\N	\N	\N	suneung	하
7513	ethic	n. *윤리*	\N	\N	\N	suneung	하
7517	urban	a. *도시의*	\N	\N	\N	suneung	하
7518	witness	n. *증인	\N	\N	\N	suneung	하
7522	owe	v. *빚지고 있다	\N	\N	\N	suneung	하
7526	preserve	v. *보존하다	\N	\N	\N	suneung	하
7527	underground	a. *지하의	\N	\N	\N	suneung	하
7529	consequence	n. *결과	\N	\N	\N	suneung	하
7530	aspect	n. *관점	\N	\N	\N	suneung	하
7547	atmosphere	n. *대기	\N	\N	\N	suneung	하
7549	v. *라벨을 붙이다	 ~를 ...라고 부르다*	\N	\N	\N	suneung	기타
7559	a. *기준의	 표준의*	\N	\N	\N	suneung	기타
7560	basis	n. *기초	\N	\N	\N	suneung	하
7562	region	n. *지역*	\N	\N	\N	suneung	하
7563	sake	n. *위함	\N	\N	\N	suneung	하
7565	possess	v. *소유하다	\N	\N	\N	suneung	하
7567	realistic	a. *현실적인	\N	\N	\N	suneung	하
7571	differ	v. *다르다	\N	\N	\N	suneung	하
7573	memorize	v. *기억하다*	\N	\N	\N	suneung	하
7574	evaluate	v. *평가하다*	\N	\N	\N	suneung	하
7582	cooperate	v. *협력하다*	\N	\N	\N	suneung	하
7588	resist	v. *저항하다*	\N	\N	\N	suneung	하
7589	grant	v. *승인하다	\N	\N	\N	suneung	하
7592	rid	v. *제거하다*	\N	\N	\N	suneung	하
7593	impact	n. *충격	\N	\N	\N	suneung	하
7602	suitable	a. *적절한	\N	\N	\N	suneung	하
7604	rainforest	n. (열대)*우림*	\N	\N	\N	suneung	하
7605	circumstance	n. *상황	\N	\N	\N	suneung	하
7609	frighten	v. *겁먹게 하다*	\N	\N	\N	suneung	하
7610	estimate	n. *견적	\N	\N	\N	suneung	하
7630	corporate	a. *회사의	\N	\N	\N	suneung	하
7631	autograph	n. *서명*	\N	\N	\N	suneung	하
7636	identical	a. *동일한	\N	\N	\N	suneung	하
7642	infant	n. *유아*	\N	\N	\N	suneung	하
7645	charity	n. *자비	\N	\N	\N	suneung	하
7651	depend	v. *의지하다*	\N	\N	\N	suneung	하
7652	pure	a. *순수한*	\N	\N	\N	suneung	하
7657	refund	n. *반환	\N	\N	\N	suneung	하
7661	lately	ad. *최근에*	\N	\N	\N	suneung	하
7669	destination	n. *목적지*	\N	\N	\N	suneung	하
7672	isolate	v. *고립시키다*	\N	\N	\N	suneung	하
7675	statue	n. *상태	\N	\N	\N	suneung	하
7679	logic	n. *논리	\N	\N	\N	suneung	하
7687	tone	n. *어조(語調)	\N	\N	\N	suneung	하
7693	cancel	v. *취소하다*	\N	\N	\N	suneung	하
7694	departure	n. *출발*	\N	\N	\N	suneung	하
7695	apparent	a. *분명한	\N	\N	\N	suneung	하
7696	visual	a. *시각의*	\N	\N	\N	suneung	하
7697	agriculture	n. *농업*	\N	\N	\N	suneung	하
7312	allow	v. *허락하다	\N	\N	\N	suneung	하
7313	firm	a. *확고한	\N	\N	\N	suneung	하
7324	signify	v. *의미하다	\N	\N	\N	suneung	하
7660	v. *설립하다	 제정하다*	\N	\N	\N	suneung	기타
7329	capable	a. *~을 할 수 있는	\N	\N	\N	suneung	하
7334	movement	n. *움직임	\N	\N	\N	suneung	하
7346	n. *증가	* 이자	\N	\N	\N	suneung	기타
7348	predict	v. *예연하다	\N	\N	\N	suneung	하
7353	conclude	v. *결론짓다	\N	\N	\N	suneung	하
7363	instruction	n. *지시	\N	\N	\N	suneung	하
7364	assume	v. *추정하다	\N	\N	\N	suneung	하
7365	attempt	v. *시도하다*	\N	\N	\N	suneung	하
7381	resident	n. *거주자*	\N	\N	\N	suneung	하
7382	reasonable	a. *논리적인	\N	\N	\N	suneung	하
7384	discount	n. *할인*	\N	\N	\N	suneung	하
7386	creature	n. *생물	\N	\N	\N	suneung	하
7390	criticize	v. *비난하다*	\N	\N	\N	suneung	하
7391	convince	v. *확신시키다	\N	\N	\N	suneung	하
7393	v. *~을 특징으로 하다	* 주연하다	\N	\N	\N	suneung	기타
7398	disaster	n. *재앙	\N	\N	\N	suneung	하
7403	theory	n. *이론*	\N	\N	\N	suneung	하
7405	clue	n. *실마리	\N	\N	\N	suneung	하
7408	risk	n. *위험*	\N	\N	\N	suneung	하
7417	elder	a. *나이가 위인*	\N	\N	\N	suneung	하
7421	violent	a. *난폭한	\N	\N	\N	suneung	하
7424	deserve	v. *~ 받을 가치가 있다	\N	\N	\N	suneung	하
7425	route	n. *길	\N	\N	\N	suneung	하
7427	mole	n. *사마귀	\N	\N	\N	suneung	하
7429	weed	n. *잡초*	\N	\N	\N	suneung	하
7431	conscience	n. *양심*	\N	\N	\N	suneung	하
7434	pose	n. *자세*	\N	\N	\N	suneung	하
7438	length	n. *길이*	\N	\N	\N	suneung	하
7441	interact	v. *상호 작용하다*	\N	\N	\N	suneung	하
7442	decide	v. *결심하다	\N	\N	\N	suneung	하
7443	lifetime	n. *평생*	\N	\N	\N	suneung	하
7445	decade	n. *10년	\N	\N	\N	suneung	하
7447	meaningful	a. *의미 있는	\N	\N	\N	suneung	하
7448	brief	a. *간단한*	\N	\N	\N	suneung	하
7453	comment	n. *논평	\N	\N	\N	suneung	하
7459	mechanic	n. *기계공*	\N	\N	\N	suneung	하
7464	rural	a. *시골의*	\N	\N	\N	suneung	하
7465	finance	n. *재정	\N	\N	\N	suneung	하
7468	crime	n. *범죄*	\N	\N	\N	suneung	하
7469	awful	a. *끔찍한	\N	\N	\N	suneung	하
7485	recover	v. *회복하다	\N	\N	\N	suneung	하
7486	facility	n. *시설	\N	\N	\N	suneung	하
7506	break	v. *깨다	\N	\N	\N	suneung	하
7507	breed	v. *낳다	\N	\N	\N	suneung	하
7534	headache	n. *두통	\N	\N	\N	suneung	하
7542	slip	v. *미끄러지다	\N	\N	\N	suneung	하
7545	row	n. *열	\N	\N	\N	suneung	하
7550	decorate	v. *장식하다	\N	\N	\N	suneung	하
7552	secretary	n. *비서	\N	\N	\N	suneung	하
7553	scale	n. *규모	\N	\N	\N	suneung	하
7556	evident	a. *명백한*	\N	\N	\N	suneung	하
7557	seldom	ad. *좀처럼 ~않는*	\N	\N	\N	suneung	하
7561	automatic	a. *자동적인	\N	\N	\N	suneung	하
7568	physics	n. *물리학*	\N	\N	\N	suneung	하
7569	encounter	v. (우연히) *만나다*	\N	\N	\N	suneung	하
7579	vote	n. *투표*	\N	\N	\N	suneung	하
7586	guarantee	v. *보증하다*	\N	\N	\N	suneung	하
7590	permanent	a. *영원한	\N	\N	\N	suneung	하
7594	v. *충격을 주다	 영향을 주다*	\N	\N	\N	suneung	기타
7595	theme	n. *주제	\N	\N	\N	suneung	하
7598	location	n. *장소	\N	\N	\N	suneung	하
7599	organism	n. *유기체	\N	\N	\N	suneung	하
7600	resolve	v. *결심하다	\N	\N	\N	suneung	하
7601	curve	n. *곡선	\N	\N	\N	suneung	하
7612	cabin	n. (통나무) *오두막집	\N	\N	\N	suneung	하
7613	adventure	n. *모험*	\N	\N	\N	suneung	하
7622	slave	n. *노예*	\N	\N	\N	suneung	하
7624	rank	n. *등급*	\N	\N	\N	suneung	하
7625	v. (등급을) *매기다	* (등급을) 차지하다	\N	\N	\N	suneung	기타
7626	offer	v. *제공하다	\N	\N	\N	suneung	하
7627	symphony	n. *교향곡	\N	\N	\N	suneung	하
7628	envy	n. *부러움*	\N	\N	\N	suneung	하
7633	retire	v. *은퇴하다*	\N	\N	\N	suneung	하
7634	appeal	v. *간청하다	\N	\N	\N	suneung	하
7637	innocence	n. *순결	\N	\N	\N	suneung	하
7640	alternative	n. *대안*	\N	\N	\N	suneung	하
7644	calculate	v. *계산하다*	\N	\N	\N	suneung	하
7653	extinct	a. *멸종된	\N	\N	\N	suneung	하
7654	household	n. *가족	\N	\N	\N	suneung	하
7662	accept	v. *받아들이다	\N	\N	\N	suneung	하
7663	ashamed	a. *부끄러워하는*	\N	\N	\N	suneung	하
7668	continue	v. *계속하다*	\N	\N	\N	suneung	하
7671	evolution	n. *진화*	\N	\N	\N	suneung	하
7674	genuine	a. *진짜의* 성실한	\N	\N	\N	suneung	하
7677	military	a. *군대의*	\N	\N	\N	suneung	하
7689	invitation	n. *초대	\N	\N	\N	suneung	하
7690	precise	a. *정확한*	\N	\N	\N	suneung	하
7708	diligent	a. *근면한*	\N	\N	\N	suneung	하
7709	distinct	a. *별개의	\N	\N	\N	suneung	하
7710	component	n. *구성 요소*	\N	\N	\N	suneung	하
7716	v. 덫을 놓다	 막다	\N	\N	\N	suneung	기타
7719	demonstrate	v. *논증하다	\N	\N	\N	suneung	하
7725	faith	n. *신념	\N	\N	\N	suneung	하
7728	transfer	v. *이동하다	\N	\N	\N	suneung	하
7734	awake	v. *깨우다	\N	\N	\N	suneung	하
7737	insight	n. *통찰	\N	\N	\N	suneung	하
7740	complicated	a. *복잡한*	\N	\N	\N	suneung	하
7743	minor	a. *사소한	\N	\N	\N	suneung	하
7746	duty	n. *의무	\N	\N	\N	suneung	하
7749	option	n. *선택	\N	\N	\N	suneung	하
7755	laundry	n. *세탁물*	\N	\N	\N	suneung	하
7315	vary	v. *바꾸다	\N	\N	\N	suneung	하
7318	threat	n. *위협	\N	\N	\N	suneung	하
7322	lack	n. *부족*	\N	\N	\N	suneung	하
7584	request	n. *요청*	\N	\N	\N	suneung	하
7705	portion	n. *일부	\N	\N	\N	suneung	하
7714	universal	a. *보편적인	\N	\N	\N	suneung	하
7717	eager	a. *갈망하는*	\N	\N	\N	suneung	하
7720	democracy	n. *민주주의	\N	\N	\N	suneung	하
7723	brilliant	a. *찬란한	\N	\N	\N	suneung	하
7726	spare	a. *여분의	\N	\N	\N	suneung	하
7729	refrigerator	n. *냉장고*	\N	\N	\N	suneung	하
7738	achieve	v. *목적을 이루다	\N	\N	\N	suneung	하
7741	falsify	v. *잘못을 입증하다*	\N	\N	\N	suneung	하
7747	pause	n. *중단*	\N	\N	\N	suneung	하
7750	digest	v. *소화하다	\N	\N	\N	suneung	하
7756	transform	v. *변형시키다	\N	\N	\N	suneung	하
7759	kindergarten	n. *유치원*	\N	\N	\N	suneung	하
7762	thrive	v. *번영하다	\N	\N	\N	suneung	하
7768	n. *악	 사악*	\N	\N	\N	suneung	기타
7771	worship	n. *예배	\N	\N	\N	suneung	하
7777	fancy	n. *공상	\N	\N	\N	suneung	하
7780	surgery	n. *외과 수술*	\N	\N	\N	suneung	하
7783	shelf	n. *선반*	\N	\N	\N	suneung	하
7786	yield	v. *생산하다	\N	\N	\N	suneung	하
7789	aside	ad. *옆에	\N	\N	\N	suneung	하
7795	prey	n. *먹이*	\N	\N	\N	suneung	하
7798	abstract	a. *추상적인*	\N	\N	\N	suneung	하
7801	n. *측정	 수단*	\N	\N	\N	suneung	기타
7804	confirm	v. *확인하다	\N	\N	\N	suneung	하
7807	defeat	v. *패배시키다*	\N	\N	\N	suneung	하
7810	illustrate	v. *설명하다	\N	\N	\N	suneung	하
7816	dine	v. *만찬을 대접하다	\N	\N	\N	suneung	하
7822	a. *외국의	 이질적인*	\N	\N	\N	suneung	기타
7828	document	n. *문서	\N	\N	\N	suneung	하
7834	prohobit	v. *금지하다*	\N	\N	\N	suneung	기타
7837	execute	v. *실행하다	\N	\N	\N	suneung	하
7840	defect	n. *결점*	\N	\N	\N	suneung	하
7852	contrary	a. *반대의	\N	\N	\N	suneung	하
7855	supervise	v. *감독하다	\N	\N	\N	suneung	하
7858	enroll	v. *입학하다	\N	\N	\N	suneung	하
7861	greed	n. *탐욕*	\N	\N	\N	suneung	하
7864	compare	v. *비교하다*	\N	\N	\N	suneung	하
7873	prejudice	n. *편견	\N	\N	\N	suneung	하
7876	n. *양육	 교육*	\N	\N	\N	suneung	기타
7879	appear	v. *나타나다*	\N	\N	\N	suneung	하
7882	harsh	a. *거친	\N	\N	\N	suneung	하
7885	criteria	n. (pl.) *기준	\N	\N	\N	suneung	하
7888	n. *삼킴	* 제비	\N	\N	\N	suneung	기타
7891	general	a. *일반적인*	\N	\N	\N	suneung	하
7894	n. *비명	 절규*	\N	\N	\N	suneung	기타
7900	modify	v. *변형하다	\N	\N	\N	suneung	하
7906	sensitive	a. *민감한	\N	\N	\N	suneung	하
7909	interfere	v. *방해하다	\N	\N	\N	suneung	하
7915	capture	v. *붙잡다	\N	\N	\N	suneung	하
7921	warehouse	n. *창고*	\N	\N	\N	suneung	하
7924	pedestrian	n. *보행자*	\N	\N	\N	suneung	하
7927	errand	n. *심부름	\N	\N	\N	suneung	하
7933	n. (동물의) 우리	 양 떼	\N	\N	\N	suneung	기타
7936	profound	a. *깊은	\N	\N	\N	suneung	하
7942	widespread	a. *널리 퍼진*	\N	\N	\N	suneung	하
7945	stiffen	v. *굳어지다*	\N	\N	\N	suneung	중
7948	germ	n. *미생물	\N	\N	\N	suneung	하
7951	pile	n. *축적	\N	\N	\N	suneung	하
7954	peer	n. *동료	\N	\N	\N	suneung	하
7957	renew	v. *새롭게 하다	\N	\N	\N	suneung	하
7960	candidate	n. *후보자*	\N	\N	\N	suneung	하
7963	result	v. *결과로서 생기다*	\N	\N	\N	suneung	하
7966	foretell	v. *예언하다	\N	\N	\N	suneung	중
7969	wholesale	n. *도매*	\N	\N	\N	suneung	하
7993	avoid	v. *피하다*	\N	\N	\N	suneung	하
7996	beard	n. *턱수염*	\N	\N	\N	suneung	하
7999	confront	v. *직면하다*	\N	\N	\N	suneung	하
8002	valid	a. *타당한	\N	\N	\N	suneung	하
8008	thread	n. *실*	\N	\N	\N	suneung	하
8011	scatter	v. *흩뿌리다	\N	\N	\N	suneung	하
8014	temper	n. *성질	\N	\N	\N	suneung	하
8017	uondoubtedly	ad. *의심할 여지없이	\N	\N	\N	suneung	기타
8020	soak	v. *적시다	\N	\N	\N	suneung	하
8026	unify	v. *통합하다	\N	\N	\N	suneung	하
8029	n. 운명	 비운	\N	\N	\N	suneung	기타
8035	graze	v. *풀을 뜯다	\N	\N	\N	suneung	하
8041	review	n. *논평	\N	\N	\N	suneung	하
8044	budget	n. *예산	\N	\N	\N	suneung	하
8047	indifferent	a. *무관심한*	\N	\N	\N	suneung	하
8050	obvious	a. *명백한	\N	\N	\N	suneung	하
8053	glacier	n. *빙하*	\N	\N	\N	suneung	하
8056	antique	n. *골동품*	\N	\N	\N	suneung	하
8065	diabetes	n. *당뇨병*	\N	\N	\N	suneung	하
8068	barter	v. *교환하다*	\N	\N	\N	suneung	하
10300	focus	집중하다	\N	\N	\N	gtelp	하
10504	aroma	향	\N	\N	\N	gtelp	하
10507	improve	향상시키다	\N	\N	\N	gtelp	하
10510	courage	용기	\N	\N	\N	gtelp	하
10513	nevertheless	그럼에도 불구하고	\N	\N	\N	gtelp	하
10516	magic power	마술적인 힘	\N	\N	\N	gtelp	기타
10522	fingerprint	지문	\N	\N	\N	gtelp	하
10525	scanner	인식기	\N	\N	\N	gtelp	하
10528	be willing to	에 대해 기꺼이 하다	\N	\N	\N	gtelp	기타
10531	transfer	옮기다	\N	\N	\N	gtelp	하
10534	far from	멀리 떨어진	\N	\N	\N	gtelp	기타
10537	curve	구부러지다	\N	\N	\N	gtelp	하
10540	point	겨누다	\N	\N	\N	gtelp	하
10543	bark	개가 짖다	\N	\N	\N	gtelp	하
7702	descend	v. *내려오다	\N	\N	\N	suneung	하
7703	leak	n. *새는 구멍*	\N	\N	\N	suneung	하
7981	n. *명령	 지배력*	\N	\N	\N	suneung	기타
7704	v. *새다	* 누설하다	\N	\N	\N	suneung	기타
7739	civil	a. *시민의	\N	\N	\N	suneung	하
7742	prove	v. *입증하다	\N	\N	\N	suneung	하
7748	v. *중단하다	 잠시 멈추다*	\N	\N	\N	suneung	기타
7751	shortage	n. *부족	\N	\N	\N	suneung	하
7754	generous	a. *관대한	\N	\N	\N	suneung	하
7757	discipline	n. *훈련	\N	\N	\N	suneung	하
7760	forbid	v. *금지하다*	\N	\N	\N	suneung	하
7763	royal	a. *왕족의	\N	\N	\N	suneung	하
7784	highway	n. *고속도로	\N	\N	\N	suneung	하
7790	tolerate	v. *참다	\N	\N	\N	suneung	하
7793	contemporary	a. *동시대의	\N	\N	\N	suneung	하
7796	prior	a. *이전의	\N	\N	\N	suneung	하
7799	n. *추상	 개요*	\N	\N	\N	suneung	기타
7802	fuse	v. *융합하다*	\N	\N	\N	suneung	하
7805	explain	v. *설명하다*	\N	\N	\N	suneung	하
7811	pupil	n. *학생	\N	\N	\N	suneung	하
7814	tempt	v. *유혹하다*	\N	\N	\N	suneung	하
7817	literally	ad. *문자 그대로*	\N	\N	\N	suneung	하
7820	grab	v. *움켜쥐다*	\N	\N	\N	suneung	하
7823	alcohol	n. *알코올	\N	\N	\N	suneung	하
7826	triumph	n. *승리*	\N	\N	\N	suneung	하
7835	appropriate	a. *적절한*	\N	\N	\N	suneung	하
7838	deviation	n. *변경	\N	\N	\N	suneung	하
7841	v. 탈당하다	 망명하다	\N	\N	\N	suneung	기타
7844	trait	n. *특성	\N	\N	\N	suneung	하
7850	nutrition	n. *영양*	\N	\N	\N	suneung	하
7856	inhabit	v. *살다	\N	\N	\N	suneung	하
7859	seal	n. *도장	\N	\N	\N	suneung	하
7862	debate	n. *토론*	\N	\N	\N	suneung	하
7868	altruism	n. *이타주의*	\N	\N	\N	suneung	하
7871	retail	n. *소매*	\N	\N	\N	suneung	하
7874	agency	n. 대리점	\N	\N	\N	suneung	하
7877	priest	n. *성직자*	\N	\N	\N	suneung	하
7880	impose	v. *부과하다	\N	\N	\N	suneung	하
7883	drought	n. *가뭄*	\N	\N	\N	suneung	하
7889	dim	a. *흐릿한	\N	\N	\N	suneung	하
7895	strenuous	a. *피나는	\N	\N	\N	suneung	하
7898	glare	v. *번쩍번쩍 빛나다*	\N	\N	\N	suneung	하
7901	usual	a. *보통의	\N	\N	\N	suneung	하
7904	eliminate	v. *제거하다	\N	\N	\N	suneung	하
7907	tragic	a. *비극의	\N	\N	\N	suneung	하
7919	associate	v. *연관짓다	\N	\N	\N	suneung	하
7922	crew	n. *승무원*	\N	\N	\N	suneung	하
7928	irritate	v. *화나게 하다	\N	\N	\N	suneung	하
7931	cruel	a. *잔인한*	\N	\N	\N	suneung	하
7934	trial	n. *시도	\N	\N	\N	suneung	하
7937	annals	n. *연대기	\N	\N	\N	suneung	하
7940	prevail	v. *우세하다	\N	\N	\N	suneung	하
7943	drastic	a. *격렬한	\N	\N	\N	suneung	하
7946	weapon	n. *무기	\N	\N	\N	suneung	하
7955	enrich	v. *풍성하게 하다	\N	\N	\N	suneung	하
7958	adjust	v. *조절하다	\N	\N	\N	suneung	하
7961	ideal	n. *이상*	\N	\N	\N	suneung	하
7967	wonder	v. *이상하게 여기다	\N	\N	\N	suneung	하
7976	excess	n. *초과	\N	\N	\N	suneung	하
7979	furthermore	ad. *게다가	\N	\N	\N	suneung	하
7982	ecosystem	n. *생태계*	\N	\N	\N	suneung	하
7988	outstanding	a. *눈에 띄는 저명한	\N	\N	\N	suneung	하
7991	mislead	v. *잘못 인도하다	\N	\N	\N	suneung	하
7994	initial	a. *처음의*	\N	\N	\N	suneung	하
7997	haste	n. *급함	\N	\N	\N	suneung	하
8000	destiny	n. *운명*	\N	\N	\N	suneung	하
8003	entire	a. *전체의	\N	\N	\N	suneung	하
8006	optimal	a. *최상의	\N	\N	\N	suneung	하
8012	gamble	n. *도박*	\N	\N	\N	suneung	하
8018	raft	n. *뗏목	\N	\N	\N	suneung	하
8024	cease	v. *그만두다	\N	\N	\N	suneung	하
8027	perspective	n. *관점	\N	\N	\N	suneung	하
8030	bump	v. *부딪치다	\N	\N	\N	suneung	하
8033	erase	v. *삭제하다	\N	\N	\N	suneung	하
7730	oppose	v. *반대하다*	\N	\N	\N	suneung	하
8045	myth	n. *신화	\N	\N	\N	suneung	하
8048	strain	v. *긴장시키다	\N	\N	\N	suneung	하
8051	ingredient	n. *재료	\N	\N	\N	suneung	하
8054	urge	v. *촉구하다	\N	\N	\N	suneung	하
8060	disgrace	n. *불명예	\N	\N	\N	suneung	하
8063	scratch	v. *긁다	\N	\N	\N	suneung	하
8066	congestion	n. *밀집	\N	\N	\N	suneung	하
10301	knowledge	지식	\N	\N	\N	gtelp	하
10304	worldwide	세계적인	\N	\N	\N	gtelp	하
10307	be committed to	에 헌신하다	\N	\N	\N	gtelp	기타
10310	correctness	정확함	\N	\N	\N	gtelp	하
10313	inborn	타고난 선천적인	\N	\N	\N	gtelp	하
10316	sensitive	민감한	\N	\N	\N	gtelp	하
10319	court	궁전 왕실	\N	\N	\N	gtelp	하
10322	assume	역할 임무를 맡다	\N	\N	\N	gtelp	하
10325	wear out	닳다	\N	\N	\N	gtelp	기타
10328	continually	계속해서	\N	\N	\N	gtelp	하
10331	physically	물리적으로 육체적으로	\N	\N	\N	gtelp	하
10334	camper	야영객	\N	\N	\N	gtelp	하
10337	slap	뺨때림	\N	\N	\N	gtelp	하
10340	actual	현실의	\N	\N	\N	gtelp	하
10343	calendar	달력	\N	\N	\N	gtelp	하
10346	leap day	윤일	\N	\N	\N	gtelp	기타
10352	creative	창의적인	\N	\N	\N	gtelp	하
10355	otherwise	만약 그렇지 않으면 다른 면에서	\N	\N	\N	gtelp	하
10358	secretary	비서	\N	\N	\N	gtelp	하
10361	harmonious	조화된 균형 잡힌	\N	\N	\N	gtelp	하
10364	sentence	문장	\N	\N	\N	gtelp	하
10367	to the point	적절한	\N	\N	\N	gtelp	기타
10370	president	대통령 장	\N	\N	\N	gtelp	하
10373	belong to	에 속하다	\N	\N	\N	gtelp	기타
7727	v. 용서하다	 남겨주다	\N	\N	\N	suneung	기타
7736	vigor	n. *활력*	\N	\N	\N	suneung	하
7806	imitate	v. *모방하다*	\N	\N	\N	suneung	하
7812	intellect	n. *지성*	\N	\N	\N	suneung	하
7815	inspire	v. *영감을 주다	\N	\N	\N	suneung	하
7818	resort	v. *의지하다	\N	\N	\N	suneung	하
7821	alien	n. *외국인	\N	\N	\N	suneung	하
7824	wreck	n. *난파	\N	\N	\N	suneung	하
7830	suspect	v. *~가 아닐까 의심하다*	\N	\N	\N	suneung	하
7833	install	v. *설치하다*	\N	\N	\N	suneung	하
7836	scholarship	n. *학문	\N	\N	\N	suneung	하
7842	commute	n. *통근*	\N	\N	\N	suneung	하
7845	split	v. *찢다	\N	\N	\N	suneung	하
7848	modest	a. *겸손한	\N	\N	\N	suneung	하
7851	inner	a. *내부의*	\N	\N	\N	suneung	하
7854	ensure	v. *확보하다	\N	\N	\N	suneung	하
7857	earthquake	n. *지진	\N	\N	\N	suneung	하
7866	conquer	v. *극복하다	\N	\N	\N	suneung	하
7869	contract	v. *계약하다	\N	\N	\N	suneung	하
7878	elegant	a. *고상한	\N	\N	\N	suneung	하
7881	masterpiece	n. *명작	\N	\N	\N	suneung	하
7884	arise	v. *발생하다	\N	\N	\N	suneung	하
7887	swallow	v. *삼키다*	\N	\N	\N	suneung	하
7893	scream	v. *절규하다	\N	\N	\N	suneung	하
7896	spill	v. *엎지르다	\N	\N	\N	suneung	하
7902	routine	n. *일상적인 일	\N	\N	\N	suneung	하
7905	deny	v. *부인하다	\N	\N	\N	suneung	하
7908	deprive	v. *박탈하다*	\N	\N	\N	suneung	하
7911	council	n. *협회	\N	\N	\N	suneung	하
7914	arctic	a. *북극의*	\N	\N	\N	suneung	하
7917	dilute	a. *묽은*	\N	\N	\N	suneung	하
7926	welfare	n. *복지*	\N	\N	\N	suneung	하
7929	glance	n. *흘긋 봄*	\N	\N	\N	suneung	하
7932	fold	v. *접다*	\N	\N	\N	suneung	하
7935	tribe	n. *부족	\N	\N	\N	suneung	하
7941	infection	n. *감염	\N	\N	\N	suneung	하
7947	reinforcement	n. *강화	\N	\N	\N	suneung	하
7950	endanger	v. *위험에 빠뜨리다*	\N	\N	\N	suneung	하
7953	atom	n. *원자*	\N	\N	\N	suneung	하
7956	protect	v. *보호하다*	\N	\N	\N	suneung	하
7959	noble	a. *귀족의	\N	\N	\N	suneung	하
7965	ethnic	a. *인종의	\N	\N	\N	suneung	하
7968	n. 경이	 경탄	\N	\N	\N	suneung	기타
7971	debt	n. *빚	\N	\N	\N	suneung	하
7977	a. *초과한	 여분의*	\N	\N	\N	suneung	기타
7986	shift	n. *변화	\N	\N	\N	suneung	하
7989	drift	n. *표류*	\N	\N	\N	suneung	하
7992	dedicate	v. *헌납하다	\N	\N	\N	suneung	하
8001	hardship	n. *고난	\N	\N	\N	suneung	하
8004	n. 전부	 전체	\N	\N	\N	suneung	기타
8007	hydrogen	n. *수소*	\N	\N	\N	suneung	하
8010	dynasty	n. *왕조	\N	\N	\N	suneung	하
8016	craft	n. *솜씨	\N	\N	\N	suneung	하
8019	minimal	a. *아주 적은	\N	\N	\N	suneung	하
8025	ceiling	n. *천장	\N	\N	\N	suneung	하
8028	doom	v. *~할 운명이다*	\N	\N	\N	suneung	하
8031	n. *충돌	* 혹	\N	\N	\N	suneung	기타
8034	moderate	a. *온건한	\N	\N	\N	suneung	하
8037	incident	n. *일어난 일	\N	\N	\N	suneung	하
8043	geometry	n. *기하학*	\N	\N	\N	suneung	하
8046	fur	n. *부드러운 털	\N	\N	\N	suneung	하
8052	dismiss	v. *해고하다	\N	\N	\N	suneung	하
8055	celebrity	n. *명성	\N	\N	\N	suneung	하
8058	sphere	n. *구체(球體)	\N	\N	\N	suneung	하
8061	crawl	v. *기어가다	\N	\N	\N	suneung	하
8064	n. *긁은 자국	 찰과상*	\N	\N	\N	suneung	기타
8067	constituse	v. *구성하다	\N	\N	\N	suneung	기타
8069	n. *물물교환	 교역품*	\N	\N	\N	suneung	기타
8071	circular	a. *원의	\N	\N	\N	suneung	하
8072	chilly	a. *쌀쌀한	\N	\N	\N	suneung	하
8073	profit	n. *이익	\N	\N	\N	suneung	하
8075	fierce	a. *사나운	\N	\N	\N	suneung	하
8076	vague	a. *막연한	\N	\N	\N	suneung	하
8077	editorial	n. *사설	\N	\N	\N	suneung	하
8079	content	a. *만족하여*	\N	\N	\N	suneung	하
8080	n. *내용(물)	 목차*	\N	\N	\N	suneung	기타
8081	flow	v. *흐르다*	\N	\N	\N	suneung	하
8084	fertile	a. *비옥한	\N	\N	\N	suneung	하
8085	abolish	v. *폐지하다*	\N	\N	\N	suneung	하
8086	assure	v. *보증하다	\N	\N	\N	suneung	하
8087	rehearsal	n. *리허설	\N	\N	\N	suneung	하
8088	gender	n. *성	\N	\N	\N	suneung	하
8089	innovation	n. *혁신*	\N	\N	\N	suneung	하
8090	emperor	n. *황제*	\N	\N	\N	suneung	하
8091	dwell	v. *살다	\N	\N	\N	suneung	하
8092	opponent	n. *반대자	\N	\N	\N	suneung	하
8095	fossil	n. *화석*	\N	\N	\N	suneung	하
8096	glitter	v. *반짝이다*	\N	\N	\N	suneung	하
7800	measure	v. *측정하다*	\N	\N	\N	suneung	하
8098	carve	v. *베다	\N	\N	\N	suneung	하
8099	decay	n. *부식*	\N	\N	\N	suneung	하
8101	protein	n. *단백질*	\N	\N	\N	suneung	하
8102	backward	ad. *후방에	\N	\N	\N	suneung	하
8103	tissue	n. (생물의 근육 · 신경 등의) *조직*	\N	\N	\N	suneung	하
8104	refresh	v. *상쾌하게 하다	\N	\N	\N	suneung	하
7758	v. *훈련하다	 단련하다*	\N	\N	\N	suneung	기타
7761	ultimate	a. *궁극적인	\N	\N	\N	suneung	하
7764	ruin	n. *파멸	\N	\N	\N	suneung	하
7767	evil	a. *사악한*	\N	\N	\N	suneung	하
7773	afterward	ad. *나중에	\N	\N	\N	suneung	하
7776	scarce	a. *부족한	\N	\N	\N	suneung	하
7782	regulate	v. *규제하다	\N	\N	\N	suneung	하
7785	utility	n. *효용	\N	\N	\N	suneung	하
7791	cottage	n. *오두막집*	\N	\N	\N	suneung	하
7797	necessity	n. *필수	\N	\N	\N	suneung	하
7803	n. 전기 퓨즈	 도화선	\N	\N	\N	suneung	기타
7944	fade	v. *사라지다	\N	\N	\N	suneung	하
8117	n. *오름	 상승*	\N	\N	\N	suneung	기타
8126	strive	v. *노력하다	\N	\N	\N	suneung	하
8129	pertray	v. *묘사하다	\N	\N	\N	suneung	기타
8132	wage	n. *급료*	\N	\N	\N	suneung	하
8135	merit	n. *장점	\N	\N	\N	suneung	하
8141	administer	v. *관리하다	\N	\N	\N	suneung	하
8144	accuse	v. *고발하다	\N	\N	\N	suneung	하
8147	overwhelm	v. *압도하다	\N	\N	\N	suneung	하
8150	a. *구리의	 구릿빛의*	\N	\N	\N	suneung	기타
8153	colleague	n. *동료*	\N	\N	\N	suneung	하
8156	pill	n.*알약*	\N	\N	\N	suneung	하
8162	cope	v. *대처하다	\N	\N	\N	suneung	하
8165	cattle	n. (집합적) *소	\N	\N	\N	suneung	하
8168	obedient	a. *유순한	\N	\N	\N	suneung	하
8171	therapy	n. *치료	\N	\N	\N	suneung	하
8174	radical	a. *과격한	\N	\N	\N	suneung	하
8177	caution	n. *조심	\N	\N	\N	suneung	하
8180	reverse	n. *역	\N	\N	\N	suneung	하
8183	architecture	n. *건축	\N	\N	\N	suneung	하
8186	hence	ad. *그러므로	\N	\N	\N	suneung	하
8192	murder	n. *살인*	\N	\N	\N	suneung	하
8198	omit	v. *생략하다	\N	\N	\N	suneung	하
8201	despair	n. *절망*	\N	\N	\N	suneung	하
8207	optimistic	a. *낙관적인	\N	\N	\N	suneung	하
8210	pretend	v. *주장하다	\N	\N	\N	suneung	하
8213	inflate	v. *팽창시키다	\N	\N	\N	suneung	하
8216	joint	n. *이음매	\N	\N	\N	suneung	하
8222	restore	v. *복구하다	\N	\N	\N	suneung	하
8408	lease	n. *임대*	\N	\N	\N	suneung	하
8225	n. *경험	 체험*	\N	\N	\N	suneung	기타
8228	classify	v. *분류하다*	\N	\N	\N	suneung	하
8309	industry	n. *산업(계)	\N	\N	\N	suneung	하
8312	partial	a. *부분적인*	\N	\N	\N	suneung	하
8315	fate	n. *운명*	\N	\N	\N	suneung	하
8327	paralysis	n. *마비*	\N	\N	\N	suneung	하
8330	context	n. *전후관계	\N	\N	\N	suneung	하
8333	masculine	a. *남자의	\N	\N	\N	suneung	하
8336	frown	v. *눈살을 찌푸리다*	\N	\N	\N	suneung	하
8342	alley	n. *오솔길	\N	\N	\N	suneung	하
8345	crucial	a. *중대한	\N	\N	\N	suneung	하
8348	complete	v. *완료하다*	\N	\N	\N	suneung	하
8351	tease	v. *괴롭히다	\N	\N	\N	suneung	하
8360	v. *남용하다	* 학대하다	\N	\N	\N	suneung	기타
8363	unemployed	a. *실업의	\N	\N	\N	suneung	하
8369	psychologist	n. *심리학자*	\N	\N	\N	suneung	하
8375	v. 기르다	 일으키다	\N	\N	\N	suneung	기타
8378	deal	v. *다루다	\N	\N	\N	suneung	하
8381	n. *신병	 신입사원*	\N	\N	\N	suneung	기타
8387	devastate	v. *황폐시키다*	\N	\N	\N	suneung	중
8390	troop	n. *무리	\N	\N	\N	suneung	하
8393	bay	n. *만(灣)*	\N	\N	\N	suneung	하
8396	bulletin	n. *게시	\N	\N	\N	suneung	하
8399	affair	n. *사건	\N	\N	\N	suneung	하
8402	hostile	a. *적대적인*	\N	\N	\N	suneung	하
8414	kettle	n. *주전자	\N	\N	\N	suneung	하
8417	compensate	v. *보장하다*	\N	\N	\N	suneung	하
8426	pierce	v. *꿰뚫다	\N	\N	\N	suneung	하
8429	strike	v. *치다	\N	\N	\N	suneung	하
8435	renowned	a. *유명한	\N	\N	\N	suneung	하
8438	immigrate	v. (타국에서) *이주하다*	\N	\N	\N	suneung	중
8441	animate	v. *생기있게 하다	\N	\N	\N	suneung	하
8447	mischief	n. *해악	\N	\N	\N	suneung	하
8456	simultaneously	ad. *동시에*	\N	\N	\N	suneung	하
8450	adhere	v. *충실하다	\N	\N	\N	suneung	하
8459	prevent	v. *예방하다*	\N	\N	\N	suneung	하
8462	meditate	v. *명상하다*	\N	\N	\N	suneung	하
8465	afflict	v. *괴롭히다*	\N	\N	\N	suneung	중
8468	intolerable	a. *참을 수 없는*	\N	\N	\N	suneung	하
8471	compliment	n. *칭찬*	\N	\N	\N	suneung	하
8477	durability	n. *내구성*	\N	\N	\N	suneung	하
8480	face	v. *직면하다*	\N	\N	\N	suneung	하
8483	n. *사항	 상세*	\N	\N	\N	suneung	기타
8489	colony	n. *식민지	\N	\N	\N	suneung	하
8492	casual	a. *우연한	\N	\N	\N	suneung	하
8495	retreat	n. *퇴각	\N	\N	\N	suneung	하
8498	clinic	n. *전문 병원	\N	\N	\N	suneung	하
8501	vow	n. *맹세*	\N	\N	\N	suneung	하
8504	tame	a. *길들여진*	\N	\N	\N	suneung	하
8507	boast	v. *자랑하다	\N	\N	\N	suneung	하
8516	incentive	n	\N	\N	\N	suneung	하
8519	Confucian	a. *공자의	\N	\N	\N	suneung	하
8522	crude	a. *가공하지 않은	\N	\N	\N	suneung	하
8525	velocity	n. *속력*	\N	\N	\N	suneung	하
8108	form	v. *형성하다*	\N	\N	\N	suneung	하
8231	transaction	n. *거래	\N	\N	\N	suneung	하
8237	edible	a. *먹을 수 있는	\N	\N	\N	suneung	하
8243	tablet	n. <의학> *정제	\N	\N	\N	suneung	하
8249	roam	v. (정처 없이) *배회하다*	\N	\N	\N	suneung	하
8252	behalf	n. *이익	\N	\N	\N	suneung	하
8255	infinite	a. *무한의*	\N	\N	\N	suneung	하
8258	municipal	a. *지방(자치제)의	\N	\N	\N	suneung	하
8261	concern	v. *~에 관계하다*	\N	\N	\N	suneung	하
8264	pavement	n. *보도	\N	\N	\N	suneung	하
8270	exclude	v. *배제하다	\N	\N	\N	suneung	하
8273	sacred	a. *신성한	\N	\N	\N	suneung	하
8276	n. *떠받침	 지지*	\N	\N	\N	suneung	기타
8279	monetary	a. *화폐의*	\N	\N	\N	suneung	하
8282	superb	a. *최고의	\N	\N	\N	suneung	하
8285	internal	a. *내부의*	\N	\N	\N	suneung	하
8288	refine	v. *정제하다	\N	\N	\N	suneung	하
8291	prompt	a. *즉각적인*	\N	\N	\N	suneung	하
8294	control	v. *관리하다*	\N	\N	\N	suneung	하
8300	deliberate	a. *의도적인	\N	\N	\N	suneung	하
8306	rod	n. *막대기	\N	\N	\N	suneung	하
8111	substitute	v. *대체하다*	\N	\N	\N	suneung	하
8114	pottery	n. *도자기*	\N	\N	\N	suneung	하
8119	exclaim	v. (감탄하며) *외치다*	\N	\N	\N	suneung	하
8125	heritage	n. *유산	\N	\N	\N	suneung	하
8128	majesty	n. *위엄	\N	\N	\N	suneung	하
8134	intimate	a. *친밀한*	\N	\N	\N	suneung	하
8137	launch	v. (로켓 · 우주선 등을) *발사하다	\N	\N	\N	suneung	하
8140	reception	n. *환영회	\N	\N	\N	suneung	하
8143	cherish	v. *소중히 하다*	\N	\N	\N	suneung	하
8146	shrink	v. *축소하다	\N	\N	\N	suneung	하
8149	copper	n. *구리*	\N	\N	\N	suneung	하
8155	famine	n. *굶주림	\N	\N	\N	suneung	하
8158	immune	a. *면역성의	\N	\N	\N	suneung	하
8161	string	n. *끈	\N	\N	\N	suneung	하
8164	apply	v. *적용하다*	\N	\N	\N	suneung	하
8170	bond	n. *결속	\N	\N	\N	suneung	하
8173	depict	v. *묘사하다	\N	\N	\N	suneung	하
8176	angle	n. *각도	\N	\N	\N	suneung	하
8185	strategy	n. *전략*	\N	\N	\N	suneung	하
8191	category	n. *범주*	\N	\N	\N	suneung	하
8194	funeral	n. *장례식*	\N	\N	\N	suneung	하
8197	flush	v. (얼굴이) *붉어지다	\N	\N	\N	suneung	하
8200	alert	a. *방심하지 않는	\N	\N	\N	suneung	하
8203	compact	a. *아담한	\N	\N	\N	suneung	하
8206	astonish	v. *놀라게 하다*	\N	\N	\N	suneung	중
8209	humid	a. (날씨가) *습기 있는	\N	\N	\N	suneung	하
8212	delicate	a. *섬세한*	\N	\N	\N	suneung	하
8215	physician	n. *의사	\N	\N	\N	suneung	하
8218	via	p. *~에 의하여	\N	\N	\N	suneung	하
8224	experience	v. *경험하다*	\N	\N	\N	suneung	하
8230	a. *근본적인	 근본의*	\N	\N	\N	suneung	기타
8233	stable	a. *안정된*	\N	\N	\N	suneung	하
8236	by-product	n. *부산물*	\N	\N	\N	suneung	기타
8239	bud	n. *싹*	\N	\N	\N	suneung	하
8242	anxiety	n. *걱정	\N	\N	\N	suneung	하
8245	liquid	n. *액체*	\N	\N	\N	suneung	하
8248	outlook	n. *전망	\N	\N	\N	suneung	하
8251	tenant	n. *세입자	\N	\N	\N	suneung	하
8254	distortion	n. *왜곡	\N	\N	\N	suneung	하
8257	symbolic	a. *상징적인*	\N	\N	\N	suneung	하
8263	worthwhile	a. *~할 가치가 있는*	\N	\N	\N	suneung	하
8266	diminish	v. *감소하다*	\N	\N	\N	suneung	하
8272	nominate	v. (후보자로) *지명하다	\N	\N	\N	suneung	하
8275	support	v. *떠받치다	\N	\N	\N	suneung	하
8278	iceberg	n. *빙산*	\N	\N	\N	suneung	하
8281	resent	v. *분개하다	\N	\N	\N	suneung	하
8284	diverse	a. *다른 종류의	\N	\N	\N	suneung	하
8290	nerve	n. *신경*	\N	\N	\N	suneung	하
8293	suspend	v. *매달다	\N	\N	\N	suneung	하
8296	distranction	n. (정신의) *산만함	\N	\N	\N	suneung	기타
8299	martial	a. *전쟁의	\N	\N	\N	suneung	하
8302	trigger	n. *방아쇠	\N	\N	\N	suneung	하
8311	suggest	v. *제안하다	\N	\N	\N	suneung	하
8314	mutual	a. *서로의	\N	\N	\N	suneung	하
8317	pursue	v. *추구하다	\N	\N	\N	suneung	하
8320	insult	n. *모욕*	\N	\N	\N	suneung	하
8323	supreme	n. *최고*	\N	\N	\N	suneung	하
8332	sew	v. *꿰매다	\N	\N	\N	suneung	하
8338	vest	n. *조끼*	\N	\N	\N	suneung	하
8341	dictator	n. *독재자	\N	\N	\N	suneung	하
8347	deck	n. *갑판*	\N	\N	\N	suneung	하
8350	miserable	a. *비참한	\N	\N	\N	suneung	하
8356	a. *수양의	 위탁의*	\N	\N	\N	suneung	기타
8359	abuse	n. *남용	\N	\N	\N	suneung	하
8365	disguise	n. *변장*	\N	\N	\N	suneung	하
8368	sermon	n. *설교*	\N	\N	\N	suneung	하
8371	sprout	n. *싹*	\N	\N	\N	suneung	하
8374	a. *뒤의	 후방의*	\N	\N	\N	suneung	기타
8380	recruit	v. *모집하다	\N	\N	\N	suneung	하
8383	workshop	n. *작업장	\N	\N	\N	suneung	하
8386	convention	n. *집회	\N	\N	\N	suneung	하
8389	overlook	v. *간과하다	\N	\N	\N	suneung	하
8392	nourish	v. *영양분을 주다	\N	\N	\N	suneung	하
8395	goodwill	n. *호의	\N	\N	\N	suneung	하
8404	respect	v. *존중하다*	\N	\N	\N	suneung	하
8407	mow	v. (풀을) *베다*	\N	\N	\N	suneung	하
8410	racial	a. *인종의*	\N	\N	\N	suneung	하
8413	satisfy	v. *만족시키다	\N	\N	\N	suneung	하
8416	fatal	a. *치명적인*	\N	\N	\N	suneung	하
8419	reign	n. *통치*	\N	\N	\N	suneung	하
8422	crack	n. *갈라진 틈*	\N	\N	\N	suneung	하
8431	core	n. *핵심*	\N	\N	\N	suneung	하
8434	spear	n. *창*	\N	\N	\N	suneung	하
8437	withdraw	v. (돈을) *인출하다	\N	\N	\N	suneung	하
8440	notify	v. *공지하다	\N	\N	\N	suneung	하
8443	tender	a. *부드러운*	\N	\N	\N	suneung	하
8446	bilingual	a. *2개 국어의*	\N	\N	\N	suneung	하
8449	maintain	v. *유지하다	\N	\N	\N	suneung	하
8455	folktale	n. *민간 설화	\N	\N	\N	suneung	중
8461	gigantic	a. *거대한*	\N	\N	\N	suneung	하
8464	remove	v. *제거하다*	\N	\N	\N	suneung	하
8467	coherent	a. *통일성 있는	\N	\N	\N	suneung	하
8470	bold	a. *대담한	\N	\N	\N	suneung	하
8473	summit	n. *꼭대기	\N	\N	\N	suneung	하
8476	conceive	v. *생각해 내다	\N	\N	\N	suneung	하
8479	shallow	a. *얕은	\N	\N	\N	suneung	하
8482	particular	a. *특정한	\N	\N	\N	suneung	하
8485	overall	a. *전부의	\N	\N	\N	suneung	하
8488	superstition	n. *미신*	\N	\N	\N	suneung	하
8494	conceal	v. *숨기다*	\N	\N	\N	suneung	하
8497	compulsive	a. *강제적인	\N	\N	\N	suneung	하
8500	formula	n. *공식	\N	\N	\N	suneung	하
8503	malnutrition	n. *영양실조*	\N	\N	\N	suneung	하
8506	undergo	v. *겪다*	\N	\N	\N	suneung	하
8509	stain	n. *얼룩*	\N	\N	\N	suneung	하
8512	tendency	n. *경향	\N	\N	\N	suneung	하
8113	scan	v. *정밀 검사하다	\N	\N	\N	suneung	하
8116	rise	v. *오르다	\N	\N	\N	suneung	하
8121	flavor	n. *맛*	\N	\N	\N	suneung	하
8127	property	n. *재산*	\N	\N	\N	suneung	하
8133	asset	n. *자산	\N	\N	\N	suneung	하
8142	vicious	a. *사악한	\N	\N	\N	suneung	하
8145	eternal	a. *영원한*	\N	\N	\N	suneung	하
8148	transmit	v. *전달하다*	\N	\N	\N	suneung	하
8151	orbit	n. *궤도*	\N	\N	\N	suneung	하
8154	discard	v. *버리다	\N	\N	\N	suneung	하
8157	enhance	v. *향상시키다*	\N	\N	\N	suneung	하
8163	raw	a. *날것의	\N	\N	\N	suneung	하
8166	loan	n. *대출	\N	\N	\N	suneung	하
8169	procedure	n. *절차	\N	\N	\N	suneung	하
8172	subtle	a. *미묘한	\N	\N	\N	suneung	하
8181	a. *역의	 반대의*	\N	\N	\N	suneung	기타
8187	panic	n. *갑작스런 공포	\N	\N	\N	suneung	하
8190	attract	v. (주의 · 흥미 등을) *끌다*	\N	\N	\N	suneung	하
8196	humiliation	n. *창피함	\N	\N	\N	suneung	하
8199	outcome	n. *결과*	\N	\N	\N	suneung	하
8205	likewise	ad. *마찬가지로*	\N	\N	\N	suneung	하
8208	loyal	a. *충성스러운	\N	\N	\N	suneung	하
8211	deluxe	a. *호화로운	\N	\N	\N	suneung	하
8214	adequate	a. *적당한*	\N	\N	\N	suneung	하
8217	a. 공동의	 연합의	\N	\N	\N	suneung	기타
8223	passive	a. *수동적인	\N	\N	\N	suneung	하
8226	marble	n. *대리석	\N	\N	\N	suneung	하
8229	fundamental	n. *근본*	\N	\N	\N	suneung	하
8232	sufficient	a. *충분한*	\N	\N	\N	suneung	하
8235	sympathy	n. *동정	\N	\N	\N	suneung	하
8238	federal	a. *연방의	\N	\N	\N	suneung	하
8241	trivial	a. *사소한*	\N	\N	\N	suneung	하
8244	prepare	v. *준비하다*	\N	\N	\N	suneung	하
8247	contend	v. *싸우다	\N	\N	\N	suneung	하
8250	decent	a. *괜찮은	\N	\N	\N	suneung	하
8256	anticipate	v. *예상하다	\N	\N	\N	suneung	하
8259	phenomenon	n. *현상	\N	\N	\N	suneung	하
8262	n. *관심사	 걱정*	\N	\N	\N	suneung	기타
8265	dioxide	n. *이산화물*	\N	\N	\N	suneung	하
8268	limp	v. *절뚝거리다*	\N	\N	\N	suneung	하
8271	flexible	a. *융통성 있는	\N	\N	\N	suneung	하
8274	ranch	n. *목장*	\N	\N	\N	suneung	하
8280	revise	v *개정하다*	\N	\N	\N	suneung	하
8283	abrupt	a. *갑작스러운*	\N	\N	\N	suneung	하
8286	gloom	n. *어둠	\N	\N	\N	suneung	하
8289	dynamic	a. *동적인	\N	\N	\N	suneung	하
8292	v. *촉구하다	 자극하다*	\N	\N	\N	suneung	기타
8295	n. *지배	 제어*	\N	\N	\N	suneung	기타
8298	monologue	n. *독백*	\N	\N	\N	suneung	하
8304	plot	n. *음모	\N	\N	\N	suneung	하
8307	Atlantic	n. *대서양*	\N	\N	\N	suneung	하
8310	weird	a. *이상한	\N	\N	\N	suneung	하
8316	booth	n. *칸막이한 좌석	\N	\N	\N	suneung	하
8319	erupt	v. *분출하다	\N	\N	\N	suneung	하
8322	gaze	v. *뚫어지게 보다	\N	\N	\N	suneung	하
8325	lever	n. *지레	\N	\N	\N	suneung	하
8328	dominate	v. *지배하다*	\N	\N	\N	suneung	하
8340	astound	v. *놀라게 하다*	\N	\N	\N	suneung	중
8343	gain	v. *얻다*	\N	\N	\N	suneung	하
8346	curriculum	n. *교육 과정	\N	\N	\N	suneung	하
8352	aggressive	a. *공격적인	\N	\N	\N	suneung	하
8355	foster	v. *육성하다	\N	\N	\N	suneung	하
8358	postpone	v. *연기하다	\N	\N	\N	suneung	하
8361	blueprint	n. *청사진*	\N	\N	\N	suneung	하
8364	breakdown	n. *고장	\N	\N	\N	suneung	하
8367	tin	n. *양철	\N	\N	\N	suneung	하
8370	output	n. *생산(고)	\N	\N	\N	suneung	하
8373	rear	n. *뒤*	\N	\N	\N	suneung	하
8376	reform	n. *개혁*	\N	\N	\N	suneung	하
8382	choke	v. *질식시키다	\N	\N	\N	suneung	하
8388	reap	v. *수확하다*	\N	\N	\N	suneung	하
8391	reject	v. *거절하다	\N	\N	\N	suneung	하
8394	stun	v. *기절시키다	\N	\N	\N	suneung	하
8397	fluid	n. *유동체* (액체 · 기체의 총칭)	\N	\N	\N	suneung	하
8400	dawn	n. *새벽*	\N	\N	\N	suneung	하
8403	tray	n. *쟁반*	\N	\N	\N	suneung	하
8406	await	v. *기다리다*	\N	\N	\N	suneung	하
8418	invert	v. *거꾸로 하다*	\N	\N	\N	suneung	하
8421	convert	v. *전환하다*	\N	\N	\N	suneung	하
8424	startle	v. *깜짝 놀라게 하다*	\N	\N	\N	suneung	중
8427	tension	n. *긴장	\N	\N	\N	suneung	하
8430	suppress	v. *억압하다	\N	\N	\N	suneung	하
8433	contribute	v. *공헌하다*	\N	\N	\N	suneung	하
8436	era	n. *시대*	\N	\N	\N	suneung	하
8439	dignity	n. *존엄*	\N	\N	\N	suneung	하
8451	judge	v. *판단하다*	\N	\N	\N	suneung	하
8454	sanitation	n. *위생*	\N	\N	\N	suneung	하
8457	groom	n. *신랑*	\N	\N	\N	suneung	하
8460	instinct	n. *본능*	\N	\N	\N	suneung	하
8463	exemplify	v. *예증하다	\N	\N	\N	suneung	하
8466	literate	a. *읽고 쓸 수 있는*	\N	\N	\N	suneung	하
8469	fountain	n. *분수	\N	\N	\N	suneung	하
8475	alter	v. *바꾸다	\N	\N	\N	suneung	하
8481	n. *얼굴	 표면*	\N	\N	\N	suneung	기타
8484	grasp	v. *붙잡다	\N	\N	\N	suneung	하
8487	weep	v. *울다*	\N	\N	\N	suneung	하
8490	absurd	a. *불합리한	\N	\N	\N	suneung	하
8493	prone	a. *~하는 경향이 있는*	\N	\N	\N	suneung	하
8496	v. *퇴각하다	 후퇴하다*	\N	\N	\N	suneung	기타
8499	banner	n. *깃발	\N	\N	\N	suneung	하
8511	wrestle	v. (일과) *씨름하다	\N	\N	\N	suneung	하
8520	draft	n. *밑그림	\N	\N	\N	suneung	하
8523	supplement	n. *보충*	\N	\N	\N	suneung	하
8526	relate	v. *관련시키다*	\N	\N	\N	suneung	하
8532	diagnose	v. *진단하다*	\N	\N	\N	suneung	하
8115	layer	n. *층	\N	\N	\N	suneung	하
8118	radiant	a. *빛나는	\N	\N	\N	suneung	하
8539	motive	n. *동기* (행동의 원인)	\N	\N	\N	suneung	하
8542	rigid	a. *완고한*	\N	\N	\N	suneung	하
8545	impulse	n. *충동	\N	\N	\N	suneung	하
8548	proficient	a. *숙달된*	\N	\N	\N	suneung	하
8551	equity	n. *공평*	\N	\N	\N	suneung	하
8557	versus	p. *~대(對)	\N	\N	\N	suneung	하
8560	a. *독특한	* 특징적인	\N	\N	\N	suneung	기타
8563	boundary	n. *경계	\N	\N	\N	suneung	하
8566	confine	v. *한정하다	\N	\N	\N	suneung	하
8569	v. *급파하다	 발송하다*	\N	\N	\N	suneung	기타
8572	propriety	n. *적절성	\N	\N	\N	suneung	하
8578	geology	n. *지질학*	\N	\N	\N	suneung	하
8581	soar	v. *높이 치솟다*	\N	\N	\N	suneung	하
8584	disclose	v. *드러내다	\N	\N	\N	suneung	하
8587	sympton	n. *증상*	\N	\N	\N	suneung	기타
8590	awkward	a. *서투른	\N	\N	\N	suneung	하
8593	closet	n. *벽장*	\N	\N	\N	suneung	하
8596	suitor	n. *소송인	\N	\N	\N	suneung	중
8602	V. *배출하다	 내보내다	\N	\N	\N	suneung	기타
8605	cord	n. *끈	\N	\N	\N	suneung	하
8608	sole	a. *유일한*	\N	\N	\N	suneung	하
8611	storage	n. *저장	\N	\N	\N	suneung	하
8614	illusion	n. *환상	\N	\N	\N	suneung	하
8617	divine	a. *신성한	\N	\N	\N	suneung	하
8620	probe	v. *조사하다*	\N	\N	\N	suneung	하
8623	regret	v. *후회하다	\N	\N	\N	suneung	하
8626	abnormal	a. *비정상의*	\N	\N	\N	suneung	하
8629	stool	n. (등받이가 없는) *걸상	\N	\N	\N	suneung	하
8632	virtue	n. *미덕*	\N	\N	\N	suneung	하
8635	cognitive	a. *인식의	\N	\N	\N	suneung	하
8638	bounce	v. (공이) *튀다	\N	\N	\N	suneung	하
8641	imprison	v. *투옥하다*	\N	\N	\N	suneung	중
8644	trace	n. *흔적*	\N	\N	\N	suneung	하
8653	convenience	n. *편의	\N	\N	\N	suneung	하
8656	contaminate	v. *오염시키다*	\N	\N	\N	suneung	하
8659	allocate	v. *할당하다	\N	\N	\N	suneung	하
8662	subjective	a. *주관적인	\N	\N	\N	suneung	하
8665	accord	v. *일치하다*	\N	\N	\N	suneung	하
8671	reconcliation	n. *화해*	\N	\N	\N	suneung	기타
8677	ceramic	n. *도자기*	\N	\N	\N	suneung	하
8683	v. *정지하다	 정지시키다*	\N	\N	\N	suneung	기타
8686	lottery	n. *복권	\N	\N	\N	suneung	하
8689	burglar	n. (주거 침입) *강도*	\N	\N	\N	suneung	하
8692	transplant	n. *이식*	\N	\N	\N	suneung	하
8698	plague	n. *전염병*	\N	\N	\N	suneung	하
8704	evaporate	v. *증발하다*	\N	\N	\N	suneung	하
8707	n. *행위	 안내*	\N	\N	\N	suneung	기타
8710	oppress	v. *억압하다*	\N	\N	\N	suneung	중
8713	embrace	n. *포옹*	\N	\N	\N	suneung	하
8716	certificate	n. *증명서*	\N	\N	\N	suneung	하
8719	remind	v. *생각나게 하다	\N	\N	\N	suneung	하
8722	v. *흘긋 보다	* 깨닫다	\N	\N	\N	suneung	기타
8725	swell	v. *부풀다*	\N	\N	\N	suneung	하
8728	beverage	n. *음료*	\N	\N	\N	suneung	하
8734	arrogant	a. *거만한*	\N	\N	\N	suneung	하
8737	cozy	a. *아늑한*	\N	\N	\N	suneung	하
8743	outbreak	n. (전쟁 · 질병 등의) *발발	\N	\N	\N	suneung	하
8749	undo	v. *원상태로 돌리다	\N	\N	\N	suneung	하
8752	toss	v. *던지다*	\N	\N	\N	suneung	하
8755	buildup	n. *축적*	\N	\N	\N	suneung	하
8758	auditorium	n. *강당*	\N	\N	\N	suneung	하
8761	n. *소홀	 무시*	\N	\N	\N	suneung	기타
8767	bruise	n. *타박상	\N	\N	\N	suneung	하
8773	heredity	n. *유전	\N	\N	\N	suneung	하
8776	metropolitan	a. *수도권의	\N	\N	\N	suneung	하
8779	induce	v. *유도하다	\N	\N	\N	suneung	하
8782	plow	n. *쟁기*	\N	\N	\N	suneung	하
8785	fluent	a. *유창한*	\N	\N	\N	suneung	하
8788	interior	n. *내부*	\N	\N	\N	suneung	하
8794	vibrate	v. *진동하다	\N	\N	\N	suneung	하
8797	epidemic	n. *전염병	\N	\N	\N	suneung	하
8800	portfolio	n. *대표 작품	\N	\N	\N	suneung	하
8806	gross	n. *총합*	\N	\N	\N	suneung	하
8809	paste	n. *풀	\N	\N	\N	suneung	하
8812	assassinate	v. *암살하다*	\N	\N	\N	suneung	하
8815	tuition	n. *수업료*	\N	\N	\N	suneung	하
8818	quote	v. *인용하다*	\N	\N	\N	suneung	하
8821	anchor	n. *닻	\N	\N	\N	suneung	하
8824	compound	n. *화합물*	\N	\N	\N	suneung	하
8827	withstand	v. *견디다*	\N	\N	\N	suneung	하
8830	anonymous	a. *익명의*	\N	\N	\N	suneung	하
8833	vacant	a. *빈	\N	\N	\N	suneung	하
8836	orchard	n. *과수원*	\N	\N	\N	suneung	하
8842	wander	v. (정처 없이) *돌아다니다*	\N	\N	\N	suneung	하
8845	peroccupation	n. *몰두	\N	\N	\N	suneung	기타
8848	wicked	a. *사악한*	\N	\N	\N	suneung	하
8851	n. *연설	 인사말*	\N	\N	\N	suneung	기타
8854	disrupt	v. *~을 혼란에 빠뜨리다	\N	\N	\N	suneung	하
8857	transgenic	a. *이식 유전자의[에 의한]*	\N	\N	\N	suneung	하
8860	tariff	n. *관세*	\N	\N	\N	suneung	하
8869	crook	n. *사기꾼	\N	\N	\N	suneung	하
8872	beloved	a. *사랑스러운*	\N	\N	\N	suneung	하
8875	skyscraper	n. *마천루	\N	\N	\N	suneung	하
8878	vaccum	n. *진공	\N	\N	\N	suneung	중
8881	spectacle	n. *광경*	\N	\N	\N	suneung	하
8884	overlap	v. *겹치다*	\N	\N	\N	suneung	하
8887	hypothesis	n. *가설*(假設)	\N	\N	\N	suneung	하
8890	armor	n. *갑옷*	\N	\N	\N	suneung	하
8893	divide	v. *나누다	\N	\N	\N	suneung	하
8896	simulate	v. *흉내 내다	\N	\N	\N	suneung	하
8899	clone	n. *복제 생물	\N	\N	\N	suneung	하
8905	except	p. *~을 제외하고는*	\N	\N	\N	suneung	하
8908	flea	n. *벼룩*	\N	\N	\N	suneung	하
8527	molecule	n. *분자*	\N	\N	\N	suneung	하
8536	spacious	a. *넓은	\N	\N	\N	suneung	하
8540	prominent	a. *현저한	\N	\N	\N	suneung	하
8543	inferior	a. *열등한*	\N	\N	\N	suneung	하
8546	utmost	a. *최대한의*	\N	\N	\N	suneung	하
8549	accumulate	v. *모으다	\N	\N	\N	suneung	하
8552	violate	v. *침해하다	\N	\N	\N	suneung	하
8555	plea	n. *탄원	\N	\N	\N	suneung	하
8561	pledge	n. *약속	\N	\N	\N	suneung	하
8564	attack	v. *공격하다*	\N	\N	\N	suneung	하
8570	diameter	n. *지름	\N	\N	\N	suneung	하
8573	attend	v. *출석하다	\N	\N	\N	suneung	하
8576	cost	v. (비용이) *들다*	\N	\N	\N	suneung	하
8579	detect	v. *발견하다*	\N	\N	\N	suneung	하
8582	mock	v. *조롱하다*	\N	\N	\N	suneung	하
8591	grind	v. *갈다	\N	\N	\N	suneung	하
8594	manage	v. *~을 잘 해내다	\N	\N	\N	suneung	하
8597	fad	n. *일시적 유행*	\N	\N	\N	suneung	하
8600	flourish	v. *번영하다	\N	\N	\N	suneung	하
8603	thorough	a. *철저한*	\N	\N	\N	suneung	하
8606	linguistic	a. *언어의	\N	\N	\N	suneung	하
8609	sophomore	n. (대학 · 고등학교의) *2학년생*	\N	\N	\N	suneung	하
8612	pillar	n. *기둥*	\N	\N	\N	suneung	하
8615	swamp	n. *늪지*	\N	\N	\N	suneung	하
8618	corrupt	a. *부정한	\N	\N	\N	suneung	하
8624	n. *유감	 후회*	\N	\N	\N	suneung	기타
8627	possibility	n. *가능성	\N	\N	\N	suneung	하
8633	deadline	n. *마감 시간	\N	\N	\N	suneung	하
8636	motion	n. *운동	\N	\N	\N	suneung	하
8639	return	v. *돌려주다*	\N	\N	\N	suneung	하
8642	enlist	v. (군인을) *모집하다	\N	\N	\N	suneung	하
8651	lyric	n. *노래 가사	\N	\N	\N	suneung	하
8654	rush	v. *돌진하다	\N	\N	\N	suneung	하
8657	external	a. *외부의*	\N	\N	\N	suneung	하
8660	gorgeous	a. *화려한	\N	\N	\N	suneung	하
8663	hell	n. *지옥*	\N	\N	\N	suneung	하
8672	amid	p. *~의 한가운데*	\N	\N	\N	suneung	하
8675	complement	v. *보완하다*	\N	\N	\N	suneung	하
8681	emerge	v. *나오다	\N	\N	\N	suneung	하
8684	ivory	n. *상아	\N	\N	\N	suneung	하
8687	remain	v. *여전히 ~이다	\N	\N	\N	suneung	하
8690	blame	v. *비난하다	\N	\N	\N	suneung	하
8696	borrow	v. *빌리다*	\N	\N	\N	suneung	하
8699	abundant	a. *풍부한*	\N	\N	\N	suneung	하
8705	lame	a. *절름발이의*	\N	\N	\N	suneung	하
8708	sour	a. *신맛이 나는*	\N	\N	\N	suneung	하
8711	leftover	a. *나머지의	\N	\N	\N	suneung	하
8714	v. *포옹하다	* 받아들이다	\N	\N	\N	suneung	기타
8717	duplicate	n. *복제품*	\N	\N	\N	suneung	하
8720	altitude	n. *고도	\N	\N	\N	suneung	하
8729	warrior	n. *용사*	\N	\N	\N	suneung	하
8735	vanish	n. *사라지다*	\N	\N	\N	suneung	하
8738	broker	n. *중개인*	\N	\N	\N	suneung	하
8741	obsess	v. *강박 관념을 갖다	\N	\N	\N	suneung	중
8750	bouquet	n. *꽃다발*	\N	\N	\N	suneung	하
8753	retain	v. *보유하다*	\N	\N	\N	suneung	하
8756	machinery	n. (집합적) *기계*	\N	\N	\N	suneung	하
8759	lay	v. (물건을) *놓다	\N	\N	\N	suneung	하
8762	feedback	n. *반응	\N	\N	\N	suneung	하
8765	metaphor	n. *은유	\N	\N	\N	suneung	하
8771	attorney	n. *변호사*	\N	\N	\N	suneung	하
8774	naive	a. *순진한*	\N	\N	\N	suneung	하
8777	shield	n. *방패	\N	\N	\N	suneung	하
8780	bazaar	n. *시장	\N	\N	\N	suneung	하
8786	margin	n. *가장자리*	\N	\N	\N	suneung	하
8792	separate	v. *분리하다*	\N	\N	\N	suneung	하
8795	urgent	a. *긴급한	\N	\N	\N	suneung	하
8798	precede	v. *~에 앞서다	\N	\N	\N	suneung	하
8801	beware	v. *조심하다*	\N	\N	\N	suneung	하
8807	a. *총합의	 엄청난*	\N	\N	\N	suneung	기타
8813	vapor	n. *증기*	\N	\N	\N	suneung	하
8816	loop	n. *고리*	\N	\N	\N	suneung	하
8819	inhale	v. (숨을) *들이쉬다*	\N	\N	\N	suneung	하
8828	implement	n. *도구*	\N	\N	\N	suneung	하
8831	collide	v. *충돌하다*	\N	\N	\N	suneung	하
8834	technical	a. *기술[기법]의	\N	\N	\N	suneung	하
8837	sink	v. *가라앉다*	\N	\N	\N	suneung	하
8840	overtake	v. *따라잡다*	\N	\N	\N	suneung	하
8846	adapt	v. *적응시키다*	\N	\N	\N	suneung	하
8849	sprain	v. (발목 · 손목 등을) *삐다*	\N	\N	\N	suneung	하
8852	propaganda	n. *선전 활동	\N	\N	\N	suneung	하
8855	solitary	a. *혼자의	\N	\N	\N	suneung	하
8858	rust	n. *녹*	\N	\N	\N	suneung	하
8864	sector	n. *분야	\N	\N	\N	suneung	하
8867	gymnastics	n. *체육	\N	\N	\N	suneung	하
8873	yeast	n. *효모*	\N	\N	\N	suneung	하
8882	surplus	n. *과잉	\N	\N	\N	suneung	하
8888	affirm	v. *단언하다*	\N	\N	\N	suneung	하
8891	cue	n. *단서	\N	\N	\N	suneung	하
8897	fatigue	n. *피로*	\N	\N	\N	suneung	하
8903	ease	v. *진정시키다*	\N	\N	\N	suneung	하
8909	vaccine	n. *백신	\N	\N	\N	suneung	하
8915	cling	v. *달라붙다	\N	\N	\N	suneung	하
8921	intriguing	a. *아주 흥미로운*	\N	\N	\N	suneung	하
8924	enclose	v. *동봉하다	\N	\N	\N	suneung	하
8927	constrict	v. *죄다	\N	\N	\N	suneung	중
8930	measurement	n. *측량	\N	\N	\N	suneung	하
8933	testify	v. *검증하다	\N	\N	\N	suneung	하
8936	patriot	n. *애국자*	\N	\N	\N	suneung	하
8942	vertical	a. *수직의*	\N	\N	\N	suneung	하
8945	mentor	n. *조언자*	\N	\N	\N	suneung	하
8948	humble	a. *겸손한	\N	\N	\N	suneung	하
8951	plunge	v. *뛰어들다	\N	\N	\N	suneung	하
8954	forehead	n. *이마*	\N	\N	\N	suneung	하
8531	n. *걱정	 실망*	\N	\N	\N	suneung	기타
8537	weave	v. *엮다	\N	\N	\N	suneung	하
8553	ambitious	a. *야심 있는*	\N	\N	\N	suneung	하
8556	anecdote	n. *일화	\N	\N	\N	suneung	하
8559	characteristic	n. *특징	\N	\N	\N	suneung	하
8562	v. *약속하다	 맹세하다*	\N	\N	\N	suneung	기타
8568	dispatch	n. *급파	\N	\N	\N	suneung	하
8571	ultrasound	n. *초음파*	\N	\N	\N	suneung	하
8577	n. *비용	* 대가	\N	\N	\N	suneung	기타
8580	temperate	a. *절제하는	\N	\N	\N	suneung	하
8586	n. 전시	 전시품	\N	\N	\N	suneung	기타
8592	expose	v. *드러내다	\N	\N	\N	suneung	하
8595	script	n. *손으로 쓰기	\N	\N	\N	suneung	하
8598	sibling	n. *형제자매	\N	\N	\N	suneung	하
8601	discharge	n. *배출	\N	\N	\N	suneung	하
8607	remedy	n. *치료	\N	\N	\N	suneung	하
8610	panel	n. *토론자단	\N	\N	\N	suneung	하
8613	explode	v. *폭발하다*	\N	\N	\N	suneung	하
8616	coffin	n. *관*(棺)	\N	\N	\N	suneung	하
8622	factual	a. *실제의*	\N	\N	\N	suneung	하
8625	expedition	n. *탐험(대)*	\N	\N	\N	suneung	하
8628	revive	v. *되살아나다*	\N	\N	\N	suneung	하
8631	flattery	n. *아첨*	\N	\N	\N	suneung	하
8634	equator	n. *적도*	\N	\N	\N	suneung	하
8643	hygiene	n. *위생	\N	\N	\N	suneung	하
8646	pulse	n. *맥박*	\N	\N	\N	suneung	하
8649	patent	n. *특허	\N	\N	\N	suneung	하
8655	carbon	n. *탄소*	\N	\N	\N	suneung	하
8661	confess	v. *고백하다*	\N	\N	\N	suneung	하
8664	acknowledge	v. *인정하다*	\N	\N	\N	suneung	하
8667	immense	a. *막대한*	\N	\N	\N	suneung	하
8670	sewage	n. *하수*	\N	\N	\N	suneung	하
8673	warrant	n. *보증	\N	\N	\N	suneung	하
8679	license	n. *면허	\N	\N	\N	suneung	하
8682	halt	n. *정지	\N	\N	\N	suneung	하
8691	n. *비난	 책망*	\N	\N	\N	suneung	기타
8694	cluster	n. (사람들의) *무리	\N	\N	\N	suneung	하
8697	derive	v. *끌어내다	\N	\N	\N	suneung	하
8700	graduate	v. *졸업하다*	\N	\N	\N	suneung	하
8703	depth	n. *깊이*	\N	\N	\N	suneung	하
8709	repetitive	a. *반복성의*	\N	\N	\N	suneung	하
8715	blade	n. *칼날*	\N	\N	\N	suneung	하
8718	v. *이중으로 하다	 복제하다*	\N	\N	\N	suneung	기타
8721	glimpse	n. *흘긋 봄*	\N	\N	\N	suneung	하
8727	grief	n. *큰 슬픔*	\N	\N	\N	suneung	하
8730	earn	v. (평판을) *얻다	\N	\N	\N	suneung	하
8733	exotic	a. *이국적인*	\N	\N	\N	suneung	하
8736	perdominant	a. *뛰어난	\N	\N	\N	suneung	기타
8739	auction	n. *경매*	\N	\N	\N	suneung	하
8742	feed	v. *먹이를 주다	\N	\N	\N	suneung	하
8745	pioneer	n. *개척자*	\N	\N	\N	suneung	하
8748	assert	v. *주장하다	\N	\N	\N	suneung	하
8751	elaborate	a. *정교한	\N	\N	\N	suneung	하
8754	radioactive	a. *방사성의*	\N	\N	\N	suneung	하
8757	passerby	n. *통행인	\N	\N	\N	suneung	중
8763	promote	v. *증진하다	\N	\N	\N	suneung	하
8766	dispense	v. *분배하다*	\N	\N	\N	suneung	하
8769	race	v. *경주[경쟁]하다*	\N	\N	\N	suneung	하
8772	framework	n. *하부 구조	\N	\N	\N	suneung	하
8775	shed	v. *떨구다	\N	\N	\N	suneung	하
8781	expel	v. *쫓아내다*	\N	\N	\N	suneung	하
8784	prolong	v. *연장하다*	\N	\N	\N	suneung	하
8790	ornament	n. *장식*	\N	\N	\N	suneung	하
8793	ripe	a. *익은*	\N	\N	\N	suneung	하
8796	speculate	v. *사색하다	\N	\N	\N	suneung	하
8799	breathtaking	a. *아슬아슬한	\N	\N	\N	suneung	하
8802	handcuff	n. *수갑*	\N	\N	\N	suneung	중
8805	pregnant	a. *임신한*	\N	\N	\N	suneung	하
8811	summon	v. *소집하다	\N	\N	\N	suneung	하
8817	literature	n. *문학	\N	\N	\N	suneung	하
8820	prospect	n. *가능성	\N	\N	\N	suneung	하
8823	reference	n. *참조	\N	\N	\N	suneung	하
8835	settle	v. *정착하다	\N	\N	\N	suneung	하
8838	proportion	n. *비율	\N	\N	\N	suneung	하
8841	resemble	v. *닮다*	\N	\N	\N	suneung	하
8844	compassion	n. *연민	\N	\N	\N	suneung	하
8847	prevoke	v. *선동하다	\N	\N	\N	suneung	기타
8850	address	v. *연설하다*	\N	\N	\N	suneung	하
8853	consistent	a. *일관된	\N	\N	\N	suneung	하
8856	bury	v. *파묻다*	\N	\N	\N	suneung	하
8865	boost	n. *상승	\N	\N	\N	suneung	하
8868	intelligence	n. *지능	\N	\N	\N	suneung	하
8871	discuss	v. *토론하다*	\N	\N	\N	suneung	하
8877	spade	n. *삽*	\N	\N	\N	suneung	하
8880	migrate	v. *이동하다	\N	\N	\N	suneung	하
8883	a. *과잉의	* 나머지의	\N	\N	\N	suneung	기타
8886	integration	n. *통합	\N	\N	\N	suneung	하
8892	obscure	a. *분명치 않은	\N	\N	\N	suneung	하
8895	inborn	a. *타고난*	\N	\N	\N	suneung	하
8901	peel	v. *~의 껍질을 벗기다.*	\N	\N	\N	suneung	하
8904	n. *편함	 용이함*	\N	\N	\N	suneung	기타
8907	prophecy	n. *예언*	\N	\N	\N	suneung	하
8910	tread	v. *밟다	\N	\N	\N	suneung	하
8913	explore	v. *탐험하다*	\N	\N	\N	suneung	하
8916	mutation	n. *변화	\N	\N	\N	suneung	하
8919	tyrant	n. *폭군	\N	\N	\N	suneung	하
8925	insert	v. *삽입하다*	\N	\N	\N	suneung	하
8928	submit	v. *복종시키다	\N	\N	\N	suneung	하
8931	originate	v. *시작되다	\N	\N	\N	suneung	하
8934	Celsius	a. *섭씨의*	\N	\N	\N	suneung	하
8937	interchange	n. *교환	\N	\N	\N	suneung	하
8940	garment	n. *의복*	\N	\N	\N	suneung	하
8946	vivid	a. *생생한*	\N	\N	\N	suneung	하
8949	crust	n. *껍질	\N	\N	\N	suneung	하
8952	gather	v. *모으다*	\N	\N	\N	suneung	하
8538	ceremony	n. *의식	\N	\N	\N	suneung	하
8544	subtract	v. *빼다*	\N	\N	\N	suneung	하
8926	keen	a. *날카로운	\N	\N	\N	suneung	하
8929	reputation	n. *평판	\N	\N	\N	suneung	하
8932	flour	n. *밀가루*	\N	\N	\N	suneung	하
8944	rough	a. *거친	\N	\N	\N	suneung	하
8947	pasture	n. *목초지	\N	\N	\N	suneung	하
8953	emigrate	v. (타국으로) *이주하다*	\N	\N	\N	suneung	하
8956	skinny	a. *피골이 상접한	\N	\N	\N	suneung	하
8959	curse	n. *저주*	\N	\N	\N	suneung	하
8962	adverse	a. *거스르는	\N	\N	\N	suneung	하
8965	nasty	a. *더러운	\N	\N	\N	suneung	하
8968	dye	n. *염료*	\N	\N	\N	suneung	하
8971	segregation	n. *인종 차별	\N	\N	\N	suneung	하
8977	irrigation	n. *관개*	\N	\N	\N	suneung	하
8980	refuge	n. *피난	\N	\N	\N	suneung	하
8988	feminine	a. *여성의	\N	\N	\N	suneung	하
8989	drowsy	a.*졸리는*	\N	\N	\N	suneung	하
8990	inspect	v. *검사하다	\N	\N	\N	suneung	하
8997	shatter	v. *산산이 부서지다*	\N	\N	\N	suneung	하
9002	steep	a. *가파른	\N	\N	\N	suneung	하
9008	designate	v. *지정하다	\N	\N	\N	suneung	하
9015	shiver	n. *떨림*	\N	\N	\N	suneung	하
9022	execurive	a. *집행의	\N	\N	\N	suneung	기타
9023	n. *임원	 경영진*	\N	\N	\N	suneung	기타
9028	appetite	n. *식욕	\N	\N	\N	suneung	하
9037	ingenuity	n. *솜씨	\N	\N	\N	suneung	하
9038	record	v. *기록하다	\N	\N	\N	suneung	하
9039	n. *기록	 증언*	\N	\N	\N	suneung	기타
9045	upcoming	a. *다가오는*	\N	\N	\N	suneung	하
9052	n. *관계	 고려*	\N	\N	\N	suneung	기타
9053	deficient	a. *부족한	\N	\N	\N	suneung	하
9057	equivalent	a. *동등한	\N	\N	\N	suneung	하
9064	privilege	n. *특권*	\N	\N	\N	suneung	하
9072	negotiate	v. *협상하다*	\N	\N	\N	suneung	하
9080	surpass	v. *능가하다*	\N	\N	\N	suneung	하
9081	correlation	n. *상관관계	\N	\N	\N	suneung	하
9082	magnitude	n. *거대함	\N	\N	\N	suneung	하
9086	slaughter	v. *도살하다*	\N	\N	\N	suneung	하
9088	surrender	v. *넘겨주다	\N	\N	\N	suneung	하
9097	sprint	n. *단거리 경주	\N	\N	\N	suneung	하
9099	aid	v. *돕다*	\N	\N	\N	suneung	하
9103	primary	a. *주요한	\N	\N	\N	suneung	하
9111	blow	v. *불다	\N	\N	\N	suneung	하
9115	acquaintance	n. *아는 사이	\N	\N	\N	suneung	하
9116	boil	v. *끓다	\N	\N	\N	suneung	하
9122	perdicate	v. *단정하다	\N	\N	\N	suneung	기타
9123	psychic	a. *초능력이 있는	\N	\N	\N	suneung	하
9124	n. *무당	 영매*	\N	\N	\N	suneung	기타
9125	paddle	n. *노*	\N	\N	\N	suneung	하
9127	steer	v. *조종하다	\N	\N	\N	suneung	하
9128	verbal	a. *말의	\N	\N	\N	suneung	하
9134	harass	v. *괴롭히다	\N	\N	\N	suneung	하
9136	tribuete	n. *감사[존경]의 표시	\N	\N	\N	suneung	기타
9137	artery	n. *동맥	\N	\N	\N	suneung	하
9140	slum	n. *빈민가*	\N	\N	\N	suneung	하
9144	conflict	v. *충돌하다*	\N	\N	\N	suneung	하
9145	n. *투쟁	 충돌*	\N	\N	\N	suneung	기타
9157	accelerate	v. *가속하다	\N	\N	\N	suneung	하
9158	heatstroke	n. *일사병	\N	\N	\N	suneung	중
9161	n. *베테랑	* 퇴역 군인	\N	\N	\N	suneung	기타
9162	dramatic	a. *연극의	\N	\N	\N	suneung	하
9163	vocation	n. *직업	\N	\N	\N	suneung	하
9164	vegetarian	n. *채식주의자*	\N	\N	\N	suneung	하
9167	fellow	n. *사나이	\N	\N	\N	suneung	하
9173	connotation	n. *함축	\N	\N	\N	suneung	하
10302	talent	재능	\N	\N	\N	gtelp	하
10308	motivate	동기를 주다	\N	\N	\N	gtelp	하
10311	share	공유하다	\N	\N	\N	gtelp	하
10314	physiology	생리학	\N	\N	\N	gtelp	하
10317	opinion	의견	\N	\N	\N	gtelp	하
10320	conclude	결론내리다	\N	\N	\N	gtelp	하
10323	expose	노출시키다	\N	\N	\N	gtelp	하
10326	sustain	계속하다	\N	\N	\N	gtelp	하
10329	consequently	결론적으로	\N	\N	\N	gtelp	하
10335	fortunate	운이 좋은 행운의	\N	\N	\N	gtelp	하
10338	entire	전체의 완전한	\N	\N	\N	gtelp	하
10341	completely	완전히 완벽하게	\N	\N	\N	gtelp	하
10344	match up	조화를 이루다	\N	\N	\N	gtelp	기타
10347	extend	확장하다	\N	\N	\N	gtelp	하
10350	disastrous	비참한 재난의	\N	\N	\N	gtelp	하
10356	prefer	선호하다	\N	\N	\N	gtelp	하
10359	invisible	보이지 않는	\N	\N	\N	gtelp	하
10362	feature	특징	\N	\N	\N	gtelp	하
10365	define	정의하다	\N	\N	\N	gtelp	하
10368	paragraph	절 단락	\N	\N	\N	gtelp	하
10371	calculate	계산하다	\N	\N	\N	gtelp	하
10374	take the place of	대체하다	\N	\N	\N	gtelp	기타
10377	firmly	견고하게	\N	\N	\N	gtelp	하
10380	plenty of	많은	\N	\N	\N	gtelp	기타
10386	inactive	활동하지 않은	\N	\N	\N	gtelp	하
10389	chew	씹다	\N	\N	\N	gtelp	하
10392	ginger	생강	\N	\N	\N	gtelp	하
10395	inequality	불평등	\N	\N	\N	gtelp	하
10401	potential	잠재력	\N	\N	\N	gtelp	하
10404	squash	호박	\N	\N	\N	gtelp	하
10407	servant	하인	\N	\N	\N	gtelp	하
10410	identity	동일함 신원	\N	\N	\N	gtelp	하
10413	dropout	낙제하다 실패하다	\N	\N	\N	gtelp	하
10416	opportunity	기회	\N	\N	\N	gtelp	하
10419	polite	예의바른	\N	\N	\N	gtelp	하
10422	pain	고통	\N	\N	\N	gtelp	하
10425	complain	불평하다	\N	\N	\N	gtelp	하
10431	recognize	인식하다	\N	\N	\N	gtelp	하
10434	pronunciation	발음	\N	\N	\N	gtelp	하
10437	official	공식적인	\N	\N	\N	gtelp	하
10440	pet	애완동물	\N	\N	\N	gtelp	하
10443	ancient	고대의	\N	\N	\N	gtelp	하
8920	odd	a. *이상한	\N	\N	\N	suneung	하
8923	bundle	n. *묶음	\N	\N	\N	suneung	하
8967	outgoing	a. *외향적인*	\N	\N	\N	suneung	하
8970	foundation	n. *기초	\N	\N	\N	suneung	하
8973	underlying	a. *밑에 놓인	\N	\N	\N	suneung	하
8976	stimulate	v. *자극하다	\N	\N	\N	suneung	하
8979	superficial	a. *표면상의	\N	\N	\N	suneung	하
8991	carriage	n. *마차	\N	\N	\N	suneung	하
8995	govern	v. *다스리다*	\N	\N	\N	suneung	하
8996	abort	v. *유산하다	\N	\N	\N	suneung	하
8999	exaggerate	v. *과장하다	\N	\N	\N	suneung	하
9003	forfeit	n. *벌금	\N	\N	\N	suneung	하
9007	chronic	a. *만성적인	\N	\N	\N	suneung	하
9014	numerous	a. *다수의	\N	\N	\N	suneung	하
9018	ongoing	n. *진행*	\N	\N	\N	suneung	하
9020	mention	v. *언급하다*	\N	\N	\N	suneung	하
9025	microscope	n. *현미경*	\N	\N	\N	suneung	하
9026	belonging	n. (pl.) 소유물	\N	\N	\N	suneung	하
9031	recommend	v. *추천하다*	\N	\N	\N	suneung	하
9032	index	n. *지수	\N	\N	\N	suneung	하
9036	innate	a. *천부적인	\N	\N	\N	suneung	하
9041	seize	v. *잡다	\N	\N	\N	suneung	하
9044	refuse	v. *거절하다*	\N	\N	\N	suneung	하
9048	province	n. *지방	\N	\N	\N	suneung	하
9056	preview	n. *미리 보기	\N	\N	\N	suneung	하
9066	squeeze	v. *짜내다*	\N	\N	\N	suneung	하
9068	breakthrough	n. *비약적 발전	\N	\N	\N	suneung	하
9073	recipe	n. *조리법	\N	\N	\N	suneung	하
9074	deceive	v.*속이다*	\N	\N	\N	suneung	하
9078	successive	a. *연속되는	\N	\N	\N	suneung	하
9079	paradox	n. *역설	\N	\N	\N	suneung	하
9084	earnest	a. *진지한*	\N	\N	\N	suneung	하
9101	tense	a. *팽팽한	\N	\N	\N	suneung	하
9105	collaborate	v. *협력하다*	\N	\N	\N	suneung	하
9106	aim	v. *겨냥하다*	\N	\N	\N	suneung	하
9108	bet	v. *돈을 걸다	\N	\N	\N	suneung	하
9110	stance	n. *서 있는 자세	\N	\N	\N	suneung	하
9121	cast	v. *내던지다	\N	\N	\N	suneung	하
9131	suppose	v. *가정하다	\N	\N	\N	suneung	하
9132	unpredictable	a. *예측할 수 없는*	\N	\N	\N	suneung	하
9133	temperament	n. *기질	\N	\N	\N	suneung	하
9138	mandate	v. *명령하다	\N	\N	\N	suneung	하
9148	enlightenment	n. *계몽	\N	\N	\N	suneung	하
9149	cosmetic	n. *화장품*	\N	\N	\N	suneung	하
9165	a. *채식주의자의	 채식의*	\N	\N	\N	suneung	기타
9174	decode	v. (암호를) *해독하다*	\N	\N	\N	suneung	하
9175	hollow	a. *속이 빈	\N	\N	\N	suneung	하
10303	condition	상태 조건	\N	\N	\N	gtelp	하
10306	attract	끌다 매혹하다	\N	\N	\N	gtelp	하
10309	perform	이행하다 공연하다	\N	\N	\N	gtelp	하
10312	operate	작동하다 움직이다	\N	\N	\N	gtelp	하
10315	detect	감지하다	\N	\N	\N	gtelp	하
10321	isolate	고립시키다 분리시키다	\N	\N	\N	gtelp	하
10324	organ	신체장기	\N	\N	\N	gtelp	하
10327	eventually	드디어 결국	\N	\N	\N	gtelp	하
10330	countryside	한 지방 시골	\N	\N	\N	gtelp	하
10333	individual	개인의	\N	\N	\N	gtelp	하
10336	fascinating	매혹적인 황홀한	\N	\N	\N	gtelp	하
10339	discipline	훈련 수양	\N	\N	\N	gtelp	하
10342	quarter	분	\N	\N	\N	gtelp	하
10345	orbit	궤도	\N	\N	\N	gtelp	하
10351	productive	생산적인	\N	\N	\N	gtelp	하
10354	fewer	보다 소수의	\N	\N	\N	gtelp	하
10357	graduation	졸업	\N	\N	\N	gtelp	하
10360	translate	번역하다	\N	\N	\N	gtelp	하
10363	confidence	신임 신용 신뢰	\N	\N	\N	gtelp	하
10366	statement	진술	\N	\N	\N	gtelp	하
10369	statement	말해진 것 진술	\N	\N	\N	gtelp	하
10372	as follow	다음과 같이	\N	\N	\N	gtelp	기타
10381	civilization	문명	\N	\N	\N	gtelp	하
10384	engage	약속하다 보증하다	\N	\N	\N	gtelp	하
10387	rude	무례한	\N	\N	\N	gtelp	하
10390	document	문서	\N	\N	\N	gtelp	하
10393	garlic	마늘	\N	\N	\N	gtelp	하
10396	statistics	통계	\N	\N	\N	gtelp	하
10399	persuade	설득하다	\N	\N	\N	gtelp	하
10402	sparkling	반짝이는	\N	\N	\N	gtelp	하
10405	fig	무화과	\N	\N	\N	gtelp	하
10408	sheepskin	양가죽	\N	\N	\N	gtelp	하
10414	selfesteem	자존심 자부심	\N	\N	\N	gtelp	기타
10417	behave	행동하다	\N	\N	\N	gtelp	하
10420	exhausted	지친 힘든	\N	\N	\N	gtelp	하
10423	annoyance	짜증	\N	\N	\N	gtelp	하
10426	lose ones selfcontrol	자제력을 잃다	\N	\N	\N	gtelp	기타
10429	creativity	창의력	\N	\N	\N	gtelp	하
10432	excellence	우수성	\N	\N	\N	gtelp	하
10435	represent	나타내다	\N	\N	\N	gtelp	하
10438	First Lady	영부인	\N	\N	\N	gtelp	기타
10444	spiritual	정신의 영혼의	\N	\N	\N	gtelp	하
10447	recently	최근에	\N	\N	\N	gtelp	하
10450	vacation	휴가 방학	\N	\N	\N	gtelp	하
10453	borrow	빌리다	\N	\N	\N	gtelp	하
10456	though	라고 해도	\N	\N	\N	gtelp	하
10459	robber	강도	\N	\N	\N	gtelp	하
10465	ability to ride horse	말 타는 능력	\N	\N	\N	gtelp	기타
10468	vocabulary	어휘력	\N	\N	\N	gtelp	하
10471	article	기사	\N	\N	\N	gtelp	하
10474	neither	또한 아니다	\N	\N	\N	gtelp	하
10477	meaning	의미	\N	\N	\N	gtelp	하
10480	while	반면에	\N	\N	\N	gtelp	하
10483	step	발걸음	\N	\N	\N	gtelp	하
10486	royal	왕의	\N	\N	\N	gtelp	하
10492	reveal	발표하다	\N	\N	\N	gtelp	하
10495	phrase	어구	\N	\N	\N	gtelp	하
10498	make definition	정의를 내리다	\N	\N	\N	gtelp	기타
10501	president	사장	\N	\N	\N	gtelp	하
8961	canal	n. *수로	\N	\N	\N	suneung	하
8964	wrist	n. *손목*	\N	\N	\N	suneung	하
10375	turn off	잠그다	\N	\N	\N	gtelp	기타
8972	cemetery	n. *공동묘지*	\N	\N	\N	suneung	하
8978	consecutive	a. *연속적인	\N	\N	\N	suneung	하
8981	swear	v. *맹세하다	\N	\N	\N	suneung	하
8982	allergy	n. *알레르기*	\N	\N	\N	suneung	하
8983	semiconductor	n. *반도체*	\N	\N	\N	suneung	하
8984	endeavor	n. *노력*	\N	\N	\N	suneung	하
8986	erect	n. *세우다*	\N	\N	\N	suneung	하
8994	compress	v. *압축하다*	\N	\N	\N	suneung	하
9000	bass	n. *저음	\N	\N	\N	suneung	하
9001	commemorate	v.*기념하다*	\N	\N	\N	suneung	하
9005	toxic	a. *유독한	\N	\N	\N	suneung	하
9010	intense	a. *강렬한*	\N	\N	\N	suneung	하
9011	sequence	n. *순서	\N	\N	\N	suneung	하
9012	nuisance	n. *귀찮은 사람	\N	\N	\N	suneung	하
9013	vulnerable	a. *취약한	\N	\N	\N	suneung	하
9024	chaos	n. *혼돈	\N	\N	\N	suneung	하
9027	implication	n. *함축	\N	\N	\N	suneung	하
9029	authentic	a. *진짜의	\N	\N	\N	suneung	하
9030	compel	v. *강요하다	\N	\N	\N	suneung	하
9035	attain	v. *달성하다*	\N	\N	\N	suneung	하
9040	bias	n. *편견*	\N	\N	\N	suneung	하
9042	screw	n. *나사*	\N	\N	\N	suneung	하
9046	savage	a. *야만스러운	\N	\N	\N	suneung	하
9049	coordinate	v. *조정하다*	\N	\N	\N	suneung	하
9054	outlaw	v. *금지하다	\N	\N	\N	suneung	하
9058	loom	n. *베틀*	\N	\N	\N	suneung	하
9060	register	n. *등록*	\N	\N	\N	suneung	하
9062	purple	n. *자주색*	\N	\N	\N	suneung	하
9069	consent	n. *동의	\N	\N	\N	suneung	하
9071	orphan	n. *고아*	\N	\N	\N	suneung	하
9075	sweep	v. *휩쓸다	\N	\N	\N	suneung	하
9076	profile	n. *옆 얼굴	\N	\N	\N	suneung	하
9077	enterprise	n. *기업	\N	\N	\N	suneung	하
9083	aesthetics	n. *미학*	\N	\N	\N	suneung	하
9087	n. *도살	 대학살*	\N	\N	\N	suneung	기타
9089	philosophy	n. *철학*	\N	\N	\N	suneung	하
9090	deplete	v. *고갈시키다	\N	\N	\N	suneung	하
9091	admire	v. *감탄하다	\N	\N	\N	suneung	하
9093	thrill	n. *스릴	\N	\N	\N	suneung	하
9096	blunt	a. *무뚝뚝한	\N	\N	\N	suneung	하
9100	n. *도움	 조력*	\N	\N	\N	suneung	기타
9104	timber	n. *목재*	\N	\N	\N	suneung	하
9114	division	n. *분할	\N	\N	\N	suneung	하
9117	contradict	v. *부정하다	\N	\N	\N	suneung	하
9118	wealth	n. *부	\N	\N	\N	suneung	하
9119	burst	v. *터뜨리다*	\N	\N	\N	suneung	하
9120	n. *파열	 폭발*	\N	\N	\N	suneung	기타
9141	gracious	a. *상냥한	\N	\N	\N	suneung	하
9142	spike	n. *대못*	\N	\N	\N	suneung	하
9147	fiery	a. *불의	\N	\N	\N	suneung	하
9151	oval	a. *달걀 모양의	\N	\N	\N	suneung	하
9153	aspire	v. *열망하다	\N	\N	\N	suneung	하
9154	obstruct	v. *막다	\N	\N	\N	suneung	하
9159	catalog	n. *카탈로그	\N	\N	\N	suneung	하
8966	flaw	n. *결점	\N	\N	\N	suneung	하
9160	veteran	a. *경험이 많은*	\N	\N	\N	suneung	하
9166	stereotype	n. *인습	\N	\N	\N	suneung	하
9169	sneak	v. *살금살금 움직이다	\N	\N	\N	suneung	하
9170	perish	v. *죽다	\N	\N	\N	suneung	하
9171	inseparable	a. *불가분의	\N	\N	\N	suneung	하
9177	apron	n. *앞치마*	\N	\N	\N	suneung	하
9178	mortgage	n. *저당	\N	\N	\N	suneung	하
9179	rebel	n. *반역자*	\N	\N	\N	suneung	하
9181	shabby	a. *누추한	\N	\N	\N	suneung	하
9182	latter	a. *나중 쪽의	\N	\N	\N	suneung	하
9183	illuminate	v. *밝게 비추다	\N	\N	\N	suneung	하
9184	mimic	v. *모방하다*	\N	\N	\N	suneung	하
9185	a. *흉내를 잘 내는	 모조의*	\N	\N	\N	suneung	기타
9186	unearth	v. *발굴하다	\N	\N	\N	suneung	하
9187	wail	v. *울부짖다*	\N	\N	\N	suneung	하
9189	shudder	v. *떨다	\N	\N	\N	suneung	하
9191	n. *성큼성큼 걷기	* 진보	\N	\N	\N	suneung	기타
9192	applicant	n. *신청자	\N	\N	\N	suneung	하
9193	disprove	v. *오류를 증명하다	\N	\N	\N	suneung	하
9194	disturb	v. *방해하다	\N	\N	\N	suneung	하
9195	marriage	n. *결혼	\N	\N	\N	suneung	하
9196	hemisphere	n. *반구체	\N	\N	\N	suneung	하
9197	recur	v. *재발하다	\N	\N	\N	suneung	하
9199	n. *탈출	 도망*	\N	\N	\N	suneung	기타
9200	elastic	a. *탄력 있는	\N	\N	\N	suneung	하
9201	saint	n. *성인*(聖人)	\N	\N	\N	suneung	하
9202	stubborn	a. *완고한	\N	\N	\N	suneung	하
9203	suicide	n. *자살*	\N	\N	\N	suneung	하
9204	lure	v. *유학하다*	\N	\N	\N	suneung	하
9207	lavatory	n. *세면장	\N	\N	\N	suneung	하
9208	sway	n. *흔들림*	\N	\N	\N	suneung	하
9210	examine	v. *검사하다	\N	\N	\N	suneung	하
9211	compromise	v. *타협하다*	\N	\N	\N	suneung	하
9213	foremost	a. *주요한	\N	\N	\N	suneung	하
9214	precaution	n. *조심	\N	\N	\N	suneung	하
9215	torture	n. *고문*	\N	\N	\N	suneung	하
9217	peep	v. *엿보다*	\N	\N	\N	suneung	하
9219	morale	n. *사기	\N	\N	\N	suneung	하
9220	religious	a. *종교(상)의	\N	\N	\N	suneung	하
9221	obligation	n. *의무	\N	\N	\N	suneung	하
9224	subdue	v. *정복하다	\N	\N	\N	suneung	하
9225	regime	n. *정권	\N	\N	\N	suneung	하
9226	terminate	v. *끝내다	\N	\N	\N	suneung	하
9227	inject	v. *주사하다	\N	\N	\N	suneung	하
9228	theft	n. *도둑질	\N	\N	\N	suneung	하
9229	folklore	n. *민속	\N	\N	\N	suneung	하
9230	vast	a. *막대한	\N	\N	\N	suneung	하
9231	preliminary	a. *예비의	\N	\N	\N	suneung	하
9232	n. 예선	 사전 준비	\N	\N	\N	suneung	기타
9233	meanwhile	ad. *한편	\N	\N	\N	suneung	하
9234	painkiller	n. *진통제*	\N	\N	\N	suneung	하
8963	censorship	n. *검열*	\N	\N	\N	suneung	하
9454	expertise	n. *전문 지식[기술]*	\N	\N	\N	suneung	하
9455	renovate	v. *~을 새롭게 하다	\N	\N	\N	suneung	하
9456	wrench	n. *렌치* (너트를 죄는 기구)	\N	\N	\N	suneung	하
9457	v. *비틀다	 삐다*	\N	\N	\N	suneung	기타
9462	v. *반박하다	* 말대꾸하다	\N	\N	\N	suneung	기타
9463	strict	a. *엄한	\N	\N	\N	suneung	하
9464	inherent	a. *선천적인	\N	\N	\N	suneung	하
9469	segment	n. *부분*	\N	\N	\N	suneung	하
9475	estate	n. *소유지	\N	\N	\N	suneung	하
9481	tactics	n. *방안	\N	\N	\N	suneung	하
9484	dispute	n. *논쟁	\N	\N	\N	suneung	하
9486	console	v. *위로하다*	\N	\N	\N	suneung	하
9487	stack	n. *더미	\N	\N	\N	suneung	하
9490	reprove	v. *꾸짖다	\N	\N	\N	suneung	중
9501	subordinate	a. *하급의	\N	\N	\N	suneung	하
9504	furnish	v. (필요한 것을) *제공하다	\N	\N	\N	suneung	하
9520	rash	n. *발진	\N	\N	\N	suneung	하
9525	tact	n. *재치	\N	\N	\N	suneung	하
9526	harm	v. *해치다*	\N	\N	\N	suneung	하
9527	n. *손해	 손상*	\N	\N	\N	suneung	기타
9532	eligible	a. *적격의*	\N	\N	\N	suneung	하
9534	legacy	n. *유산*	\N	\N	\N	suneung	하
9540	reside	v. *거주하다	\N	\N	\N	suneung	하
9545	shuffle	v. *질질 끌며 걷다	\N	\N	\N	suneung	하
9546	summarize	v. *요약하다*	\N	\N	\N	suneung	하
9549	quest	n. *탐색	\N	\N	\N	suneung	하
9550	linear	a. *직선의	\N	\N	\N	suneung	하
9551	landslide	n. *산사태	\N	\N	\N	suneung	하
9554	merge	v. *합병하다	\N	\N	\N	suneung	하
9555	frantic	a. *광란의	\N	\N	\N	suneung	하
9411	solvent	a. *용해력이 있는	\N	\N	\N	suneung	하
9560	yearn	v. *그리워하다	\N	\N	\N	suneung	하
9561	conviction	n. *확신	\N	\N	\N	suneung	하
9565	dusk	n. *땅거미	\N	\N	\N	suneung	하
9566	sustain	v. *지탱하다	\N	\N	\N	suneung	하
9569	n. *전진	 진보*	\N	\N	\N	suneung	기타
9572	offspring	n. *자식	\N	\N	\N	suneung	하
9573	rent	v. *임대하다*	\N	\N	\N	suneung	하
9579	embed	v. *깊숙이 박다	\N	\N	\N	suneung	하
9582	antagonist	n. *적대자	\N	\N	\N	suneung	하
9585	endure	v. *참다	\N	\N	\N	suneung	하
9588	missionary	n. *선교사*	\N	\N	\N	suneung	하
9591	secondhand	a. *중고의	\N	\N	\N	suneung	하
9599	fixate	v. *고정시키다*	\N	\N	\N	suneung	중
9601	utensil	n. *가정용품	\N	\N	\N	suneung	하
9606	notable	a. *주목할 만한*	\N	\N	\N	suneung	하
9609	jest	n. *농담	\N	\N	\N	suneung	하
9616	outset	n. *착수	\N	\N	\N	suneung	하
9617	inaugural	a. *취임의*	\N	\N	\N	suneung	하
9620	kednap	n. *유괴*	\N	\N	\N	suneung	기타
9630	prudent	a. *신중한	\N	\N	\N	suneung	하
9631	registration	n. *기재	\N	\N	\N	suneung	하
9632	grudge	n. *원한	\N	\N	\N	suneung	하
9635	relevant	a. *관련된	\N	\N	\N	suneung	하
9644	v. *반격하다	 역습하다*	\N	\N	\N	suneung	기타
9235	amend	v. *수정하다	\N	\N	\N	suneung	하
9236	recess	n. *휴식	\N	\N	\N	suneung	하
9249	maternal	a. *어머니의	\N	\N	\N	suneung	하
9250	pharmacy	n. *약국	\N	\N	\N	suneung	하
9251	burden	n. *짐	\N	\N	\N	suneung	하
9260	ancestor	n. *조상	\N	\N	\N	suneung	하
9264	intermediate	a. *중간의*	\N	\N	\N	suneung	하
9273	fiber	n. *섬유(질)*	\N	\N	\N	suneung	하
9274	irony	n. *반어법	\N	\N	\N	suneung	하
9275	spectator	n. *관객	\N	\N	\N	suneung	하
9281	n. 전복	 혼란	\N	\N	\N	suneung	기타
9282	throughout	p. (장소의) *도처에	\N	\N	\N	suneung	하
9283	slogan	n. *선전 문구	\N	\N	\N	suneung	하
9284	composure	n. *침착	\N	\N	\N	suneung	하
9285	incurable	a. *불치의	\N	\N	\N	suneung	하
9287	revenge	n. *복수*	\N	\N	\N	suneung	하
9296	sturdy	a. *견고한	\N	\N	\N	suneung	하
9297	narrative	n. (실제의) *이야기	\N	\N	\N	suneung	하
9302	manifest	v. *명백하게 하다	\N	\N	\N	suneung	하
9306	populate	v. *거주시키다*	\N	\N	\N	suneung	하
9307	frugal	a. *검소한	\N	\N	\N	suneung	하
9308	phony	a. *가짜의*	\N	\N	\N	suneung	하
9322	sarcastic	a. *비꼬는	\N	\N	\N	suneung	하
9323	terrain	n. *지형	\N	\N	\N	suneung	하
9324	toll	n. *사용세	\N	\N	\N	suneung	하
9326	warfare	n. *전쟁	\N	\N	\N	suneung	하
9335	daze	n. *멍한 상태*	\N	\N	\N	suneung	하
9342	n. *균형	* 평정	\N	\N	\N	suneung	기타
9343	disciple	n. *문하생	\N	\N	\N	suneung	하
9351	border	n. *가장자리	\N	\N	\N	suneung	하
9355	withhold	v. *억누르다	\N	\N	\N	suneung	하
9363	vanity	n. *허영심	\N	\N	\N	suneung	하
9364	firsthand	ad. *직접	\N	\N	\N	suneung	하
9373	counteract	v. (효력을) *중화시키다	\N	\N	\N	suneung	하
9380	juggle	v. *잘 처리하다	\N	\N	\N	suneung	하
9388	nursery	n. *육아실	\N	\N	\N	suneung	하
9390	notion	n. *개념	\N	\N	\N	suneung	하
9393	fragment	n. *일부분	\N	\N	\N	suneung	하
9399	rational	a. *이성적인	\N	\N	\N	suneung	하
9400	clarify	v. *명백히 하다*	\N	\N	\N	suneung	하
9402	deterioration	n. *악화	\N	\N	\N	suneung	하
9405	intervene	v. *사이에 끼어들다	\N	\N	\N	suneung	하
9408	n. *치유	 회복*	\N	\N	\N	suneung	기타
9410	dare	v. *감히 ~하다*	\N	\N	\N	suneung	하
9413	cultivate	v. *경작하다	\N	\N	\N	suneung	하
9420	reproach	n. *비난*	\N	\N	\N	suneung	하
9430	contagious	a. *전염성의	\N	\N	\N	suneung	하
9436	dehydrate	v. *탈수하다	\N	\N	\N	suneung	중
9437	underneth	p *~의 아래에	\N	\N	\N	suneung	기타
9450	n. 사절	 대표	\N	\N	\N	suneung	기타
9241	v. 공급하다	 준비하다	\N	\N	\N	suneung	기타
9242	mourn	v. *슬퍼하다	\N	\N	\N	suneung	하
9256	defend	v. *방어하다	\N	\N	\N	suneung	하
9243	evoke	v. *일깨우다	\N	\N	\N	suneung	하
9244	stretch	v. *잡아늘리다*	\N	\N	\N	suneung	하
9247	patch	n. *헝겊 조각	\N	\N	\N	suneung	하
9257	fraud	n. *사기	\N	\N	\N	suneung	하
9269	breast	n. *가슴*	\N	\N	\N	suneung	하
9270	anthropology	n. *인류학*	\N	\N	\N	suneung	하
9271	premature	a. *조숙한	\N	\N	\N	suneung	하
9272	dual	a. *둘의	\N	\N	\N	suneung	하
9276	medieval	a. *중세의*	\N	\N	\N	suneung	하
9278	snatch	v. *잡아채다	\N	\N	\N	suneung	하
9293	deflect	v. *비끼다	\N	\N	\N	suneung	하
9294	adorable	a. *귀여운	\N	\N	\N	suneung	하
9305	duration	n. *지속	\N	\N	\N	suneung	하
9321	n. *평행선	* ~에 필적하는 것	\N	\N	\N	suneung	기타
9327	mortal	a. *죽을 운명의	\N	\N	\N	suneung	하
9330	headmaster	n. *교장*	\N	\N	\N	suneung	하
9331	rubbish	n. *쓰레기	\N	\N	\N	suneung	하
9332	feeble	a. *가냘픈	\N	\N	\N	suneung	하
9337	caravan	n. *여행자 무리	\N	\N	\N	suneung	하
9338	countless	a. *셀 수 없는	\N	\N	\N	suneung	하
9339	condense	v. *농축하다	\N	\N	\N	suneung	하
9340	stout	a. *뚱뚱한	\N	\N	\N	suneung	하
9349	scope	n. (관찰 · 활동의) *범위	\N	\N	\N	suneung	하
9354	a. *국경의	* 최첨단의	\N	\N	\N	suneung	기타
9361	compatible	a. *양립할 수 있는	\N	\N	\N	suneung	하
9362	detest	v. *혐오하다	\N	\N	\N	suneung	중
9366	obesity	n. (병적인) *비만	\N	\N	\N	suneung	하
9371	structural	a. *구조(상)의	\N	\N	\N	suneung	하
9372	bother	v. *일부러 ~하다	\N	\N	\N	suneung	하
9374	static	a. *정적인	\N	\N	\N	suneung	하
9397	creep	v. *기다	\N	\N	\N	suneung	하
9401	dissolve	v. *용해하다	\N	\N	\N	suneung	하
9403	janitor	n. *문지기	\N	\N	\N	suneung	하
9418	scheme	n. *계획	\N	\N	\N	suneung	하
9422	publicity	n. *널리 알려짐	\N	\N	\N	suneung	하
9427	disappoint	v. *실망시키다*	\N	\N	\N	suneung	하
9428	handle	v. *다루다*	\N	\N	\N	suneung	하
9431	constraint	n. *강제	\N	\N	\N	suneung	하
9438	decree	n. *법령*	\N	\N	\N	suneung	하
9440	pinch	v. *~을 꼬집다	\N	\N	\N	suneung	하
9441	punctual	a. *시간을 지키는	\N	\N	\N	suneung	하
9442	last	v. *계속하다*	\N	\N	\N	suneung	하
9448	rectangular	a. *직사각형의	\N	\N	\N	suneung	하
9451	elect	v. *선출하다*	\N	\N	\N	suneung	하
9453	empathize	v. *공감하다	\N	\N	\N	suneung	중
9459	experiment	v. *실험하다*	\N	\N	\N	suneung	하
9461	retort	n. *반박	\N	\N	\N	suneung	하
9467	figure	n. *수치	\N	\N	\N	suneung	하
9472	coexist	v. *공존하다*	\N	\N	\N	suneung	하
9476	discreet	a. *분별 있는	\N	\N	\N	suneung	하
9482	dread	n. *공포*	\N	\N	\N	suneung	하
9491	verify	v. *검증하다	\N	\N	\N	suneung	하
9492	engross	v. *열중하게 하다*	\N	\N	\N	suneung	중
9494	despise	v. *경멸하다*	\N	\N	\N	suneung	하
9505	fume	n. *연기*	\N	\N	\N	suneung	하
9507	conscious	a. *의식하고 있는*	\N	\N	\N	suneung	하
9509	staple	a. *주요한*	\N	\N	\N	suneung	하
9513	eloquent	a. *웅변의	\N	\N	\N	suneung	하
9516	hazar	a. *위험한	\N	\N	\N	suneung	중
9517	skull	n. *두개골*	\N	\N	\N	suneung	하
9518	detergent	n. *세제*	\N	\N	\N	suneung	하
9519	brutal	a. *야만적인	\N	\N	\N	suneung	하
9528	hire	v. *고용하다*	\N	\N	\N	suneung	하
9529	melancholy	a. *우울한*	\N	\N	\N	suneung	하
9531	perpetual	a. *영구의	\N	\N	\N	suneung	하
9536	lecture	v. *강의를 하다*	\N	\N	\N	suneung	하
9538	simplicity	n. *간단	\N	\N	\N	suneung	하
9539	ditch	n. *수로	\N	\N	\N	suneung	하
9543	persider	n. *주재자	\N	\N	\N	suneung	기타
9544	newbie	n. *신출내기	\N	\N	\N	suneung	하
9552	plausible	a. *그럴듯한	\N	\N	\N	suneung	하
9557	v. *신음하다	* 불평하다	\N	\N	\N	suneung	기타
9567	demolish	v. *파괴하다	\N	\N	\N	suneung	하
9570	degenerate	v. *퇴보하다	\N	\N	\N	suneung	하
9576	n. 도구	 (축구의) 태클	\N	\N	\N	suneung	기타
9580	enchant	v. *매혹하다	\N	\N	\N	suneung	하
9583	thrust	v. *밀다	\N	\N	\N	suneung	하
9586	misplace	v. *잘못 두다*	\N	\N	\N	suneung	하
9592	multiple	a. *복합적인	\N	\N	\N	suneung	하
9597	propel	v. *나아가게 하다	\N	\N	\N	suneung	하
9600	feat	n. *위업	\N	\N	\N	suneung	하
9607	grumble	n. *불평*	\N	\N	\N	suneung	하
9611	reckless	a. *부주의한	\N	\N	\N	suneung	하
9614	rule	v. *지배하다*	\N	\N	\N	suneung	하
9622	liable	a. *책임을 져야 할	\N	\N	\N	suneung	하
9623	insane	a. *정신 이상의	\N	\N	\N	suneung	하
9628	barefoot	ad. *맨발로*	\N	\N	\N	suneung	하
9633	lessen	v. *줄(이)다*	\N	\N	\N	suneung	하
9634	tangle	v. *얽히게 하다	\N	\N	\N	suneung	하
9640	prosper	v. *번영하다	\N	\N	\N	suneung	하
9641	phase	n. *상	\N	\N	\N	suneung	하
9642	veterinarian	n. *수의사*	\N	\N	\N	suneung	하
9646	weigh	v. *무게를 달다*	\N	\N	\N	suneung	하
9649	discrete	a. *분리된	\N	\N	\N	suneung	하
9650	Transgenic	a. *이식 유전자에 의한*	\N	\N	\N	suneung	하
9651	thread	실	\N	\N	\N	gtelp	하
9652	needle	바늘	\N	\N	\N	gtelp	하
9653	pattern	도안 모양	\N	\N	\N	gtelp	하
9654	distribute	분배하다	\N	\N	\N	gtelp	하
9658	creativity	창조성	\N	\N	\N	gtelp	하
9240	outfit	n. *용품	\N	\N	\N	suneung	하
9259	easygoing	a. *태평스러운	\N	\N	\N	suneung	중
9261	trade	v. *교환하다*	\N	\N	\N	suneung	하
9263	insomnia	n. *불면증*	\N	\N	\N	suneung	하
9277	analogy	n. *유추	\N	\N	\N	suneung	하
9279	upset	a. *마음이 상한	\N	\N	\N	suneung	하
9289	indulge	v. *탐닉하다	\N	\N	\N	suneung	하
9290	meadow	n. *목초지	\N	\N	\N	suneung	하
9291	venture	v. *모험하다*	\N	\N	\N	suneung	하
9299	lurk	v. *숨다	\N	\N	\N	suneung	하
9300	advance	v. *나아가게 하다	\N	\N	\N	suneung	하
9309	n. *가짜	 사기꾼*	\N	\N	\N	suneung	기타
9310	beaver	n. *비버	\N	\N	\N	suneung	하
9311	comprise	v. *포함하다	\N	\N	\N	suneung	하
9312	textile	a. *직물의	\N	\N	\N	suneung	하
9315	spouse	n. *배우자*	\N	\N	\N	suneung	하
9318	ban	v. *금지하다*	\N	\N	\N	suneung	하
9320	parallel	a. *평행의*	\N	\N	\N	suneung	하
9328	humanity	n. *인류	\N	\N	\N	suneung	하
9329	crispy	a. *바삭바삭한	\N	\N	\N	suneung	하
9333	clumsy	a. *어색한	\N	\N	\N	suneung	하
9334	subsequent	a. *그 후의	\N	\N	\N	suneung	하
9344	gust	n. *돌풍	\N	\N	\N	suneung	하
9345	hail	n. *싸락눈	\N	\N	\N	suneung	하
9353	frontier	n. *국경*	\N	\N	\N	suneung	하
9356	amnesty	n. *사면*	\N	\N	\N	suneung	하
9358	stall	n. *마굿간	\N	\N	\N	suneung	하
9360	apparatus	n. *장치	\N	\N	\N	suneung	하
9367	dilemma	n. *진퇴양난	\N	\N	\N	suneung	하
9368	render	v. *~이 되게 하다	\N	\N	\N	suneung	하
9375	sheriff	n. *보안관*	\N	\N	\N	suneung	하
9376	charge	v. *채우다	\N	\N	\N	suneung	하
9377	discourse	n. *강연	\N	\N	\N	suneung	하
9378	bribe	n. *뇌물*	\N	\N	\N	suneung	하
9381	perspiration	n. *땀	\N	\N	\N	suneung	하
9382	retention	n. *보유	\N	\N	\N	suneung	하
9383	valiant	a. *용감한	\N	\N	\N	suneung	하
9384	cheer	v. *성원하다*	\N	\N	\N	suneung	하
9385	n. *환호	 갈채*	\N	\N	\N	suneung	기타
9386	distress	n. *고민	\N	\N	\N	suneung	하
9391	disgust	n. *혐오감*	\N	\N	\N	suneung	하
9394	correct	v. *바로잡다*	\N	\N	\N	suneung	하
9396	oversee	v. *감독하다	\N	\N	\N	suneung	하
9406	nomad	n. *유목민	\N	\N	\N	suneung	하
9407	cure	v. *치료하다*	\N	\N	\N	suneung	하
9414	ascent	n. *상승	\N	\N	\N	suneung	하
9415	spur	n. *자극	\N	\N	\N	suneung	하
9417	discern	v. *식별하다	\N	\N	\N	suneung	하
9423	declare	v. *선언하다*	\N	\N	\N	suneung	하
9425	exile	n. *망명	\N	\N	\N	suneung	하
9429	fling	v. *내던지다	\N	\N	\N	suneung	하
9432	unanimous	a. *만장일치의	\N	\N	\N	suneung	하
9433	itch	n. *가려움*	\N	\N	\N	suneung	하
9435	delude	v. *속이다	\N	\N	\N	suneung	중
9449	delegate	v. *파견하다*	\N	\N	\N	suneung	하
9452	catastrophe	n. *대참사	\N	\N	\N	suneung	하
9458	interval	n. *간격	\N	\N	\N	suneung	하
9465	asthma	n. *천식*	\N	\N	\N	suneung	하
9466	realm	n. *왕국	\N	\N	\N	suneung	하
9471	devote	v. (몸 · 노력 · 시간 · 돈을) *바치다*	\N	\N	\N	suneung	하
9473	hospitality	n. *환대	\N	\N	\N	suneung	하
9479	tradition	n. *전통	\N	\N	\N	suneung	하
9480	drawback	n. *문제점	\N	\N	\N	suneung	하
9488	v. *쌓다	 쌓이다*	\N	\N	\N	suneung	기타
9489	cynical	a. *냉소적인	\N	\N	\N	suneung	하
9493	bulk	n. *크기	\N	\N	\N	suneung	하
9497	barrel	n. *통	\N	\N	\N	suneung	하
9498	predecessor	n. *앞서 있었던 것	\N	\N	\N	suneung	하
9499	pastor	n. *목사	\N	\N	\N	suneung	하
9500	proclaim	v. *선언하다	\N	\N	\N	suneung	하
9511	reverence	n. *존경	\N	\N	\N	suneung	하
9512	rapid	a. *빠른	\N	\N	\N	suneung	하
9521	a. 무분별한	 성급한	\N	\N	\N	suneung	기타
9522	bypass	v. *우회하다*	\N	\N	\N	suneung	하
9541	enact	v. *법제화하다	\N	\N	\N	suneung	하
9547	eject	v. *쫓아내다	\N	\N	\N	suneung	하
9548	intersection	n. *교차(로)	\N	\N	\N	suneung	하
9556	moan	n. *신음*	\N	\N	\N	suneung	하
9559	rerspectively	ad. *각각	\N	\N	\N	suneung	기타
9562	post	v. (벽 따위에) *붙이다*	\N	\N	\N	suneung	하
9564	reckon	v. *세다	\N	\N	\N	suneung	하
9568	progress	v. *전진하다*	\N	\N	\N	suneung	하
9571	sentiment	n. *감상	\N	\N	\N	suneung	하
9577	defy	v. *물리치다	\N	\N	\N	suneung	하
9578	perdator	n. *육식 동물	\N	\N	\N	suneung	기타
9581	detach	v. *떼어 내다	\N	\N	\N	suneung	하
9584	creed	n. *신념	\N	\N	\N	suneung	하
9587	auditory	a. *귀의	\N	\N	\N	suneung	하
9590	n. 세계인	 국제인	\N	\N	\N	suneung	기타
9598	reptile	n. *파충류*	\N	\N	\N	suneung	하
9602	penetrate	v. *침투하다	\N	\N	\N	suneung	하
9603	repair	v. *수선하다*	\N	\N	\N	suneung	하
9605	cringe	c. *위축되다	\N	\N	\N	suneung	하
9608	v. *불평하다	* 으르렁거리다	\N	\N	\N	suneung	기타
9610	scrutiny	n. (면밀한) *조사*	\N	\N	\N	suneung	하
9612	synthetic	a. <화학> *합성의*	\N	\N	\N	suneung	하
9615	n. *지배	 규칙*	\N	\N	\N	suneung	기타
9625	compartment	n. *구획	\N	\N	\N	suneung	하
9626	uncover	v. *폭로하다	\N	\N	\N	suneung	하
9627	limb	n. *사지	\N	\N	\N	suneung	하
9636	ambiguous	a. *애매모호한	\N	\N	\N	suneung	하
9637	enthusiasm	n. *열광	\N	\N	\N	suneung	하
9638	bankruptcy	n. *파산*	\N	\N	\N	suneung	하
9639	duel	n. *결투*	\N	\N	\N	suneung	하
9254	friction	n. *마찰	\N	\N	\N	suneung	하
9258	translate	v. *번역하다	\N	\N	\N	suneung	하
9657	feature n v	특징 특징을 이루다	\N	\N	\N	gtelp	기타
9666	gratitude	감사	\N	\N	\N	gtelp	하
9667	scold	꾸짖다 비난하다	\N	\N	\N	gtelp	중
9677	courageous	용기 있는	\N	\N	\N	gtelp	하
9678	encourage	격려하다 용기를 주다	\N	\N	\N	gtelp	하
9679	encouragement	격려	\N	\N	\N	gtelp	하
9684	activity	활동	\N	\N	\N	gtelp	하
9701	enable A to Root A	가 하는 것을 가능하게하다	\N	\N	\N	gtelp	기타
9705	advanced form	진보된 형태	\N	\N	\N	gtelp	기타
9706	highly skilled sport	고도로 숙련된 스포츠	\N	\N	\N	gtelp	기타
9707	soar	하늘로 솟아오르다	\N	\N	\N	gtelp	하
9713	population	인구	\N	\N	\N	gtelp	하
9723	comic strip	연재만화	\N	\N	\N	gtelp	기타
9724	remark	말하다 언급하다	\N	\N	\N	gtelp	하
9725	mound	투수 마운드	\N	\N	\N	gtelp	하
9726	faith	신념 확신	\N	\N	\N	gtelp	하
9736	frightened	두려운	\N	\N	\N	gtelp	하
9739	dogs biting people	사람을 무는 개들	\N	\N	\N	gtelp	기타
9742	in this case	이런 경우에	\N	\N	\N	gtelp	기타
9745	reward	보상	\N	\N	\N	gtelp	하
9748	lawyer	변호사	\N	\N	\N	gtelp	하
9751	CEO	최고경영자	\N	\N	\N	gtelp	하
9754	daydream	공상에 잠기다	\N	\N	\N	gtelp	하
9760	behavior	행동 처신	\N	\N	\N	gtelp	하
9763	play a role	역할을 하다	\N	\N	\N	gtelp	기타
9766	genetic characters	유전적 특성	\N	\N	\N	gtelp	기타
9769	enormous	거대한 막대한	\N	\N	\N	gtelp	하
9772	stair	계단	\N	\N	\N	gtelp	하
9775	stare at	빤히 쳐다 보다 응시하다	\N	\N	\N	gtelp	기타
9778	pleased	기쁜	\N	\N	\N	gtelp	하
9781	motorist	자가용 운전수	\N	\N	\N	gtelp	하
9787	garbage	쓰레기	\N	\N	\N	gtelp	하
9790	muscles and joints	근육과 관절	\N	\N	\N	gtelp	기타
9793	mobility	움직임	\N	\N	\N	gtelp	하
9796	morality	도덕성	\N	\N	\N	gtelp	하
9799	perform	수행하다	\N	\N	\N	gtelp	하
9802	spine	척추	\N	\N	\N	gtelp	하
9805	tissue	조직	\N	\N	\N	gtelp	하
9811	horizontally	수평으로	\N	\N	\N	gtelp	하
9814	grinding device	가는 기계	\N	\N	\N	gtelp	기타
9817	used to Root	하곤 했다	\N	\N	\N	gtelp	기타
9820	grain	곡물	\N	\N	\N	gtelp	하
9823	attach	붙이다 부착하다	\N	\N	\N	gtelp	하
9826	groove	홈	\N	\N	\N	gtelp	하
9832	lifelimiting illness	불치병	\N	\N	\N	gtelp	기타
9835	treatment	치료	\N	\N	\N	gtelp	하
9841	spiritual impact	정신적 충격	\N	\N	\N	gtelp	기타
9844	scribble	갈겨쓰다	\N	\N	\N	gtelp	하
9847	avoid	피하다	\N	\N	\N	gtelp	하
9850	if necessary	필요하다면	\N	\N	\N	gtelp	기타
9853	effectively	효과적으로	\N	\N	\N	gtelp	하
9856	similarly	유사하게 이와 마찬가지로	\N	\N	\N	gtelp	하
9859	negative	부정적인	\N	\N	\N	gtelp	하
9862	overcome	극복하다	\N	\N	\N	gtelp	하
9865	focus on	초점을 맞추다	\N	\N	\N	gtelp	기타
9868	expedition	탐험	\N	\N	\N	gtelp	하
9871	reward n v	보상 보상하다	\N	\N	\N	gtelp	기타
9874	in theory	이론상	\N	\N	\N	gtelp	기타
9877	equipment	장비	\N	\N	\N	gtelp	하
9880	above graph	위 도표	\N	\N	\N	gtelp	기타
9883	while	반면에 동안	\N	\N	\N	gtelp	하
9889	female	여성의	\N	\N	\N	gtelp	하
9892	prove	증명하다	\N	\N	\N	gtelp	하
9895	turn into	로 바뀌다	\N	\N	\N	gtelp	기타
9898	rich connection	풍부한 연결고리	\N	\N	\N	gtelp	기타
9901	floor	가속페달을 밟다	\N	\N	\N	gtelp	하
9904	all at once	갑자기	\N	\N	\N	gtelp	기타
9907	gunshop	총격	\N	\N	\N	gtelp	기타
9910	torn metal	찢겨진 금속	\N	\N	\N	gtelp	기타
9916	promising	가망 있는 유망한	\N	\N	\N	gtelp	하
9919	colleague	동료	\N	\N	\N	gtelp	하
9922	gladiator	검투사	\N	\N	\N	gtelp	하
9925	wearily	지쳐서	\N	\N	\N	gtelp	중
9928	calmness	평온함 안정	\N	\N	\N	gtelp	하
9931	greet	인사하다	\N	\N	\N	gtelp	하
9934	stick	막대기	\N	\N	\N	gtelp	하
9937	scare away	겁주어 ㅉㅗㅈ아내다	\N	\N	\N	gtelp	기타
9940	describe	묘사하다 서술하다	\N	\N	\N	gtelp	하
9943	key part	중요한 역할	\N	\N	\N	gtelp	기타
9949	total	전체의	\N	\N	\N	gtelp	하
9952	sink	부엌 싱크대	\N	\N	\N	gtelp	하
9955	blood vessel	혈관	\N	\N	\N	gtelp	기타
9958	smooth	부드러운 유연한	\N	\N	\N	gtelp	하
9961	heart disease	심장 질환	\N	\N	\N	gtelp	기타
9964	insect	곤충	\N	\N	\N	gtelp	하
9970	mammal	포유동물	\N	\N	\N	gtelp	하
9973	symbol	상징	\N	\N	\N	gtelp	하
9976	ease	덜다 완화시키다	\N	\N	\N	gtelp	하
9979	special	특별한	\N	\N	\N	gtelp	하
9982	passion	열정	\N	\N	\N	gtelp	하
9985	funeral	장례식	\N	\N	\N	gtelp	하
9991	society	사회	\N	\N	\N	gtelp	하
9994	employee	종업원 사원	\N	\N	\N	gtelp	하
9997	these days	요즘	\N	\N	\N	gtelp	기타
10000	romantic	낭만적인	\N	\N	\N	gtelp	하
10003	bouquet	부케	\N	\N	\N	gtelp	하
10006	select	선택하다	\N	\N	\N	gtelp	하
10009	exactly	정확하게	\N	\N	\N	gtelp	하
10012	dont have toR R	할 필요 없다	\N	\N	\N	gtelp	기타
10015	negative	부정적인	\N	\N	\N	gtelp	하
10018	diligent	부지런한	\N	\N	\N	gtelp	하
10021	separate	떼어 놓다	\N	\N	\N	gtelp	하
10024	behave	행동하다	\N	\N	\N	gtelp	하
10030	broken heart	실연	\N	\N	\N	gtelp	기타
10033	longdistance	장거리	\N	\N	\N	gtelp	중
10036	search for	을 찾다	\N	\N	\N	gtelp	기타
10039	purple	보라색	\N	\N	\N	gtelp	하
9659	blessing phrase	축복을 비는 문구	\N	\N	\N	gtelp	기타
9660	tend to Root	하는 경향이 있다	\N	\N	\N	gtelp	기타
9661	celebrate	기념하다	\N	\N	\N	gtelp	하
9676	courage	용기	\N	\N	\N	gtelp	하
9680	discourage	실망시키다 낙담시키다	\N	\N	\N	gtelp	하
9681	recover	회복하다	\N	\N	\N	gtelp	하
9682	benefit	이익	\N	\N	\N	gtelp	하
9683	beneficial effect on	에 이로운 영향	\N	\N	\N	gtelp	기타
9688	depression	우울증	\N	\N	\N	gtelp	하
9689	awesome	멋진 근사한 두려운	\N	\N	\N	gtelp	하
9692	accompany	동반하다 수반하다	\N	\N	\N	gtelp	하
9694	grand	웅장한	\N	\N	\N	gtelp	하
9695	grand prize	대상	\N	\N	\N	gtelp	기타
9697	accommodations	숙박	\N	\N	\N	gtelp	하
9702	powerproducing	동력을 발생시키는	\N	\N	\N	gtelp	기타
9703	device	장치	\N	\N	\N	gtelp	하
9704	expert	전문가 숙련가	\N	\N	\N	gtelp	하
9711	census bureau	인구조사국	\N	\N	\N	gtelp	기타
9712	popularity	인기	\N	\N	\N	gtelp	하
9721	confident	확신하는	\N	\N	\N	gtelp	하
9728	in other words	즉 다시 말해서	\N	\N	\N	gtelp	기타
9735	realization	실현 현실화	\N	\N	\N	gtelp	하
9741	bite bit bitten	물다	\N	\N	\N	gtelp	기타
9744	award	상	\N	\N	\N	gtelp	하
9747	approach	접근하다	\N	\N	\N	gtelp	하
9750	commuter train	통근기차	\N	\N	\N	gtelp	기타
9753	principle	원리 원칙	\N	\N	\N	gtelp	하
9756	complaint	불평	\N	\N	\N	gtelp	하
9759	opportunity	기회	\N	\N	\N	gtelp	하
9762	instinctive	본능적인	\N	\N	\N	gtelp	하
9765	mammal	포유동물	\N	\N	\N	gtelp	하
9768	process	과정 절차	\N	\N	\N	gtelp	하
9774	stretch	쭉 뻗다 잡아 늘리다	\N	\N	\N	gtelp	하
9777	grateful	감사해하는	\N	\N	\N	gtelp	하
9780	embarrassed	당혹해하는 난처한	\N	\N	\N	gtelp	하
9783	food container	음식물 용기	\N	\N	\N	gtelp	기타
9786	trash	쓰레기	\N	\N	\N	gtelp	하
9789	seriously	심각하게 진지하게	\N	\N	\N	gtelp	하
9792	flexibility	유연성	\N	\N	\N	gtelp	하
9795	immoral	비도덕적인	\N	\N	\N	gtelp	하
9798	reform	개혁하다	\N	\N	\N	gtelp	하
9804	internal organ	내장기관 내부 장기	\N	\N	\N	gtelp	기타
9807	everyday routine	일상생활	\N	\N	\N	gtelp	기타
9810	fasten	고정시키다	\N	\N	\N	gtelp	하
9813	grindgroundground	갈다	\N	\N	\N	gtelp	기타
9816	be used to ing	하는데 익숙하다	\N	\N	\N	gtelp	기타
9819	paste	반죽	\N	\N	\N	gtelp	하
9825	the grain jammed	짓눌려진 곡물	\N	\N	\N	gtelp	기타
9828	care	보살핌	\N	\N	\N	gtelp	하
9831	support	지원 지지 지원하다	\N	\N	\N	gtelp	하
9834	respond to	에 반응하다	\N	\N	\N	gtelp	기타
9840	deal with	다루다 치료하다	\N	\N	\N	gtelp	기타
9843	something complex	복잡한 무엇인가	\N	\N	\N	gtelp	기타
9846	room to complete	완성할 수 있는 공간	\N	\N	\N	gtelp	기타
9849	refer to	언급하다 말하다	\N	\N	\N	gtelp	기타
9852	attention	관심	\N	\N	\N	gtelp	하
9855	explanation	설명	\N	\N	\N	gtelp	하
9858	positive	긍정적인	\N	\N	\N	gtelp	하
9861	attitude	태도	\N	\N	\N	gtelp	하
9864	recognize	인식하다	\N	\N	\N	gtelp	하
9867	explorer	탐험가	\N	\N	\N	gtelp	하
9873	in gaining support	지원을 얻는데	\N	\N	\N	gtelp	기타
9876	equip	장비를 갖추다	\N	\N	\N	gtelp	하
9879	aging population	노령인구	\N	\N	\N	gtelp	기타
9882	be expected to Root	할 것으로 기대되어진다	\N	\N	\N	gtelp	기타
9885	figure	숫자 모양	\N	\N	\N	gtelp	하
9888	male	남성의	\N	\N	\N	gtelp	하
9894	pregnancy	임신	\N	\N	\N	gtelp	하
9897	due to	때문에	\N	\N	\N	gtelp	기타
9900	three times	세배	\N	\N	\N	gtelp	기타
9903	all of a sudden	갑자기	\N	\N	\N	gtelp	기타
9906	explosion	폭발	\N	\N	\N	gtelp	하
9909	teartoretorn	찢다	\N	\N	\N	gtelp	기타
9915	monotonous	단조로운 무미건조한	\N	\N	\N	gtelp	하
9918	exhausted	녹초가 된 기진맥진한	\N	\N	\N	gtelp	하
9921	nothing left	남겨진 것이 아무것도 없다	\N	\N	\N	gtelp	기타
9924	weary	피로한 지친	\N	\N	\N	gtelp	하
9927	regain	되찾다	\N	\N	\N	gtelp	하
9930	scenario	극본 상황 대본	\N	\N	\N	gtelp	하
9933	bamboo	대나무	\N	\N	\N	gtelp	하
9936	explode	폭발시키다	\N	\N	\N	gtelp	하
9939	various	다양한	\N	\N	\N	gtelp	하
9942	burst	터지다 폭발하다	\N	\N	\N	gtelp	하
9945	national holidays	국경일	\N	\N	\N	gtelp	기타
9948	increase	증가시키다	\N	\N	\N	gtelp	하
9951	grease	기름 지방	\N	\N	\N	gtelp	하
9957	blood stream	혈류피의 흐름	\N	\N	\N	gtelp	기타
9960	be likely toR R	할 것 같다	\N	\N	\N	gtelp	기타
9963	communicate with	와 의사소통하다	\N	\N	\N	gtelp	기타
9966	over there	저쪽에	\N	\N	\N	gtelp	기타
9969	location	위치	\N	\N	\N	gtelp	하
9972	exchange	교환하다	\N	\N	\N	gtelp	하
9975	thought	생각	\N	\N	\N	gtelp	하
9981	sense of humor	유머 감각	\N	\N	\N	gtelp	기타
9984	cherish	소중히 하다	\N	\N	\N	gtelp	하
9987	in the meantime	그사이에	\N	\N	\N	gtelp	기타
9990	supper	저녁식사	\N	\N	\N	gtelp	하
9993	company	회사	\N	\N	\N	gtelp	하
9996	broadcast	방송하다	\N	\N	\N	gtelp	하
9999	express	표현하다	\N	\N	\N	gtelp	하
10002	decoration	장식	\N	\N	\N	gtelp	하
10008	celebration	축하	\N	\N	\N	gtelp	하
10011	get along with	와 사이좋게 지내다	\N	\N	\N	gtelp	기타
10014	accept	받아들이다	\N	\N	\N	gtelp	하
10017	that is	즉	\N	\N	\N	gtelp	기타
9663	hut	오두막	\N	\N	\N	gtelp	하
9665	indicate	가리키다	\N	\N	\N	gtelp	하
9668	care for	돌보다	\N	\N	\N	gtelp	기타
9669	look after	돌보다	\N	\N	\N	gtelp	기타
9672	According to	에 따르면	\N	\N	\N	gtelp	기타
9673	recent study	최근의 연구	\N	\N	\N	gtelp	기타
9674	do harm	해가 되다	\N	\N	\N	gtelp	기타
9675	keep going on	계속해서 해나가다	\N	\N	\N	gtelp	기타
9685	inactivity	비 활동	\N	\N	\N	gtelp	하
9686	muscle weakness	근육약화	\N	\N	\N	gtelp	기타
9687	depress	우울하게 만들다	\N	\N	\N	gtelp	하
9690	awesome trick	멋진 묘기	\N	\N	\N	gtelp	기타
9696	include	포함하다	\N	\N	\N	gtelp	하
9698	encyclopedia	백과사전	\N	\N	\N	gtelp	하
9699	the unique appeal	독특한 매력	\N	\N	\N	gtelp	기타
9708	obstacle	장애물	\N	\N	\N	gtelp	하
9709	census	인구조사	\N	\N	\N	gtelp	하
9710	bureau	사무소 국	\N	\N	\N	gtelp	하
9714	calculate	계산하다	\N	\N	\N	gtelp	하
9715	million	억	\N	\N	\N	gtelp	하
9716	conduct	수행하다	\N	\N	\N	gtelp	하
9718	omit	생략하다 누락하다	\N	\N	\N	gtelp	하
9719	illegal immigrant	불법이민자	\N	\N	\N	gtelp	기타
9720	precise	정확한	\N	\N	\N	gtelp	하
9722	somewhat close	다소 근접한	\N	\N	\N	gtelp	기타
9729	as it were	즉 다시 말해서	\N	\N	\N	gtelp	기타
9731	the lack of faith	신념확신의 결핍	\N	\N	\N	gtelp	기타
9732	pursuit	추구	\N	\N	\N	gtelp	하
9733	the pursuit of happiness	행복의 추구	\N	\N	\N	gtelp	기타
9734	demand	요구 수요	\N	\N	\N	gtelp	하
9737	scared	두려운	\N	\N	\N	gtelp	하
9740	rush into action	즉시 행동에 옮기다	\N	\N	\N	gtelp	기타
9743	protect	보호하다	\N	\N	\N	gtelp	하
9749	commute	통근하다	\N	\N	\N	gtelp	하
9752	chief executive officer	최고경영자	\N	\N	\N	gtelp	기타
9755	complain	불평하다	\N	\N	\N	gtelp	하
9758	be willing to Root	기꺼이 하다	\N	\N	\N	gtelp	기타
9761	instinct	본능	\N	\N	\N	gtelp	하
9764	biological need	생물학적인 욕구	\N	\N	\N	gtelp	기타
9767	complex	복잡한	\N	\N	\N	gtelp	하
9770	tumble	구르다	\N	\N	\N	gtelp	하
9773	below me	내 아래	\N	\N	\N	gtelp	기타
9779	indifferent	무관심한	\N	\N	\N	gtelp	하
9782	cigarette butt	담배 공초	\N	\N	\N	gtelp	기타
9785	rubbish	쓰레기	\N	\N	\N	gtelp	하
9788	litter	더럽히다	\N	\N	\N	gtelp	하
9791	flexible	유연한	\N	\N	\N	gtelp	하
9794	moral	도덕적인	\N	\N	\N	gtelp	하
9797	inform	알리다	\N	\N	\N	gtelp	하
9803	oxygen	산소	\N	\N	\N	gtelp	하
9806	maintain	유지하다	\N	\N	\N	gtelp	하
9809	aching back	욱신거리는 등	\N	\N	\N	gtelp	기타
9812	vertically	수직으로	\N	\N	\N	gtelp	하
9815	be used to Root	하는데 사용되어지다	\N	\N	\N	gtelp	기타
9818	flour	밀가루	\N	\N	\N	gtelp	하
9824	detach	떨어뜨리다 분리하다	\N	\N	\N	gtelp	하
9827	concept	개념	\N	\N	\N	gtelp	하
9830	comfort	안락 위안	\N	\N	\N	gtelp	하
9833	no longer	더 이상 이 아니다	\N	\N	\N	gtelp	기타
9836	human dignity	인간의 존엄성	\N	\N	\N	gtelp	기타
9839	professional	전문가	\N	\N	\N	gtelp	하
9842	emotional	정신적인 감성적인	\N	\N	\N	gtelp	하
9845	necessary	필요한	\N	\N	\N	gtelp	하
9848	erase	지우다	\N	\N	\N	gtelp	하
9854	explain	설명하다	\N	\N	\N	gtelp	하
9857	in contrast	반대로	\N	\N	\N	gtelp	기타
9860	competition	경쟁	\N	\N	\N	gtelp	하
9863	defeat	부수다 이기다	\N	\N	\N	gtelp	하
9866	weakness	약점	\N	\N	\N	gtelp	하
9869	caravan	여행 대	\N	\N	\N	gtelp	하
9872	yet	그러나 그럼에도 불구하고	\N	\N	\N	gtelp	하
9875	particular path	특별한 길	\N	\N	\N	gtelp	기타
9881	elderly people	노인	\N	\N	\N	gtelp	기타
9884	gradual rise	점차적인 증가	\N	\N	\N	gtelp	기타
9887	various	다양한	\N	\N	\N	gtelp	하
9890	happen to Root	우연히 알게 되다	\N	\N	\N	gtelp	기타
9893	pregnant	임신한	\N	\N	\N	gtelp	하
9896	male hormone	남성호르몬	\N	\N	\N	gtelp	기타
9902	slam	쾅 부딪히다	\N	\N	\N	gtelp	하
9905	explode	폭발하다	\N	\N	\N	gtelp	하
9908	head for	로 향하다	\N	\N	\N	gtelp	기타
9911	spin spanspun	돌다	\N	\N	\N	gtelp	기타
9914	urgent	다급한 긴박한	\N	\N	\N	gtelp	하
9917	pressure	압력 압박	\N	\N	\N	gtelp	하
9920	customer	고객	\N	\N	\N	gtelp	하
9923	battle	전투	\N	\N	\N	gtelp	하
9926	arm chair	안락의자	\N	\N	\N	gtelp	기타
9929	this sorry scenario	이 슬픈 상황	\N	\N	\N	gtelp	기타
9932	fill A with B A B	를 로 채우다	\N	\N	\N	gtelp	기타
9935	gunpowder	화약	\N	\N	\N	gtelp	하
9938	evil spirits	악령	\N	\N	\N	gtelp	기타
9941	bomb	폭탄	\N	\N	\N	gtelp	하
9947	Trans fat	트랜스 지방	\N	\N	\N	gtelp	기타
9950	level	수준	\N	\N	\N	gtelp	하
9953	that is	즉 다시 말하면	\N	\N	\N	gtelp	기타
9956	as a result	그 결과	\N	\N	\N	gtelp	기타
9962	therefore	그러므로	\N	\N	\N	gtelp	하
9965	such as	와 같은	\N	\N	\N	gtelp	기타
9968	a ind of	일종의	\N	\N	\N	gtelp	기타
9971	whale	고래	\N	\N	\N	gtelp	하
9974	represent	말하다 표현하다	\N	\N	\N	gtelp	하
9977	pain	고통	\N	\N	\N	gtelp	하
9980	in many ways	여러 면에서	\N	\N	\N	gtelp	기타
9983	pleasure	기쁨	\N	\N	\N	gtelp	하
9986	come by	에 들리다	\N	\N	\N	gtelp	기타
9992	open	열려있는	\N	\N	\N	gtelp	하
9998	common	일반적인	\N	\N	\N	gtelp	하
10004	anniversary	기념일	\N	\N	\N	gtelp	하
10007	present	에게 주다	\N	\N	\N	gtelp	하
10010	opinion	의견	\N	\N	\N	gtelp	하
10013	difference	차이	\N	\N	\N	gtelp	하
10016	thought	생각	\N	\N	\N	gtelp	하
10019	intelligent	지적인	\N	\N	\N	gtelp	하
10022	immediately	즉시	\N	\N	\N	gtelp	하
10028	float	뜨다 표류하다	\N	\N	\N	gtelp	하
10031	temperature	온도	\N	\N	\N	gtelp	하
10034	rare	보기 드문 희귀한	\N	\N	\N	gtelp	하
10037	avoid	피하다	\N	\N	\N	gtelp	하
10040	dye	염색하다	\N	\N	\N	gtelp	하
10043	on the other hand	반면에	\N	\N	\N	gtelp	기타
10049	education	교육	\N	\N	\N	gtelp	하
10052	be full of	으로 가득 차다	\N	\N	\N	gtelp	기타
10055	counselor	상담원 캠프지도자	\N	\N	\N	gtelp	하
10058	tearful	눈물어린	\N	\N	\N	gtelp	하
10061	relationship	관계	\N	\N	\N	gtelp	하
10064	amazing	놀라운	\N	\N	\N	gtelp	하
10067	truly	진심으로	\N	\N	\N	gtelp	하
10070	increase	증가시키다	\N	\N	\N	gtelp	하
10073	cause	의 원인이 되다	\N	\N	\N	gtelp	하
10076	avoid	피하다	\N	\N	\N	gtelp	하
10082	skin	피부	\N	\N	\N	gtelp	하
10085	select	고르다 선택하다	\N	\N	\N	gtelp	하
10088	for instance	예를 들어	\N	\N	\N	gtelp	기타
10091	sense of touch	촉감	\N	\N	\N	gtelp	기타
10094	rough	거친	\N	\N	\N	gtelp	하
10100	sign	징조 조짐	\N	\N	\N	gtelp	하
10103	camel	낙타	\N	\N	\N	gtelp	하
10106	achieve	이행하다 성취하다	\N	\N	\N	gtelp	하
10109	letter	글자 문자	\N	\N	\N	gtelp	하
10112	upper body	상체	\N	\N	\N	gtelp	기타
10115	straight line	직선	\N	\N	\N	gtelp	기타
10121	path	길	\N	\N	\N	gtelp	하
10124	male	수컷의	\N	\N	\N	gtelp	하
10127	affect	영향을 주다	\N	\N	\N	gtelp	하
10130	fall in love	사랑에 빠지다	\N	\N	\N	gtelp	기타
10133	differently	다르게	\N	\N	\N	gtelp	하
10136	last	지속하다 계속하다	\N	\N	\N	gtelp	하
10139	big mean	양이 많은 식사	\N	\N	\N	gtelp	기타
10142	fairly	꽤 매우	\N	\N	\N	gtelp	하
10148	stomach	위장	\N	\N	\N	gtelp	하
10151	refer to	언급하다	\N	\N	\N	gtelp	기타
10154	produce	생산하다	\N	\N	\N	gtelp	하
10157	treat	치료하다	\N	\N	\N	gtelp	하
10160	sharp	날카로운	\N	\N	\N	gtelp	하
10166	sight	시력	\N	\N	\N	gtelp	하
10169	silver	은 은색	\N	\N	\N	gtelp	하
10172	advertiser	광고주	\N	\N	\N	gtelp	하
10175	advertisement	광고	\N	\N	\N	gtelp	하
10178	explain	설명하다	\N	\N	\N	gtelp	하
10181	commercial	상업광고	\N	\N	\N	gtelp	하
10187	gene	유전자	\N	\N	\N	gtelp	하
10190	behavior	행동	\N	\N	\N	gtelp	하
10193	cancer	암	\N	\N	\N	gtelp	하
10196	plenty of	많은	\N	\N	\N	gtelp	기타
10199	checkup	검사 건강 진단	\N	\N	\N	gtelp	하
10202	architect	건축가	\N	\N	\N	gtelp	하
10208	almost	거의	\N	\N	\N	gtelp	하
10211	in most cases	대부분의 경우에	\N	\N	\N	gtelp	기타
10214	anymore	더 이상	\N	\N	\N	gtelp	하
10217	purse	지갑	\N	\N	\N	gtelp	하
10220	all the time	항상	\N	\N	\N	gtelp	기타
10223	more than	이상	\N	\N	\N	gtelp	기타
10226	claim	주장하다	\N	\N	\N	gtelp	하
10229	grave	무덤	\N	\N	\N	gtelp	하
10235	pointed	예리한 뾰족한	\N	\N	\N	gtelp	하
10238	turn on	켜다	\N	\N	\N	gtelp	기타
10241	nutrition	영양	\N	\N	\N	gtelp	하
10244	organization	단체	\N	\N	\N	gtelp	하
10250	valuable	귀중한	\N	\N	\N	gtelp	하
10253	moreover	더구나	\N	\N	\N	gtelp	하
10256	parking lot	주차장	\N	\N	\N	gtelp	기타
10259	cheat	속이다	\N	\N	\N	gtelp	하
10262	seriously	심각하게	\N	\N	\N	gtelp	하
10265	expense	경비 비용	\N	\N	\N	gtelp	하
10268	worst	가장 나쁜	\N	\N	\N	gtelp	하
10274	area	분야 영역	\N	\N	\N	gtelp	하
10277	rare	희귀한 보기 드문	\N	\N	\N	gtelp	하
10280	necessity	필요 필수품	\N	\N	\N	gtelp	하
10283	ingredient	재료	\N	\N	\N	gtelp	하
10286	acquire	얻다	\N	\N	\N	gtelp	하
10289	individual	개인 개개의	\N	\N	\N	gtelp	하
10295	property	재산 자산	\N	\N	\N	gtelp	하
10298	hesitate	망설이다 주저하다	\N	\N	\N	gtelp	하
10376	conserve	보존하다	\N	\N	\N	gtelp	하
10379	primitive	원시적인	\N	\N	\N	gtelp	하
10382	doubtful	의심을 품고 있는	\N	\N	\N	gtelp	하
10385	efficient	능률적인 효과 있는	\N	\N	\N	gtelp	하
10388	particularly	특별히	\N	\N	\N	gtelp	하
10391	spice	향료	\N	\N	\N	gtelp	하
10394	ancient	고대의	\N	\N	\N	gtelp	하
10397	wage	임금	\N	\N	\N	gtelp	하
10403	stuff	에 채우다	\N	\N	\N	gtelp	하
10406	pat	가볍게 톡톡 치다	\N	\N	\N	gtelp	하
10409	immigrant	이민 이주자	\N	\N	\N	gtelp	하
10412	failure	실패 실수	\N	\N	\N	gtelp	하
10418	badly	나쁘게	\N	\N	\N	gtelp	하
10421	lack	부족하다	\N	\N	\N	gtelp	하
10424	accept	수용하다 받아들이다	\N	\N	\N	gtelp	하
10427	patience	인내력	\N	\N	\N	gtelp	하
10430	export	수출하다	\N	\N	\N	gtelp	하
10433	match	어울리다	\N	\N	\N	gtelp	하
10436	actually	실제로	\N	\N	\N	gtelp	하
10439	professor	교수	\N	\N	\N	gtelp	하
10442	raise	기르다	\N	\N	\N	gtelp	하
10448	bone	뼈	\N	\N	\N	gtelp	하
10451	fortunately	다행히	\N	\N	\N	gtelp	하
10454	away from	멀리 떨어져	\N	\N	\N	gtelp	기타
10457	cheaper	더 저렴한	\N	\N	\N	gtelp	하
10023	notice	알아차리다	\N	\N	\N	gtelp	하
10026	bang	쾅 부딪히다	\N	\N	\N	gtelp	하
10029	surface	표면	\N	\N	\N	gtelp	하
10032	lack	부족 결핍	\N	\N	\N	gtelp	하
10038	toxic object	독이 있는 물질	\N	\N	\N	gtelp	기타
10041	serve	음식을 차려내다	\N	\N	\N	gtelp	하
10044	decoration	장식	\N	\N	\N	gtelp	하
10047	poetry	시	\N	\N	\N	gtelp	하
10050	any more	더 이상	\N	\N	\N	gtelp	기타
10056	realize	깨닫다	\N	\N	\N	gtelp	하
10059	deeply	짙게 몹시	\N	\N	\N	gtelp	하
10062	form	형성하다	\N	\N	\N	gtelp	하
10065	point	어떤 특정한 때 시점 순간 찰나	\N	\N	\N	gtelp	하
10068	depend on	에 의존하다	\N	\N	\N	gtelp	기타
10071	amount	양 총계	\N	\N	\N	gtelp	하
10074	green house effect	온실효과	\N	\N	\N	gtelp	기타
10077	sources of energy	에너지 원	\N	\N	\N	gtelp	기타
10080	electricity	전기	\N	\N	\N	gtelp	하
10083	most of	대부분	\N	\N	\N	gtelp	기타
10086	heat	열	\N	\N	\N	gtelp	하
10092	sense	감각	\N	\N	\N	gtelp	하
10095	smooth	부드러운	\N	\N	\N	gtelp	하
10098	slightly	약간	\N	\N	\N	gtelp	하
10101	design	설계하다	\N	\N	\N	gtelp	하
10104	spin	회전	\N	\N	\N	gtelp	하
10110	stretch	뻗치다	\N	\N	\N	gtelp	하
10113	bend	구부리다	\N	\N	\N	gtelp	하
10116	perform	실행하다 이행하다	\N	\N	\N	gtelp	하
10119	among	사이에	\N	\N	\N	gtelp	하
10122	female	암컷의	\N	\N	\N	gtelp	하
10125	worker bee	일 벌	\N	\N	\N	gtelp	기타
10128	human beings	인간	\N	\N	\N	gtelp	기타
10131	relation	관계	\N	\N	\N	gtelp	하
10137	clearly	분명하게	\N	\N	\N	gtelp	하
10140	even though	비록 일지라도	\N	\N	\N	gtelp	기타
10143	slow down	속도가떨어뜨리다	\N	\N	\N	gtelp	기타
10146	rapid	빠른 신속한	\N	\N	\N	gtelp	하
10149	digest	소화시키다	\N	\N	\N	gtelp	하
10152	spine	등뼈 가시	\N	\N	\N	gtelp	하
10155	various	다양한	\N	\N	\N	gtelp	하
10158	fever	열 열병	\N	\N	\N	gtelp	하
10161	rat	쥐	\N	\N	\N	gtelp	하
10167	above	위	\N	\N	\N	gtelp	하
10170	four out of ten	개중에서 넷	\N	\N	\N	gtelp	기타
10173	consider	고려하다	\N	\N	\N	gtelp	하
10179	depend on	에 달려있다	\N	\N	\N	gtelp	기타
10182	goal	목표	\N	\N	\N	gtelp	하
10185	mood	기분 분위기	\N	\N	\N	gtelp	하
10188	play a role	역할을 하다	\N	\N	\N	gtelp	기타
10191	form	형태	\N	\N	\N	gtelp	하
10194	no matter who	일지라도	\N	\N	\N	gtelp	기타
10197	physical	신체의	\N	\N	\N	gtelp	하
10200	period	기간	\N	\N	\N	gtelp	하
10206	pet	애완동물	\N	\N	\N	gtelp	하
10209	keep	기르다	\N	\N	\N	gtelp	하
10212	carry	운반하다 휴대하다	\N	\N	\N	gtelp	하
10215	company	회사	\N	\N	\N	gtelp	하
10218	shoulder	어깨	\N	\N	\N	gtelp	하
10221	handwriting	필적 손으로 씀	\N	\N	\N	gtelp	하
10224	fingerprint	손금	\N	\N	\N	gtelp	하
10227	sort	종류	\N	\N	\N	gtelp	하
10230	notice	알아차리다	\N	\N	\N	gtelp	하
10233	straw	짚 밀짚	\N	\N	\N	gtelp	하
10236	unusual	유별난	\N	\N	\N	gtelp	하
10239	poverty	가난	\N	\N	\N	gtelp	하
10245	throughout the world	전 세계에	\N	\N	\N	gtelp	기타
10248	lots of	많은	\N	\N	\N	gtelp	기타
10251	certain types of jobs	어떤 종류의 일	\N	\N	\N	gtelp	기타
10254	ability	능력	\N	\N	\N	gtelp	하
10257	official	관리 공무원	\N	\N	\N	gtelp	하
10260	congratulate	축하하다	\N	\N	\N	gtelp	하
10266	touch	감동시키다	\N	\N	\N	gtelp	하
10269	humans	인간	\N	\N	\N	gtelp	하
10272	specialize	전문으로 다루다하다전공하다	\N	\N	\N	gtelp	하
10275	private	사적인	\N	\N	\N	gtelp	하
10278	purpose	목적	\N	\N	\N	gtelp	하
10281	value	가치	\N	\N	\N	gtelp	하
10284	Mediterranean	지중해	\N	\N	\N	gtelp	하
10287	instruction	교육 명령 지시	\N	\N	\N	gtelp	하
10290	govern	좌우하다 다스리다	\N	\N	\N	gtelp	하
10293	interaction	상호 작용	\N	\N	\N	gtelp	하
10296	payment	지불 납입	\N	\N	\N	gtelp	하
10446	piece	조각	\N	\N	\N	gtelp	하
10449	remains	유해	\N	\N	\N	gtelp	하
10452	equipment	장비	\N	\N	\N	gtelp	하
10455	prefer to	더 좋아하다	\N	\N	\N	gtelp	기타
10458	dangerous	위험한	\N	\N	\N	gtelp	하
10461	organize	조직하다	\N	\N	\N	gtelp	하
10464	fine shooting	뛰어난 사격 솜씨	\N	\N	\N	gtelp	기타
10467	rifle	소총	\N	\N	\N	gtelp	하
10473	context	문맥	\N	\N	\N	gtelp	하
10476	guess	추측하다	\N	\N	\N	gtelp	하
10479	finger	손가락	\N	\N	\N	gtelp	하
10482	others	다른 사람들	\N	\N	\N	gtelp	하
10485	length	길이	\N	\N	\N	gtelp	하
10488	thumb	엄지손가락	\N	\N	\N	gtelp	하
10491	publishing company	출판사	\N	\N	\N	gtelp	기타
10494	latest	최신의	\N	\N	\N	gtelp	하
10500	publication	출판물	\N	\N	\N	gtelp	하
10503	delicious	맛있는	\N	\N	\N	gtelp	하
10506	widely	널리	\N	\N	\N	gtelp	하
10509	strength	힘	\N	\N	\N	gtelp	하
10512	unknown	알려지지 않은	\N	\N	\N	gtelp	하
10515	enemy	적 적군	\N	\N	\N	gtelp	하
10521	complain	불평하다	\N	\N	\N	gtelp	하
10524	index finger	검지손가락	\N	\N	\N	gtelp	기타
10527	be concerned about	에 대해 염려하다	\N	\N	\N	gtelp	기타
10530	be satisfied with	에 만족하다	\N	\N	\N	gtelp	기타
10533	state government	주정부	\N	\N	\N	gtelp	기타
10536	trail	길의 흔적 오솔길	\N	\N	\N	gtelp	하
10539	escape	도망가다	\N	\N	\N	gtelp	하
10045	most of	대부분	\N	\N	\N	gtelp	기타
10048	common	일반적인	\N	\N	\N	gtelp	하
10051	indoor	실내의	\N	\N	\N	gtelp	하
10054	feel like	처럼 느끼다	\N	\N	\N	gtelp	기타
10060	move	감동시키다	\N	\N	\N	gtelp	하
10063	experience	경험하다	\N	\N	\N	gtelp	하
10066	effort	노력	\N	\N	\N	gtelp	하
10069	fossil fuel	화석 연료	\N	\N	\N	gtelp	기타
10072	carbon	탄소	\N	\N	\N	gtelp	하
10075	in order toR R	하기 위하여	\N	\N	\N	gtelp	기타
10081	take steps	조치를 취하다	\N	\N	\N	gtelp	기타
10084	protect	보호하다	\N	\N	\N	gtelp	하
10087	dirt	오물	\N	\N	\N	gtelp	하
10090	have to do with	와 관계가 있다	\N	\N	\N	gtelp	기타
10093	difference	차이	\N	\N	\N	gtelp	하
10096	surface	표면	\N	\N	\N	gtelp	하
10099	pale	창백한	\N	\N	\N	gtelp	하
10102	illness	병	\N	\N	\N	gtelp	하
10105	spin move	회전동작	\N	\N	\N	gtelp	기타
10108	shape	모양 형태	\N	\N	\N	gtelp	하
10114	forward	앞쪽으로	\N	\N	\N	gtelp	하
10117	either	둘 중 하나	\N	\N	\N	gtelp	하
10120	play a role	역할을 하다	\N	\N	\N	gtelp	기타
10123	attract	끌다 매혹하다	\N	\N	\N	gtelp	하
10126	respond	반응하다	\N	\N	\N	gtelp	하
10132	govern	통치하다	\N	\N	\N	gtelp	하
10135	hate	증오하다	\N	\N	\N	gtelp	하
10138	nap	낮잠	\N	\N	\N	gtelp	하
10141	relax	긴장을 풀다	\N	\N	\N	gtelp	하
10144	beat	심장이 뛰다	\N	\N	\N	gtelp	하
10147	digestion	소화	\N	\N	\N	gtelp	하
10153	mainly	주로	\N	\N	\N	gtelp	하
10156	root	뿌리	\N	\N	\N	gtelp	하
10159	creature	동물 생물	\N	\N	\N	gtelp	하
10162	squirrel	다람쥐	\N	\N	\N	gtelp	하
10165	evil	나쁜 사악한	\N	\N	\N	gtelp	하
10168	prefer	더 좋아하다	\N	\N	\N	gtelp	하
10171	in ing ing	할 때	\N	\N	\N	gtelp	기타
10174	culture	문화	\N	\N	\N	gtelp	하
10177	product	제품	\N	\N	\N	gtelp	하
10180	in this case	이런 경우에	\N	\N	\N	gtelp	기타
10183	create	창조하다 만들다	\N	\N	\N	gtelp	하
10186	disease	질병	\N	\N	\N	gtelp	하
10189	prevent	막다 예방하다	\N	\N	\N	gtelp	하
10192	heart disease	심장 질환	\N	\N	\N	gtelp	기타
10195	basics	기본 기초	\N	\N	\N	gtelp	하
10198	stuff	요소 음식물	\N	\N	\N	gtelp	하
10201	inventor	발명가	\N	\N	\N	gtelp	하
10204	most of	대부분	\N	\N	\N	gtelp	기타
10207	these days	요즈음	\N	\N	\N	gtelp	기타
10210	at least	최소한	\N	\N	\N	gtelp	기타
10216	product	제품	\N	\N	\N	gtelp	하
10219	this way	이런 식으로	\N	\N	\N	gtelp	기타
10222	modern	현대의	\N	\N	\N	gtelp	하
10225	identify	확인하다	\N	\N	\N	gtelp	하
10228	silent	조용한	\N	\N	\N	gtelp	하
10231	movement	움직임 동작	\N	\N	\N	gtelp	하
10234	hook	갈고리처럼 구부리다	\N	\N	\N	gtelp	하
10237	honeymoon	신혼여행	\N	\N	\N	gtelp	하
10240	proper	적절한	\N	\N	\N	gtelp	하
10243	establish	설립하다	\N	\N	\N	gtelp	하
10246	almost	거의	\N	\N	\N	gtelp	하
10252	graduate	졸업하다	\N	\N	\N	gtelp	하
10255	consider	고려하다	\N	\N	\N	gtelp	하
10258	liar	거짓말쟁이	\N	\N	\N	gtelp	하
10261	victory	승리	\N	\N	\N	gtelp	하
10264	bill	청구서	\N	\N	\N	gtelp	하
10270	curious	호기심 있는 사물을 알고 싶어 하는	\N	\N	\N	gtelp	하
10273	certain	어떤	\N	\N	\N	gtelp	하
10276	exist	존재하다	\N	\N	\N	gtelp	하
10279	used goods	중고품	\N	\N	\N	gtelp	기타
10282	set a goal	목표를 설정하다	\N	\N	\N	gtelp	기타
10285	originally	원래	\N	\N	\N	gtelp	하
10288	enable	가능하게 하다 허락하다	\N	\N	\N	gtelp	하
10291	aspect	외관 관점 용모	\N	\N	\N	gtelp	하
10294	scale	규모	\N	\N	\N	gtelp	하
10460	criminal	범죄자	\N	\N	\N	gtelp	하
10463	bravery	용기 용맹	\N	\N	\N	gtelp	하
10466	pistol	권총	\N	\N	\N	gtelp	하
10469	skill	기술	\N	\N	\N	gtelp	하
10475	word list	단어 목록	\N	\N	\N	gtelp	기타
10478	measure	측정하다	\N	\N	\N	gtelp	하
10481	some	어떤 사람들	\N	\N	\N	gtelp	하
10484	therefore	그래서 그리하여	\N	\N	\N	gtelp	하
10487	width	너비	\N	\N	\N	gtelp	하
10490	international	국제적인	\N	\N	\N	gtelp	하
10493	list	목록	\N	\N	\N	gtelp	하
10499	evidence	증거	\N	\N	\N	gtelp	하
10502	ordinary people	평범한 사람들	\N	\N	\N	gtelp	기타
10505	garlic	마늘	\N	\N	\N	gtelp	하
10508	for instance	예를 들어	\N	\N	\N	gtelp	기타
10514	frighten	겁나게 하다	\N	\N	\N	gtelp	하
10517	various taste	다양한 맛	\N	\N	\N	gtelp	기타
10520	economic value	경제적 가치	\N	\N	\N	gtelp	기타
10523	cafeteria	학교 식당	\N	\N	\N	gtelp	하
10526	personal information	개인 정보	\N	\N	\N	gtelp	기타
10529	be supposed to	할 예정이다	\N	\N	\N	gtelp	기타
10532	gather	모으다	\N	\N	\N	gtelp	하
10535	village	마을	\N	\N	\N	gtelp	하
10538	monster bear	괴물 같은 곰	\N	\N	\N	gtelp	기타
10541	fire	총을 쏘다	\N	\N	\N	gtelp	하
10545	hill	언덕	\N	\N	\N	gtelp	하
10547	through the day	하루 종일	\N	\N	\N	gtelp	기타
10548	stare at	응시하다	\N	\N	\N	gtelp	기타
10549	blank	텅 빈	\N	\N	\N	gtelp	하
10550	condition	상태	\N	\N	\N	gtelp	하
10552	overcome	극복하다	\N	\N	\N	gtelp	하
10553	opening	앞부분	\N	\N	\N	gtelp	하
10554	section	부분	\N	\N	\N	gtelp	하
10555	tend to	하게 하다 이끌다	\N	\N	\N	gtelp	기타
10556	activate	활성화 하다	\N	\N	\N	gtelp	하
10728	relax	편하게 하다	\N	\N	\N	gtelp	\N
10731	comfortable	편안한	\N	\N	\N	gtelp	\N
10734	cheerlead	응원하다	\N	\N	\N	gtelp	\N
10737	get involved with	에 열중하다	\N	\N	\N	gtelp	\N
10740	average	보통의	\N	\N	\N	gtelp	\N
10743	sigh	한숨	\N	\N	\N	gtelp	\N
10746	character	등장인물	\N	\N	\N	gtelp	\N
10749	unavoidable circumstance	불가피한 상황	\N	\N	\N	gtelp	\N
10752	financial problem	재정적인 문제	\N	\N	\N	gtelp	\N
10755	professional beggar	직업적 거지	\N	\N	\N	gtelp	\N
10758	an easy source of money	쉬운 돈 벌이의 원천	\N	\N	\N	gtelp	\N
10761	properly	적절하게	\N	\N	\N	gtelp	\N
10764	unemployment	실직	\N	\N	\N	gtelp	\N
10767	be treated as	로 취급되다	\N	\N	\N	gtelp	\N
10770	family or community support		\N	\N	\N	gtelp	\N
10773	individually	개인적인	\N	\N	\N	gtelp	\N
10776	government action	정부 조치	\N	\N	\N	gtelp	\N
10779	concrete	콘크리트	\N	\N	\N	gtelp	\N
10782	various	다양한	\N	\N	\N	gtelp	\N
10785	cliff	절벽	\N	\N	\N	gtelp	\N
10788	guide	안내하다	\N	\N	\N	gtelp	\N
10791	flash	불 빛을 번쩍 발하다	\N	\N	\N	gtelp	\N
10794	location	위치	\N	\N	\N	gtelp	\N
10797	navigation	항법 항해	\N	\N	\N	gtelp	\N
10800	builder	건축가	\N	\N	\N	gtelp	\N
10803	lay	쌓아 올리다	\N	\N	\N	gtelp	\N
10806	process	진행 과정	\N	\N	\N	gtelp	\N
10809	check	검사하다	\N	\N	\N	gtelp	\N
10812	housework	집안일	\N	\N	\N	gtelp	\N
10815	special kind	특별한 종류	\N	\N	\N	gtelp	\N
10818	look like	처럼 보이다	\N	\N	\N	gtelp	\N
10821	cardboard	판지 마분지	\N	\N	\N	gtelp	\N
10824	cause	이유	\N	\N	\N	gtelp	\N
10827	include	포함하다	\N	\N	\N	gtelp	\N
10830	electricity	전기	\N	\N	\N	gtelp	\N
10833	recycle	재활용하다	\N	\N	\N	gtelp	\N
10836	in the long run	결국	\N	\N	\N	gtelp	\N
10839	break up	해체하다	\N	\N	\N	gtelp	\N
10842	behave n behavior	행동하다	\N	\N	\N	gtelp	\N
10845	terribly	지독하게	\N	\N	\N	gtelp	\N
10848	conduct	행동 행위	\N	\N	\N	gtelp	\N
10851	grocery	식료품	\N	\N	\N	gtelp	\N
10854	next to	옆에	\N	\N	\N	gtelp	\N
10857	completely	완전히	\N	\N	\N	gtelp	\N
10860	get in	타다	\N	\N	\N	gtelp	\N
10863	front seat	앞좌석	\N	\N	\N	gtelp	\N
10866	cardboard	마분지	\N	\N	\N	gtelp	\N
10869	subject	주제	\N	\N	\N	gtelp	\N
10872	match	맞추다 조화시키다	\N	\N	\N	gtelp	\N
10875	absurd	부조리한 엉터리없는	\N	\N	\N	gtelp	\N
10878	activity	행동	\N	\N	\N	gtelp	\N
10881	in just one night	하룻밤에	\N	\N	\N	gtelp	\N
10884	exist	존재하다	\N	\N	\N	gtelp	\N
10887	at least	최소한 적어도	\N	\N	\N	gtelp	\N
10890	suit	정장 한 벌	\N	\N	\N	gtelp	\N
10893	unfortunately	불행히도	\N	\N	\N	gtelp	\N
10896	every timewhen	할 때마다	\N	\N	\N	gtelp	\N
10899	pale	창백한	\N	\N	\N	gtelp	\N
10902	desirable	바람직한 호감이 가는	\N	\N	\N	gtelp	\N
10905	lead to	결과를 가져오다	\N	\N	\N	gtelp	\N
10908	lotion	로션	\N	\N	\N	gtelp	\N
10911	product	제품	\N	\N	\N	gtelp	\N
10914	temperature	기온	\N	\N	\N	gtelp	\N
10917	in a short time	짧은 시간에	\N	\N	\N	gtelp	\N
10920	spouse	배우자	\N	\N	\N	gtelp	\N
10923	formal	정식의 형식적인	\N	\N	\N	gtelp	\N
10926	couples	부부	\N	\N	\N	gtelp	\N
10560	flight instructor	비행교관	\N	\N	\N	gtelp	기타
10563	calm	침착한 차분한	\N	\N	\N	gtelp	하
10566	characteristic	성향 성격	\N	\N	\N	gtelp	하
10569	cloud	구름	\N	\N	\N	gtelp	하
10572	fix	고쳐주다	\N	\N	\N	gtelp	하
10575	collect	수집하다	\N	\N	\N	gtelp	하
10581	solar	태양의	\N	\N	\N	gtelp	하
10584	planet	행성	\N	\N	\N	gtelp	하
10587	at the front	앞쪽의	\N	\N	\N	gtelp	기타
10590	structure	구조	\N	\N	\N	gtelp	하
10593	wake up	잠에서 깨다	\N	\N	\N	gtelp	기타
10596	recommend	추천하다	\N	\N	\N	gtelp	하
10599	chemicals	화학물질	\N	\N	\N	gtelp	하
10602	relieve	제거하다 줄이다	\N	\N	\N	gtelp	하
10605	sleepy	졸리는	\N	\N	\N	gtelp	하
10608	add	덧붙여 말하다	\N	\N	\N	gtelp	하
10614	in other words	다시 말해서	\N	\N	\N	gtelp	기타
10617	earn	벌다	\N	\N	\N	gtelp	하
10620	different parts	다른 지역	\N	\N	\N	gtelp	기타
10623	get a stomachache	배가 아프다	\N	\N	\N	gtelp	기타
10626	skin of an ill	아픈 사람의 피부	\N	\N	\N	gtelp	기타
10632	get out	석방하다 나가다	\N	\N	\N	gtelp	기타
10635	diameter	지름	\N	\N	\N	gtelp	하
10638	spread	퍼지다	\N	\N	\N	gtelp	하
10641	survive	살다 생존하다	\N	\N	\N	gtelp	하
10644	attach	에 붙다	\N	\N	\N	gtelp	하
10647	sharp increase	급격한 증가	\N	\N	\N	gtelp	기타
10650	fast rise	빠른 상승세	\N	\N	\N	gtelp	기타
10653	forest fire	산불	\N	\N	\N	gtelp	기타
10656	whenever	할 때마다	\N	\N	\N	gtelp	하
10659	be allowed to	하기를 허락 하다	\N	\N	\N	gtelp	기타
10662	limited fire	제한된 화재	\N	\N	\N	gtelp	기타
10668	communicate	의사소통하다	\N	\N	\N	gtelp	하
10671	run into	뛰어들다	\N	\N	\N	gtelp	기타
10674	point	핵심	\N	\N	\N	gtelp	하
10677	block association	반상회	\N	\N	\N	gtelp	기타
10680	activity	활동	\N	\N	\N	gtelp	하
10683	cleanup day	대청소	\N	\N	\N	gtelp	기타
10686	crime	범죄	\N	\N	\N	gtelp	하
10689	time	시간을 재다	\N	\N	\N	gtelp	하
10692	bean	콩	\N	\N	\N	gtelp	하
10698	temperature	기온	\N	\N	\N	gtelp	하
10701	blast	폭발 센 바람	\N	\N	\N	gtelp	하
10704	shed tears	눈물을 흘리다	\N	\N	\N	gtelp	기타
10707	fly by	날아가다	\N	\N	\N	gtelp	기타
10710	fire fighter	소방관	\N	\N	\N	gtelp	기타
10713	urgent	급한	\N	\N	\N	gtelp	하
10719	robbery	도난사건	\N	\N	\N	gtelp	하
10722	unwrap	포장을 풀다	\N	\N	\N	gtelp	하
10558	experience	경험	\N	\N	\N	gtelp	\N
10561	fighter jet	전투기	\N	\N	\N	gtelp	\N
10564	positive	긍정적인	\N	\N	\N	gtelp	\N
10567	panic	공포	\N	\N	\N	gtelp	\N
10570	instructor	교관	\N	\N	\N	gtelp	\N
10573	instructions	지시사항	\N	\N	\N	gtelp	\N
10576	confidence	자신감	\N	\N	\N	gtelp	\N
10579	microwave	전자레인지	\N	\N	\N	gtelp	\N
10582	panel	판	\N	\N	\N	gtelp	\N
10585	collect	수집하다	\N	\N	\N	gtelp	\N
10588	signal	신호	\N	\N	\N	gtelp	\N
10591	hold	잡다	\N	\N	\N	gtelp	\N
10594	harmful	해로운	\N	\N	\N	gtelp	\N
10597	point to	지적하다	\N	\N	\N	gtelp	\N
10600	contain	포함하다	\N	\N	\N	gtelp	\N
10603	headache	두통	\N	\N	\N	gtelp	\N
10606	stimulate	자극하다	\N	\N	\N	gtelp	\N
10609	compare A to B A B	를 에 비유하다	\N	\N	\N	gtelp	\N
10612	option	선택상항	\N	\N	\N	gtelp	\N
10615	theater	극장	\N	\N	\N	gtelp	\N
10618	personality	성격	\N	\N	\N	gtelp	\N
10621	different cultures	다른 문화	\N	\N	\N	gtelp	\N
10624	jealous	질투나는	\N	\N	\N	gtelp	\N
10627	with jealousy	질투가 나서	\N	\N	\N	gtelp	\N
10630	develop	익히다	\N	\N	\N	gtelp	\N
10633	join	들어가다	\N	\N	\N	gtelp	\N
10636	seed	씨앗	\N	\N	\N	gtelp	\N
10639	lack	부족하다	\N	\N	\N	gtelp	\N
10645	suck	빨아 먹다	\N	\N	\N	gtelp	하
10651	peak	최고	\N	\N	\N	gtelp	하
10654	disaster	재앙	\N	\N	\N	gtelp	하
10657	forest keeper	산림 감시원	\N	\N	\N	gtelp	기타
10660	Forest Service	산림청	\N	\N	\N	gtelp	기타
10663	make room	공간을 만들다	\N	\N	\N	gtelp	기타
10666	acre	넓이의 단위	\N	\N	\N	gtelp	하
10669	factual message	사실적 메시지	\N	\N	\N	gtelp	기타
10672	my gosh	맙소사	\N	\N	\N	gtelp	기타
10678	organization	조직	\N	\N	\N	gtelp	하
10681	common	평범한	\N	\N	\N	gtelp	하
10684	association	모임	\N	\N	\N	gtelp	하
10687	take a chance	기회를 잡다	\N	\N	\N	gtelp	기타
10693	rename	새로운 이름을 짓다	\N	\N	\N	gtelp	하
10696	chicken wings	닭 날개	\N	\N	\N	gtelp	기타
10699	rise	오르다	\N	\N	\N	gtelp	하
10702	sound of exploding glass	유리 폭발 소리	\N	\N	\N	gtelp	기타
10705	breathe	호흡하다	\N	\N	\N	gtelp	하
10708	fire truck	소방차	\N	\N	\N	gtelp	기타
10711	attach	붙이다	\N	\N	\N	gtelp	하
10714	be hold	개최되다	\N	\N	\N	gtelp	기타
10717	on display	전시 중에 있는	\N	\N	\N	gtelp	기타
10723	buried	묻혀있는	\N	\N	\N	gtelp	하
10726	lemon scent	레몬 향	\N	\N	\N	gtelp	기타
10729	patient	환자	\N	\N	\N	gtelp	하
10732	remind	떠오르게 하다	\N	\N	\N	gtelp	하
10735	outgoing	사교적인	\N	\N	\N	gtelp	하
10738	perfect body	완벽한 신체	\N	\N	\N	gtelp	기타
10741	class president	학급 반장	\N	\N	\N	gtelp	기타
10744	escape	탈출하다 도피하다	\N	\N	\N	gtelp	하
10747	script	대본	\N	\N	\N	gtelp	하
10750	beg for	구걸하다	\N	\N	\N	gtelp	기타
10756	in real need	정말로 궁핍한	\N	\N	\N	gtelp	기타
10759	in itself	그 자체인	\N	\N	\N	gtelp	기타
10762	be applied to	에 적용시키다	\N	\N	\N	gtelp	기타
10765	miserable	비참한	\N	\N	\N	gtelp	하
10771		가족 지역 사회의 지원	\N	\N	\N	gtelp	기타
10774	individual giving	개인적 도움	\N	\N	\N	gtelp	기타
10777	be made from	으로 만들어지다	\N	\N	\N	gtelp	기타
10780	steel	강철	\N	\N	\N	gtelp	하
10783	shape	모양	\N	\N	\N	gtelp	하
10786	century	세기 년	\N	\N	\N	gtelp	하
10789	area	지역	\N	\N	\N	gtelp	하
10795	be equipped with	을 장착하다 설비를 갖추다	\N	\N	\N	gtelp	기타
10798	equipment	장비 설비	\N	\N	\N	gtelp	하
10801	admire	존경하다	\N	\N	\N	gtelp	하
10804	foundation	기초 토대	\N	\N	\N	gtelp	하
10807	roof	지붕	\N	\N	\N	gtelp	하
10810	progress	경과 추이	\N	\N	\N	gtelp	하
10813	immediately	즉시	\N	\N	\N	gtelp	하
10819	typical	전형적인	\N	\N	\N	gtelp	하
10822	one of	중에 하나	\N	\N	\N	gtelp	기타
10825	traffic accident	교통사고	\N	\N	\N	gtelp	기타
10828	solar panel	태양 전지판	\N	\N	\N	gtelp	기타
10831	collect	모으다	\N	\N	\N	gtelp	하
10834	waste	쓰레기	\N	\N	\N	gtelp	하
10840	agree with	동의하다	\N	\N	\N	gtelp	기타
10843	acceptable	수용할 수 있는 받아들일 수 있는	\N	\N	\N	gtelp	하
10846	be criticized for	에 대해 비난받다	\N	\N	\N	gtelp	기타
10849	such	그런	\N	\N	\N	gtelp	하
10852	back seat	뒤 좌석	\N	\N	\N	gtelp	기타
10855	parking lot	주차장	\N	\N	\N	gtelp	기타
10858	alone	혼자	\N	\N	\N	gtelp	하
10864	like	처럼	\N	\N	\N	gtelp	하
10867	investment	투자	\N	\N	\N	gtelp	하
10870	develop	발달시키다	\N	\N	\N	gtelp	하
10873	sort	분류하다	\N	\N	\N	gtelp	하
10876	first of all	우선 무엇보다도	\N	\N	\N	gtelp	기타
10879	rule	규칙	\N	\N	\N	gtelp	하
10885	chimney	굴뚝	\N	\N	\N	gtelp	하
10888	mall	대형 상가	\N	\N	\N	gtelp	하
10891	many of	대부분	\N	\N	\N	gtelp	기타
10894	make money	돈을 벌다	\N	\N	\N	gtelp	기타
10897	try	시도하다	\N	\N	\N	gtelp	하
10900	skin	피부	\N	\N	\N	gtelp	하
10903	tan	햇볕에 태우다	\N	\N	\N	gtelp	하
10906	invention	발명	\N	\N	\N	gtelp	하
10912	lie down	눕다	\N	\N	\N	gtelp	기타
10915	expect	기대하다	\N	\N	\N	gtelp	하
10918	be careful	조심하다	\N	\N	\N	gtelp	기타
10921	in the world	비교급 강조 도대체	\N	\N	\N	gtelp	기타
10924	weather forecast	일기예보	\N	\N	\N	gtelp	기타
10927	that day	그 날	\N	\N	\N	gtelp	기타
10930	relate	관련시키다	\N	\N	\N	gtelp	하
10565	negative	부정적인	\N	\N	\N	gtelp	하
10568	dangerous situation	위험한 상황	\N	\N	\N	gtelp	기타
10571	control	통제하다	\N	\N	\N	gtelp	하
10574	correct	수정하다 고치다	\N	\N	\N	gtelp	하
10577	Mars	화성	\N	\N	\N	gtelp	하
10580	wheel	바퀴	\N	\N	\N	gtelp	하
10586	visual data	시각자료	\N	\N	\N	gtelp	기타
10589	handlike	손과 같은	\N	\N	\N	gtelp	기타
10592	various	다양한	\N	\N	\N	gtelp	하
10595	dietician	영양사	\N	\N	\N	gtelp	하
10598	scientific evidence	과학적 증거	\N	\N	\N	gtelp	기타
10601	blood circulation	혈액순환	\N	\N	\N	gtelp	기타
10607	ahead of a day	하루 시작 전	\N	\N	\N	gtelp	기타
10610	choosing a career	직업 선택	\N	\N	\N	gtelp	기타
10613	romantic person	낭만적인 사람	\N	\N	\N	gtelp	기타
10616	suit	적합하다	\N	\N	\N	gtelp	하
10619	profession	직업 분야	\N	\N	\N	gtelp	하
10622	be surprised at	에 놀라다	\N	\N	\N	gtelp	기타
10628	by carrying bags	가방을 날라주며	\N	\N	\N	gtelp	기타
10631	pitching skills	던지기 기술	\N	\N	\N	gtelp	기타
10634	the Baseball Hall of Fame	야구 명예의 전당	\N	\N	\N	gtelp	기타
10637	carry	운반하다	\N	\N	\N	gtelp	하
10640	structure	구조	\N	\N	\N	gtelp	하
10643	leave	나뭇잎	\N	\N	\N	gtelp	하
10646	weigh	무게가 나가다	\N	\N	\N	gtelp	하
10649	lowest number	가장 낮은 수	\N	\N	\N	gtelp	기타
10652	fall continuously	계속 떨어지다	\N	\N	\N	gtelp	기타
10655	in the past	과거에	\N	\N	\N	gtelp	기타
10661	chief of the Forest Service	산림청장	\N	\N	\N	gtelp	기타
10664	diseased trees	죽은 나무	\N	\N	\N	gtelp	기타
10667	passive listener	수동적 청취자	\N	\N	\N	gtelp	기타
10670	miss	놓치다	\N	\N	\N	gtelp	하
10673	assume	가정하다	\N	\N	\N	gtelp	하
10679	ordinary citizen	일반시민	\N	\N	\N	gtelp	기타
10682	tree and flower planting	나무 꽃 심기	\N	\N	\N	gtelp	기타
10685	neighborhood	이웃	\N	\N	\N	gtelp	하
10688	be in a hurry	서두르다	\N	\N	\N	gtelp	기타
10691	nervous	불안한	\N	\N	\N	gtelp	하
10694	funny	재미있는	\N	\N	\N	gtelp	하
10697	get out	나가다	\N	\N	\N	gtelp	기타
10700	stair	계단	\N	\N	\N	gtelp	하
10706	ash	재	\N	\N	\N	gtelp	하
10709	siren	사이렌	\N	\N	\N	gtelp	하
10712	lightning	번개	\N	\N	\N	gtelp	하
10715	United Kingdom	영국	\N	\N	\N	gtelp	기타
10718	investigate	조사하다	\N	\N	\N	gtelp	하
10721	wrap	포장하다	\N	\N	\N	gtelp	하
10724	recognize	인식하다	\N	\N	\N	gtelp	하
10730	customer	고객	\N	\N	\N	gtelp	하
10733	pretend	인 척하다	\N	\N	\N	gtelp	하
10736	shy	수줍은	\N	\N	\N	gtelp	하
10739	perfect grade	완벽한 성적	\N	\N	\N	gtelp	기타
10742	personality	성격	\N	\N	\N	gtelp	하
10745	occur to	에 생각나다	\N	\N	\N	gtelp	기타
10748	determine	결정하다	\N	\N	\N	gtelp	하
10751	face up to	극복하다	\N	\N	\N	gtelp	기타
10757	sentiment	감정	\N	\N	\N	gtelp	하
10760	negative	부정적인	\N	\N	\N	gtelp	하
10763	penniless	돈 없는	\N	\N	\N	gtelp	중
10766	family background	가정환경	\N	\N	\N	gtelp	기타
10769	end up	끝나다	\N	\N	\N	gtelp	기타
10772	selfish	이기적인	\N	\N	\N	gtelp	하
10775	charity	자선 단체	\N	\N	\N	gtelp	하
10778	brick	벽돌	\N	\N	\N	gtelp	하
10784	flat	편평한 납작한	\N	\N	\N	gtelp	하
10787	sailor	선원	\N	\N	\N	gtelp	하
10793	figure out	파악하다 이해하다	\N	\N	\N	gtelp	기타
10796	specialized	전문의	\N	\N	\N	gtelp	하
10799	not any more	더 이상 않다	\N	\N	\N	gtelp	기타
10802	orderly	순서 바른	\N	\N	\N	gtelp	하
10805	put up	올리다 설치하다	\N	\N	\N	gtelp	기타
10808	floor	마루	\N	\N	\N	gtelp	하
10811	at any time	언제라도	\N	\N	\N	gtelp	기타
10814	accomplish	완성하다 이루다	\N	\N	\N	gtelp	하
10820	stack	쌓아 올리다	\N	\N	\N	gtelp	하
10823	major	주요한	\N	\N	\N	gtelp	하
10826	feature	특징 특색	\N	\N	\N	gtelp	하
10829	generate	발생시키다	\N	\N	\N	gtelp	하
10832	not only A but also B A B	뿐만아니라 도	\N	\N	\N	gtelp	기타
10835	natural resources	천연 자원	\N	\N	\N	gtelp	기타
10838	consider	고려하다	\N	\N	\N	gtelp	하
10844	Year after year	해가 갈수록	\N	\N	\N	gtelp	기타
10847	rude	무례한	\N	\N	\N	gtelp	하
10850	continual	지속적인 계속되는	\N	\N	\N	gtelp	하
10853	sweet	귀여운	\N	\N	\N	gtelp	하
10856	unlocked	잠기지 않은	\N	\N	\N	gtelp	하
10859	leave	남기다	\N	\N	\N	gtelp	하
10862	concern	염려 걱정	\N	\N	\N	gtelp	하
10865	guarantee	보증하다	\N	\N	\N	gtelp	하
10868	shape	모양	\N	\N	\N	gtelp	하
10871	skill T	기술 솜	\N	\N	\N	gtelp	기타
10874	sleigh	썰매	\N	\N	\N	gtelp	하
10880	physics	물리학	\N	\N	\N	gtelp	하
10883	nowadays	요즘	\N	\N	\N	gtelp	하
10886	deliver	배달하다	\N	\N	\N	gtelp	하
10889	despite	에도 불구하고	\N	\N	\N	gtelp	하
10895	in order to	하기 위해서	\N	\N	\N	gtelp	기타
10898	skill	기술 솜씨	\N	\N	\N	gtelp	하
10901	no longer	더 이상 않다	\N	\N	\N	gtelp	기타
10904	desire	욕구 욕망	\N	\N	\N	gtelp	하
10907	spray	스프레이 분무	\N	\N	\N	gtelp	하
10910	vacation	휴가 방학	\N	\N	\N	gtelp	하
10913	gain	얻다 늘리다	\N	\N	\N	gtelp	하
10916	rise	오르다	\N	\N	\N	gtelp	하
10919	quarrel with	와 다투다	\N	\N	\N	gtelp	기타
10922	actually	실제로	\N	\N	\N	gtelp	하
10925	warn	경고하다	\N	\N	\N	gtelp	하
10928	Celsius	섭씨의	\N	\N	\N	gtelp	하
10932	raise	일으키다	\N	\N	\N	gtelp	하
10935	for the first time	처음으로	\N	\N	\N	gtelp	기타
10938	manager	관리자	\N	\N	\N	gtelp	하
10941	such a great	그 런 멋진	\N	\N	\N	gtelp	기타
10944	joy	기쁨	\N	\N	\N	gtelp	하
10947	regretful	후회하는	\N	\N	\N	gtelp	중
10953	allow	허락하다	\N	\N	\N	gtelp	하
10956	bring up	양육하다 기르다	\N	\N	\N	gtelp	기타
10959	toward	에 대하여	\N	\N	\N	gtelp	하
10962	rare	드문 진기한	\N	\N	\N	gtelp	하
10965	unwanted	원치 않는	\N	\N	\N	gtelp	하
10971	constant	끊임없는	\N	\N	\N	gtelp	하
10974	be well known for	을 잘 알려지다	\N	\N	\N	gtelp	기타
10977	disturbing	어지럽히는	\N	\N	\N	gtelp	하
10980	one day	어느 날	\N	\N	\N	gtelp	기타
10983	automatic	자동의 자동적인	\N	\N	\N	gtelp	하
10986	melt	녹이다	\N	\N	\N	gtelp	하
10989	connect	연결하다	\N	\N	\N	gtelp	하
10992	bucket	양동이	\N	\N	\N	gtelp	하
10995	position	위치 자리	\N	\N	\N	gtelp	하
10998	print	인쇄 출판물	\N	\N	\N	gtelp	하
11001	profit	이익 수익	\N	\N	\N	gtelp	하
11007	comment	견해 의견	\N	\N	\N	gtelp	하
11010	lead A toR A R	에게 할 마음이 생기게 하다	\N	\N	\N	gtelp	기타
11013	unexamined	검사하지 않은	\N	\N	\N	gtelp	중
11016	gain	얻다 획득하다	\N	\N	\N	gtelp	하
11019	curiosity	호기심	\N	\N	\N	gtelp	하
11022	improve	향상시키다	\N	\N	\N	gtelp	하
11028	uncomfortable	불편한	\N	\N	\N	gtelp	하
11031	not only A but also B		\N	\N	\N	gtelp	기타
11034	attractive	매력적인	\N	\N	\N	gtelp	하
11037	blister	물집	\N	\N	\N	gtelp	하
11040	hammertoe	갈고리 모양의 기형적인 발가락	\N	\N	\N	gtelp	기타
11043	light	색이 연한	\N	\N	\N	gtelp	하
11046	unfinished	미완성의	\N	\N	\N	gtelp	하
11049	plain	평원	\N	\N	\N	gtelp	하
11052	protect	보호하다	\N	\N	\N	gtelp	하
11055	revolution	혁명	\N	\N	\N	gtelp	하
11058	earn	획득하다	\N	\N	\N	gtelp	하
11061	popularity	인기	\N	\N	\N	gtelp	하
11067	least little	의 최상급	\N	\N	\N	gtelp	기타
11070	previous	이전의	\N	\N	\N	gtelp	하
11073	increase	증가하다	\N	\N	\N	gtelp	하
11076	gym	체육관 체육	\N	\N	\N	gtelp	하
11079	though	그러나	\N	\N	\N	gtelp	하
11082	limit	제한하다	\N	\N	\N	gtelp	하
11088	avoid	피하다	\N	\N	\N	gtelp	하
11091	economics	경제학	\N	\N	\N	gtelp	하
11094	prediction	예측	\N	\N	\N	gtelp	하
11097	even	비교급 훨씬 더욱	\N	\N	\N	gtelp	하
11100	reality	현실	\N	\N	\N	gtelp	하
11103	as a result	결과적으로	\N	\N	\N	gtelp	기타
11106	yet	그러나	\N	\N	\N	gtelp	하
11109	a variety of	다양한	\N	\N	\N	gtelp	기타
11112	yearly	년의	\N	\N	\N	gtelp	하
11118	mostly	대개	\N	\N	\N	gtelp	하
11121	rate	비율	\N	\N	\N	gtelp	하
11124	play a part	역할을 하다	\N	\N	\N	gtelp	기타
11130	three times a week	일주일에 번	\N	\N	\N	gtelp	기타
11133	improve	개선하다 향상시키다	\N	\N	\N	gtelp	하
11136	decision	결정	\N	\N	\N	gtelp	하
11139	even if	비록 일지라도	\N	\N	\N	gtelp	기타
11142	much	비교급 훨씬	\N	\N	\N	gtelp	하
11145	handle	취급하다	\N	\N	\N	gtelp	하
11148	record	기록	\N	\N	\N	gtelp	하
11151	statement	명세서	\N	\N	\N	gtelp	하
11157	spirit	마음 정신	\N	\N	\N	gtelp	하
11160	approach	접근하다 다가서다	\N	\N	\N	gtelp	하
11163	pause	잠시 쉬다	\N	\N	\N	gtelp	하
11166	gradually	점차로 점진적으로	\N	\N	\N	gtelp	하
11169	sign	징조 표시	\N	\N	\N	gtelp	하
11172	surface	표면	\N	\N	\N	gtelp	하
11178	clap	손뼉을 치다	\N	\N	\N	gtelp	하
11181	consider	라고 여기다	\N	\N	\N	gtelp	하
11184	ability	능력	\N	\N	\N	gtelp	하
11187	by ing ing	하므로	\N	\N	\N	gtelp	기타
11190	actually	실제로	\N	\N	\N	gtelp	하
11193	creative	창조적인	\N	\N	\N	gtelp	하
11199	others	다른 사람들	\N	\N	\N	gtelp	하
11202	prefer	을 더 좋아하다	\N	\N	\N	gtelp	하
11205	adventurous	모험을 좋아하는 대담한	\N	\N	\N	gtelp	하
11208	view A as B A B	를 로 여기다	\N	\N	\N	gtelp	기타
11211	theory	이론	\N	\N	\N	gtelp	하
11214	talent	재주	\N	\N	\N	gtelp	하
11217	fate	운명	\N	\N	\N	gtelp	하
11223	circumstances	상황	\N	\N	\N	gtelp	하
11226	well known	잘 알려진	\N	\N	\N	gtelp	기타
11229	audience	청중	\N	\N	\N	gtelp	하
11232	suspense	긴장 불안	\N	\N	\N	gtelp	하
11235	afterward	후에 나중에	\N	\N	\N	gtelp	하
11238	situation	상황	\N	\N	\N	gtelp	하
11244	crack	찰싹 때리다	\N	\N	\N	gtelp	하
11247	modern	현대의	\N	\N	\N	gtelp	하
11250	unnecessarily	필요 없이	\N	\N	\N	gtelp	하
11253	passenger	승객	\N	\N	\N	gtelp	하
11256	control	통제하다	\N	\N	\N	gtelp	하
11259	random	무작위의	\N	\N	\N	gtelp	하
11262	at any time	언제라도	\N	\N	\N	gtelp	기타
11268	of no use	쓸모없는 무익한	\N	\N	\N	gtelp	기타
11271	figure	숫자 합계	\N	\N	\N	gtelp	하
11274	accompanying	동시에 시행되는	\N	\N	\N	gtelp	하
11277	regularly	규칙적으로	\N	\N	\N	gtelp	하
11280	store	저장하다	\N	\N	\N	gtelp	하
11283	nowadays	요즘	\N	\N	\N	gtelp	하
11286	alone	혼자서	\N	\N	\N	gtelp	하
11289	shore	해안	\N	\N	\N	gtelp	하
11295	connection	관련	\N	\N	\N	gtelp	하
11298	describe	묘사하다	\N	\N	\N	gtelp	하
11301	annoying	성가신	\N	\N	\N	gtelp	하
11304	educator	교육자	\N	\N	\N	gtelp	하
10934	pray	기도하다	\N	\N	\N	gtelp	하
10937	position	직책	\N	\N	\N	gtelp	하
10940	amazed	깜짝 놀란	\N	\N	\N	gtelp	하
10943	hang up	전화를 끊다	\N	\N	\N	gtelp	기타
10949	disappointed	실망한	\N	\N	\N	gtelp	하
10952	be supposed toR R	할 예정이다	\N	\N	\N	gtelp	기타
10955	bend	악용하다 구부리다	\N	\N	\N	gtelp	하
10958	generous	관대한	\N	\N	\N	gtelp	하
10961	silence	침묵	\N	\N	\N	gtelp	하
10964	suffer from	로 부터 고통 받다	\N	\N	\N	gtelp	기타
10967	sunrise	해돋이 일출	\N	\N	\N	gtelp	하
10970	sauce	소스 양념	\N	\N	\N	gtelp	하
10976	comfort	안락하게 하다	\N	\N	\N	gtelp	하
10979	anywhere	어느 곳에서나	\N	\N	\N	gtelp	하
10982	dont have to	할 필요가 없다	\N	\N	\N	gtelp	기타
10985	heat	열	\N	\N	\N	gtelp	하
10988	weight	무게	\N	\N	\N	gtelp	하
10991	tray	칸막이 한 작은 상자 쟁반	\N	\N	\N	gtelp	하
10994	original	최초의 본래의	\N	\N	\N	gtelp	하
10997	get	얻다	\N	\N	\N	gtelp	하
11003	create	만들다	\N	\N	\N	gtelp	하
11006	deliver	배달하다 전하다	\N	\N	\N	gtelp	하
11009	examine	검사조사하다 고찰하다	\N	\N	\N	gtelp	하
11012	otherwise	그렇지 않으면	\N	\N	\N	gtelp	하
11015	in ing ing	할 때	\N	\N	\N	gtelp	기타
11018	develop	발전시키다	\N	\N	\N	gtelp	하
11021	interest	관심 흥미	\N	\N	\N	gtelp	하
11024	invitation	초대	\N	\N	\N	gtelp	하
11030	stylish	현대식의 유행의	\N	\N	\N	gtelp	하
11033	slim	늘씬한	\N	\N	\N	gtelp	하
11036	cause	의 원인이 되다	\N	\N	\N	gtelp	하
11039	misstep	실족	\N	\N	\N	gtelp	중
11042	as	로서	\N	\N	\N	gtelp	하
11045	sound like	처럼 들리다 소리 나다	\N	\N	\N	gtelp	기타
11048	herd	떼 무리	\N	\N	\N	gtelp	하
11051	settler	정착민 개척자	\N	\N	\N	gtelp	하
11054	cattle	소	\N	\N	\N	gtelp	하
11057	publish	출판하다	\N	\N	\N	gtelp	하
11063	chart	도표 그림	\N	\N	\N	gtelp	하
11066	in the course of	동안에	\N	\N	\N	gtelp	기타
11069	more thanover	이상	\N	\N	\N	gtelp	기타
11072	steadily	꾸준히	\N	\N	\N	gtelp	하
11078	recent search	최근 연구	\N	\N	\N	gtelp	기타
11081	encourage	장려하다 권하다	\N	\N	\N	gtelp	하
11084	opportunity	기회	\N	\N	\N	gtelp	하
11087	dizziness	현기증	\N	\N	\N	gtelp	하
11090	labor union	노동조합	\N	\N	\N	gtelp	기타
11093	rise to fame	명성을 얻다	\N	\N	\N	gtelp	기타
11096	in the past	과거에	\N	\N	\N	gtelp	기타
11102	rather	차라리 오히려 어느 쪽인가 하면	\N	\N	\N	gtelp	하
11105	few	거의 없는	\N	\N	\N	gtelp	하
11108	despite	에도 불구하고	\N	\N	\N	gtelp	하
11111	average	평균의	\N	\N	\N	gtelp	하
11114	with	때문에	\N	\N	\N	gtelp	하
11117	nap	선잠 잠시 졸기 낮잠	\N	\N	\N	gtelp	하
11120	generally	일반적으로	\N	\N	\N	gtelp	하
11126	risk	위험	\N	\N	\N	gtelp	하
11129	take part in	에 참여하다	\N	\N	\N	gtelp	기타
11132	those who	하는 사람들	\N	\N	\N	gtelp	기타
11135	check	수표	\N	\N	\N	gtelp	하
11138	task	일 과업 업무	\N	\N	\N	gtelp	하
11141	experience	경험	\N	\N	\N	gtelp	하
11144	unlike	와는 다르게	\N	\N	\N	gtelp	하
11147	receipt	영수증	\N	\N	\N	gtelp	하
11150	look back at	을 다시 보다	\N	\N	\N	gtelp	기타
11153	weak	몸이 약한 허약한	\N	\N	\N	gtelp	하
11159	footstep	발소리 걸음걸이	\N	\N	\N	gtelp	중
11162	reach	도착하다	\N	\N	\N	gtelp	하
11165	presence	존재 있음	\N	\N	\N	gtelp	하
11168	perform trick	재주를 부리다	\N	\N	\N	gtelp	기타
11171	perhaps	아마	\N	\N	\N	gtelp	하
11174	ring	종을울리다	\N	\N	\N	gtelp	하
11180	behavior	행동	\N	\N	\N	gtelp	하
11183	intelligence	지능	\N	\N	\N	gtelp	하
11186	solve	해결하다	\N	\N	\N	gtelp	하
11189	collection	수집 수집물	\N	\N	\N	gtelp	하
11192	be likely toR R	할 것 같다	\N	\N	\N	gtelp	기타
11195	those who	하는 사람들	\N	\N	\N	gtelp	기타
11198	trust	믿다 신용하다	\N	\N	\N	gtelp	하
11201	practical	현실적인	\N	\N	\N	gtelp	하
11204	active	활동적인	\N	\N	\N	gtelp	하
11210	taste	기호 취향	\N	\N	\N	gtelp	하
11213	personality	성격	\N	\N	\N	gtelp	하
11216	worst bad	의 최상급	\N	\N	\N	gtelp	기타
11219	go out	불이 꺼지다	\N	\N	\N	gtelp	기타
11222	protection	보호	\N	\N	\N	gtelp	하
11225	calmly	침착하게	\N	\N	\N	gtelp	하
11228	rest	나머지	\N	\N	\N	gtelp	하
11231	highlight	강조하다	\N	\N	\N	gtelp	하
11234	treat	다루다	\N	\N	\N	gtelp	하
11237	fear	두려움	\N	\N	\N	gtelp	하
11240	point out	지적하다	\N	\N	\N	gtelp	기타
11246	headache	두통 골칫거리	\N	\N	\N	gtelp	하
11249	seriously	심각하게 진지하게	\N	\N	\N	gtelp	하
11252	innocent	죄 없는	\N	\N	\N	gtelp	하
11255	unable	할 수 없는	\N	\N	\N	gtelp	하
11258	carry out	시행하다	\N	\N	\N	gtelp	기타
11261	realize	깨닫다	\N	\N	\N	gtelp	하
11264	sharply	급격하게	\N	\N	\N	gtelp	하
11270	fall	감소	\N	\N	\N	gtelp	하
11273	effect	효과	\N	\N	\N	gtelp	하
11276	campaign	캠페인 조직적인 운동	\N	\N	\N	gtelp	하
11279	basically	기본적으로	\N	\N	\N	gtelp	하
11282	income	소득	\N	\N	\N	gtelp	하
11285	remain	남다	\N	\N	\N	gtelp	하
11288	shallow	얕은	\N	\N	\N	gtelp	하
11291	forget	잊다	\N	\N	\N	gtelp	하
11294	retirement	퇴직	\N	\N	\N	gtelp	하
11297	accept	받아들이다	\N	\N	\N	gtelp	하
11300	playfully	장난스럽게	\N	\N	\N	gtelp	하
10942	opportunity	기회	\N	\N	\N	gtelp	하
10945	beat throb	심장맥박 따위가 뛰다	\N	\N	\N	gtelp	기타
10948	indifferent	무관심한	\N	\N	\N	gtelp	하
10951	get old	나이를 먹다	\N	\N	\N	gtelp	기타
10954	strict	엄격한 엄한	\N	\N	\N	gtelp	하
10957	properly	올바르게 제대로	\N	\N	\N	gtelp	하
10960	modern society	현대 사회	\N	\N	\N	gtelp	기타
10966	noise	소음	\N	\N	\N	gtelp	하
10969	sunset	해질 녘 일몰	\N	\N	\N	gtelp	하
10972	sauce	양념	\N	\N	\N	gtelp	하
10975	noisiness	소음	\N	\N	\N	gtelp	기타
10978	effect	효과 영향	\N	\N	\N	gtelp	하
10981	above	위	\N	\N	\N	gtelp	하
10984	invention	발명 발명품	\N	\N	\N	gtelp	하
10990	take a shower	샤워하다	\N	\N	\N	gtelp	기타
10993	so That will	하기 위하여	\N	\N	\N	gtelp	기타
10996	recent	최근	\N	\N	\N	gtelp	하
10999	organization	조직체 단체	\N	\N	\N	gtelp	하
11002	decrease	감소하다	\N	\N	\N	gtelp	하
11008	shape	구체화하다	\N	\N	\N	gtelp	하
11011	issue	논쟁점 문제	\N	\N	\N	gtelp	하
11014	take notes	필기하다	\N	\N	\N	gtelp	기타
11017	besides	게다가 더욱이	\N	\N	\N	gtelp	하
11020	relationship	관계	\N	\N	\N	gtelp	하
11023	huge	거대한	\N	\N	\N	gtelp	하
11026	when it comes to	에 관해서	\N	\N	\N	gtelp	기타
11032	look taller	더 크게 보이다	\N	\N	\N	gtelp	기타
11035	effect	영향 효과	\N	\N	\N	gtelp	하
11038	painful	고통스런	\N	\N	\N	gtelp	하
11041	describe	묘사하다 설명하다	\N	\N	\N	gtelp	하
11044	front	앞	\N	\N	\N	gtelp	하
11047	stripe	줄무늬	\N	\N	\N	gtelp	하
11050	extinction	멸종	\N	\N	\N	gtelp	하
11053	grazing land	목초지	\N	\N	\N	gtelp	기타
11056	flee	달아나다 도망치다	\N	\N	\N	gtelp	하
11062	above	위에 위쪽에	\N	\N	\N	gtelp	하
11065	occur	일어나다 발생하다	\N	\N	\N	gtelp	하
11068	those who	하는 사람들	\N	\N	\N	gtelp	기타
11071	one fifth	분의	\N	\N	\N	gtelp	기타
11074	anyone who	하는 사람은 누구나	\N	\N	\N	gtelp	기타
11077	according to	에 따르면	\N	\N	\N	gtelp	기타
11080	researcher	연구가	\N	\N	\N	gtelp	하
11083	amount	양	\N	\N	\N	gtelp	하
11086	such as	와 같은	\N	\N	\N	gtelp	기타
11092	profession	직업	\N	\N	\N	gtelp	하
11095	predict	예언하다	\N	\N	\N	gtelp	하
11098	endless	끝이 없는	\N	\N	\N	gtelp	하
11101	island	섬	\N	\N	\N	gtelp	하
11104	southern	남쪽의	\N	\N	\N	gtelp	하
11110	landscape	경치 풍경	\N	\N	\N	gtelp	하
11113	around	약 대략	\N	\N	\N	gtelp	하
11116	tropical rain forest	열대우림	\N	\N	\N	gtelp	기타
11119	common	흔한	\N	\N	\N	gtelp	하
11122	disease	질병	\N	\N	\N	gtelp	하
11125	reduce	줄이다	\N	\N	\N	gtelp	하
11128	healthy	건강한	\N	\N	\N	gtelp	하
11131	death	죽음	\N	\N	\N	gtelp	하
11134	cash	현금	\N	\N	\N	gtelp	하
11137	rent	빌리다	\N	\N	\N	gtelp	하
11143	process	과정	\N	\N	\N	gtelp	하
11146	document	서류	\N	\N	\N	gtelp	하
11149	company	회사	\N	\N	\N	gtelp	하
11152	still	움직임 없는 고요한	\N	\N	\N	gtelp	하
11155	shake	흔들다 떨다	\N	\N	\N	gtelp	하
11158	all of sudden	갑자기	\N	\N	\N	gtelp	기타
11161	along	을 따라서	\N	\N	\N	gtelp	하
11164	sense	알아채다 느껴 알다	\N	\N	\N	gtelp	하
11170	be capable of	할 수 있다	\N	\N	\N	gtelp	기타
11173	look for	을 찾다	\N	\N	\N	gtelp	기타
11176	do tricks	재주를 부리다	\N	\N	\N	gtelp	기타
11179	seal	물개	\N	\N	\N	gtelp	하
11182	trick	재주 곡예 책략	\N	\N	\N	gtelp	하
11188	previous	이전의 앞선	\N	\N	\N	gtelp	하
11191	quite a lot	많은	\N	\N	\N	gtelp	기타
11194	on the other hand	반면에	\N	\N	\N	gtelp	기타
11197	tend toR R	하는 경향이 있다	\N	\N	\N	gtelp	기타
11200	hardworking	열심히 일하는	\N	\N	\N	gtelp	하
11203	physically	신체적으로	\N	\N	\N	gtelp	하
11206	athletic	운동경기의 운동선수다운 활발한	\N	\N	\N	gtelp	하
11209	attractive	매력적인	\N	\N	\N	gtelp	하
11212	profession	직업	\N	\N	\N	gtelp	하
11215	performance	공연	\N	\N	\N	gtelp	하
11218	fall upon	에게 일어나다	\N	\N	\N	gtelp	기타
11221	whip	채찍	\N	\N	\N	gtelp	하
11227	act	공연	\N	\N	\N	gtelp	하
11230	cage	우리	\N	\N	\N	gtelp	하
11233	skillfully	능숙하게	\N	\N	\N	gtelp	하
11236	admit	인정하다	\N	\N	\N	gtelp	하
11239	chilling	오싹하게 하는	\N	\N	\N	gtelp	하
11245	drunk driving	음주 운전	\N	\N	\N	gtelp	기타
11248	suffer from	로 고통 받다	\N	\N	\N	gtelp	기타
11251	include	포함하다	\N	\N	\N	gtelp	하
11254	pedestrian	보행자	\N	\N	\N	gtelp	하
11257	vehicle	수송 수단 차량	\N	\N	\N	gtelp	하
11260	breath	호흡 숨	\N	\N	\N	gtelp	하
11266	debate	토론 논쟁	\N	\N	\N	gtelp	하
11269	for some time	얼마동안	\N	\N	\N	gtelp	기타
11272	distinguish	구별하다	\N	\N	\N	gtelp	하
11275	advertising	광고	\N	\N	\N	gtelp	하
11278	record	기록	\N	\N	\N	gtelp	하
11281	display	보여주다	\N	\N	\N	gtelp	하
11284	dolphin	돌고래	\N	\N	\N	gtelp	하
11290	encouragement	격려	\N	\N	\N	gtelp	하
11293	effort	노력	\N	\N	\N	gtelp	하
11296	goat	염소	\N	\N	\N	gtelp	하
11299	consider	여기다	\N	\N	\N	gtelp	하
11305	necessity	필수품	\N	\N	\N	gtelp	하
11308	develop	발달하다	\N	\N	\N	gtelp	하
11311	appear	나타나다	\N	\N	\N	gtelp	하
11314	normal	보통의	\N	\N	\N	gtelp	하
11309	get along with	와 잘 지내다	\N	\N	\N	gtelp	기타
11312	gain	얻다	\N	\N	\N	gtelp	하
11315	go through	겪다	\N	\N	\N	gtelp	기타
11318	throughout	에 걸쳐서	\N	\N	\N	gtelp	하
11321	instead of	대신에	\N	\N	\N	gtelp	기타
11324	researcher	연구자	\N	\N	\N	gtelp	하
11330	hairdressing salon	미용실	\N	\N	\N	gtelp	기타
11333	damage	손상시키다	\N	\N	\N	gtelp	하
11336	repair	수리하다	\N	\N	\N	gtelp	하
11339	reach into	속으로 손을 뻗다	\N	\N	\N	gtelp	기타
11345	represent	나타내다	\N	\N	\N	gtelp	하
11348	bloom	개화하다	\N	\N	\N	gtelp	하
11351	receive	받다	\N	\N	\N	gtelp	하
11354	score	득점하다	\N	\N	\N	gtelp	하
11357	evenly	균등하게	\N	\N	\N	gtelp	하
11360	suggest	시사하다	\N	\N	\N	gtelp	하
11363	dig	파다	\N	\N	\N	gtelp	하
11366	extraordinary	비범한	\N	\N	\N	gtelp	하
11369	cliff	절벽	\N	\N	\N	gtelp	하
11375	get into trouble	어려움에 처하다	\N	\N	\N	gtelp	기타
11378	desire	욕구	\N	\N	\N	gtelp	하
11384	plenty	많음 다수	\N	\N	\N	gtelp	하
11387	dawn	새벽	\N	\N	\N	gtelp	하
11390	academic	학문의 학구적인	\N	\N	\N	gtelp	하
11393	Antarctica the South Pole	남극	\N	\N	\N	gtelp	기타
11396	coast	해변 해안	\N	\N	\N	gtelp	하
11399	pass by	지나가다	\N	\N	\N	gtelp	기타
11402	muscle	근육	\N	\N	\N	gtelp	하
11405	blame	탓하다	\N	\N	\N	gtelp	하
11408	flavor	맛 향	\N	\N	\N	gtelp	하
11411	place an order	주문을 하다	\N	\N	\N	gtelp	기타
11414	actual	실제의	\N	\N	\N	gtelp	하
11417	exchange	교환하다	\N	\N	\N	gtelp	하
11420	feed	먹이다	\N	\N	\N	gtelp	하
11426	uneasy	불안한	\N	\N	\N	gtelp	하
11429	hang hanghunghung	걸다	\N	\N	\N	gtelp	기타
11432	popular	인기 있는	\N	\N	\N	gtelp	하
11435	withinA A	이내에	\N	\N	\N	gtelp	기타
11438	indeed	실제로	\N	\N	\N	gtelp	하
11444	opportunity	기회	\N	\N	\N	gtelp	하
11447	bait	미끼	\N	\N	\N	gtelp	하
11450	endangered	위험에 처한	\N	\N	\N	gtelp	하
11453	predator	약탈자	\N	\N	\N	gtelp	하
11456	stuffed	박제한	\N	\N	\N	gtelp	하
11459	pleasure	기쁨 즐거움	\N	\N	\N	gtelp	하
11465	deal with	처리하다 다루다 취급하다	\N	\N	\N	gtelp	기타
11468	balance	균형	\N	\N	\N	gtelp	하
11471	theory	가설 이론	\N	\N	\N	gtelp	하
11474	beneficial	유익한	\N	\N	\N	gtelp	하
11477	pill	알약	\N	\N	\N	gtelp	하
11480	diarrhea	설사	\N	\N	\N	gtelp	하
11483	ancient	고대의	\N	\N	\N	gtelp	하
11486	date back	거슬러 올라가다	\N	\N	\N	gtelp	기타
11489	spread spreadspread	퍼지다	\N	\N	\N	gtelp	기타
11492	several	몇몇의	\N	\N	\N	gtelp	하
11495	tomb	무덤	\N	\N	\N	gtelp	하
11498	fantastic	환상적인	\N	\N	\N	gtelp	하
11504	silence	침묵	\N	\N	\N	gtelp	하
11507	emphasize	강조하다	\N	\N	\N	gtelp	하
11510	freeze froze frozen	그자리에서 꼼짝못하게 하다 얼다	\N	\N	\N	gtelp	기타
11513	audiovisual aid	시청각 도구	\N	\N	\N	gtelp	기타
11516	tool	방법 도구	\N	\N	\N	gtelp	하
11519	surrender	굴복하다 항복하다	\N	\N	\N	gtelp	하
11522	traffic	교통	\N	\N	\N	gtelp	하
11525	upset	화난	\N	\N	\N	gtelp	하
11531	headache	두통	\N	\N	\N	gtelp	하
11534	reaction	반응	\N	\N	\N	gtelp	하
11537	powerlessness	무력함	\N	\N	\N	gtelp	중
11540	shop	쇼핑하다	\N	\N	\N	gtelp	하
11543	preference	선호 애호	\N	\N	\N	gtelp	하
11546	approach	접근하다 다가가다	\N	\N	\N	gtelp	하
11549	obey	복종하다	\N	\N	\N	gtelp	하
11552	ancient	고대의	\N	\N	\N	gtelp	하
11555	punishment	처벌	\N	\N	\N	gtelp	하
11558	microorganism	미생물	\N	\N	\N	gtelp	중
11561	responsibility	책임감	\N	\N	\N	gtelp	하
11564	healthy	건강한	\N	\N	\N	gtelp	하
11567	illness	병	\N	\N	\N	gtelp	하
11573	by word of mouth	구두로 말로	\N	\N	\N	gtelp	기타
11576	poet	시인	\N	\N	\N	gtelp	하
11579	appoint	지명하다	\N	\N	\N	gtelp	하
11582	retell	다시 말하다	\N	\N	\N	gtelp	중
11585	lodging	숙박	\N	\N	\N	gtelp	하
11588	details	세부사항	\N	\N	\N	gtelp	하
11591	culture	문화	\N	\N	\N	gtelp	하
11594	garbage	쓰레기	\N	\N	\N	gtelp	하
11597	ashtray	재떨이	\N	\N	\N	gtelp	하
11603	apparently	분명히 확실히	\N	\N	\N	gtelp	하
11606	fortunately	다행히도	\N	\N	\N	gtelp	하
11609	item	물건 품목	\N	\N	\N	gtelp	하
11612	photograph	사진	\N	\N	\N	gtelp	하
11615	granite stone	화강암	\N	\N	\N	gtelp	기타
11621	hole	구멍	\N	\N	\N	gtelp	하
11624	stone	돌	\N	\N	\N	gtelp	하
11627	chimney	굴뚝	\N	\N	\N	gtelp	하
11630	shift	근무 교대 순번	\N	\N	\N	gtelp	하
11633	secretly	몰래	\N	\N	\N	gtelp	하
11636	oddest	가장 기괴한	\N	\N	\N	gtelp	중
11639	complexity	복잡성	\N	\N	\N	gtelp	하
11642	participate in A A	에 참여참석하다	\N	\N	\N	gtelp	기타
16558	inconvenient	ad . 불편한 	\N	\N	\N	toeic	하
16567	credit	n . 신용 거래 	\N	\N	\N	toeic	하
16599	delighted	adj . 기뻐 하는 	\N	\N	\N	toeic	하
16602	outstanding	adj 뛰어난 	\N	\N	\N	toeic	하
16649	furnished	adj . 가구 가 비치 된	\N	\N	\N	toeic	하
16652	projection	n . 예상 	\N	\N	\N	toeic	하
16671	ownership	n . 소유 	\N	\N	\N	toeic	하
16687	subsequent to	prep.- 다음 에 	\N	\N	\N	toeic	기타
16710	informal	adj 	\N	\N	\N	toeic	하
16717	reflective	adj . 반영 하는 	\N	\N	\N	toeic	하
11313	knowledge	지식	\N	\N	\N	gtelp	하
11316	whole	전체의	\N	\N	\N	gtelp	하
11319	political	정치의	\N	\N	\N	gtelp	하
11322	satisfy	만족시키다	\N	\N	\N	gtelp	하
11325	wrinkle	주름	\N	\N	\N	gtelp	하
11328	conclude	결론짓다	\N	\N	\N	gtelp	하
11331	attractive	매력적인	\N	\N	\N	gtelp	하
11334	doubt	의심	\N	\N	\N	gtelp	하
11337	convenience food	인스턴트식품	\N	\N	\N	gtelp	기타
11340	method	방법	\N	\N	\N	gtelp	하
11343	tip	끝	\N	\N	\N	gtelp	하
11346	remaining	남아 있는	\N	\N	\N	gtelp	하
11349	appeal	간청하다	\N	\N	\N	gtelp	하
11355	detail	세부 사항	\N	\N	\N	gtelp	하
11358	narrow	좁은	\N	\N	\N	gtelp	하
11361	customer	고객	\N	\N	\N	gtelp	하
11364	scene	장면	\N	\N	\N	gtelp	하
11367	run	운영하다	\N	\N	\N	gtelp	하
11370	distant	먼	\N	\N	\N	gtelp	하
11373	gifted	재능이 있는	\N	\N	\N	gtelp	하
11379	matter	중요하다	\N	\N	\N	gtelp	하
11382	accomplish	달성하다	\N	\N	\N	gtelp	하
11385	invention	발명	\N	\N	\N	gtelp	하
11388	various	다양한	\N	\N	\N	gtelp	하
11391	opportunity	기회	\N	\N	\N	gtelp	하
11394	amazingly	놀랍게도	\N	\N	\N	gtelp	하
11400	athlete	운동선수	\N	\N	\N	gtelp	하
11403	crash	쿵 떨어지다	\N	\N	\N	gtelp	하
11406	gene	유전자	\N	\N	\N	gtelp	하
11409	unpleasantly	불쾌하게	\N	\N	\N	gtelp	중
11412	according to	에 따르면	\N	\N	\N	gtelp	기타
11415	compare	비교하다	\N	\N	\N	gtelp	하
11418	product	상품	\N	\N	\N	gtelp	하
11421	blacksmith	대장장이	\N	\N	\N	gtelp	하
11424	outline	윤곽선	\N	\N	\N	gtelp	하
11427	faintly	희미하게	\N	\N	\N	gtelp	하
11433	engage inA A	에 참여하다	\N	\N	\N	gtelp	기타
11436	be good at	을 잘하다	\N	\N	\N	gtelp	기타
11439	cane pole	낚싯대	\N	\N	\N	gtelp	기타
11442	income	수입 소득	\N	\N	\N	gtelp	하
11448	line	낚싯줄	\N	\N	\N	gtelp	하
11451	species	생물학적 종	\N	\N	\N	gtelp	하
11454	expert	전문가	\N	\N	\N	gtelp	하
11457	chase	추적하다	\N	\N	\N	gtelp	하
11460	Now that SV	때문에	\N	\N	\N	gtelp	기타
11463	management	관리 경영	\N	\N	\N	gtelp	하
11466	peer	동료 급우	\N	\N	\N	gtelp	하
11469	relaxation	휴식	\N	\N	\N	gtelp	하
11472	bacteria	세균	\N	\N	\N	gtelp	하
11478	effect	효과 영향 결과	\N	\N	\N	gtelp	하
11481	southern	남부의 남쪽의	\N	\N	\N	gtelp	하
11484	temple	사원	\N	\N	\N	gtelp	하
11487	hide	숨기다 은닉하다	\N	\N	\N	gtelp	하
11490	square	평방제곱 광장 사각형	\N	\N	\N	gtelp	하
11493	stage	단계	\N	\N	\N	gtelp	하
11496	function	기능	\N	\N	\N	gtelp	하
11499	efficient	효율적인	\N	\N	\N	gtelp	하
11505	tone	어조	\N	\N	\N	gtelp	하
11508	clearly and directly	명확하고 직접적으로	\N	\N	\N	gtelp	기타
11511	make full use of	을 최대한 이용하다	\N	\N	\N	gtelp	기타
11514	illustrate	설명하다	\N	\N	\N	gtelp	하
11517	unfailingly	틀림없이	\N	\N	\N	gtelp	중
11520	be on ones way to A A	로 가는 중이다	\N	\N	\N	gtelp	기타
11523	roadwork	도로공사	\N	\N	\N	gtelp	중
11526	to the point ofA A	정도까지	\N	\N	\N	gtelp	기타
11529	stomach	위 배	\N	\N	\N	gtelp	하
11532	realize	깨닫다 알다	\N	\N	\N	gtelp	하
11538	relax	편안해 지다 긴장을 풀다	\N	\N	\N	gtelp	하
11541	happen toV	우연히 하다	\N	\N	\N	gtelp	기타
11544	ignore	무시하다	\N	\N	\N	gtelp	하
11547	closely	면밀히 세밀히	\N	\N	\N	gtelp	하
11550	realize	깨닫다 알다	\N	\N	\N	gtelp	하
11553	regard A as B A B	를 로 간주하다	\N	\N	\N	gtelp	기타
11556	cause	일으키다 초래하다	\N	\N	\N	gtelp	하
11559	maintain	유지하다 관리하다 주장하다	\N	\N	\N	gtelp	하
11562	practice	실행하다	\N	\N	\N	gtelp	하
11565	exercise	운동	\N	\N	\N	gtelp	하
11568	machine	기계	\N	\N	\N	gtelp	하
11574	hand down	건네주다	\N	\N	\N	gtelp	기타
11577	professional	전문적인	\N	\N	\N	gtelp	하
11580	specific	특별한	\N	\N	\N	gtelp	하
11583	educate	교육시키다	\N	\N	\N	gtelp	하
11586	As often happens	흔히 그렇듯이	\N	\N	\N	gtelp	기타
11589	result	결과	\N	\N	\N	gtelp	하
11592	sculptor	조각가	\N	\N	\N	gtelp	하
11595	heap	쌓아 놓는 것 더미	\N	\N	\N	gtelp	하
11598	throw threwthrown	던지다 버리다	\N	\N	\N	gtelp	기타
11601	mass	덩어리	\N	\N	\N	gtelp	하
11607	art gallery	미술관	\N	\N	\N	gtelp	기타
11610	recreate	다시 만들다 재창조하다	\N	\N	\N	gtelp	하
11613	traditional	전통적인	\N	\N	\N	gtelp	하
11616	support	지탱하다	\N	\N	\N	gtelp	하
11619	oiled paper	기름 장판지	\N	\N	\N	gtelp	기타
11622	kitchen	부엌	\N	\N	\N	gtelp	하
11625	radiate	방출하다 빛을 발하다	\N	\N	\N	gtelp	하
11628	unusually	몹시 대단히	\N	\N	\N	gtelp	하
11634	pedal	자전거 페달	\N	\N	\N	gtelp	하
11637	breathe	호흡하다	\N	\N	\N	gtelp	하
11640	amazingly	놀랍게도	\N	\N	\N	gtelp	하
16560	announce	v . 발표 하다 . 알리다	\N	\N	\N	toeic	하
16566	retailer	n . 소매 상인	\N	\N	\N	toeic	하
16572	beverage	n . ( 물 이외 의 ) 음료 	\N	\N	\N	toeic	하
16587	destructive	adj . 파괴 적인 	\N	\N	\N	toeic	하
16595	return	v . 돌려 주다 . 반납 하다 . 돌아 오다 	\N	\N	\N	toeic	하
16608	emphasis	n . 강조 	\N	\N	\N	toeic	하
16614	convenience	n . 편의 	\N	\N	\N	toeic	하
16621	donation	n . 기부 	\N	\N	\N	toeic	하
16636	author	n 	\N	\N	\N	toeic	하
11320	fail to	하지 못하다	\N	\N	\N	gtelp	기타
11323	merely	단지	\N	\N	\N	gtelp	하
11326	bald	대머리의	\N	\N	\N	gtelp	하
11329	situation	상황	\N	\N	\N	gtelp	하
11332	attitude	태도	\N	\N	\N	gtelp	하
11338	package	포장하다	\N	\N	\N	gtelp	하
11341	number	번호를 매기다	\N	\N	\N	gtelp	하
11344	place	두다 배치하다	\N	\N	\N	gtelp	하
11347	rosebud	장미 봉오리	\N	\N	\N	gtelp	하
11350	explain	설명하다	\N	\N	\N	gtelp	하
11356	think of A as B A B	를 로 생각하다	\N	\N	\N	gtelp	기타
11359	achieve	성취하다	\N	\N	\N	gtelp	하
11362	avoid	회피하다	\N	\N	\N	gtelp	하
11365	openly	공개적으로	\N	\N	\N	gtelp	하
11368	sight	시력 시각	\N	\N	\N	gtelp	하
11371	recently	최근에	\N	\N	\N	gtelp	하
11374	obey	따르다	\N	\N	\N	gtelp	하
11380	convenient	편리한	\N	\N	\N	gtelp	하
11383	available	이용할 수 있는	\N	\N	\N	gtelp	하
11386	electric	전기의	\N	\N	\N	gtelp	하
11389	wellpaid	보수가 좋은	\N	\N	\N	gtelp	기타
11392	present	현재의	\N	\N	\N	gtelp	하
11395	valley	골짜기	\N	\N	\N	gtelp	하
11398	blanket	담요	\N	\N	\N	gtelp	하
11401	stretch	뻗다 늘이다	\N	\N	\N	gtelp	하
11404	bitter	쓴	\N	\N	\N	gtelp	하
11407	determine	결정하다	\N	\N	\N	gtelp	하
11410	decision	결정	\N	\N	\N	gtelp	하
11413	consumer	소비자	\N	\N	\N	gtelp	하
11419	merchant	상인	\N	\N	\N	gtelp	하
11422	nail	못	\N	\N	\N	gtelp	하
11425	zebra	얼룩말	\N	\N	\N	gtelp	하
11428	direction	지시	\N	\N	\N	gtelp	하
11431	pleased	기쁜	\N	\N	\N	gtelp	하
11434	No matter where	어디에 한다 하더라도	\N	\N	\N	gtelp	기타
11437	individually	개인적으로	\N	\N	\N	gtelp	하
11440	hook	낚싯바늘	\N	\N	\N	gtelp	하
11443	appeal	호소 매력	\N	\N	\N	gtelp	하
11446	vary	다양하다	\N	\N	\N	gtelp	하
11449	danger	위험	\N	\N	\N	gtelp	하
11455	specially	특별히 특히	\N	\N	\N	gtelp	하
11458	excellent	뛰어난 훌륭한	\N	\N	\N	gtelp	하
11461	pressure	압박	\N	\N	\N	gtelp	하
11464	extremely	매우	\N	\N	\N	gtelp	하
11470	success	성공	\N	\N	\N	gtelp	하
11473	dose	회분 복용량	\N	\N	\N	gtelp	하
11476	hospital	병원	\N	\N	\N	gtelp	하
11479	risk	위험	\N	\N	\N	gtelp	하
11482	amaze	깜짝 놀라게 하다	\N	\N	\N	gtelp	하
11485	solid	단단한 견고한	\N	\N	\N	gtelp	하
11488	exist	존재하다	\N	\N	\N	gtelp	하
11491	enormous	거대한	\N	\N	\N	gtelp	하
11494	marvelous	놀라운 기적적인	\N	\N	\N	gtelp	하
11497	popular	인기 있는	\N	\N	\N	gtelp	하
11503	pause	중단 정지	\N	\N	\N	gtelp	하
11506	pitch	높이 고저	\N	\N	\N	gtelp	하
11509	avoid	피하다	\N	\N	\N	gtelp	하
11512	resources	자료	\N	\N	\N	gtelp	하
11518	reduce	줄이다 감소하다	\N	\N	\N	gtelp	하
11521	appointment	약속	\N	\N	\N	gtelp	하
11524	accident	사건 사고	\N	\N	\N	gtelp	하
11527	physical action	신체적 반응	\N	\N	\N	gtelp	기타
11530	stir	뒤틀리다 휘젓다 꿈틀거리다	\N	\N	\N	gtelp	하
11533	unreasonable	비이성적인	\N	\N	\N	gtelp	하
11536	accept	받아들이다 수용하다	\N	\N	\N	gtelp	하
11542	foreigner	외국인	\N	\N	\N	gtelp	하
11545	compelling	강압적인 강제적인	\N	\N	\N	gtelp	하
11548	immediately	즉시	\N	\N	\N	gtelp	하
11551	intended	의도된	\N	\N	\N	gtelp	하
11554	disease	질병	\N	\N	\N	gtelp	하
11557	viruses	바이러스 병균	\N	\N	\N	gtelp	하
11560	largely	대체로 일반적으로	\N	\N	\N	gtelp	하
11563	preventive medicine	예방약	\N	\N	\N	gtelp	기타
11569	regular	규칙적인	\N	\N	\N	gtelp	하
11572	pass	넘겨주다 건네주다	\N	\N	\N	gtelp	하
11575	generation	세대	\N	\N	\N	gtelp	하
11578	storyteller	이야기꾼	\N	\N	\N	gtelp	하
11581	myth	신화	\N	\N	\N	gtelp	하
11584	entertain	을 즐겁게 해주다	\N	\N	\N	gtelp	하
11587	orally	구두로	\N	\N	\N	gtelp	하
11590	version	각색 번역 편곡	\N	\N	\N	gtelp	하
11596	empty beer bottle	빈 맥주병	\N	\N	\N	gtelp	기타
11599	trash	쓰레기	\N	\N	\N	gtelp	하
11602	mess	엉망진창	\N	\N	\N	gtelp	하
11605	estimate	평가하다	\N	\N	\N	gtelp	하
11608	rescue	구하다	\N	\N	\N	gtelp	하
11611	exhibit	전시	\N	\N	\N	gtelp	하
11614	underfloor heating system	방구들 난방시스템	\N	\N	\N	gtelp	기타
11617	mound	둔덕 흙무덤	\N	\N	\N	gtelp	하
11620	hot flue gases	뜨거운 통기관의 가스	\N	\N	\N	gtelp	기타
11623	direct	향하게 하다	\N	\N	\N	gtelp	하
11626	flow out	흘러나오다	\N	\N	\N	gtelp	기타
11629	tap	두드리다	\N	\N	\N	gtelp	하
11635	manage toV	가까스로 하다	\N	\N	\N	gtelp	기타
11638	in spite of A A	에도 불구하고	\N	\N	\N	gtelp	기타
11641	daughter	딸	\N	\N	\N	gtelp	하
16575	present	v . ( 영화 	\N	\N	\N	toeic	하
16578	currently	adv . 현재 	\N	\N	\N	toeic	하
16592	deduct	v . 빼다 	\N	\N	\N	toeic	하
16611	patronage	n . 애용 : 후원	\N	\N	\N	toeic	하
16632	subscription	n . 정기 구독 ( 료 )	\N	\N	\N	toeic	하
16635	blame	v . 탓 으로 돌리다 	\N	\N	\N	toeic	하
16640	helpful	adj . 도움 이 되는 	\N	\N	\N	toeic	하
16656	belong	v . ~ 에 소속 하다 . ~ 의 소유물 이다	\N	\N	\N	toeic	하
16667	directions	n . 방향 	\N	\N	\N	toeic	하
16673	dimension	n . 크기 	\N	\N	\N	toeic	하
16676	wind up	phr . 결국 - 하게 되다	\N	\N	\N	toeic	기타
16683	Implement	v.- 을 실행 하다	\N	\N	\N	toeic	하
16837	wrap up	v . 끝내다	\N	\N	\N	toeic	\N
16850	increase	v . 증가 시키다 	\N	\N	\N	toeic	\N
16853	merit	n . 장점 : 가치 v . 가치 가 있다	\N	\N	\N	toeic	\N
16857	propose	v . 제안 하다 	\N	\N	\N	toeic	\N
16860	produce	동사 [ predjú s ] v . 생산 하다 . 제조 하다 명사 [ prádju s l n . 농산물 	\N	\N	\N	toeic	\N
16870	growth	n . 성장 	\N	\N	\N	toeic	\N
16873	create	v . 창조 하다 	\N	\N	\N	toeic	\N
16883	hardware store	철물점	\N	\N	\N	toeic	\N
16886	impede	v . 방해 하다 	\N	\N	\N	toeic	\N
16889	match	v . ( 필요 에 ) 맞추다 . 부응 하다 : 어울리다 n . 짝 	\N	\N	\N	toeic	\N
16892	publicity	n . 홍보 	\N	\N	\N	toeic	\N
16902	derive	v.- 에서 비롯 되다 . ~ 에서 나오다	\N	\N	\N	toeic	\N
16905	succinctly	adv . 간결 하게	\N	\N	\N	toeic	\N
16920	recycled	재활용 된	\N	\N	\N	toeic	\N
7700	sculpture	n. *조각*	\N	\N	\N	suneung	하
7774	client	n. *고객	\N	\N	\N	suneung	하
7912	adolescent	n. *청소년*	\N	\N	\N	suneung	하
7939	statement	n. *진술	\N	\N	\N	suneung	하
10519	healing effect	치료 효과	\N	\N	\N	gtelp	중
7787	decline	v. (정중히) *거절하다	\N	\N	\N	suneung	하
7910	temporary	a. *일시적인	\N	\N	\N	suneung	하
7952	v. *축적하다	 쌓아 올리다*	\N	\N	\N	suneung	중
7794	bless	v. *축복하다*	\N	\N	\N	suneung	하
7875	nurture	v. *양육하다	\N	\N	\N	suneung	하
8040	fragile	a. *부서지기 쉬운*	\N	\N	\N	suneung	하
8094	chore	n. *집안일	\N	\N	\N	suneung	하
8123	imprint	v. (도장 등을) *찍다	\N	\N	\N	suneung	하
927	Mars	화성	\N	\N	\N		하
1150	admire	존경하다	\N	\N	\N		하
1159	progress	경과 추이	\N	\N	\N		하
1162	immediately	즉시	\N	\N	\N		하
1173	cause	이유	\N	\N	\N		하
11377	the instant	주어동사 하는 순간에	\N	\N	\N	gtelp	기타
11416	advertise	광고하다	\N	\N	\N	gtelp	하
11539	be busy ing	하느라 바쁘다	\N	\N	\N	gtelp	기타
16712	acceptable	adj . 받아 들일 수 있는 	\N	\N	\N	toeic	하
16603	attachment	n . 부착 : 첨부 ( 파일 )	\N	\N	\N	toeic	하
16613	supply	n . 비품 	\N	\N	\N	toeic	하
16616	hospitality	n . 환대 : 친절	\N	\N	\N	toeic	하
16620	ancient artifacts	고대 유물	\N	\N	\N	toeic	기타
16638	session	n . ( 특정 활동 을 위한 ) 시간 	\N	\N	\N	toeic	하
16648	valuable	adj . 가치 가 큰 : 소중한	\N	\N	\N	toeic	하
16651	expect	v . 예기 하다 . 예상 하다	\N	\N	\N	toeic	하
16654	intriguingly	adv . 흥미롭게 도 	\N	\N	\N	toeic	중
16657	exhibit	n . 전시 ( 회 ) 	\N	\N	\N	toeic	하
16681	implement	v . 시행 하다 . 이행 하다 n . 연장 	\N	\N	\N	toeic	하
16689	brainstorm	v . 브레인 스토밍 을 하다 . 자유롭게 생각 하다	\N	\N	\N	toeic	하
16695	transaction	n . 거래 	\N	\N	\N	toeic	하
16713	follow	v . 따라 가다 . ( 시간 / 순서 상 ) 뒤를 잇다 ; 주시 하다 ; ( 분명히 ) 이해 하다	\N	\N	\N	toeic	하
16726	assorted	adj . 여러 가지 의 	\N	\N	\N	toeic	하
16729	ingredient	n . ( 요리 ) 재료 	\N	\N	\N	toeic	하
16733	separate	v . 떼어 놓다 : ( 따로 ) 떨어지다 adj . 분리 된 : 독립된	\N	\N	\N	toeic	하
16736	unease	n . 불안 ( 감 ) 	\N	\N	\N	toeic	하
16743	environment	n . 환경 	\N	\N	\N	toeic	하
16750	initiative	n . 계획 : 진취성 	\N	\N	\N	toeic	하
16753	commuter	n . 통근자	\N	\N	\N	toeic	하
16760	object	v . 반대 하다 	\N	\N	\N	toeic	하
16767	regret	v . 유감 스럽게 생각 하다 . 후회 하다 n . 유감 	\N	\N	\N	toeic	하
16776	sculpture	n . 조각 ( 품 )	\N	\N	\N	toeic	하
16783	audience	n . 청중 	\N	\N	\N	toeic	하
16790	respect	n . 존경 ( 심 ) 	\N	\N	\N	toeic	하
16793	invite	v . 초대 하다 . 요청 하다	\N	\N	\N	toeic	하
16796	keep - to a minimum	phr.- 을 최소 로 하다	\N	\N	\N	toeic	기타
16803	novice	n . 초보자	\N	\N	\N	toeic	하
16827	judge	v.- 로 미루어 판단 하다 n . 심사 위원	\N	\N	\N	toeic	하
16834	virtually	adv . 사실상	\N	\N	\N	toeic	하
11971	น่ารัก เหมือน เดิม	21. 여전히 귀여워.	(나＾아락↗ 므v언 드 ㅓ ㅁ) 귀엽다 ~ 와 같다, ~ 대로 원래	\N	\N		기타
11983	เขา พูดไม่รู้เรื่อง	33. 나는 그가 무슨 얘기하는 지 모르겠어.	카오↗ 푸＾웃 마＾이 루우↗ 르＾앙 그 말하다 아니다 알다 이야기, 일	\N	\N		기타
12071	เชิญขึ้น ข้างบน	121. 윗층으로 올라 가세요.	츠ㅓㄴ 큰＾ 카＾앙   본 하세요 오르다 ~쪽, ~ 방향 위	\N	\N		기타
12149	ไม่ยอม ให้ คุณไป	180. 당신이 가도록 내버려 둘 수 없어.	마＾이 여엄   하＾이 쿤 빠이 ~ 아니다 인정 (허락) 하다 ~하도록 당신 가다	\N	\N		기타
12264	แอบดู	237. 몰래 보다	애앱↘ 두우 몰래 ~ 하다 보다 แอบ (애앱↘) + ~ 라는 구문이다. ~ 부분에 다양한 동사를 넣어서 말하게 되면, &lt; 몰래 ~ 하다 &gt;라는 뜻이 된다.	\N	\N		기타
12337	กลัวถูกแม่ ด่า	300. 엄마한테 혼날까 봐 무서워.	끌루아 투욱↘ 매＾애 다아↘ 무섭다 당하다 엄마 꾸짖다, 욕하다	\N	\N		기타
12379	เขา ไม่โทรหาตั้งนาน	336. 그가 전화 안한지 오래 됐어.	카오↗ 마＾이 토오 하v아 땅＾ 나안 그 ~ 아니다 전화하다 찾다 ~ 부터, ~ 이나 오래다, (시간이) 길다	\N	\N		기타
12414	เดินทางข้าม น้ำข้ามทะเล	366. 물 건너 바다 건너 여행하다	드ㅓㄴ   타앙 카＾암 나암↗ 카＾암 탈↗레애 걷다, 활동하다 길 건너다 물 건너다 바다	\N	\N		기타
12496	มองตา ค้าง	436. 눈길이 떨어지지 않아.	머엉 따아 카앙↗ 바라보다 눈 남아있다, 도중에 멈춰있다	\N	\N		기타
12503	จะ ดูลาย มือ ให้	443. 손금 봐줄께.	짜↘  두우 라아이  므으 하＾이 ~ 할 것이다 보다 (줄)무늬, 반점, 문양 손 ~ 해 주다	\N	\N		기타
5424	acrimonious	(태도	\N	\N	\N	gongmuwon	중
13414	Thursday	목요일	\N	\N	\N	kr-en-basic	하
13452	Won (currency)	원	\N	\N	\N	kr-en-basic	기타
13607	blessing phrase	축복을 비는 문구	\N	\N	\N		기타
13679	the lack of faith	신념확신의 결핍	\N	\N	\N		기타
16663	approve	v . 승인 하다 . 인가 하다	\N	\N	\N	toeic	\N
16677	current	adj . 현재 의	\N	\N	\N	toeic	\N
16679	ambitious	adj . 야심 적인 	\N	\N	\N	toeic	\N
16682	paperwork	n . 서류 작업 	\N	\N	\N	toeic	\N
16696	certain	adj . 어떤 	\N	\N	\N	toeic	\N
16699	lay off	phr . ( 정리 ) 해고 하다	\N	\N	\N	toeic	\N
16702	redundant	adj . 여분 의 	\N	\N	\N	toeic	\N
16705	streamlined	adj . 유선형 의 : 능률적 인 	\N	\N	\N	toeic	\N
16708	avoid	v . 피하다 . 방지 하다	\N	\N	\N	toeic	\N
16711	renowned	adj . 유명한 	\N	\N	\N	toeic	\N
16738	compartment	n . 구획 	\N	\N	\N	toeic	\N
16741	landscape	n . 풍경 	\N	\N	\N	toeic	\N
16758	assumption	n . 가정 : 인수 	\N	\N	\N	toeic	\N
16768	venue	n . 개최지 	\N	\N	\N	toeic	\N
16777	region	n . 지역 	\N	\N	\N	toeic	\N
16794	opportunity	n . 기회 ( = chance )	\N	\N	\N	toeic	\N
16797	on the downside	하락세 로	\N	\N	\N	toeic	\N
16807	alternate	adj . 대체 의 	\N	\N	\N	toeic	\N
16810	principle	n . 원리 	\N	\N	\N	toeic	\N
16816	functionality	n . ( 상품 등 의 ) 기능성	\N	\N	\N	toeic	\N
16823	inventory	n . 재고 ( 품 ) 	\N	\N	\N	toeic	\N
16831	dine	v . 식사 를 하다 	\N	\N	\N	toeic	\N
16847	trade	n . 무역 	\N	\N	\N	toeic	\N
16866	hardware store	철물점	\N	\N	\N	toeic	\N
16879	shortly	adv . 곧 	\N	\N	\N	toeic	\N
16895	precaution	n . 예방책 	\N	\N	\N	toeic	\N
16898	upscale	adj . 평균 이상의 : 부자 의	\N	\N	\N	toeic	\N
16908	premier	n . ( 영화 의 ) 개봉 	\N	\N	\N	toeic	\N
16911	novice	n . 초보자	\N	\N	\N	toeic	\N
16923	functionality	n . ( 상품 등 의 ) 기능성	\N	\N	\N	toeic	\N
7938	distinguish	v. *구별하다*	\N	\N	\N	suneung	하
7974	oral	a. *구두(口頭)의	\N	\N	\N	suneung	하
8083	obstacle	n. *장애물	\N	\N	\N	suneung	하
8105	present	v. *제출하다	\N	\N	\N	suneung	하
8189	wilderness	n. *황무지	\N	\N	\N	suneung	하
1138	area	지역	\N	\N	\N		하
1144	be equipped with	을 장착하다 설비를 갖추다	\N	\N	\N		중
1371	improve	향상시키다	\N	\N	\N		하
11452	fearless	겁 없는	\N	\N	\N	gtelp	하
11566	prevent	예방하다 막다	\N	\N	\N	gtelp	하
20	longlasting pain	오랫동안 지속되는 통증	\N	\N	\N		기타
11964	แค่นี้นะ	14.그럼, 이만 (전화끊을 때)	(캐＾애 니이↗ 나↗)	\N	\N		기타
12006	ไม่คิดเลยว่าจะเป็นแบบ นี้	56. 이렇게 되리라고는 생각도 못했어.	마＾이 킷↗  러이 와＾아 짜 뻰   배앱 ↘ 니↗ ~ 아니다 생각하다 전혀 ~라고 ~ 일 것이다 ~ 이다 형식, 모양 이	\N	\N		기타
11997	รัก คุณเท่าฟ้า	47.하늘만큼 당신을 사랑해.	락↗  쿤 타＾오 화아↗ 사랑하다 당신 ~ 만큼 하늘	\N	\N		기타
12017	ทำแค่ นี้ก็ ไม่ ได้	67.이 정도인 데 (쉬운데)할 수 없다니.	탐 캐＾애 니이↗ 꺼＾ 마＾이 다＾이 하다 겨우 ~ 뿐 이 ~ 해도 아니다 할 수 있다	\N	\N		기타
12068	นึกออกแล้ว	118. 아하, 알았어.	늑↗ 어억↘ 래우↗ 생각하다 나오다 이제	\N	\N		기타
12137	ทำกับมือ	2) 손으로 직접 만들었어.	(탐 깝↘ 므으)	\N	\N		기타
12182	ไปกินอะไรมา	너 뭐 먹었어 ?	빠이 낀 아라이 마아 가다 먹다 무엇 오다 이 문장에서ไป 는 &ldquo;가다&rdquo;의 뜻이 아니고, มา 역시 &ldquo;오다&rdquo; 의 뜻이 아니다.	\N	\N		기타
12336	เปิดอีเมล์ดูรึยัง	299. e-mail 열어 봤어 ?	쁘ㅓㅅ↘ 이이메애 두우 르↗ 양 열다 e-mail 보다 아니면 아직	\N	\N		기타
12366	กล้า พูด กล้า ทำ	323. 감히 말하고, 감히 행하다	끌＾라아 푸＾웃 끌＾라아 탐 감히 ~ 하다, 용감하다, 강하다 말하다 감히 ~ 하다	\N	\N		기타
12396	ผมผิดข้อหาอะไร	350. 내가 잘못한 혐의가 뭡니까	폼v 핏↘ 커＾어 하v아 아↘라이 나 잘못하다 용의점, 혐의 무엇	\N	\N		기타
12339	ลูกถูกแม่ตี	아이는 엄마에게 맞는다.	(루＾욱 투욱↘ 매＾애 띠) ลูก (루＾욱 : 아이) + ถูก (투욱↘ : 당하다) + แม่ (매＾애 : 엄마) + ตี (띠이 : 때리다)	\N	\N		기타
12431	อยากได้อะไรบอกได้เลย	382. 무엇을 갖고 싶은 지 말만 해.	야악↘   다＾이 아↘라이 버억↘ 다＾이   르ㅓ이 원하다, 하고 싶다 얻다, 획득하다 무엇 말하다 ~ 할 수 있다 전혀, 완전히	\N	\N		기타
12498	ธุรกิจเฟื่องฟู	438. 사업이 번창하다	투↘라↗낏↘ 희＾으앙 후우 사업 번영하다, 진보하다 부풀다, 팽창하다, 번영하다 เฟื่อง (희＾으앙) 과 ฟู (후우) 에 있는 ฟ 의 발음은 / ㅎ + ㅍ / 즉, 영어의 / f / 발음처럼&hellip;	\N	\N		기타
12715	อยู่กันพร้อมหน้าพร้อมตา	183. 다들 여기 있었네.	유우↘ 깐 프럼↗   나＾아   프럼↗ 따아 있다 함께 한꺼번에, 동시에 얼굴 한꺼번에, 동시에 눈	\N	\N	thai-conversation	기타
12710	ไม่ยอม ให้ คุณไป	180. 당신이 가도록 내버려 둘 수 없어.	마＾이 여엄   하＾이 쿤 빠이 ~ 아니다 인정 (허락) 하다 ~하도록 당신 가다	\N	\N	thai-conversation	기타
12780	มีเท่าไหร่เอามาให้หมด	216. 가진 것 다 내놔 !	미이   타＾오 라이↘ 아오 마아 하＾이 못↘ 가지고 있다 얼마 가지다, 휴대하다 오다 주다 전부	\N	\N	thai-conversation	기타
12876	ท่าทางมีความ สุข	280. 행복해 보여.	타＾아 타앙 미이 콰암   쑥↘ 자세, 풍모, 형세 있다 ~ 함, ~ 하기 (명사형 어미) 행복하다 태국인들은 99.9 % เขามีความสุข (카오↗ 미이 콰암 쑥↘) 이라고 말한다.우리말 뜻으로는 그는 / 가지고 있다 / 행복함을.	\N	\N	thai-conversation	기타
12879	ใช้ได้มั้ย	281. 쓸 수 있어 ?, 사용할 수 있어 ?	차이↗   다＾이 마이↗ 쓰다, 사용하다 ~ 할 수 있나요 ?	\N	\N	thai-conversation	기타
13011	ไปรึไม่ไปเหรอ	갈거야 안 갈거야 ?	(빠이 르↗ 마＾이 빠이 르ㅓv어) 그리고, เลย(르ㅓ이) 는 " 전혀, 절대로, 완전히 " 의 뜻입니다.	\N	\N	thai-conversation	기타
13024	ไม่ใช่ความผิดของฉัน	409. 내 잘못이 아냐.	마＾이 차＾이 콰암 핏↘ 커v엉 폼v 아니다 맞다, 옳다 잘못 ~ 의 나	\N	\N	thai-conversation	기타
13461	That's what I meant	구러니카	\N	\N	\N	kr-en-basic	기타
16720	quantity	n . 양 	\N	\N	\N	toeic	\N
16723	selection	n . 선발 	\N	\N	\N	toeic	\N
16737	uneasy	adj . 불안한 	\N	\N	\N	toeic	\N
16773	improve	v . 개선 하다	\N	\N	\N	toeic	\N
16784	spectator	n . 관중 	\N	\N	\N	toeic	\N
16787	intensively	adv . 집중적 으로 	\N	\N	\N	toeic	\N
16804	haste	n . ( 시간 부족 으로 ) 서두름 	\N	\N	\N	toeic	\N
16828	judge	v.- 로 미루어 판단 하다 n . 심사 위원	\N	\N	\N	toeic	\N
16835	nursery	n . 묘목 장 	\N	\N	\N	toeic	\N
16848	acquire	v . 습득 하다 	\N	\N	\N	toeic	\N
16851	increasingly	adv . 점점 	\N	\N	\N	toeic	\N
16858	create	v . 창조 하다 	\N	\N	\N	toeic	\N
16861	shortly	adv . 곧 	\N	\N	\N	toeic	\N
16871	found	v . 설립 하다 	\N	\N	\N	toeic	\N
16874	periodic	adj . 주기 적인 	\N	\N	\N	toeic	\N
16887	succeed	v . ( 자리 / 지위 등 ) 뒤를 잇다 . 성공 하다	\N	\N	\N	toeic	\N
16890	offer	v . 제공 하다 : 제안 하다 n . 제공 : 제안 : 특별 할인가	\N	\N	\N	toeic	\N
16903	call for	- 을 필요 로 하다 . 요구 하다	\N	\N	\N	toeic	\N
16906	intact	adj 온전한 	\N	\N	\N	toeic	\N
16918	principle	n . 원리 	\N	\N	\N	toeic	\N
16925	paralegal	n . 준 법률가	\N	\N	\N	toeic	\N
16930	correctly	adv . 정확하게 	\N	\N	\N	toeic	\N
16935	lodging	n . 임시 숙소	\N	\N	\N	toeic	\N
1508	footstep	발소리 걸음걸이	\N	\N	\N		중
15766	concentration on sth	정신 집중 / ( 노력 등 의 ) 집중	\N	\N	\N	toeic	중
15860	otherwise	adv . 달리 : 그렇지 않으면	\N	\N	\N	toeic	하
16055	in light of	prep.- 에 비추어 	\N	\N	\N	toeic	중
16228	seldom	adv . 좀처럼 [ 거의 ] ~ 않는	\N	\N	\N	toeic	하
16358	remind	v . 상기 시키다 . 생각 나게 하다	\N	\N	\N	toeic	하
16545	share	v . ( 감정 / 생각 등 을 ) 공유 하다 ( 나누다 ] 	\N	\N	\N	toeic	하
16361	nominate	v . ( 후보자 로 ) 추천 하다 . 임명 하다 . 지정 하다	\N	\N	\N	toeic	하
16600	impressed	adj 	\N	\N	\N	toeic	하
3354	abruptly	ad. 갑자기	\N	\N	\N	toefl	하
3399	adulterate	(불순물을 섞어) 순도/품질을 떨어뜨리다	\N	\N	\N	toefl	중
3639	bombshell	n. 깜짝 놀라게 하는 일(사람)(=thing or event that was not planned for ); 폭탄	\N	\N	\N	toefl	하
4110	embryo	태아	\N	\N	\N	toefl	하
4187	2. (한도를) 넘다	 초과하다	\N	\N	\N	toefl	중
4219	extraneous	외부로부터 온	\N	\N	\N	toefl	하
4412	havoc	대파괴	\N	\N	\N	toefl	하
4579	innate	타고난	\N	\N	\N	toefl	하
5100	puritanical	A. 청교도적인; 엄격한	\N	\N	\N	toefl	중
5529	attenuate	약화시키다	\N	\N	\N	gongmuwon	중
5463	allot	할당하다	\N	\N	\N	gongmuwon	하
5760	corrupt	타락한	\N	\N	\N	gongmuwon	하
5802	decelerate	속도를 줄이다	\N	\N	\N	gongmuwon	중
6083	ferocious	사나운	\N	\N	\N	gongmuwon	하
5944	dye	염료	\N	\N	\N	gongmuwon	하
5973	encounter	부닥치다	\N	\N	\N	gongmuwon	하
6479	morbid	무서운	\N	\N	\N	gongmuwon	하
6734	refrain	그만두다; 삼가다	\N	\N	\N	gongmuwon	하
6681	prosperous	번영하는; 순조로운	\N	\N	\N	gongmuwon	하
6934	stupid	어리석은	\N	\N	\N	gongmuwon	하
7317	permit	v. *허락하다*	\N	\N	\N	suneung	하
7682	sum	n. *총합	\N	\N	\N	suneung	하
7439	occupy	v. (시간 · 장소를) *차지하다	\N	\N	\N	suneung	하
7457	survey	n. *설문 조사*	\N	\N	\N	suneung	하
8039	session	n. *회의	\N	\N	\N	suneung	하
10349	visualize	눈에 보이게 하다	\N	\N	\N	gtelp	하
7781	assign	v. *할당하다	\N	\N	\N	suneung	하
7788	n. *하락	 쇠퇴*	\N	\N	\N	suneung	기타
7983	nap	n. *낮잠*	\N	\N	\N	suneung	하
8318	prescribe	v. *규정하다	\N	\N	\N	suneung	하
8384	patient	a. *인내심 있는*	\N	\N	\N	suneung	하
8120	polish	v. *닦다	\N	\N	\N	suneung	하
8260	peasant	n. *영세 농민	\N	\N	\N	suneung	하
8329	vehicle	n. *탈것	\N	\N	\N	suneung	하
8401	v. 날이 새다	 이해되기 시작하다	\N	\N	\N	suneung	기타
8515	applause	n. *박수 갈채*	\N	\N	\N	suneung	하
8839	antibiotic	n. *항생 물질*	\N	\N	\N	suneung	하
8528	reed	n. *갈대*	\N	\N	\N	suneung	하
8558	embody	v. *구체화하다	\N	\N	\N	suneung	하
8588	damp	a. *축축한*	\N	\N	\N	suneung	하
8630	hinder	v. *방해하다*	\N	\N	\N	suneung	하
8666	n. *일치	* 협정	\N	\N	\N	suneung	기타
8723	blend	n. *혼합*	\N	\N	\N	suneung	하
8574	shrub	n. *관목*(灌木)	\N	\N	\N	suneung	하
8604	undertake	v. *수행하다	\N	\N	\N	suneung	하
8640	n. *귀환	 반환*	\N	\N	\N	suneung	기타
8658	herd	n. *짐승의 떼*	\N	\N	\N	suneung	하
8760	neglect	v. *무시하다*	\N	\N	\N	suneung	하
8914	correspond	v. *일치하다	\N	\N	\N	suneung	하
8950	inevitable	a. *피할 수 없는*	\N	\N	\N	suneung	하
9129	bid	v. *말하다	\N	\N	\N	suneung	하
9146	sophisticated	a. *세련된	\N	\N	\N	suneung	하
10305	accomplish	이루다 성취하다	\N	\N	\N	gtelp	하
10428	curiosity	호기심	\N	\N	\N	gtelp	하
8955	deed	n. *행위	\N	\N	\N	suneung	하
10348	scenario	계획안	\N	\N	\N	gtelp	하
10411	academic	학원의 대학의	\N	\N	\N	gtelp	하
10441	human	인간	\N	\N	\N	gtelp	하
8975	riddle	n. *수수께끼*	\N	\N	\N	suneung	하
9135	compost	n. *혼합물	\N	\N	\N	suneung	하
9477	cripple	v. *~을 불구로 만들다*	\N	\N	\N	suneung	하
9553	overcome	v. *압도하다	\N	\N	\N	suneung	하
9589	cosmopolitan	a. *세계적인	\N	\N	\N	suneung	하
9643	counterattack	n. *반격	\N	\N	\N	suneung	중
9304	imperial	a. *제국의	\N	\N	\N	suneung	하
9496	prehistoric	a. *선사 시대의*	\N	\N	\N	suneung	하
9524	accommodate	v. *수용하다	\N	\N	\N	suneung	하
9595	range	v. *정렬시키다*	\N	\N	\N	suneung	하
9647	wound	v. *부상하게 하다*	\N	\N	\N	suneung	하
13484	How much is it?	얼마에요?	\N	\N	\N	kr-en-basic	기타
13618	longlasting pain	오랫동안 지속되는 통증	\N	\N	\N		기타
16728	assortment	n . 모듬 	\N	\N	\N	toeic	하
16731	spacious	adj . 넓은 	\N	\N	\N	toeic	하
16735	save	v . ( 돈 을 ) 모으다 	\N	\N	\N	toeic	하
16752	remove	v . 치우다 . 없애다 	\N	\N	\N	toeic	하
16762	observation	n . 관찰	\N	\N	\N	toeic	하
16766	indicate	v . 나타내 다 . 보여 주다 . 명시 하다	\N	\N	\N	toeic	하
16769	curb	v . 억제 하다 . 제한 하다 n . 억제 	\N	\N	\N	toeic	하
16772	affect	v . 영향 을 미치다 . ( 불리 하게 ) 작용 하다	\N	\N	\N	toeic	하
16779	surround	v . 둘러 싸다 . 에워 싸다	\N	\N	\N	toeic	하
16782	encouragement	n . 격려 ( 가 되는 것 )	\N	\N	\N	toeic	하
16786	intensive	adj . 집중적 인 	\N	\N	\N	toeic	하
16789	acquaint	v . 알려주 다 	\N	\N	\N	toeic	하
16792	fit	v.- 에 들어 맞다 . 적합 하다 adj . 적합한 	\N	\N	\N	toeic	하
16818	functional	adj 	\N	\N	\N	toeic	하
16839	interior	n . 내부 	\N	\N	\N	toeic	하
16842	domestic	adj . 국내 의 	\N	\N	\N	toeic	하
16845	domestic flights	HA	\N	\N	\N	toeic	기타
16855	growth	n . 성장 	\N	\N	\N	toeic	하
16862	attitude	n . 태도 	\N	\N	\N	toeic	하
16865	unfurnished	v . 가구 가 비치 되지 않은	\N	\N	\N	toeic	하
16878	produce	v . 생산 하다 . 제조 하다 명사 n . 농산물 	\N	\N	\N	toeic	하
16881	mark	v . 흔적 을 남기다 . 기념 하다 n . 자국 	\N	\N	\N	toeic	하
16894	personify	v . ~ 를 의인화 하다 ; 전형적 으로 보여 주다 . ~ 의 화신 이다	\N	\N	\N	toeic	중
16897	locals	n . 지역 주민 	\N	\N	\N	toeic	하
16900	judge	v.- 로 미루어 판단 하다 n . 심사 위원	\N	\N	\N	toeic	하
16910	wear	n . ( 많이 사용 되어 ) 닮음 	\N	\N	\N	toeic	하
16926	tribute	| n . 헌사 	\N	\N	\N	toeic	하
1787	indeed	실제로	\N	\N	\N		하
1963	underfloor heating system	방구들 난방시스템	\N	\N	\N		기타
15841	normally	adv . 일반적 으로 	\N	\N	\N	toeic	하
15670	limited warranty/items/time	보증 제한 / 제한된 품목 / 시간	\N	\N	\N	toeic	기타
15962	relevant work experience	phr . 관련 분야 의 경력	\N	\N	\N	toeic	기타
16326	hypothesize	v . 가정 하다	\N	\N	\N	toeic	하
16467	film	n . 영화 v . 촬영 하다 . 영화화 하다	\N	\N	\N	toeic	하
15691	have trouble difficulty ing	- 하는 데 어려움 을 겪다	\N	\N	\N	toeic	기타
3429	allegedly	주장하는 바에 따르면	\N	\N	\N	toefl	하
3792	congruent	일치하는	\N	\N	\N	toefl	하
4103	elucidate	명료하게 하다	\N	\N	\N	toefl	하
4449	humdrum	단조로운	\N	\N	\N	toefl	중
5615	candid	솔직한	\N	\N	\N	gongmuwon	하
5621	capsize	뒤집다	\N	\N	\N	gongmuwon	중
5470	amalgamate	합병시키다	\N	\N	\N	gongmuwon	중
5883	discord	조화되지 않다; 불화하다	\N	\N	\N	gongmuwon	하
6473	moist	축축한	\N	\N	\N	gongmuwon	하
6757	render	~가 되게 하다; 주다; 보답하다; 제출하다; 교부하다; ~을 표현하다	\N	\N	\N	gongmuwon	하
6902	spontaneous	자연히 일어나는	\N	\N	\N	gongmuwon	하
6613	plausible	그럴듯한	\N	\N	\N	gongmuwon	하
6880	smother	숨이 막히게 하다; 질식시키다	\N	\N	\N	gongmuwon	하
6935	sturdy	튼튼한	\N	\N	\N	gongmuwon	하
6937	submit	제출하다; 맡기다	\N	\N	\N	gongmuwon	하
7676	compete	v. *경쟁하다*	\N	\N	\N	suneung	하
7978	appliance	n. (가정용) *기구	\N	\N	\N	suneung	하
7987	v. *바꾸다	 이동하다*	\N	\N	\N	suneung	기타
7769	horror	n. *공포	\N	\N	\N	suneung	하
8357	rob	v. *훔치다	\N	\N	\N	suneung	하
8411	concrete	a. *구체적인*	\N	\N	\N	suneung	하
8513	float	v. *뜨다	\N	\N	\N	suneung	하
8179	persist	v. *고집하다	\N	\N	\N	suneung	하
8221	vessel	n. (물건을 담는) *용기	\N	\N	\N	suneung	하
8353	attribute	v. *~의 탓으로 돌리다*	\N	\N	\N	suneung	하
8458	supernatural	a. *초자연적인*	\N	\N	\N	suneung	하
8277	mammal	n. *포유동물*	\N	\N	\N	suneung	하
8334	force	v. *강요하다*	\N	\N	\N	suneung	하
8415	perseverance	n. *인내심*	\N	\N	\N	suneung	하
8508	neutral	a. *중립의	\N	\N	\N	suneung	하
8554	intact	a. *본래대로의	\N	\N	\N	suneung	하
8647	controversy	n. *논란	\N	\N	\N	suneung	하
8803	overturn	v. *전복시키다*	\N	\N	\N	suneung	하
8702	convey	v. *전달하다	\N	\N	\N	suneung	하
8535	conform	v. *적합하게 하다	\N	\N	\N	suneung	하
8541	archaeology	n. *고고학*	\N	\N	\N	suneung	하
8832	memorial	n. *기념물	\N	\N	\N	suneung	하
8917	fund	n. *기금*	\N	\N	\N	suneung	하
10353	joyful	반가운 즐거운	\N	\N	\N	gtelp	하
8992	primitive	a. *원시의	\N	\N	\N	suneung	하
9017	retarded	a. (정서 · 지능 · 학력) *발달이 뒤진*	\N	\N	\N	suneung	하
9139	housewarming	n. *집들이*	\N	\N	\N	suneung	하
10318	determine	결정하다 결론내리다	\N	\N	\N	gtelp	하
10378	unnecessarily	불필요하게 쓸데없이	\N	\N	\N	gtelp	하
9444	thorn	n. *가시	\N	\N	\N	suneung	하
9445	exert	v. (힘 · 지식 등을) *쓰다	\N	\N	\N	suneung	하
9645	cumulative	a. *누적되는	\N	\N	\N	suneung	하
9253	perstigious	a. *명성이 있는	\N	\N	\N	suneung	기타
9246	latitude	n. <지리> *위도	\N	\N	\N	suneung	하
9398	n. *포복	 서행*	\N	\N	\N	suneung	기타
9542	burnout	n. *극도의 피로	\N	\N	\N	suneung	하
9700	slim plates	가느다란 판	\N	\N	\N	gtelp	기타
9727	When it comes to ing	에 관한 한	\N	\N	\N	gtelp	기타
12060	ผมผิดหวัง ในตัวคุณ	110. 저는 당신에게 실망했어요.	폼v 핏↘ 왕v   나이   뚜아 쿤 저 틀리다 기대하다 안에, 에게 몸, 자신 당신	\N	\N		기타
11985	รอไม่ไหวแล้ว	35.더 이상 기다릴 수 없어.	러어  마＾이 와v이  래우↗ 기다리다 아니다 할수있다 이미	\N	\N		기타
13499	To know (V)	알다	\N	\N	\N	kr-en-basic	기타
13586	What do you want to do?	뭐 하고 싶어?	\N	\N	\N	kr-en-basic	기타
1	thread	실	\N	\N	\N		하
33	beneficial effect on	에 이로운 영향	\N	\N	\N		기타
56	highly skilled sport	고도로 숙련된 스포츠	\N	\N	\N		기타
121	cafeteria	학교식당구내식당	\N	\N	\N		하
130	embarrassed	당혹해하는 난처한	\N	\N	\N		하
154	internal organ	내장기관 내부 장기	\N	\N	\N		기타
188	in order to Root	하기 위해서	\N	\N	\N		기타
196	room to complete	완성할 수 있는 공간	\N	\N	\N		기타
218	expedition	탐험	\N	\N	\N		하
245	turn into	로 바뀌다	\N	\N	\N		기타
265	monotonous	단조로운 무미건조한	\N	\N	\N		하
276	arm chair	안락의자	\N	\N	\N		기타
331	sense of humor	유머 감각	\N	\N	\N		기타
375	strangely	이상하게	\N	\N	\N		하
388	toxic object	독이 있는 물질	\N	\N	\N		기타
396	textmessage	문자를 주고받다	\N	\N	\N		기타
419	fossil fuel	화석 연료	\N	\N	\N		기타
451	design	설계하다	\N	\N	\N		하
456	achieve	이행하다 성취하다	\N	\N	\N		하
466	perform	실행하다 이행하다	\N	\N	\N		하
483	differently	다르게	\N	\N	\N		하
496	rapid	빠른 신속한	\N	\N	\N		하
529	depend on	에 달려있다	\N	\N	\N		기타
538	play a role	역할을 하다	\N	\N	\N		기타
561	in most cases	대부분의 경우에	\N	\N	\N		기타
569	this way	이런 식으로	\N	\N	\N		기타
576	claim	주장하다	\N	\N	\N		하
606	parking lot	주차장	\N	\N	\N		기타
620	curious	호기심 있는 사물을 알고 싶어 하는	\N	\N	\N		하
640	govern	좌우하다 다스리다	\N	\N	\N		하
658	motivate	동기를 주다	\N	\N	\N		하
671	isolate	고립시키다 분리시키다	\N	\N	\N		하
740	document	문서	\N	\N	\N		하
748	motivate	에게 동기를 주다	\N	\N	\N		하
787	official	공식적인	\N	\N	\N		하
16072	administer	v . 운영 하다 . 관리 하다 실시 하다 . 집행 하다	\N	\N	\N	toeic	하
15644	opening/closing remarks	개회사 / 폐회사	\N	\N	\N	toeic	기타
15621	lasting effect/memory	지속적인 효과 / 기억	\N	\N	\N	toeic	기타
16630	fill	v . ( 일자리 에 사람 을 ) 채우다 ; ( 주문 대로 ) 이행 하다	\N	\N	\N	toeic	하
3364	accede	동의하다	\N	\N	\N	toefl	중
3808	dispute	논쟁하다	\N	\N	\N	toefl	하
4102	eloquent	웅변의	\N	\N	\N	toefl	하
4212	extemporize	V. (사전 준비 없이) 즉석에서 연설[연주]하다	\N	\N	\N	toefl	기타
4224	fabrication	N. 1. (속이기 위해) 꾸며낸 말	\N	\N	\N	toefl	하
4510	imprudent	경솔한	\N	\N	\N	toefl	중
5709	conditional	조건부의	\N	\N	\N	gongmuwon	하
5734	contagious	(접촉) 전염성의; 전염 독이 있는	\N	\N	\N	gongmuwon	하
5769	coup	쿠데타; 불시의 일격; 대성공	\N	\N	\N	gongmuwon	하
5496	apparel	(집합적)의류; 옷	\N	\N	\N	gongmuwon	하
6472	modify	변경하다	\N	\N	\N	gongmuwon	하
6480	moreover	게다가	\N	\N	\N	gongmuwon	하
6845	sensational	선풍적 인기의	\N	\N	\N	gongmuwon	하
6603	pioneer	(새 분야를) 개척하다; 도로를 개설하다	\N	\N	\N	gongmuwon	하
6647	preposterous	앞뒤가 뒤바뀐	\N	\N	\N	gongmuwon	하
7017	tribunal	법정; 판사석	\N	\N	\N	gongmuwon	하
7093	upbringing	(특히 유아기 때 가정에서 이루어지는)교육	\N	\N	\N	gongmuwon	하
7680	commit	v. (죄를)*저지르다	\N	\N	\N	suneung	하
7341	accompany	v. *동반하다*	\N	\N	\N	suneung	하
7772	v. *예배하다	 숭배하다*	\N	\N	\N	suneung	기타
7980	command	v. *명령하다	\N	\N	\N	suneung	하
8425	discourage	v. *낙담시키다	\N	\N	\N	suneung	하
8253	suffer	v. *고통받다*	\N	\N	\N	suneung	하
8313	priceless	a. *대단히 소중한*	\N	\N	\N	suneung	하
8331	brochure	n. *소책자	\N	\N	\N	suneung	하
8530	dismay	v. *실망시키다	\N	\N	\N	suneung	하
8599	linger	v. *오래 머물다	\N	\N	\N	suneung	하
8701	n. *졸업생	 대학원 학생*	\N	\N	\N	suneung	기타
8731	slice	n. *얇은 조각*	\N	\N	\N	suneung	하
8843	n. *유랑	 방랑*	\N	\N	\N	suneung	기타
8912	vomit	v. *토하다*	\N	\N	\N	suneung	하
8706	conduct	v. (업무 따위를) *실시하다*	\N	\N	\N	suneung	하
8787	ecology	n. *생태학*	\N	\N	\N	suneung	하
8889	fortress	n. (대규모의) *요새*	\N	\N	\N	suneung	하
8922	restrain	v. *억제하다	\N	\N	\N	suneung	하
9009	slot	n. (자동판매기 따위의) *투입 구멍	\N	\N	\N	suneung	하
9067	justify	v. *정당화하다*	\N	\N	\N	suneung	하
10332	annoying	괴롭히는	\N	\N	\N	gtelp	하
10398	motivate	에게 동기를 주다	\N	\N	\N	gtelp	하
9051	regard	v. *~으로 여기다*	\N	\N	\N	suneung	하
10462	wherever	어느 곳이든	\N	\N	\N	gtelp	하
10489	blame	비난하다	\N	\N	\N	gtelp	하
8957	grill	n. *석쇠*	\N	\N	\N	suneung	하
9474	evolve	v. *발전하다	\N	\N	\N	suneung	하
9558	merchandise	n. (집합적) *상품*	\N	\N	\N	suneung	하
9314	patron	n. *후원자	\N	\N	\N	suneung	하
9347	collective	a. *집합적인	\N	\N	\N	suneung	하
9624	radius	n. *반지름*	\N	\N	\N	suneung	하
9369	indispensable	a. *필수 불가결한*	\N	\N	\N	suneung	하
9424	brisk	a. *활발한	\N	\N	\N	suneung	하
9434	v. *가렵다	* (~하고 싶어) 못 견디다	\N	\N	\N	suneung	기타
9619	meek	a. *얌전한	\N	\N	\N	suneung	하
9757	reluctant to Root	마지못해서 하다	\N	\N	\N	gtelp	기타
12104	ทั้งสวยทั้งเก่ง	151. 이쁘고도 똑똑해.	탕↗ 쑤v어이 탕↗ 껭↘ 모두, ~랑 이쁘다 모두, ~ 랑 잘한다, 능력있다	\N	\N		기타
13515	You all (everybody)	여러분	\N	\N	\N	kr-en-basic	기타
13568	Lie	거짓말	\N	\N	\N	kr-en-basic	하
13592	Do you want me to give you ...? (Informal)	... 줄까?	\N	\N	\N	kr-en-basic	기타
6543	outfit	채비; 의상 한 벌; 장비 한 벌; 마음의 준비	\N	\N	\N	gongmuwon	하
3	pattern	도안 모양	\N	\N	\N		하
43	a color photograph accompanied by a story	이야기사연 가 동반된 컬러사진 한 장	\N	\N	\N		기타
71	confident	확신하는	\N	\N	\N		하
96	safety tips	안전 충고수칙	\N	\N	\N		기타
102	chief executive officer	최고경영자	\N	\N	\N		기타
129	indifferent	무관심한	\N	\N	\N		하
136	trash	쓰레기	\N	\N	\N		하
179	be designed to Root	하도록 고안되어져 있다	\N	\N	\N		기타
206	similarly	유사하게 이와 마찬가지로	\N	\N	\N		하
222	yet	그러나 그럼에도 불구하고	\N	\N	\N		하
253	all of a sudden	갑자기	\N	\N	\N		기타
262	passerby	지나가는 사람 행인	\N	\N	\N		중
287	scare away	겁주어 ㅉㅗㅈ아내다	\N	\N	\N		기타
297	Trans fat	트랜스 지방	\N	\N	\N		기타
338	sympathy pl	동정 헤아림 종종 조위 문상 위문	\N	\N	\N		기타
353	bouquet	부케	\N	\N	\N		하
383	longdistance	장거리	\N	\N	\N		중
413	experience	경험하다	\N	\N	\N		하
476	respond	반응하다	\N	\N	\N		하
490	even though	비록 일지라도	\N	\N	\N		기타
553	even though	비록 일지라도	\N	\N	\N		기타
583	straw	짚 밀짚	\N	\N	\N		하
635	originally	원래	\N	\N	\N		하
649	literally	글자 뜻대로 사실상	\N	\N	\N		하
667	opinion	의견	\N	\N	\N		하
681	physically	물리적으로 육체적으로	\N	\N	\N		하
715	define	정의하다	\N	\N	\N		하
722	as follow	다음과 같이	\N	\N	\N		기타
763	dropout	낙제하다 실패하다	\N	\N	\N		하
771	lack	부족하다	\N	\N	\N		하
788	First Lady	영부인	\N	\N	\N		기타
16073	run	v . 진행 [ 계속 ] 되다 . 제공 되다 ; 운영 하다 ( 기계 ) 돌아가다	\N	\N	\N	toeic	하
16650	furnish	v . ( 가구 를 ) 비치 하다	\N	\N	\N	toeic	하
16606	post	v . ( 안내문 등 을 ) 게시 ( 공고 ] 하다 . 불이다 . ( 편지 / 우편물 을 ) 부치다 . 발송 하다 n . 직책 : 기둥 : 우편 ( 물 )	\N	\N	\N	toeic	하
3371	accountable	책임이 있는	\N	\N	\N	toefl	하
3428	alleged	a. (증거없이) 주장된	\N	\N	\N	toefl	하
11951	ทำอะไรอย่	1.뭐하는 중이야.	(탐 아↘라이 유우↘)	\N	\N		기타
11952	ทำไมถึงไม่ไป	2.왜 안가.	탐마이   틍v   마＾이 빠이	\N	\N		기타
11953	เดี๋ยวก่อน	3. 잠깐만 기다려	디여v우 꺼언↘ 잠깐        before	\N	\N		기타
11954	แป๊บนึง	4.잠깐만.	(뻽↗ 능)	\N	\N		기타
11955	ว่าไง	5.뭐라고 말할건 데	(와＾아 응아이)	\N	\N		기타
11956	อะไรยังเงี้ยะ	6. 이게 뭐야 ? 어떻게 된거야 ?	(아↘라이 양이야↗)	\N	\N		기타
11957	ทำปุ๊บเสร็จปั๊บ	7.하는 대로, 끝난다.	(탐뿝↗ 쎗↘빱↗)	\N	\N		기타
11958	มันไม่คุ้ม	8.수지가 안 맞아.	(만 마＾이 쿰↗)	\N	\N		기타
11959	พอได้	9.쓸만해.	(퍼어 다＾이)	\N	\N		기타
11960	พอดีเจอกันเขา	10.그사람이랑 우연히 딱 마주쳤어.	(퍼어디 쩌어 깐 카오↗)	\N	\N		기타
11961	ทำไปเลย	11.하던 일 계속해./가서 일해.	(탐 빠이 러이)	\N	\N		기타
11962	สวยขึ้น	12.더 예뻐졌는 데.	(쑤v어이 큰＾)	\N	\N		기타
11963	แล้วเจอกัน	13.다음에 봐.	(래우↗쩌어 깐)	\N	\N		기타
11965	อะไรนะ	15.뭐라고 ?	(아↘라이 나↗)	\N	\N		기타
11966	พาเพื่อนไปเลี้ยง	16.친구 데려가서 대접했어.	(파아 프＾안 빠이 리앙↗)	\N	\N		기타
11967	แถวนี้มีของอร่อย ๆ	17.이 근방은 맛있는 것들이 많아.	(태v우 니이↗ 미이 커v엉 아↘러이 아↘러이)	\N	\N		기타
11968	ลองใส่ดู	18.한번 입어 봐.	(러엉 싸이↘ 두우)	\N	\N		기타
11969	แล้วไง	19.그래서 ?/더 말해 봐.	(래우↗ 응아이)	\N	\N		기타
11970	หิวจะตายอย่แล้ว	20.배고파 죽겠어.	(히v우 짜 따이 유우↘ 래우↗)	\N	\N		기타
11972	ขอ เข้า ห้องน้ำก่อน	22. 내가 먼저 화장실 좀 쓸께.	(커v어  카＾오  허＾엉남 ↗ 꺼언↘) ~ 해 달라 들어가다 화장실 먼저	\N	\N		기타
11973	เดี๋ยวมา	23. 곧 올게.	(디여v우 마) 곧  오다	\N	\N		기타
11974	หยุดกลางทาง	24. 길 가운데서 멈췄다.	(윳↘ 까앙 타앙) 멈추다 가운데 길	\N	\N		기타
11975	ไม่ถือ	25. 신경 안써.	마＾이 트v으 아니다 (손에)잡다, 가지다, 유지하다, 간주하다, 마음에 두다, 걱정하다	\N	\N		기타
11976	เขา พูด ภาษา พื้น ๆ	26. 그는 쉬운 말로 얘기해.	카오↗ 푸＾웃 파아싸v아 프은↗ 프은↗ 그 말하다 언어, 말 기초적인	\N	\N		기타
11977	ทำไป เรื่อย ๆ	27. 계속 하세요.	탐 빠이 르어＾이 르어＾이 하다 앞에 나와 있는 동사의 계속 계속, 조금씩	\N	\N		기타
11978	มันยังไง กัน	28. 그게 다 뭐야 ?	만 양아이 깐 그것 어떻게 서로, 함께	\N	\N		기타
11979	เราจะเหมารถไป	29. 차하고 기사랑 함께 렌트하려구요.	라오 짜 마v오 롯↗ 빠이 우리 할것이다 (통째로) 빌리다 차 앞의 동사의 계속	\N	\N		기타
11980	ผมเป็นหนี้บุญคุณเขา	30. 저는 그분에게 은혜를 입었습니다.	폼v 뻰 니＾이분쿤 카오↗ 저 이다 은혜 그	\N	\N		기타
11981	ขอเป็นโอกาสห้นา	31. 다음 기회로 미룰께요.	커v어 뻰 오오까앗↘ 나＾아 요구하다, 바라다 로서 기회 다음	\N	\N		기타
11982	เรา ได้ กำไร	32.우리는 이익이야.	라오 다＾이 깜라이 우리 얻다 이익	\N	\N		기타
11986	ไม่มี ประโยชน์	36.소용 없어. / 쓸모 없어	마＾이 미이 쁘라요＾옷 아니다 있다 쓸모, 효과	\N	\N		기타
11988	คนใจดำ	38. 잔인한 (인정머리없는) 사람이야.	(콘 짜이 담) 사람 마음 검다	\N	\N		기타
11990	เขา ถูก เมียทิ้ง	40. 그는 아내에게 버림받았다.	카오↗ 투욱↘ 미아 팅↗ 그  당하다   부인 버리다	\N	\N		기타
11992	เผลอ ไม่ได้	42.부주의해선 안 돼.	플v르ㅓ   마＾이 다＾이 부주의하다 ~ 아니다 ~ 할수 있다	\N	\N		기타
11994	ขอหลับแป๊บนึง	44.잠깐만 눈좀 붙일께요.	커v어   랍↘ 뺍↗능 ~해 주세요 눈을 감다, 자다 잠깐	\N	\N		기타
11996	โอ้โห	46. 와아 !/ 오오 !	오＾오 호v오 와아 ! / 오오 !	\N	\N		기타
11998	เอาไปซ่อนไว้ไหน	48.어디다 숨겨 놨어 ?	아오 빠이 써＾언 와이↗ 나v이 가지다, 소지하다 가다 숨기다 ~ 해 두다 어디	\N	\N		기타
12000	ขอที เถอะ	50.제발 그만이요.	커v어 티이 트ㅓ↘ 요구하다, 부탁하다 ~ 번, 시기 ~ 라, ~ 자, ~ 요 부탁이니까 그만둬 주기를 요구하다	\N	\N		기타
12002	บอก ตรง ๆ	52.까놓고 얘기할께.	버억↘   뜨롱뜨롱 이야기하다 곧이곧대로, 있는대로	\N	\N		기타
12004	เขาหนี ไปแล้ว	54.그는 이미 도망쳤어.	카오↗ 니v이 빠이 래우↗ 그 도망치다 가다 이미	\N	\N		기타
12008	มันไร้ สาระ	58.그건 넌센스야.	만 라이↗ 싸v아 라↗ 그것 ~ 이 없다 내용	\N	\N		기타
12010	มันไม่เหมือนแต่ก่อน	60.그건 전과 같지 않은 데.	만 마＾이 므v언 때애↘ 꺼언↘ 그것 아니다 같다 ~부터, ~에서 전, 지나간 이전에는, 옛날에는	\N	\N		기타
12012	เดี๋อว ก็รู้	62.곧 알게 될거야.	디여v우 꺼＾ 루우↗ 곧   ~ 하면 알다	\N	\N		기타
12014	มันเป็นเรื่องใหญ่	64.그거 큰일인 데.	만 뻰   르＾앙 야이↘ 그것 ~ 이다 일, 이야기 크다	\N	\N		기타
12016	รับรองทำได้	66.된다는 걸 보장할께.	랍↗ 러엉 탐 다＾이 보장하다 하다 할 수 있다	\N	\N		기타
12018	เรื่องนี้ผมถนัด	68.이 일은 내가 익숙해.	르＾앙 니이↗ 폼v 타낫↘ 일, 이야기 이 나 능숙하다, 숙달되다	\N	\N		기타
12020	ไปแป๊บเดียวก็ถึง	70.조금만 가면 도착해.	빠이 뺍↗ 디여우 꺼＾ 틍v 가다 잠깐 하나의 ~ 하면 도착하다	\N	\N		기타
12022	ค่อยยังชั่ว	72.(병세가) 많이 나아졌어.	커＾이 양 추＾아 슬슬, 점점 아직도, 계속 시종, 내내, 기간	\N	\N		기타
12024	ขึ้น รถ	74.차에 타다	큰＾  롯↗ 타다 차	\N	\N		기타
12026	จ้าง ก็ ไม่บอก	76.뭐라 해도 말 안할 거야.	짜＾앙 꺼＾ 마＾이 버억↘ 고용하다 ~ 해도 아니다 말하다	\N	\N		기타
12028	คืออย่างงี้นะ	78.말하자면 이런 거야.	크으 야앙↘ 이이↗ 나↗ 즉, 말하자면 ~ 처럼, ~ 같이 이 ~ 야, ~ 요	\N	\N		기타
12030	ขับรถปาดซ้ายปาดขวา	80.왼쪽 오른쪽 왔다갔다 끼어들면서 운전하다	캅↘ 롯↗ 빠앗↘ 싸이↗ 빠앗↘ 콰v아 운전하다 차 깎아내다 왼쪽 깎아내다 오른쪽	\N	\N		기타
12032	ทุกซอก ทุกมุม	82.구석구석	툭↗ 써＾억 툭↗ 뭄 모든 틈새, 골목 모든 구석, 모서리	\N	\N		기타
12034	นั่นน่ะสิ	84.너에게 동의해. (그것 봐.)	난＾ 나＾ 씨↘ 그것 ~ 요 ~ 해 (명령, 강조)	\N	\N		기타
12036	ตกลงเอายังงี้	86.이렇게 하는 걸로 하자.	똑↘롱   아오   양 이이↗ 결정하다, 동의하다 사용하다, 이용하다 이렇게	\N	\N		기타
12038	มี ข้อแลกเปลี่ยน	88. 바꿔야 할 항목이 있어.	미이 커＾어   래＾액 쁘리↘얀 있다 사항, 항목 교환하다, 바꾸다	\N	\N		기타
12040	ความฝัน ที่ เป็นจริง	90.실현된 꿈.	콰암환v 티＾이 뻰 찡 꿈 ~ 인, ~ 한 ~ 되다 진짜	\N	\N		기타
12042	คุณทำไปได้ยังไง	92.당신 어떻게 그 일을 했어요 ?	쿤 탐 빠이 다＾이 양아이 당신 하다 동작의 계속 할 수 있다 어떻게	\N	\N		기타
12044	ช่าง มัน	94.그냥 둬, 내버려 둬.	차＾앙   만 무관심하다, 방치하다, 마음대로 하다 그것	\N	\N		기타
12046	ต้องดีแน่ ๆ	96.확실히 좋을 거야.	떠＾엉   디이 내＾애 내＾애 일치하다, 명중하다, ~ 해야 한다 좋다 정말, 반드시	\N	\N		기타
12048	ไม่นึกเลยว่าเป็นคุณ	98.당신 일줄은 전혀 생각도 못했어.	마＾이 늑↗ 르ㅓ이 와＾아 뻰 쿤 아니다 생각하다 전혀, 절대로 ~ 라고 이다 당신	\N	\N		기타
12050	เขา นอกใจเมีย	100.그는 아내로부터 마음이 떠났다.	카오↗ 너＾억 짜이 미아 그 밖에   마음 부인 (부부중 한 쪽이) 변심하다	\N	\N		기타
12052	เป็นแรง จูงใจ	102. 흡입력(유인, 끌림)이 있어.	뻰   래앵 쭈웅짜이 ~ 이다 힘, 능력 유인하다, 권유하다	\N	\N		기타
12054	มัวแต่ ทำงาน	104. 일밖에 안 해.	무어 때애↘   탐 응안 (무턱대고) ~ 하고 있을 뿐이다 하다 일	\N	\N		기타
12056	ยิ่งกว่านั้น	106. 그보다 더 (그이상).	잉＾   꽈아↘   난↗ 더욱 더, 점점 ~ 보다.~이상으로 그것	\N	\N		기타
12058	หาย ไปไหนหมด	108. 다 어디로 사라졌어 ?	하v이   빠이 나v이 못↘ 사라지다, 없어지다 동작의 지속 어디로 모두, 전부	\N	\N		기타
12062	ดีพอ รึยัง	112. 충분히 좋아 안좋아 ?	디이 퍼어 르양 좋다 충분하다 ~ 인가요 아닌가요 ?	\N	\N		기타
12064	จะเป็น กำลังใจให้ คุณ	114. 당신에게 힘이 될께요.	짜   뻰 깜랑짜이 하＾이 쿤 ~ 할 것이다 ~ 이다 정신력, 사기 ~ 에게 당신	\N	\N		기타
12066	รวม หัวกัน โกง	116. 함께 작당해서 속였어.	루엄   후v아 깐   꼬옹 모으다 머리 함께 속이다 머리를 맞대고 함께 행하다, 연합하다	\N	\N		기타
11987	ใครบอก	37. 누가 그래 ?	크라이 버억↘ 누구 말하다	\N	\N		기타
11989	อย่าหลอกกันนะ	39. 날 속이지 마.	(야아↘ 러억↘ 깐 나↗) 하지 마라 속이다 서로, 동시에 ~구요	\N	\N		기타
11991	ทำไป ทำไม	41.왜 그걸 하고 있어 ?	탐 빠이   탐마이 하다 앞의 동작을 계속 하다 왜	\N	\N		기타
11993	หมดตัวแล้ว	43. 난 빈털털이야.	못↘   뚜아   래우↗ 다하다, 없어지다 자기, 몸, 수 이미	\N	\N		기타
11995	รู้แล้วล่ะ	45.이제 알겠어요.	루우↗ 래우↗ 라＾ 알다 이미, 벌써 ~ 죠, ~ 라	\N	\N		기타
11999	อยากลองดี	49.한번 해 보고 싶어.	야악↘ 러엉   디이 하고싶다 한번 해보다 좋다 정말로 좋은지 나쁜지 시험해 보다	\N	\N		기타
12001	อย่าย่ง ได้ มั้ย	51.신경 좀 안 써줄 수 있니 ?	야아↘ 융＾   다＾이 마이↗ ~ 하지마라 혼란하다, 바쁘다 할 수 있다 ~ 요 ?	\N	\N		기타
12003	ขับรถ เมา	53.음주운전하다	캅↘   롯↗ 마오 운전하다 차 취하다	\N	\N		기타
12005	คุณ นอน ละเมอ	55.당신은 자면서 잠꼬대한다.	쿤 너언 라↗머어 당신 자다, 눕다 잠꼬대하다, 망상하다	\N	\N		기타
12007	อย่างอนไปหน่อย เลย	57.너무 삐지지좀 마.	야↘ 우언 빠이 너이↘ 러이 ~ 하지마라 토라지다 앞의 동작의 계속 좀 전혀, 완전	\N	\N		기타
12009	เขาดวง ไม่ดี	59.그는 운이 안 좋아.	카오↗ 두엉 마＾이 디이 그 운 아니다 좋다	\N	\N		기타
12011	คุณเอาแต่ใจตัว เอง	61.당신은 제 멋대로 한다.	쿤 아오 때애↘ 짜이 뚜아 에앵 당신 원한다 단지 마음 몸 자기의,제멋대로 하다	\N	\N		기타
12013	สมน้ำหน้า	63.쌤통이다, 꼴좋다	쏨v 남↗ 나＾아 적합하다 얼굴, 안면 (비꼼, 혐오의 감정)	\N	\N		기타
12015	บอกแล้วไง	65.이미 말했잖아.	버억↘ 래우↗ 응아이 말하다 이미 어때 ? 어째 ?	\N	\N		기타
12019	ไม่ ได้พูดเล่น	69.농담이 아냐.	마＾이 다＾이 푸＾웃 레＾앤 아니다 했다 말하다 장난하다,농담하다	\N	\N		기타
12021	เขาเอาตัวไม่รอด	71.그는 몸을 피할 수 없었어.	카오↗ 아오 뚜아 마＾이 러＾엇 그 가지고 가다 몸 아니다 면하다, 피하다	\N	\N		기타
12023	เชื่อใจ ได้	73. 믿을 수 있어.	츠＾아 짜이 다＾이 믿다   할 수 있다	\N	\N		기타
12025	ไม่ต้อง แล้ว	75.이젠 필요 없어	마＾이 떠＾엉 래우↗ 아니다 ~ 해야 한다 이미	\N	\N		기타
12027	จริง หรือเปล่าก็ไม่ รู้	77.진짠지 아닌 지 몰라.	찡 르v 빠오 꺼＾   마＾이 루우↗ 진짜 또는 아니다 ~ 해도, ~ 하면 아니다 알다	\N	\N		기타
12029	คอยดูก็แล้วกัน	79.조금만 기다려 보자.	커이 두우 꺼＾ 래우↗ 깐 기다리다 보다 (~ 하도록) 합시다	\N	\N		기타
12031	เขาถังแตก	81.그는 빈털털이다.	카오↗ 탕v 때액↘ 그 (물)통 깨지다 매우 가난하다, 돈이 없다	\N	\N		기타
12033	เป็นไปได้ยังไร	83.어떻게 그렇게 될 수 있어 ?	뻰   빠이   다＾이 양라이 ~ 이다, ~ 되다 앞동작의 계속 할 수 있다 어떻게 진행되다, 경과하다	\N	\N		기타
12035	เกิดมาจน	85.가난하게 태어났어.	끄ㅓㅅ ↘ 마아 쫀 태어나다 동사의 지속적 상태 가난하다	\N	\N		기타
12037	ไม่ใช่ เรื่องเลวร้าย	87.나쁜 일이 아냐.	마＾ 이 차＾ 이 르＾ 앙 레우라이↗ 아니다   일, 이야기 나쁘다	\N	\N		기타
12039	เรารู้จักกันมาก่อนรึเปล่า	89.우리 전에 알던 사이 아닌가 ?	라오 루우↗ 짝↘ 깐 마아 꺼언↘ 르↗ 빠오↘ 우리 알고 있다 서로 동사의 지속적 상태 전에 ~ 인가 아닌가	\N	\N		기타
12041	ไม่ ทำเด็ดขาด	91.절대로 그 일 안 해.	마＾이 탐 뎃↘ 카앗↘ 아니다 하다 절대로, 전혀	\N	\N		기타
12043	เจอกันชาติ หน้า	93.다음 생애에 만나.	쯔ㅓ어 깐 차＾앗 나＾아 만나다 같이 인생, 삶 다음의	\N	\N		기타
12045	ทีหลังอย่า ทำ	95.다음 번에는 하지 마.	티이   랑v 야아↘ 탐 ~ 번, ~ 차례 뒤의, 다음의 하지 마라 하다	\N	\N		기타
12047	เขาไม่ยอมกิน	97.그는 먹으려고 하지 않아.	카오↗ 마＾이 여엄   낀 그 아니다 동의하다, 허락하다 먹다	\N	\N		기타
12049	หา ไม่ ได้ ง่าย ๆ	99.찾기가 쉽지 않아.	하v아 마＾이 다＾이 응＾아이 응＾아이 찾다   아니다 할 수 있다 쉽다	\N	\N		기타
12051	เขาชอบพูด เพ้อเจ้อ	101. 그는 쓸데없는 말을 잘 해.	카오↗ 처＾업 푸＾웃 프ㅓ↗ 쯔ㅓ＾ 그 좋아하다 말하다 쓸데없는 소리를 지껄이다	\N	\N		기타
12053	เชิญนั่งก่อน	103. 먼저 앉으시죠.	츠ㅓㄴ   낭＾   꺼언↘ ~ 하세요 앉다 먼저	\N	\N		기타
12055	มัน คนละ เรื่อง	105. 그건 다른 이야기야.	만 콘 라↗   르＾앙 그것 사람 ~ 마다 이야기	\N	\N		기타
12057	เสียเวลา	107. 시간낭비야.	씨v아   웨라 잃다, 낭비하다 시간	\N	\N		기타
12059	มา ถึงแล้ว	109. (와서) 도착했어.	마아 틍v   래우↗ 오다 도착하다 이미, 벌써	\N	\N		기타
12061	เที่ยวบินขาออก	111. 출국 비행기편	티＾여우 빈 카v아 어억↘ (교통) 편 날다 나가다, 수출하다	\N	\N		기타
12063	ยังไงก็แล้วแต่	113. 어쨌든, 좌우간	양아이 꺼＾ 래우↗ 때애↘ 어떻게 ~ 해도, ~ 하면 ~ 에 달려 있다	\N	\N		기타
12065	พยายาม อยู่	115. 노력하고 있어.	파야아야암 유우↘ 노력하다 ~ 하고 있다	\N	\N		기타
12067	เขา ไม่ยอมรับ	117. 그는 수락 (인정) 하지 않아.	카오↗ 마＾이 여엄랍↗ 그 ~ 아니다   인정하다, 수락하다	\N	\N		기타
12069	อย่าหู เบา	119. 너무 쉽게 믿지 마.	야아↘   후v우 바오 ~ 하지 마라 귀 가볍다 다른 사람의 말을 잘 믿다	\N	\N		기타
12159	กิอะไรก็ได้	뭘 먹어도 좋아요.	(낀 아라이 꺼＾ 다이＾)	\N	\N		기타
12072	คุณเข้าใจผมผิด	122. 당신은 저를 오해했어요.	쿤 카＾오  짜이 폼v   핏↘ 당신 들어가다 마음 저 (남성) 틀리다	\N	\N		기타
12074	คุณมาทำอะไรที่นี่	124. 당신 여기서 뭐 해요 ?	쿤 마아  탐 아라이 티＾이 니＾이 당신 현재까지 지속 하다 무엇 ~ 에 이것 ,여기에	\N	\N		기타
12076	แล้วแต่ คุณ	126. 당신에게 달려 있어요.	래우↗ 때＾애 쿤 ~ 에 달려 있다 당신	\N	\N		기타
12078	โง่เหมือนควาย	128. 물소처럼 멍청해.	옹＾오 므v안   콰이 멍청하다 ~ 처럼, ~ 같이 물소	\N	\N		기타
12080	ไม่เอาได้มั้ย	130. 원치 않아요.	마＾이 아오 다＾이 마이↗ ~아니다 원하다 ~할 수 있다 ~인가요 ?	\N	\N		기타
12082	ไม่เอาครับ	원치 않아요.	접대성 멘트 : (마＾이 아오 캅↗)	\N	\N		기타
12084	เดี๋ยวอย่างนี้เดี๋ยวอย่างนั้น	131. 이 순간은 이렇게, 저 순간은 저렇게.	디v여우 야앙↘ 니이↗ 디v여우 야앙↘ 난↗ 순간, 잠시 ~ 처럼 이 순간, 잠시 ~ 처럼 그	\N	\N		기타
12086	รอ เดี๋ยวนะ	133. 잠시만 기다려.	러어 디v여우 나↗ 기다리다 잠시 ~ 요	\N	\N		기타
12088	จะไปส่งคุณ ที่ รถ	135. 당신을 차있는 데까지 바래다 줄께요.	짜 빠이 쏭↘ 쿤 티＾이 롯↗ ~할것이다 가다 보내다 당신 ~ 에 차	\N	\N		기타
12090	ช่วยฝากให้ เขา ด้วย	137. 그에게 이걸 좀 전해 줘.	추＾어이 화악↘ 하＾이 카오↗ 두＾어이 도와주다 맡기다 ~ 에게 그 ~ 해 주세요	\N	\N		기타
12092	กรรม ตาม สนอง	139. 업보 (불행) 가 뒤따르다.	깜 따암 싸↘너v엉 업보, 불행 따라오다 보답하다, 부응하다	\N	\N		기타
12094	หันมานี่หน่อย	141. 조금만 이쪽을 봐주세요.	한v 마아   니＾이   너이↘ 향하다  오다 , 지속되는 상태 이것, 여기 좀, 약간	\N	\N		기타
12096	คิด ออกรึยัง	143. 생각났어요 안 났어요 ?	킷↗ 어억↘   르↗양 생각하다 나오다 ~ 인가요 아닌가요 ?	\N	\N		기타
12098	เขาเป็นนายหน้า	145. 그는 중개인이야.	카오↗ 뻰   나이 나＾아 그   ~ 이다 중개인	\N	\N		기타
12100	เรื่อง มันเป็นยังงี้	147. 얘기가 이렇게 된거야.	르＾앙 만 뻰   양 이이↗ 이야기, 일 그것 ~ 이다 이렇게	\N	\N		기타
12102	พูดจา น่ารัก	149. 귀엽게 말하다	푸＾웃 짜아 나＾아 락↗ 말하다 말하다 ~ 할만한 사랑하다	\N	\N		기타
12106	โสดแต่ไมสด	&ldquo;독신이지만 처녀나 총각이 아니다&rdquo;	(쏘옷↘ 때애↘ 마＾이 쏫↘)	\N	\N		기타
12108	ไม่มีเงินดาวน์	154. 인도금이 없어.	마＾이 미이 응언 다우 아니다 있다 돈 계약금(선불)로 지불하다 할부금의 첫 지불액 (차 살 때의 인도금)	\N	\N		기타
12110	ไม่ดีมั้ง	156. 좋은 생각이 아닌 걸.	마＾이 디이 망↗ 아니다 좋다 ~ 일 걸 (불확실함, 상상, 추측) (끄라망) 의 줄임말	\N	\N		기타
12112	เอาใจเก่ง	158. 잘 돌보고 관심 써 줘.	아오 짜이   껭↘ 관심쓰다, 비위 맞추다 ~ 을 잘한다	\N	\N		기타
12114	พูดไม่ออก	160. 말이 안 나와.	푸＾웃 마＾이 어억↘ 말하다 아니다 나오다	\N	\N		기타
12116	ดูไม่ออก	보긴 보는 데 뭔지 잘 구분 못할 때	(두우 마＾이 어억↘)	\N	\N		기타
12118	อะไรนะ		(아라이 나↗) 와 쌍벽을 이룬다	\N	\N		기타
12120	อย่าให้ จับ ได้	162. 잡히지 마.	야아↘ 하＾이 짭↘ 다＾이 ~ 하지 마 ~ 하게 잡다 ~ 할 수 있다	\N	\N		기타
12122	ผม ไม่ค่อยถนัด	164. 저는 능숙치 않아요.	폼v 마＾이 커＾이 타↘낫↘ 저 그다지 ~ 아니다 능숙하다, 숙련되다	\N	\N		기타
12126	ไม่น่ากิน	먹음직스럽지 않은 데	(마＾이 나＾아 낀)	\N	\N		기타
12128	ไม่น่าฟัง	들을만 하지 않아	(마＾이 나＾아 황)	\N	\N		기타
12130	ตายแล้ว	169. 이런 ! (Oh, my God !)	따이 래우↗ 죽다 이미, 벌써	\N	\N		기타
12132	พูดดัง ๆหน่อย	171. 좀 크게 말해 줘.	푸＾웃 당당 너이↘ 말하다 (소리가) 크다 좀, 약간	\N	\N		기타
12134	มี ลางสังหรณ์	173. 뭔가 조짐이 있어.	미이 라앙 쌍v헌v 있다 조짐, 징조 예감이 들다	\N	\N		기타
12136	ได้ยินกับหู	1) 귀로 직접 들었어.	(다＾이 인 깝↘ 후v우)	\N	\N		기타
12138	มี เยอะแยะ	175. 굉장히 많아.	미이 으ㅕ↗ 얘↗ 있다 많다, 충분히 있다 매우 많다, 잔뜩	\N	\N		기타
12140	บิ๊กซิ	Big-C	(빅↗ 씨)	\N	\N		기타
12142	เทสโก้ โลตัส	Tesco Lotus	(테쓰꼬＾오 로오땃↘ 이지만 다들 줄여서 &ldquo; 로오땃↘ &rdquo; 이라고 함)	\N	\N		기타
12144	โพรโมชั่น	프로모션	이러한 마트에서 프로모션 (โพรโมชั่น : 프로오 모오 찬＾) 행사할 때, 사용하는 문구중의 하나가 바로,	\N	\N		기타
12146	มา ไม้ไหน	177. 어떤 수단 (수법) 을 쓴거야 ?	마아 마이↗ 나v이 현재까지 지속되는 상태 나무, 수단, 수법, 꼬치를 세는 말 어느	\N	\N		기타
12148	อยากเจ็บตัว รึไง	179. 다치고 싶어 ?	야악↘  쩹↘   뚜아 르↗ 응아이 ~ 하고 싶다, 바라다 아프다, 병들다 몸 ~ 인거야 ?	\N	\N		기타
12150	คุณไม่ยอมไป	당신은가지 않으려고 한다.	(쿤 마＾이 여엄 빠이)	\N	\N		기타
12152	จับตัวคาที่	현장에서 붙잡다	(짭↘ 뚜아 카아 티＾이) =	\N	\N		기타
12154	อยู่กันพร้อมหน้าพร้อมตา	183. 다들 여기 있었네.	유우↘ 깐 프럼↗   나＾아   프럼↗ 따아 있다 함께 한꺼번에, 동시에 얼굴 한꺼번에, 동시에 눈	\N	\N		기타
9	blessing phrase	축복을 비는 문구	\N	\N	\N		기타
12073	อีกสัก ครู่	123. 잠시후에.	이익↘ 싹↘  크루＾우 다시, 또, 다른, 더 ~ 만큼, ~ 정도 잠시, 잠깐	\N	\N		기타
12075	ในที่สุดเขา ก็ โทรมา	125. 마침내 그가 전화했다.	나이 티＾이 쑷↘ 카오↗ 꺼＾ 토오 마아 마침내  그 ~ 하면, ~ 해도 전화하다 오다	\N	\N		기타
12077	ฉัน ไม่พอใจคุณ	127. 난 당신이 (한 일이) 만족스럽지 않군요.	찬↗ 마＾이 퍼어 짜이 쿤 나 ~ 아니다 만족하다 당신	\N	\N		기타
12079	คิดมากไป รึเปล่า	129. 너무 깊게 생각하는 거 아니예요 ?	킷↗ 마＾악 빠이 르↗ 빠오↘ 생각하다 많이 상태의지속 ~인가요 아닌가요 ?	\N	\N		기타
12081	ไม่เอาเลย	원치 않는다니까.	싸가지 없게 :  (마＾이 아오 르ㅓ이)	\N	\N		기타
12083	ไม่เอาได้มั้ยครับ	원치 않아도 되나요 ?	싸가지 있게 :  (마＾이 아오 다＾이 마이↗ 캅↗ )	\N	\N		기타
12087	มาทำงานสาย	134. 일하러 늦게 오다. (직장에 지각하다.)	마아 탐응안 싸v이 오다 일하다 늦다	\N	\N		기타
12089	รับรองคุณต้อง ชอบ	136. 당신이 이걸 좋아하리라 보장해요.	랍↗ 러엉   쿤 떠＾엉   처＾업 보증하다, 증명하다 당신 적중하다, ~ 에 맞다 좋아하다	\N	\N		기타
12091	ไปตามเขามา	138. 가서 그를 불러 와.	빠이 따암 카오↗ 마아 가다 불러오다 그 오다	\N	\N		기타
12093	ถอยไป	140. 물러서.	터v이   빠이 뒤로 물러나다, 철수하다 앞동작의 계속됨, 말하는 사람으로부터 멀어져 가는 것을 뜻함.	\N	\N		기타
12095	มานี่ ได้ ยังไง	142. 어떻게 여기에 왔나요 ?	마아 니＾이 다＾이   양아이 오다 이것, 여기 ~ 할 수 있다 어떻게	\N	\N		기타
12097	ออกไป เดี๋อวนี้	144. 당장 여기서 나가 !	어억↘ 빠이 디v여우 니이↗ 나가다 가다 지금, 당장	\N	\N		기타
12099	หมั่นไส้	146. 싫어, 미워, 불쾌해.	만↘   싸＾이 부지런하다, 애쓰다 내장, 실정, (만두) 속, 가족같은 사람 싫어하다, 미워하다	\N	\N		기타
12101	ผมผิดเอง	148. 제가 잘못한 거에요.	폼v 핏↘ 에앵 저 잘못하다 자신의, 스스로	\N	\N		기타
12103	รัก จริง หวังแต่ง	150. 진짜로 사랑하고, 결혼하고 싶어.	락↗ 찡  왕v   때앵↘ 사랑하다 진짜로 희망하다 결혼하다	\N	\N		기타
12105	ผม ซื้อเงินสด	152. 나는 현찰로 샀어.	폼v 쓰으↗ 응언 쏫↘ 나 사다 돈 싱싱하다, 현금의, 순결하다,현찰 สด (쏫↘ : 순결하다) 과 โสด (쏘옷↘ : 독신의, 씽글) 의 단음 /오/ 와 장음 /오오/ 를 꼭 구별하자.	\N	\N		기타
12107	เขาซื้อเงินผ่อน	153. 그는 할부로 샀어.	카오↗ 쓰으↗ 응언 퍼언↘ 그 사다 돈 분할로 지불하다, 긴장을 풀다	\N	\N		기타
12109	รอด ตัว ไป	155. 위험에서 벗어났어 (휴, 살아났어 의 느낌)	러＾엇   뚜아 빠이 (위험에서) 벗어나다 몸 앞동사의 지속	\N	\N		기타
12111	เดี๋ยวอีเมล์ไป หา	157. 바로 이메일 보낼께.	디v여우 이이 메애 빠이 하v아 곧, 순간 이메일 가다 찾다	\N	\N		기타
12113	เก็บ เป็นความลับ	159. 비밀로 해 둬.	껩↘   뻰 콰암랍↗ 챙기다, 보관하다, 숨겨두다 ~ 으로 비밀	\N	\N		기타
12115	คิดไม่ออก	&ldquo;생각이 안 나&rdquo;	(킷↗ 마＾이 어억↘)	\N	\N		기타
12117	ฟังไม่ออก	듣긴 듣는 데 뭔소린지 잘 모를 때	(황 마＾이 어억↘)	\N	\N		기타
12119	ไม่มีกำลัง เลย	161. 힘이 하나도 없어.	마＾이 미이 깜랑 르ㅓ이 아니다 있다 힘, 기운 전혀, 절대로	\N	\N		기타
12121	รักแรก พบ	163. 첫눈에 반했어.	락↗   래＾액 폽↗ 사랑하다 처음 만나다	\N	\N		기타
12123	หุบ ปาก	165.닥쳐 !	훕↘ 빠악↘ 다물다, 접다 입	\N	\N		기타
12125	ไม่น่าดู	167. 볼만 하지 않아.	마＾이 나＾아 두우 ~아니다 ~ 할만한 보다	\N	\N		기타
12127	ไม่น่าอย่	있을만 하지 않아	(마＾이 나＾아 유우↘)	\N	\N		기타
12129	มาเป็น เพื่อนคุณ	168. 당신과 길동무하려고 왔어요.	마아 뻰   프＾안 쿤 오다 ~ 로서 친구 당신	\N	\N		기타
12131	หูอื้อ	170. 귀가 먹먹해.	후v우 으＾으 귀   귀가 울리다, 잘 안들리다	\N	\N		기타
12133	เคลียงาน อยู่	172. 일 끝내는 중이야.	클리아   응안 유우↘ clear (끝내다) 일 ~ 하고 있다	\N	\N		기타
12135	เห็นกับตา	174. 눈으로 직접 봤어.	헨v 깝↘   따아 보다 ~ 으로 직접, ~ 와 함께 눈	\N	\N		기타
12139	แถม ให้	176. 덤으로 주는 거에요.	태v앰   하＾이 덤 (경품)으로 주다, 그밖에 따로 주다	\N	\N		기타
12141	คาร์ฟูร์	Carrefour	(카아 후우)	\N	\N		기타
12143	แม็คโคร	Makro	(맥↗크로)	\N	\N		기타
12145	ซื้อ 1 แถม 1	Buy 1 Get 1 (하나 사면 하나 덤)	(쓰으↗ 능↘ 태앰 능↘) =	\N	\N		기타
12147	มิน่าล่ะ	178. 별 거 없어.	미↗   나＾아라＾ ~ 아니다 (= ไม่) ~ 할 만 하다 의문, 명령, 간청할 때 문장끝에 붙이는 말	\N	\N		기타
12151	เขาตายคาที่	181. 그는 현장에서 즉사했어	카오↗ 따이 카아   티＾이 그 죽다 딱 달라붙어 있다, 남아 있다 장소	\N	\N		기타
12153	คุณผอมเกินไป	182. 당신은 너무 말랐어.	쿤 퍼v엄 끄ㅓㄴ빠이 당신 말랐다 너무 ~ 하다, 지나치게 ~ 하다	\N	\N		기타
12155	ไม่ต้องห่วง	184. 걱정할 필요 없어.	마＾이 떠＾엉 후앙↘ ~ 할 필요 없다   걱정하다, 근심하다	\N	\N		기타
12157	ช่วยตามเขามาด้วย	186. 가서 그 사람 좀 데려 와.	추＾어이   따암 카오↗ 마아   두＾어이 ~해 주세요, 도와 주세요 불러오다 그 오다 함께 그런데, 말 짧게 하기 좋아하는 태국인들은 줄여서 ไปตามมา (빠이 따암 마아) 라고 한다	\N	\N		기타
12158	ไปไหนก็ได้	187. 어디든지 가도 좋아요.	빠이 나v이   꺼＾   다이＾ 가다 어디 ~ 해도, ~ 하면 ~ 할 수 있다	\N	\N		기타
12160	ทำยังไงก็ได้	뭘 해도 좋아요.	(탐 양아이 꺼＾ 다이＾)	\N	\N		기타
12162	คุณจะ ให้ ฉันทำ ยังไง	189. 당신은 내가 어떻게 했으면 좋겠어요 ?	쿤 짜↘ 하＾이 찬 탐 양아이 당신 ~ 할 것이다 ~하도록 나 하다 어떻게	\N	\N		기타
12164	ลืมตา	눈을 뜨다	(르음 따아) ลืม (르음) 은 &ldquo; 잊다 &ldquo; 의 뜻뿐만 아니라, &ldquo; (눈을) 뜨다 &ldquo; 의 뜻도 있으니 주의할 것	\N	\N		기타
12166	ใบเบิกเงิน	(돈을) 인출하다	(바이 브ㅓㄱ↘ 응언) = (은행의) 출금전표	\N	\N		기타
12168	หลับนก	(졸음을 참지 못하고) 앉아서 꾸벅꾸벅 졸다	(랍↘ 녹↗)	\N	\N		기타
12170	ทำแล้วดี	했더니 좋아.	(탐 래우↗디이)	\N	\N		기타
12172	แก้ผ้า	192. 옷을 발가벗다	깨＾애   파＾아 벗다, 풀다 옷감, 옷	\N	\N		기타
12174	รอด ตาย	193. 살아남았다	러＾엇   따이 (위험에서) 벗어나다 죽다	\N	\N		기타
12176	ทำแทนเขา	195. 그 사람에게 보답하려고 했어.	탐 태앤   카오↗ 하다 보답하다, ~ 대신에 그 (him)	\N	\N		기타
12178	มันก็ดี	나도 좋다고 생각해. (그건 좋아.)	(만 꺼＾ 디이)	\N	\N		기타
12180	จะ บ้าตาย	198. 미쳐 버리겠어 ! (미쳐서 죽을 지경이야 !)	짜↘   바＾아   따이 ~ 할것이다, ~ 하겠다 미치다, 정신이상이다 죽다	\N	\N		기타
12184	อย่ายุ่ง	201. 간섭 하지마. (참견 마.)	야아↘ 융＾ ~ 하지 마 혼란하다, 바쁘다	\N	\N		기타
12186	คน หลายใจ	203. 바람기 있는 사람 (변덕스러운 사람)	콘 라v이 짜이 사람 많다 마음	\N	\N		기타
12188	คุณฝีมือ ดี	205. 당신은 실력이 좋다.	쿤   휘v이 므으 디이 당신 실력, 솜씨 좋다	\N	\N		기타
12190	ห้ามจอดรถ	주차 금지	(하＾암 쩌엇↘ 롯↗)	\N	\N		기타
12192	ห้ามเลี้ยวซ้าย	좌회전 금지	(하＾암 리여우↗ 싸이↗)	\N	\N		기타
12194	ห้ามสูบบุหรี่	금연	(하＾암 쑤웁↘ 부리이↘)	\N	\N		기타
12196	เรา แย่ง กันกิน	207. 우리는 먹을 것 가지고 다투었다.	라오 얘＾앵  깐 낀 우리 탈취하다, 낚아채다 서로 먹다	\N	\N		기타
12198	ทำกับ มือ	209. 내 손으로 직접 했어.	탐 깝↘   므으 하다 ~ 을 가지고 손	\N	\N		기타
12200	ดำปิด๊ปี๋	211. 새까맣다.	(담 삣↘ 삐v이)	\N	\N		기타
12202	เหลืองอ๋อย	샛노랗다	(르v앙 어v이)	\N	\N		기타
12204	ปวดเยี่ยว	(속어) 오줌 마려워.	(뿌엇↘ 이＾여우) (속어)오줌싸다	\N	\N		기타
12206	ปัสสาวะ	소변 보다	(빳↘ 싸v아 와↗)	\N	\N		기타
12208	เด็ด ดอกไม้		เด็ด (뎃↘ : 따다, 꺾다) + ดอกไม้ (더억↘ 마이↗ : 꽃 ) = 꽃을 따다 라는 뜻 차 타고 가다가 갓길에 내려서 여자가 소변보다 여성의 숲속 방뇨(?)	\N	\N		기타
12210	ปวดขี้	(속어) 똥 마려워.	(뿌엇↘ 키＾이) (속어) 똥싸다	\N	\N		기타
12212	รอบเดือน	생리하다	(러＾업 드안) ประจำเดือน(쁘라짬 드안) periodเม็นส์ (멘) &rarr; menses 에서 유래ระดู (라↗ 두우) &rarr; 의학적 표현	\N	\N		기타
12214	นึกว่า คุณ ไม่ชอบ	213. 당신은 안 좋아한다고 생각했어.	늑↗  와＾아 쿤 마＾이 처＾업 생각하다 ~ 라고 당신 아니다 좋아하다	\N	\N		기타
12216	นึกว่าคุณโกรธผม	당신은 나한테 삐졌다고 생각했어.	(늑↗ 와＾아 쿤 끄롯↘ 폼v)	\N	\N		기타
12218	อยู่เฝ้าบ้าน	215. 집 보고 있는 중이야.	유우↘   화＾오 바＾안 있다 지키다 집	\N	\N		기타
12220	บอก แล้ว ไง	217. 내가 말했잖아.	버억↘ 래우↗ 응아이 말하다 이미 어떻게, 어때요	\N	\N		기타
12222	คุณตัวร้อน	218. 당신 열이 있어요.	쿤 뚜아 러언↗ 당신 몸 뜨겁다, 덥다	\N	\N		기타
12224	จะทำยังไง	어떻게 할거에요 ?	(짜↘ 탐 양아이)	\N	\N		기타
12226	ชอบรึไม่ชอบ	좋아해요, 안 좋아해요 ?	(처＾업 르＾ 마＾이 처＾업)	\N	\N		기타
12228	อยู่บ้านเช่า	셋집에 삽니다.	(유우↘ 바＾안 차＾오)	\N	\N		기타
12230	เวลาฉันอยากจะทำ	내가 하고 싶을 때	(웰라 폼 야악↘ 짜↘ 탐)	\N	\N		기타
12232	ขอ แก้แค้น	222. 복수할거야 !	커v어 깨＾애 캐앤↗ 바라다, 요구하다 보복하다, 앙갚음을 하다	\N	\N		기타
12236	ตายเสียแล้ว	죽어버렸어요	(따이 씨v아 래우↗)	\N	\N		기타
12238	ไม่เห็น จริง ๆ	225. 정말로 안 봤어.	마＾이 헨v 찡찡 ~ 아니다 보다 정말로	\N	\N		기타
12240	ดีขนาดนั้น เลย เหรอ	227. 정말로 그렇게 좋아 ?	디이 카↘나앗↘ 난↗ 르ㅓ이   르ㅓ 좋다 그렇게   전혀, 완전히, 확실하다 ~ 해요?	\N	\N		기타
12242	ไว้ใจไม่ได้	229. 믿을 수 (신뢰할 수) 없어.	와이↗ 짜이 마＾이 다＾이 믿다, 신뢰하다 ~ 할 수 없다	\N	\N		기타
12244	กลางวันแสก ๆ	231. 백주 대낮에	까앙 완 쌔액↘ 쌔액↘ 가운데 낮 (빛이) 비치다	\N	\N		기타
12246	สอบตก	233. 시험에 떨어지다	써업↘ 똑↘ 시험   떨어지다	\N	\N		기타
12248	ยกมือขึ้น	234. 손 들어	욕↗ 므으 큰＾ 들다 손 오르다 / 앞의 동작이 상승 또는 증대되는 것을 의미, 우리 생각으로는 ยกมือ (욕↗ 므으) 라고만 해도 손들어 의 뜻이 되지만,태국인들은 99.9 % ยกมือขึ้น (욕↗ 므으 큰＾) 이라고 말한다는 것을 주의하자.	\N	\N		기타
12163	เกือบลืม	190. 거의 까먹었어.	끄압↘   르음 거의, 하마터면 잊다, 망각하다	\N	\N		기타
12165	เบิกตาดู	눈떠봐	(브ㅓㄱ↘ 따아 두우)	\N	\N		기타
12169	คิดแล้ว กลุ้ม	191. (그 걸) 생각하면 걱정돼.	킷↗ 래우↗ 끄＾룸 생각하다 그러면, 그리고 나서 걱정하다	\N	\N		기타
12171	กินแล้วไม่สบาย	먹었더니 속이 안좋아.	(낀 래우↗ 마＾이 싸바이)	\N	\N		기타
12173	ถอดเสื้อ	옷을 벗다	(터＾엇 쓰＾아)	\N	\N		기타
12175	ว่าแล้ว เชียว	194. 나도 그렇게 생각해. (내 생각이 바로 그거야.)	와＾아 래우↗ 치여우 말하여 알게 하다 그러면, 그리고 나서 정말, 꼭 = เทียว (티여우)	\N	\N		기타
12177	มันก็จริง	196. 나도 진짜라고 생각해. (그건 진짜야.)	만 꺼＾   찡 그 (It) ~ 도, ~ 면, 그래서 진짜	\N	\N		기타
12179	ไปให้ พ้น	197. (내 눈앞에서) 사라져 ! 꺼져 !	빠이 하＾이 폰↗ 가다 ~ 하도록   벗어나다, 면하다	\N	\N		기타
12181	หน้าไปโดนอะไรมา	199. 너 얼굴이 왜 그래 ? (너 얼굴에 무슨 일이야 ?)	나＾아 빠이 도온   아라이 마아 얼굴 상태의 지속 부딪치다, 당하다 무엇 상태의 지속	\N	\N		기타
12183	ทำยังไงดี	200. 전 어떻게 해야죠 ? (전 어쩌면 좋을까요 ?)	탐 양아이 디이 하다 어떻게 좋다	\N	\N		기타
12185	เห็นใจ ผมหน่อย	202. 날 좀 동정해 줘.	헨v 짜이 폼v 너이↘ 보다 마음 나 좀	\N	\N		기타
12187	คิด จนหัวปั่น	204. 생각을 많이 해서 머리가 돌 지경이야.	킷↗ 쫀   후v아 빤↘ 생각하다 ~ 할 때까지 머리 돌다	\N	\N		기타
12189	ห้ามเข้า	206. 출입 금지 (진입 금지)	하＾암 카＾오 금지하다 들어가다	\N	\N		기타
12191	ห้ามหยุดรถ	정차 금지	(하＾암 윳↘ 롯↗)	\N	\N		기타
12193	ห้ามเลี้ยวขวา	우회전 금지	(하＾암 리여우↗ 콰v아)	\N	\N		기타
12195	ห้ามเลือด	지혈하다	(하＾암 르＾앗)	\N	\N		기타
12197	ยังไม่ ถึง เดือน	208. 아직 1 달도 안 됐어.	양 마＾이 틍v 드안 아직 아니다 도달하다 달, 月	\N	\N		기타
12199	จ่ายค่าเช่า บ้าน	210. 집세를 내다	짜이↘ 카＾아 차＾오 바＾안 지불하다 비용 빌리다 집	\N	\N		기타
12201	แดงแจ๊ดแจ๋	새빨갛다	(대앵 째앳↗ 째v애)	\N	\N		기타
12203	ปวดฉี่	212. 오줌 마려워.	뿌엇↘ 치이↘ 아프다, 통증이 있다 오줌, 오줌싸다	\N	\N		기타
12205	ชิ้งฉ่อง	(속어) 오줌 싸다	(칭↗ 처엉↘)	\N	\N		기타
12209	ปวดอึ	똥 마려워	(뿌엇↘ 으↘) 똥 싸다	\N	\N		기타
12211	อุจจาระ	대변 보다	(웃↘ 짜아 라↗)	\N	\N		기타
12213	ผ้าอนามัย	생리대	"(파＾아 아 나아 마이) ผ้า (파＾아 : 천, 옷감) + อนามัย (아 나아 마이 : 위생) (속어) 생리대 โกเต็ก (꼬오 떽↘) &rarr; Kotex 상표명에서 유래된 표현.	\N	\N		기타
12215	นึกว่าคุณจะไม่มา	당신은 안 올거라고 생각했어	(늑↗ 와＾아 쿤 짜↘ 마＾이 마아)	\N	\N		기타
12217	ไม่นานขนาดนั้น	214. 그렇게 오래 걸리지 않을 거야.	마＾이 나안 카↘ 나앗↘ 난↗ ~ 아니다 오래다, (시간이) 길다 규격, 크기,용량 그	\N	\N		기타
12219	มีเท่าไหร่เอามาให้หมด	216. 가진 것 다 내놔 !	미이   타＾오 라이↘ 아오 마아 하＾이 못↘ 가지고 있다 얼마 가지다, 휴대하다 오다 주다 전부	\N	\N		기타
12221	บอกแล้ว ไม่เชื่อ	(내가) 말했는 데, 안 믿었잖아.	(버억↘ 래우↗ 마＾이 츠＾아)	\N	\N		기타
12223	ว่าแต่ คุณล่ะ	219. 그러면, 당신은요 ?	와＾아 때애↘ 쿤 라＾ 그러면, 그런데 당신 강조를 나타내거나, ~ 라고 하면	\N	\N		기타
12225	คิดว่าดีมั้ย	좋다고 생각해요 ?	(킷↗ 와아 디이 마이↗)	\N	\N		기타
12227	ไม่อยากลองดี	220. 해보고 싶지 않아.	마＾이 야악↘ 러엉   디이 ~ 아니다 하고 싶다 해보다, 시도하다 좋다 (기량, 실력 따위가) 정말로 좋은 지 나쁜 지 시험해 보다	\N	\N		기타
12229	นี่คือใจตนเอง	내 맘이야.	(니＾이 크으 짜이 똔 애앵)	\N	\N		기타
12231	ไม่บอกก็รู้	221. 말하지 않아도 알아.	마＾이 버억↘ 꺼＾ 루우↗ ~ 아니다 말하다 ~ 해도 알다	\N	\N		기타
12233	เป็นลม	223. 기절했어.	뻰   롬 ~ 이 되다 바람	\N	\N		기타
12235	กว่า จะรู้ก็สาย เสียแล้ว	알았을 때는, 이미 늦어 버렸을 거야.	꽈아↘ 짜↘  루우↗ 꺼＾ 싸v이 씨v아 래우↗ ~ 했을 때는 ~ 할 것이다 알다 ~ 하면 늦다 ~ 해 버리다	\N	\N		기타
12237	รถไฟออกเสียแล้ว	기차가 떠나 버렸어요	(롯↗화이 어억↘ 씨v아 래우↗)	\N	\N		기타
12239	น่าสงสาร	226. 불쌍해.	나＾아 쏭v 싸v안 ~ 할 만하다 불쌍하다, 가엾게 여기다	\N	\N		기타
12241	รู้ไม่ ทันคุณ	228. 나를 속였어.	루우↗ 마＾이 탄 쿤 알다 ~ 아니다 따라잡다, 나란히 되다 당신 (당신을 따라 잡을 만큼 알지 못한다는 뜻으로, 내가 모르는 걸 이용해서 속였다는 의미)	\N	\N		기타
12243	หนีไป เที่ยว	230. 몰래 도망치듯 놀러 가다.	니v이  빠이 티＾여우 달아나다, 회피하다 가다 놀러 다니다	\N	\N		기타
12245	ได้ เวลาแล้ว	232. 시간이 됐어.	다＾이 웰라 래우↗ 얻다, 획득하다 시간 이미, 벌써 비슷한 말 = ถึงเวลาแล้ว (틍v 웰라 래우↗)	\N	\N		기타
12247	สอบได้	시험에 합격하다	(써업↘ 다＾이)	\N	\N		기타
12249	เขาเพิ่งจะไป	235. 그사람 방금 갔어.	카오↗ 프ㅓㅇ＾ 짜↘ 빠이 그 방금 ~ 할 것이다 가다	\N	\N		기타
12251	นักการเมือง	정치가	(낙↗ 까안 므앙) &rarr; การเมือง (까안 므앙) = 정치	\N	\N		기타
12252	นักกีฬา	운동선수	(낙↗ 끼라) &rarr; กีฬา (끼라) = 운동, 스포츠	\N	\N		기타
12254	นักข่าว	기자	(낙↗ 카우↘) &rarr; ข่าว (카우↘) = 뉴스	\N	\N		기타
12256	นักดนตรี	음악가	(낙↗ 돈뜨리) &rarr; ดนตรี (돈뜨리) = 음악	\N	\N		기타
12258	นักบิน	조종사	(낙↗ 빈) &rarr; บิน (빈) = 하늘을 날다, 비행하다	\N	\N		기타
12260	นักเรียน	초중고 학생	(낙↗ 끄리안) &rarr; เรียน (리안) = 배우다, 공부하다	\N	\N		기타
12262	นักแสดง	배우	(낙↗ 싸↘대앵) &rarr; แสดง (싸↘대앵) = 표현하다, 연기하다	\N	\N		기타
12266	ไม่ รู้จะทำยังไง	239. 어떻게 해야 할 지 모르겠어.	마＾이   루우↗ 짜↘  탐 양아이 ~ 아니다 알다 ~ 할 것이다 하다 어떻게	\N	\N		기타
12268	หัวเด็ดตีนขาด ยังไงก็ไม่ ทำ	241. 무슨 일이 있어도, 하지 않을 거야.	후v아 뎃↘ 띠인 카앗↘ 양아이 꺼＾   마＾이  탐 머리 꺽다, 따다 다리 잘라지다 어떻게 ~ 해도 ~ 아니다 하다	\N	\N		기타
12270	ตามใจคุณ	243. 당신 뜻대로 하세요.	따라가다 마음 당신 마음대로 하다	\N	\N		기타
12272	ขึ้น ๆ ลง ๆ	245. 오르락 내리락	큰＾큰＾ 롱롱 오르다 내리다	\N	\N		기타
12274	ปาก หวาน	247. 입바른 칭찬	빠악↘ 와v안 입 달콤하다	\N	\N		기타
12276	ฝีมือ ตก	249. 실력이 줄었어.	휘v이 므으 똑↘ 실력, 기량 떨어지다	\N	\N		기타
12278	สงสัยว่า ~	~ 라고 의심하다, 의문점을 갖다.	(쏭V 싸V이 와＾아 ~)	\N	\N		기타
12280	เขาเองเหรอ	251. 바로 그 사람이라구 ?	카오↗ 에앵 러v어 그 바로, 자신의, 스스로 그래요 ?, ~ 인가요 ?	\N	\N		기타
12282	คืนดีกันแล้ว	253. 이미 화해했어.	크은 디이 깐 래우↗ 화해하다 서로 이미	\N	\N		기타
12284	อยู่กันสองต่อสอง	255. 둘이만 서로 있어.	유우↘ 깐 써v엉 떠어↘ 써v엉 있다 서로 둘 ~ 에 대해서, 對 (vs) 둘	\N	\N		기타
12286	นอนทั้งวันทั้งคืน	257. 하루종일 (밤낮으로) 자다	너언 탕↗  완 탕↗ 크은 자다 ~ 랑, 모두 낮 ~ 랑, 모두 밤	\N	\N		기타
12288	แกล้งโง่หรือโง่ จริง ๆ	258. 멍청한 척 하는 거야 아니면 진짜로 멍청한 거야 ?	끌＾랭 옹＾오 르v으 옹＾오 찡찡 ~ 한 척 하다 멍청하다 아니면 멍청하다 진짜이다	\N	\N		기타
12290	อิจฉาตา ร้อน	260. 불타는 눈으로 시기하다 (탐내다)	잇↘ 차v아   따아 러언↗ 시기하다, 샘내다, 탐내다 눈 뜨겁다, 강렬하다	\N	\N		기타
12292	ผม ไม่เกี่ยว	262. 저는 관계 (상관) 없어요.	폼v 마＾이 끼여우↘ 저 ~ 아니다 상관하다, 관계가 있다	\N	\N		기타
12294	เอาเป็นว่า~	264. ~ 라고 (결정) 하자.	아오   뻰 와＾아 ~ 사용하다, 있다, 필요하다 ~ 로서 ~ 라고	\N	\N		기타
12296	ไม่อยากคบกับเขา	266. 그사람이랑 어울리고 싶지 않아.	마＾이 야악↘ 콥↗ 깝↘ 카오↗ ~ 아니다 ~ 하고 싶다, 바라다 사귀다, 교제하다 ~ 와 그	\N	\N		기타
12298	เป็นใบ้หูหนวกตาบอด	268. 벙어리가 되고, 귀머거리가 되고, 장님이 되다.	뻰 바＾이 후v우 억↘ 따아 버엇↘ ~ 이 되다 벙어리다 귀 귀머거리다 눈 눈이 멀다	\N	\N		기타
12300	แพ้ยา	약물 과민반응을 보이다	(패애↗ 야아)	\N	\N		기타
12302	แพ้อาหารทะเล	해산물 요리에 알레르기 있다	(패애↗ 아아 하v안 탈↗레애)	\N	\N		기타
12304	ปรับ ความเข้าใจ	271. 양해를 구하다	쁘랍↘ 콰암   카＾오 짜이 통고하다 ~ 하는 것, ~ 하기, ~ 함 (명사형 어미) 이해하다	\N	\N		기타
12306	ชอบ ใจ ลอย	273. 가끔 멍해 (멍때려).	처＾업 짜이 러이 좋아하다 마음 뜨다, 떠돌아 다니다 멍하다, 우두커니 생각에 잠기다	\N	\N		기타
12308	แล้วทีจะทำยังไง	275. 그러면 어떻게 해야 돼 ?	래우↗ 티이 짜↘ 탐 양아이 그러면 ~ 회, ~ 번, 차례, 시기 ~ 할 것이다 하다	\N	\N		기타
12310	ยังมีอีกเยอะ	277. 아직 많이 있어.	양   미이 이익↘ 으ㅕ↗ 아직 있다 더 많다	\N	\N		기타
12312	ของที่เหร์อ	나머지 물건	(커v엉 티＾이 르v아)	\N	\N		기타
12314	บ้ารึเปล่า	279. 미쳤어 ? , 미친거 아냐 ?	바＾아 르↗ 빠오↘ 미치다 ~ 인가요 아닌가요 ?	\N	\N		기타
12316	ท่าทางรวย	부자처럼 보여.	(타＾아 타앙 루어이)	\N	\N		기타
12318	ใช้ได้มั้ย	281. 쓸 수 있어 ?, 사용할 수 있어 ?	차이↗   다＾이 마이↗ 쓰다, 사용하다 ~ 할 수 있나요 ?	\N	\N		기타
12322	โสดแต่ไม่สด	285. 씽글인 데, 처녀(총각) 는 아냐.	쏘옷↘   때애↘ 마＾이 쏫↘ 독신의, 단독의 하지만 아니다 처녀 (총각) 이다,	\N	\N		기타
12324	เสียแรงที่ ไว้ใจคุณ	287. 당신을 믿은 나만 헛수고했잖아.	씨v아  래앵 티＾이 와이↗ 짜이   쿤 고장나다, 손해보다 힘 ~ 한, ~ 해서 ~ 해두다, 유지하다 마음 당신	\N	\N		기타
12326	ยิดีรับใช้	289. 당신을 시중들게 되어서 기뻐요.	인디이 랍↗ 차이↗ 기쁘다   봉사하다, 떠받치다	\N	\N		기타
12328	เขาไม่สมประกอบ	291. 그 사람은 심신이 건전하지 않아.	카오↗ 마＾이 쏨v 쁘라↘껍↘ 그 ~ 아니다 건전하다	\N	\N		기타
12330	ไม่ อยากยุ่งเรื่องชาวบ้าน	293. 다른 사람 일에 끼여들고 싶지 않아.	마＾이 야악↘ 융＾   르＾앙 차아우 바＾안 ~ 아니다 원하다, 하고 싶다 바쁘다, 혼란하다 일 이웃, 백성	\N	\N		기타
12332	ทำไมพึ่งจะ บอก	295. 왜 지금에서야 말하는 거야 ? (왜 미리 말하지 않은 거야 ?)	탐마이 픙＾   짜↘ 버억↘ 왜 방금, 막 ~ 하려는 참이다 ~ 할 것이다 말하다	\N	\N		기타
12255	นักเขียน	작가	(낙↗ 키v안) &rarr; เขียน (키v안) = 글을 쓰다	\N	\N		기타
12257	นักธุรกิจ	사업가	(낙↗ 투↗라↗낏↘) &rarr; ธุรกิจ (투↗라↗낏↘) = 사업	\N	\N		기타
12259	นักแปล	번역가	(낙↗ 쁠래) &rarr; แปล (쁠래) = 번역하다	\N	\N		기타
12261	นักศึกษา	대학생	(낙↗ 쓱↘싸v아) &rarr; ศึกษา (쓱↘싸v아) = 연구, 학습, 교육	\N	\N		기타
12263	นักร้อง	가수	(낙↗ 러엉↗) &rarr; ร้อง (러엉↗) = 노래하다, 외치다	\N	\N		기타
12265	ยัง ไม่ เข็ด	238. 아직 고쳐지지 (교정되지) 않았어.	양 마＾이 켓↘ 아직 ~ 아니다 (형벌, 고난을 통해) 고쳐지다, 교정되다	\N	\N		기타
12267	ทำแรงเกินไป	240. 너무 심했어.	탐 래앵 끄ㅓㄴ 빠이 하다 강하다, 격렬하다 지나치게 ~ 하다, 너무 ~ 하다	\N	\N		기타
12269	ทำหลบ ๆซ่อน ๆ	242. 비밀리에 하다	탐 롭↘ 롭↘써＾언 써＾언 하다 (위험을) 피하다, 숨다 숨기다, 감추다	\N	\N		기타
12273	ไหน ๆ ก็ไหน ๆ	246. 잊어 버려, 내비 둬.	나v이 나v이 꺼＾ 나v이 나v이 어디 어디 ~ 해도 어디 어디	\N	\N		기타
12275	ไม่มียางอาย	248. 뻔뻔해 ! , 수치심도 없나 봐 !	마＾이 미이 야앙아이 없다 수치심	\N	\N		기타
12277	สัก วันจะทำให้ได้	250. 며칠내로 할 수 있을거야.	싹↘   완 짜↘ 탐 하＾이 다＾이 ~ 만큼, ~ 정도 날, 일 ~ 할 것이다 하다 ~ 하도록 할 수 있다	\N	\N		기타
12279	ไม่แน่ใจว่า ~	~ 라고 확실하진 않지만,,	(마＾이 내＾애 짜이 와＾아 ~)	\N	\N		기타
12281	อด ไม่ได้	252. 참을 수 없어.	옷↘  마＾이 다＾이 참다, 견디다 할 수 없다	\N	\N		기타
12283	ตาม คุณ ไม่ทัน	254. 당신을 따라잡을 수 없어요.	따암 쿤 마＾이 탄 따라가다 당신 아니다 따라잡다	\N	\N		기타
12285	ขอ แก้ ตัว	256. 해명할 기회를 줘.	커v어  깨＾애   뚜아 요구하다, 바라다 (매듭을) 풀다, 고치다, 변명하다 자기, 본인, 신체	\N	\N		기타
12287	ทำงานทั้งวันทั้งคืน	하루종일 (밤낮으로) 일하다	(탐 응안 탕↗ 완 탕↗ 크은)	\N	\N		기타
12289	รีบไป รีบมา	259. 빨리 갔다가 빨리 와.	리＾입 빠이 리＾입 마아 서두르다 가다 서두르다 오다	\N	\N		기타
12291	ดูท่าทางไม่ค่อยดี	261. 별로 좋아 보이지 않는 데.	두우   타＾아 타앙 마＾이 커＾이 디이 보다, 보이다 자세, 태도, 형세 그다지 ~ 아니다 좋다	\N	\N		기타
12293	มี เรื่องด่วน	263. 급한 일이 있어.	미이 르＾앙 두언↘ 있다 일 급하다	\N	\N		기타
12295	ขอบอกก่อน ว่า~	265. ~ 라고 미리 말해두고 싶어.	커v어  버억↘ 꺼언↘ 와＾아 ~ 요구하다, 바라다 말하다 ~ 전에 ~ 라고	\N	\N		기타
12297	เขาชอบนินทา	267. 그여자는 험담 (뒷담화) 하는 걸 좋아해.	카오↗ 처＾업 닌타아 그  좋아하다 헐뜯다. 험담하다	\N	\N		기타
12299	กำลังแพ้ ท้อง	269. 지금 입덧중이야.	깜랑  패애↗     터엉↗ ~ 하는 중이다 지다, 알레르기 증세를 보이다 임신하다, 복부	\N	\N		기타
12301	แพ้อากาศ	(피부나 몸이) 기후에 적응하지 못하다	(패애↗ 아아 까앗↘)	\N	\N		기타
12303	ขอ นั่งด้วย คุณได้มั้ย	270. 당신 옆에 앉아도 될까요 ?	커v어   낭＾ 두＾어이 쿤   다＾이 마이↗ 요구하다, 바라다 앉다 ~ 와 함께 당신 ~ 할 수 있나요?	\N	\N		기타
12305	เขาไม่พูดซัก คำ	272. 그는 한마디도 안 했어.	카오↗ 마＾이 푸＾웃 싹↗   캄 그 ~ 아니다 말하다 ~ 만큼, ~ 정도 단어, 말	\N	\N		기타
12307	จริงเหรอ	274. 진짜야 ?	찡 르ㅓv 진짜 ~ 그래 ? ~ 야 ?	\N	\N		기타
12309	มี พิรุธ	276. 의심스러워, 이상해	미이 피↗룻↗ 있다 의심스럽다, 이상하다	\N	\N		기타
12311	ที่ เหรือ	278. 나머지	티＾이   르v아 ~ 한 것 (영어의 that : 관계대명사) 남다	\N	\N		기타
12313	คนที่เหรือ	나머지 사람	(콘 티＾이 르v아)	\N	\N		기타
12317	ท่าทางจน	가난해 보여	(타＾아 타앙 쫀)	\N	\N		기타
12319	หายป่วยแล้ว	282. 아픈게 싹 나았어.	하v아이 뿌어이↘ 래애우↗ 없어지다, (병이) 낫다 아프다   이미, 벌써	\N	\N		기타
12321	มันธรรมดา	284. 그건 보통이야, 평범해.	만 탐마다아 그것 보통이다, 평범하다	\N	\N		기타
12323	เอามาทำไม	286. 왜 가져 왔어 ?	아오  마아 탐마이 가지고 오다 왜	\N	\N		기타
12325	ขอสงบสติ อารมณ์	288. 진정할 시간을 좀 줘요.	커v어   싸↘옵↗   싸↘띠↘ 아아롬 요구하다, 바라다 안정되다, 평화롭다 지각, 의식, 이성 감정, 기분 진정하다, 마음을 가라앉히다	\N	\N		기타
12327	มันเป็น กฎ	290. 그건 규칙이야.	만 뻰 꼿↘ 그것 ~ 이다 규칙, 법률	\N	\N		기타
12329	ไปไหน กัน มา	292. 어디 갔다가 왔어 ?	빠이 나v이 깐 마아 가다 어디 동시에 오다	\N	\N		기타
12331	ไปคุย กันที่บ้านดีกว่า	294. 집에 가서 얘기하는 게 좋겠어.	빠이 쿠이 깐 티＾이 바＾안 디이 꽈아↘ 가다 대화하다 함께 ~ 에서 집 더 좋다	\N	\N		기타
12333	อยากคบ คุณเป็นเพื่อน	296. 당신과 친구로 사귀고 싶어요.	야악↘   콥↗   쿤 뻰   프＾안 원하다, 하고 싶다 사귀다, 교제하다 당신 ~ 로서 친구	\N	\N		기타
12335	เดือนหน้านายจะขึ้นเงินเดือนให้	298. 다음달에 사장이 월급 올려준대.	드언 나＾아 나아이 짜↘ 큰＾ 응언 드안 하＾이 달 다음의 주인 ~ 할 것이다 올리다 돈 달 ~ 해 주다	\N	\N		기타
77	When it comes to ing	에 관한 한	\N	\N	\N		기타
12338	แม่ตีลูก	엄마는 아이를 때린다.	(매＾애 띠이 루＾욱) แม่ (매＾애 : 엄마) + ตี (띠이 : 때리다) + ลูก (루＾욱 : 아이)	\N	\N		기타
12340	ฉัน จับ เขา	나는 그를 잡았다.	(폼v : 나) + (짭↘ : 잡다) + (카오↗ : 그)	\N	\N		기타
12342	เรื่องอยู่บนข่าวหน้าหนึ่ง	302. 그 얘기는 1 페이지 뉴스에 있어. (누구나 다 아는 얘기야.)	르＾앙 유우↘ 본 카우↘ 나＾아 능↘ 이야기, 일 있다 ~ 위에 소식, 뉴스 페이지 1	\N	\N		기타
12344	หนีตามแฟน	304. 애인따라 도망갔어.	니v이 따암 홰앤 도망가다 따라서 애인	\N	\N		기타
12346	อยาก หารายได้เสริม	306. 부업을 찾아보고 싶어.	야악↘   하v아 라아이 다＾이 쓰ㅓvㅁ 원하다, 하고 싶다 찾다 수입(돈벌이) 강화하다, 보충하다,부업	\N	\N		기타
12348	เผลอไม่ได้	308. 부주의할 수 없어, (전할 것을) 까먹을 수 없어.	플v르ㅓ   마＾이 다＾이 한순간 멍청해지다, (전할 것을) 잊다 ~ 할 수 없다	\N	\N		기타
12350	เรียนต่อ	310. 공부를 계속 하다, 유학하다	리이안 떠어↘ 공부하다   연장하다, 계속해서	\N	\N		기타
12352	ต้องมีอะไรแน่ ๆ	311. 뭔가 확실히 있어.	떠＾엉   미이 아↘라이  내＾애 내＾애 해야 한다, 명중하다, 일치하다 있다 무엇 확실하다, 분명, 반드시	\N	\N		기타
12354	เร็ว ๆเข้า	313. 서둘러.	레우 레우 카＾오 빨리빨리 재촉할 때, 더욱 더 빠르게 할 때	\N	\N		기타
12356	ได้ข่าว ว่า~	315. ~ 라는 소식 (뉴스) 을 들었어.	다＾이 카우↘ 와＾아 ~ 얻다, 획득하다 소식, 뉴스 ~ 라고 ~	\N	\N		기타
12358	รู้สึกว่า ~	~ 라고 느껴져	(루우↗ 쓱↘ 와＾아 ~)	\N	\N		기타
12360	ข้ากันไม่ได้	317. 서로 잘 지낼 수 없어.	카＾오 깐   마＾이 다＾이 잘 어울리다, 마음이 맞다, 화합하다 ~ 할 수 없다	\N	\N		기타
12362	ถูกแฟนทิ้ง	319. 애인에게 차였어 (버림받았어).	투욱↘ 홰앤 팅↗ 당하다 애인 버리다	\N	\N		기타
12364	เราเป็นเนื้อ คู่กัน	321. 우리는 천생연분이야.	라오 뻰 느으아↗ 쿠＾우 깐 우리 ~ 이다 고기, 살 쌍, 배우자 서로	\N	\N		기타
12368	เก็บ แรง ไว้	325. 힘을 모아두다	껩↘ 래앵 와이↗ 모으다 힘 ~ 해 두다	\N	\N		기타
12370	อย่าหลง เชื่อ	327. 맹신하지 마, 무턱대고 믿지 마.	야아↘ 롱v   츠＾으아 ~ 하지 마라 오해하다, 갈피를 못잡다, 도취하다 믿다,맹신하다, 무턱대고 믿다	\N	\N		기타
12372	หัวอกเดีอวกัน	329. 한 배에 탄 운명이다.	후v아 옥↘ 디여우깐 심장, 가슴 같다, 동일하다	\N	\N		기타
12374	พูดอย่างทำอย่าง	331. 말하는 것 따로, 하는 것 따로.	푸＾웃 야앙↘   탐 야앙↘ 말하다 종류, 방법, ~ 처럼 하다 종류, 방법, ~ 처럼	\N	\N		기타
12376	ตายเป็นตาย	333. 죽는 건 죽는 거지.(이걸 하다가 죽어도 좋아.)	따이 뻰 따이 죽다 ~ 이다 죽다	\N	\N		기타
12378	ปฏิเสธ ไม่ได้	335. 거절할 수 없어.	빠↘띠쎄앳↘ 마＾이 다＾이 거절하다 ~ 할 수 없다	\N	\N		기타
12380	ไม่น่า ทำ เลย	337. 전혀 해봄직 하지 않은 데.	마＾이 나＾아   탐 르ㅓ이 ~ 아니다 ~ 할 만 하다, ~ 할 가치가 있다 하다 전혀, 절대로	\N	\N		기타
12382	ไม่ได้ ตั้งใจ	339. 고의가 아니었어, 일부러 한게 아니야.	마＾이 다＾이 땅＾ 짜이 ~아니다 ~했다 일부러, 뜻을 두다, 심혈을 기울이다	\N	\N		기타
12384	หาทางแก้ไข	341. 해결할 방법을 찾다	하v아 타앙 깨＾애 카v이 찾다 방법, 길 해결하다, 풀다	\N	\N		기타
12386	เกือบ ไป แล้ว	343. 거의, 하마터면 (~ 할 뻔 했어).	끄으압↘   빠이   래애우↗ 거의 ~ 할 뻔하다, 하마터면 가다, 앞동작의 지속 이미	\N	\N		기타
12388	เป็น เมนส์	345. 생리중이야.	뻰 메앤 ~ 이다 생리(menses)	\N	\N		기타
12390	อย่า ไปโทษเขา	347. 그를 탓하지 마.	야아↘ 빠이 토＾옷   카오↗ ~ 하지 마라 가다, 동작의 지속 벌, 나무라다, 죄를 덮어 씌우다 그	\N	\N		기타
12392	ลองจินตนาการดู	348. 한번 상상해 봐.	러엉   찐따↘나아까안 두우 해보다, 시도하다 상상, 마음먹은 것 보다	\N	\N		기타
12394	ลองทำดู	한번 해 봐	(러엉 탐 두우)	\N	\N		기타
12398	เราเสียลูกค้า	352. 우리는 손님을 잃었다.	라아오 씨v이아 루＾욱 카아↗ 우리 잃다 손님	\N	\N		기타
12400	จะไม่ยอม ให้คุณทำกับฉันยังงี้	354. 당신이 내게 이렇게 하지 못하게 할거야.	짜↘ 마＾이 여엄  하＾이   쿤   탐 깝↘ 폼v 양이이↗ ~ 할 것이다 ~ 아니다 허락하다 ~ 하도록 당신 하다 ~ 와 나 이렇게	\N	\N		기타
12402	พยายามรวบรวมเงิน	356. 돈을 모으려고 노력중이야.	파↗야아야암 루＾우업 루우엄 응언 노력하다 모으다   돈	\N	\N		기타
12404	คุณชอบเถียง	358. 당신은 말다툼 (말대꾸) 하는 걸 좋아해.	쿤 처＾업 티v이앙 당신 좋아하다 논쟁하다, 말대꾸하다	\N	\N		기타
12406	มักมาก ใน กาม	360. 욕정에 불타다	막↗ 마＾악 나이   까암 탐욕스럽다, 욕심부리다 ~ 안에, ~ 에 성욕, 욕정	\N	\N		기타
12408	งาน ต้อง มา ก่อน	362. 일이 먼저다.	응안 떠＾엉 마아 꺼언↘ 일 ~ 해야 한다 오다 먼저	\N	\N		기타
12410	ผมต้องลงโทษคุณ	364. 나는 당신을 벌해야 합니다.	폼v 떠＾엉 롱 토＾옷 쿤 나 ~ 해야 한다 내리다 벌 당신	\N	\N		기타
12412	อย่า หวัง เลย	바라지도 마.	야아↘ 왕v   르ㅓ이 ~하지 마라 바라다, 희망하다 절대로, 전혀	\N	\N		기타
12417	หายโกรธ รึยัง	369. 화난 (삐진) 것 풀어졌어 ?	하v아이   끄으롯↘ 르↗ 양 없어지다, (병이) 낫다 화내다, 삐지다 아니면 아직	\N	\N		기타
12341	อยากเจอคนที่รู้ใจ	301. 나를 이해해 주는 사람을 만나고 싶어.	야악↘   쯔ㅓ어 콘 티＾이 루우↗  짜이 원하다, 하고 싶다 만나다 사람 ~ 한 (관계대명사) 알다 마음성격, 취향을 다 알고 있다	\N	\N		기타
12343	ดูแลตัวเองให้ดี	303. 스스로 몸 잘 돌봐 !	두울래애   뚜아 에앵 하＾이 디이 돌보다, 보살피다 몸 스스로 ~ 하도록 좋다	\N	\N		기타
12345	เบื่อ ชีวิต	305. 사는 게 지루해.	브아↘ 치이윗↗ 지루하다 삶	\N	\N		기타
12347	สวย ไปหมด	307. 아름다움이 다 사라졌어.	쑤v어이 빠이 못↘ 아름답다 가다 다하다, 없어지다	\N	\N		기타
12349	ไม่ไหวแล้ว	309. 더 이상 참을 수 없어.	마＾이 와v이 래애우↗ 아니다 참다 이미	\N	\N		기타
12351	มาตามผม	나를 따라 와	(마아따암폼) มา(마아 : 오다) +ตาม(따암 : 따라서) +ผม(폼V : 나)	\N	\N		기타
12353	แทบ จะบ้า	312. 거의 미칠 지경이야.	태＾앱   짜↘  바＾아 거의, ~ 하려는 참이다 ~ 할 것이다 미치다	\N	\N		기타
12355	ทีละ คน	314. 한번에 한명씩	티이   라↗ 콘 ~ 번, ~ 회 ~ 마다 사람	\N	\N		기타
12357	สงสัยว่า ~	~ 라고 의심돼	(쏭v 싸v이 와＾아 ~	\N	\N		기타
12359	ทำได้ไง	316. 어떻게 한거야 ?	탐 다＾이 응아이 하다 ~ 할 수 있다 어떻게 (야앙라이) 의 구어체	\N	\N		기타
12361	ตื่นได้ แล้ว	318. (잠자리에서) 일어나 !	뜨은↘   다＾이   래애우↗ (잠에서) 깨다 (잠자리에서) 일어나다 ~ 할 수 있다 이미	\N	\N		기타
12363	ทำตาม สัญญา	320. 약속 (계약) 대로 하다	탐 따암 싼v 야아 하다 ~ 대로 약속, 계약	\N	\N		기타
12365	ขอปิดเป็นความลับ	322. 비밀로 해두고 싶어요.	커v어 삣↘ 뻰 콰암 랍↗ 요구하다, 바라다 닫다, 잠그다 ~ 으로 비밀	\N	\N		기타
12367	มันจะดี เหรอ	324. 그게 좋을 거라구요 ?	만 짜↘   디이 르ㅓv어 그것 ~ 할 것이다 좋다 ~ 라구요 ?	\N	\N		기타
12369	ดู แต่ตา มืออย่าต้อง	326. 눈으로만 보고, 손으로 만지지 마세요.	두우 때애↘ 따아 므으 야아↘ 떠＾엉 보다 단지, ~ 만 눈 손 ~ 하지 마라 만지다, 접촉하다	\N	\N		기타
12371	ไม่รู้ จะทำ ยังไง	328. 어떻게 해야 할지 모르겠	마＾이 루우↗ 짜↘ 탐 양아이 ~아니다 알다 ~ 할 것이다 하다 어떻게	\N	\N		기타
12373	ว่าง ๆจะมา หา	330. 시간나면 들를께요.	와＾앙 와＾앙 짜↘ 마아 하v아 한가하다 ~ 할 것이다 오다 찾다 찾아 오다, 방문오다	\N	\N		기타
12375	เขามาตั้งแต่ หัว ค่ำ	332. 그는 초저녁부터 와 있어.	카오↗ 마아 땅＾ 때＾애 후v아 캄＾ 그 오다 ~ 부터(시간) 머리 저녁	\N	\N		기타
12377	จะ พาไปส่งบ้าน	334. 집까지 데려다 줄께.	짜↘   파아  빠이 쏭↘ 바＾안 ~ 할 것이다 데리고 가서 보내다 집	\N	\N		기타
12381	นี่มันเรื่องส่วน ตัว	338. 이건 개인적인 일이야.	니＾이 만 르＾으앙 쑤언↘   뚜아 이것 그것 일, 이야기 부분, 비율, ~ 에 대해서는 자기, 본인	\N	\N		기타
12383	คุณเป็นต้น เหตุ	340. 당신이 문제야, 당신이 (문제의) 근원이야.	쿤 뻰 똔＾ 헤앳↘ 당신 ~ 이다 처음, 최초, 중요한 원인, 이유, 동기 사건을 일으킨 장본인, 일의 발단	\N	\N		기타
12385	เมียขอ หย่า	342. 아내가 이혼을 요구했어.	미이아 커v어   야아↘ 아내 요구하다, 바라다 이혼하다	\N	\N		기타
12387	เรื่องน่า ขำ	344. 웃긴 얘기야.	르＾으앙 나＾아 캄v 이야기 ~ 할 만하다 우습다, 유머러스하다	\N	\N		기타
12389	จะเล่าความจริง ให้ฟัง	346. 사실을 말해 줄께.	짜↘   라＾아오 콰암찡 하＾이 황 ~ 할 것이다 말하다 사실, 진실 ~하도록 듣다	\N	\N		기타
12391	อย่าโทษตัวเอง	자책하지 마.	야아↘ 토＾옷 뚜아 에앵 ~하지 마라 벌, 나무라다 자기, 본인 자기의, 스스로	\N	\N		기타
12393	ลองคิดดู	한번 생각해 봐	(러엉 킷↗ 두우)	\N	\N		기타
12395	ทำยังงี้ไม่ถูก	349. 이렇게 하면 틀려.	탐 양이이↗ 마＾이 투욱↘ 하다 이렇게 ~ 아니다 옳다	\N	\N		기타
12397	โมโห หิว	351. 배고파서 화나.	모오 호v오 히v우 화나다 배고프다	\N	\N		기타
12399	เขาติดคุกอยู่	353. 그는 감옥에 있다.	카오↗ 띳↘ 쿡↗ 유우↘ 그 붙어 있다 감옥 ~ 하고 있다	\N	\N		기타
12401	ซึ้งแล้วใช่มั้ย	355. 감동한 게 맞지 ?	씅↗ 래애우↗ 차＾이 마이↗ 감동하다 이미 옳다, 맞다 ~ 지 ?	\N	\N		기타
12403	คราวนี้ซวยแน่	357. 이번에는 정말 재수가 없을 거야.	크라우   니이↗ 쑤어이 내＾애 ~ 번, ~ 회, ~ 차 이 재수없다 정말, 반드시	\N	\N		기타
12405	ต้องจัดการให้เร็วที่สุด	359. 가능한 한 빨리 처리해야 돼.	떠＾엉 짯↘ 까안 하＾이 레우 티＾이 쑷↘ ~해야 한다 처리하다 ~ 하도록 빠르다 가장	\N	\N		기타
12407	แค้น ต้อง ชำระ	361. 원한을 꼭 갚을 거야.	캐앤↗ 떠＾엉 참라↗ 원한 ~ 해야 한다 지불하다, 청산하다	\N	\N		기타
12409	ค่าจ้างงวดแรก	363. 첫번 째 지불한 인건비	카＾아 짜＾앙 응＾옷 래＾액 비용 고용하다 ~ 회, ~ 차 처음의, 첫번째의	\N	\N		기타
12411	หวัง มาก เกินไป	365. 너무 많은 걸 바라는 데.	왕v   마＾악 끄ㅓㄴ 빠이 바라다, 희망하다 많이 너무 지나치다	\N	\N		기타
12413	อย่าพึ่งหมดหวัง	절망하지 마.	야아↘   픙＾   못↘   왕v ~ 하지 마라 방금, 막~ 하려는 참이다 다하다, 없어지다 바라다, 희망하다	\N	\N		기타
12415	อะไรกันนักกันหนา	367. 도대체 뭐하고 있는 거야 ?	아↘라이 깐   낙↗ 깐 나v아 무엇 동시에, 함께 대단히, 몹시	\N	\N		기타
88	confused	혼란스러운	\N	\N	\N		하
12416	ผมโดนหักหลัง	368. 나는 배신당했어.	폼v 도온 학↘   랑v 나 당하다 부러지다, 꺾이다 등,배신하다	\N	\N		기타
12418	เธอท้อง ได้สามเดือน	370. 그녀는 임신3개월째야.	트ㅓ 터엉↗ 다＾이   싸v암 드으안 그녀 임신하다 얻다, 획득하다,이기다 3 월, 달	\N	\N		기타
12420	คุณเป็นใครกันแน่	372. 당신은 정말로 누구에요 ?	쿤 뻰 크라이  깐   내＾애 당신 ~ 이다 누구 서로, 동시에 정말, 확실히	\N	\N		기타
12422	พนักงานชั่วคราว	374. 임시직 (비정규직) 직원	파↗낙↗응안 추＾아 크라우 직원,임시 기간, 간격 ~ 차, ~ 회, ~ 번, 시기, 또래	\N	\N		기타
12424	คุณ หมายถึง อะไร	375. 당신의 뜻 (의미) 이 뭔가요 ?	쿤 마v아이 틍v   아↘라이 당신 의미하다, 뜻하다 도달하다,~에이르다 무엇	\N	\N		기타
12426	ได้ ประโยชน์ อะไร	377. 무슨 이익을 얻나요 ?	다＾이 쁘라↘요＾옷 아↘라이 얻다 이익, 효과   무엇	\N	\N		기타
12428	ฉันเป็นคน ช่างฝัน	379. 나는 몽상가에요.	폼v 뻰 콘 차＾앙 환v 나 ~ 이다 사람 ~ 하는 경향이 있다, ~ 하기를 좋아하다 꿈꾸다	\N	\N		기타
12432	เลยเวลานัดแล้ว	383. 약속시간이 이미 지났어.	르ㅓ이   웰라아 낫↗ 래애우↗ 지나다, 경과하다 시간 약속 이미	\N	\N		기타
12434	รอง เท้า กัด	385. 신발이 쓸려.	러엉  타아오↗ 깟↘ 밑에 깔다, 지지하다 발 물다	\N	\N		기타
12436	ขอลองหน่อย	387. 좀 해볼께.	커v어 러엉   너어이↘ 부탁하다, 요구하다 ~ 해 보다, 시도하다 좀	\N	\N		기타
12438	หวงไว้ทำไม	389. 왜 기대하고 (바라고) 있는 거야 ?	후v앙 와이↗   탐마이 기대하다, 바라다 ~ 해 두다, 유지하다 왜	\N	\N		기타
12440	ไปก่อนนะ	391. 먼저 갈께요.	빠이 꺼언↘ 나↗ 가다 먼저 ~ 요	\N	\N		기타
12442	ที หลังอย่าทำ	393. 다음번엔 하지 마.	티이   랑v 야아↘  탐 ~ 번, ~ 회 다음의 ~하지 마라 하다	\N	\N		기타
12444	ตัองพิสูจน์ให้ เห็น	395. 증명해 보여야 해.	떠＾엉  피↗쑤웃↘ 하＾이 헨v ~ 해야 한다 증명하다 ~ 하도록 보이다	\N	\N		기타
12446	ตัวแทนจากบริษัท	397. 회사 대리인 (대표)	뚜아   태앤 짜악↘ 버↘리↗쌋↘ 자기, 본인, 몸 ~대신에 ~로부터, ~ 의 회사	\N	\N		기타
12448	คิดถึงใจจะขาด	399. 마음이 찢어질 정도로 보고 싶어.	킷↗ 틍v   짜이 짜↘ 카앗↘ 보고 싶다, 그리워하다 마음 ~ 할 것이다 찢어지다	\N	\N		기타
12450	ไปรึไม่ไปเหรอ	갈거야 안 갈거야 ?	(빠이 르↗ 마＾이 빠이 르ㅓv어) 그리고, เลย(르ㅓ이) 는 " 전혀, 절대로, 완전히 " 의 뜻입니다.	\N	\N		기타
12452	ไม่ได้เลย	절대로 불가능하다	(마＾이 다＾이 르ㅓ이)	\N	\N		기타
12454	ชื่นใจจังเลย	402. 진짜 개운해 (후련해)	츠＾은 짜이 짱 르ㅓ이 개운하다, 후련하다 매우, 굉장히, 정말로	\N	\N		기타
12456	ทำใจไม่ได้	404. 마음을 진정시킬 수가 없어.	탐 짜이     마＾이 다＾이 마음을 진정시키다, 감정을 누그러뜨리다 ~ 할 수 없다	\N	\N		기타
12458	มี แค่นี้ เอง	405. 가진 게 바로 이것뿐이야.	미이 캐＾애 니이↗ 에앵 가지고 있다 단지, ~ 뿐 이 바로 (앞 단어 강조)	\N	\N		기타
12460	เห็นกับตา	내 눈으로 직접 봤어.	(헨v 깝↘ 따아)	\N	\N		기타
12462	มัน ไม่เหมาะ	408. 그건 적당하지 (어울리지) 않아.	만 마＾이 머↘ 그것 ~ 아니다 적당하다, 알맞다, 어울리다	\N	\N		기타
12464	มา ตั้งแต่ เมื่อไร	410. 언제부터 와 있는 거야 ?	마아 땅＾ 때애↘ 므＾으어 라이 오다 ~ 부터 언제	\N	\N		기타
12466	ผู้หญิงหน้าเงิน	돈만 밝히는 여자	(푸＾우 잉v 나＾아 응언)	\N	\N		기타
12468	จะพาแฟนไปด้วย	413. 애인을 데리고 같이 갈께.	짜↘  파아 홰앤 빠이 두＾어이 ~ 할 것이다 데리고 애인 가다 같이, 함께	\N	\N		기타
12470	ถึงเวลาแล้ว	415. 시간 다 됐어.	틍v   웰라아 래애우↗ 도달하다, ~ 에 닿다 시간 이미	\N	\N		기타
12472	คุยออกรส	재미있게 얘기하다	(쿠이 어억↘롯↗)	\N	\N		기타
12474	ขอให้รวย ๆ	418. 부자되세요.	커v어   하＾이   루어이 루어이 요구하다, 부탁하다 ~ 하도록 부유하다	\N	\N		기타
12476	ขอให้สอบได้	시험에 합격하기 바래요.	(커v어 하＾이 써업↘ 다＾이)	\N	\N		기타
12478	เสียวไส้	420. 오싹해, 소름끼쳐, 조마조마해.	씨v여우 싸＾이 오싹하다, 소름끼치다 (동물의) 장, (만두 등의) 속, 내정, 실정	\N	\N		기타
12480	จะเอายังไง	어떻게 해주길 원하는 건데 ?	(짜↘ 아아오 양아이)	\N	\N		기타
12482	ต้อง รีบ ทำ	423. 서둘러서 해야 돼.	떠＾엉   리＾입 탐 ~ 해야 한다 서두르다 하다	\N	\N		기타
12484	ตายเป็น ผี	425. 죽어서 귀신이 되다	따아이 뻰 피v이 죽다 ~ 이 되다 귀신	\N	\N		기타
12486	เขาอยู่ทน	그는 오랫동안 머물러 있다.	(카오↗ 유우↘ 톤)	\N	\N		기타
12490	เงินล่วง หน้า	430. 선불, 가불	응언 루＾앙   나＾아 돈 지나다, 앞서다, 넘다, 경과하다 앞, 미리 앞서, 먼저	\N	\N		기타
12492	เสร็จธุระแล้วรีบกลับบ้าน	432. 볼일 (용건)을 마치고 집으로 서둘러 돌아 가다	쎗↘   투↘라↗ 래애우↗ 리＾입 끌랍↘ 바＾안 끝내다, 마치다 일, 용건 이미 서두르다 돌아가다 집	\N	\N		기타
12494	ทำ เป็น ไม่รู้ไม่เห็น	434. 모르는척, 안본척한다	탐 뻰 마＾이 루우↗ 마＾이 헨v 하다 ~로서 ~아니다 알다 ~ 아니다 보다	\N	\N		기타
112	instinctive	본능적인	\N	\N	\N		하
12421	ไม่มีอะไร สำคัญกว่านี้	373. 이보다 중요한 건 없어.	마＾이 미이 아↘라이 쌈v 칸 꽈아↘ 니이↗ ~ 아니다 있다 무엇 중요하다 ~ 보다 이	\N	\N		기타
12423	พนักงานประจำ	정규직 직원	(파↗낙↗응안 쁘라↘짬)	\N	\N		기타
12425	ทำไมไม่บอกให้รู้ ก่อน	376. 왜 미리 말하지 않았죠 ?	탐마이 마＾이 버억↘ 하＾이 루우↗ 꺼언↘ 왜 ~ 아니다 말하다 ~ 하도록 알다 미리, 전에	\N	\N		기타
12427	ใครรับผิดชอบ	378. 누가 책임지죠 ?	크라이 랍↗핏↘처＾업 누가 책임지다	\N	\N		기타
12429	เขต อันตราย	380. 위험지대	케앳↘   안따라아이 지대, 구역 위험하다	\N	\N		기타
12433	จะอธิบายยังไงดี	384. 어떻게 설명하는 게 좋을까 ?	짜↘   아↘티↗바아이 양아이 디이 ~ 할 것이다 설명하다   어떻게 좋다	\N	\N		기타
12435	ทำ แล้วก็ไม่ ดีขึ้น	386. 이미 해봤는 데도 더 좋아지지 않아.	탐 래애우↗ 꺼＾ 마＾이 디이 큰＾ 하다 이미 ~ 해도 ~아니다 좋다 상승, 증대하다	\N	\N		기타
12437	ไม่อยากมีเรื่อง	388. 일 (사건) 을 벌이고 싶지 않아.	마＾이 야악↘  미이   르＾으앙 ~ 아니다 원하다, 하고 싶다 가지다 일, 사건	\N	\N		기타
12439	งาน นี้สนุกแน่	390. 이 일 (파티, 축제) 은 확실히 재미있을거야.	응안   니이↗ 싸눅↘ 내＾애 일, 파티, 축제 이 재미있다 확실히, 반드시	\N	\N		기타
12441	มานานรึยัง	392. 온지 오래됐어 ?	마아 나안 르↗ 양 오다 오래다, (시간이) 길다 ~ 인가요 아닌가요 ?	\N	\N		기타
12443	ไปได้ แล้ว	394. 그만 가봐도 돼.	빠이 다＾이 래애우↗ 가다 ~ 할 수 있다 이미	\N	\N		기타
12445	ตั้งหน้าตั้งตารอ	396. (누군가 / 무언가) 보기를 학수고대하다	땅＾   나v아 땅＾ 따아 러어 세우다, 유지하다, 설립하다 얼굴 세우다...눈 기다리다	\N	\N		기타
12447	แบบนี้แหละดีแล้ว	398. 바로 이 방법이 좋겠다.	배앱↘   니이↗ 래↘ 디이 래애우↗ 모양, 형식, 방법 이 바로, 틀림없이 좋다 이미	\N	\N		기타
12449	เดินเร็ว ๆหน่อยไม่ได้ เหรอ	400. 좀 빨리 빨리 걸을 수 없어요 ?	드ㅓㄴ 레우레우 너어이↘ 마＾이 다＾이 르ㅓv어 걷다 빨리 빨리 좀   아니다 ~ 할 수 있다 ~ 인가요 ? เหรอ(르ㅓv어) 는 " ~ 인가요 ? " 또는 " ~ 야 ? " 정도의 느낌입니다.	\N	\N		기타
12451	ไม่รู้เลย	전혀 모른다	(마＾이 루우↗ 르ㅓ이)	\N	\N		기타
12453	อย่าลืมติดรูป มานะ	401. 사진 가져오는 것 잊지마.	야아↘   르음 띳↘   루＾웁 마아 나↗ ~ 하지 마라 잊다 붙이다,휴대하다 사진 오다 ~ 구, ~요	\N	\N		기타
12455	ไม่ต้องบอกก็รู้	403. 말하지 않아도 알아.	마＾이 떠＾엉 버억↘ 꺼＾ 루우↗ ~ 할 필요 없다 말하다 ~ 해도 알다	\N	\N		기타
12457	ทำใจให้ดี	마음을 가라앉히다	(탐 짜이 하＾이 디이)	\N	\N		기타
12459	ได้ยิน กับ หู	406. 내 귀로 직접 들었어.	다＾이 인 깝↘ 후v우 듣다 ~으로, ~을 가지고 귀	\N	\N		기타
12461	ได้เสียกันแล้ว	407. 이미 잠자리 (성관계) 를 가졌어.	다＾이 씨v이아 깐 래애우↗ 얻다 잃다 서로 이미	\N	\N		기타
12463	ไม่ใช่ความผิดของฉัน	409. 내 잘못이 아냐.	마＾이 차＾이 콰암 핏↘ 커v엉 폼v 아니다 맞다, 옳다 잘못 ~ 의 나	\N	\N		기타
12465	ผู้ชายหน้าโง่	411. 멍청한 남자	푸＾우 차아이 나＾아 오＾옹 남자  얼굴   멍청하다, 어리석다	\N	\N		기타
12467	มันไม่ ใช่ของ ง่าย	412. 그건 쉬운 일이 아니야.	만 마＾이 차＾이 커v엉   응＾아이 그것 ~ 아니다 맞다, 옳다 일, ~ 것 쉽다	\N	\N		기타
12469	แน่นะ	414. 확실한거야 ?	내＾애 나↗ 확실하다 ~ 라구 ?	\N	\N		기타
12471	ออกรถ	416. 드라이브하다	어억↘   롯↗ 출발하다, 나가다 자동차 발음이 똑같은 ออกรส (어억↘롯↗) 은 맛이 나다, 재미있다 의 뜻이다.	\N	\N		기타
12473	จะอยู่อีกนานมั้ย	417. 더 오래 있을거야 ?	짜↘   유우↘ 이익↘ 나안 마이↗ ~ 할 것이다 있다 더 오래 ~ 야 ?	\N	\N		기타
12475	ขอให้ได้แฟนสวย ๆ	이쁜 애인 생기기 바래요.	(커v어 하＾이 다＾이 홰앤 쑤v어이 쑤v어이)	\N	\N		기타
12477	เป็นคนละคน	419. 예전과 다른 사람이 됐어.	뻰 콘 라↗ 콘 ~ 이 되다 각각 다른 사람	\N	\N		기타
12479	จะ ให้ ทำยังไง	421. 내가 어떻게 했으면 좋겠어 ?	짜↘   하＾이 탐 양아이 ~ 할 것이다 ~ 하도록 하다 어떻게	\N	\N		기타
12481	นอนก่อนนะ	422. 먼저 자.	너언 꺼언↘ 나↗ 자다 먼저 ~ 라구	\N	\N		기타
12483	เลือก ไม่ถูก	424. 고를 수가 없어.	르＾으악 마＾이 투욱↘ 고르다 ~ 아니다 옳다, 맞다	\N	\N		기타
12485	เขาทนอยู่	426. 그는 참고 머물러 있다.	카오↗ 톤 유우↘ 그 참다, 견디다 있다	\N	\N		기타
12489	ที ละเล็กทีละน้อย	429. 조금씩, 점차, 차츰차츰	티이   라↗ 렉↗ 티이  라↗ 너어이↗ 차례, 기회, 시기  마다 작다 차례, 기회, 시기 ~ 마다 적다, 작다, 낮다, 어리다	\N	\N		기타
12491	รับ ไม่ได้	431. 받아 들일 수 없어.	랍↗   마＾이 다＾이 받아들이다 ~할수없다	\N	\N		기타
12493	ทำเป็นไม่รู้ไม่ชี้	433. 전혀모르는척 하다	탐 뻰 마＾이 루우↗ 마＾이 치이↗ 하다 ~ 로서 ~ 아니다 알다 지시하다, (길을) 가르쳐주다	\N	\N		기타
12495	ไม่ต้องรอทานข้าว	435. 식사하는것 기다릴 필요없어요.	마＾이 떠＾엉 러어 타안 카＾아우 ~ 할필요없다   기다리다 드시다 밥 กิน (낀 : 먹다) 보다정중한말	\N	\N		기타
12500	อย่าหาเรื่อง	440. 문제 일으키지마.	야아↘  하v아 르＾으앙 ~ 하지마라 찾다 일, 사건	\N	\N		기타
12502	ไม่ชอบนั่งเฉย ๆ	442. 아무것도 안하고 그냥 앉아있는 걸 싫어해.	마＾이 처＾업  낭＾ 츠ㅓv이 츠ㅓv이 ~ 아니다 좋아하다 앉다 그냥, 아무것도 안 하고	\N	\N		기타
12504	ไม่ เข้ากับบรรยากาศ	444. 분위기와 어울리지 않아.	마＾이 카＾아오 깝↘   반야아까앗↘ ~ 아니다 ~ 와 어울리다, 조화를 이루다 분위기	\N	\N		기타
12506	โดนเล่น งาน	446. 꾸짖음을 당하다, 공격당하다, 압박당하다	도온 레＾앤 응안 당하다 놀다, 몰두하다, 저지르다, 해를 가하다, 놀리다 일, 업무, 사정 꾸짖다, 공격하다, 압박하다, 행사에서 오락을 하다	\N	\N		기타
12508	จู่ ๆฝนตกลง มา	갑자기 비가 온다.	쭈↘ 쭈↘ 혼v 똑↘  롱   마아 갑자기  비  떨어지다 내리다 오다	\N	\N		기타
12510	ต้องระวังเป็นพิเศษ	449. 특히 조심해야 돼.	떠＾엉 라↗왕 뻰 피↗쎄앳↘ ~ 해야 한다 조심하다 ~ 로서 특별하다, 특별히, 특수하게	\N	\N		기타
140	muscles and joints	근육과 관절	\N	\N	\N		기타
148	reform	개혁하다	\N	\N	\N		하
165	be used to Root	하는데 사용되어지다	\N	\N	\N		기타
232	be expected to Root	할 것으로 기대되어진다	\N	\N	\N		기타
282	fill A with B A B	를 로 채우다	\N	\N	\N		기타
307	blood stream	혈류피의 흐름	\N	\N	\N		기타
319	location	위치	\N	\N	\N		하
320	mammal	포유동물	\N	\N	\N		하
359	exactly	정확하게	\N	\N	\N		하
368	diligent	부지런한	\N	\N	\N		하
400	any more	더 이상	\N	\N	\N		기타
403	for the first time	처음으로	\N	\N	\N		기타
424	green house effect	온실효과	\N	\N	\N		기타
434	protect	보호하다	\N	\N	\N		하
440	have to do with	와 관계가 있다	\N	\N	\N		기타
500	native	출생의 출생지의 본국의 제나라의 토산의 그 토지 에서 태어난산출되는 원산의 토착의 그 지방 고유의	\N	\N	\N		하
540	behavior	행동	\N	\N	\N		하
544	no matter who	일지라도	\N	\N	\N		기타
590	proper	적절한	\N	\N	\N		하
595	throughout the world	전 세계에	\N	\N	\N		기타
613	cannot afford to	할 여유가 없다	\N	\N	\N		기타
679	consequently	결론적으로	\N	\N	\N		하
688	entire	전체의 완전한	\N	\N	\N		하
698	scenario	계획안	\N	\N	\N		하
705	otherwise	만약 그렇지 않으면 다른 면에서	\N	\N	\N		하
758	sheepskin	양가죽	\N	\N	\N		하
776	lose ones selfcontrol	자제력을 잃다	\N	\N	\N		기타
789	professor	교수	\N	\N	\N		하
4458	idolize	Vt. 우상시하다; 맹목적으로 숭배하다	\N	\N	\N	toefl	중
4507	impregnable	A. 난공불락의	\N	\N	\N	toefl	중
4519	inadvertent	부주의한	\N	\N	\N	toefl	하
4254	felicity	행복	\N	\N	\N	toefl	하
4533	indecent	버릇없는	\N	\N	\N	toefl	하
5614	callous	무감각한	\N	\N	\N	gongmuwon	하
7046	undermine	~의 밑을 파ㅏ; 토대를 허물다; 해치다	\N	\N	\N	gongmuwon	하
5550	bargain	싸게 한 물건; 턱없이 쌈	\N	\N	\N	gongmuwon	하
5518	assess	평가하다	\N	\N	\N	gongmuwon	하
5803	decent	점잖은	\N	\N	\N	gongmuwon	하
5945	dynamic	동적인	\N	\N	\N	gongmuwon	하
5949	echo	반항하다; 반영하다; 되풀이하다	\N	\N	\N	gongmuwon	하
6337	interminable	끝없는	\N	\N	\N	gongmuwon	중
6469	mobile	움직일 수 있는	\N	\N	\N	gongmuwon	하
6531	optimistic	낙관적인	\N	\N	\N	gongmuwon	하
6672	prolong	연장하다; 늘이다	\N	\N	\N	gongmuwon	하
6825	scarce	부족한	\N	\N	\N	gongmuwon	하
6871	skeptical	의심 많은; 회의적인	\N	\N	\N	gongmuwon	하
6633	potent	강력한	\N	\N	\N	gongmuwon	하
6933	stumble	비틀거리다	\N	\N	\N	gongmuwon	하
7090	unwittingly	모르는 사이에; 고의가 아닌	\N	\N	\N	gongmuwon	하
7095	update	새롭게 하다	\N	\N	\N	gongmuwon	하
7452	survival	n. *생존*	\N	\N	\N	suneung	하
7458	v. *조사하다	 둘러보다*	\N	\N	\N	suneung	기타
7975	realize	v. *현실화하다	\N	\N	\N	suneung	하
8036	vital	a. *생명의	\N	\N	\N	suneung	하
7775	insure	v. *보험을 계약하다	\N	\N	\N	suneung	하
8453	peculiar	a. *독특한*	\N	\N	\N	suneung	하
8474	deliver	v. *배달하다	\N	\N	\N	suneung	하
8110	lord	n. *군주*	\N	\N	\N	suneung	하
8131	shrug	v. (어깨를) *으쓱하다*	\N	\N	\N	suneung	하
8287	amplify	v. *확대하다	\N	\N	\N	suneung	하
8491	dormitory	n. *기숙사*	\N	\N	\N	suneung	하
8112	n. *대리물	 대리자*	\N	\N	\N	suneung	기타
8130	subscribe	v. *정기 구독하다*	\N	\N	\N	suneung	하
8184	territory	n. *영토*	\N	\N	\N	suneung	하
8220	prefer	v. *~을 선호하다*	\N	\N	\N	suneung	하
8448	discriminate	v. *차별하다	\N	\N	\N	suneung	하
8478	destroy	v. *파괴하다*	\N	\N	\N	suneung	하
8518	sensation	n. *감각	\N	\N	\N	suneung	하
8575	consist	v. (부분 · 요소로) *이루어져 있다*	\N	\N	\N	suneung	하
8668	extract	v. *추출하다*	\N	\N	\N	suneung	하
8764	impair	v. *손상시키다*	\N	\N	\N	suneung	하
8866	v. *밀어올리다	* (생산량을) 증가하다	\N	\N	\N	suneung	기타
8534	reservoir	n. *저장소	\N	\N	\N	suneung	하
8585	exhibit	v. *전시하다	\N	\N	\N	suneung	하
8744	invent	v. *발명하다*	\N	\N	\N	suneung	하
8768	v. *타박상을 입히다	 멍들게 하다*	\N	\N	\N	suneung	기타
8810	v. *풀칠하다	 붙이다*	\N	\N	\N	suneung	기타
8876	inquire	v. *묻다	\N	\N	\N	suneung	하
8939	intuitive	a. *직관적인	\N	\N	\N	suneung	하
8685	ponder	v. *심사숙고하다*	\N	\N	\N	suneung	하
8862	referee	n. *심판*	\N	\N	\N	suneung	하
12499	ต้องทำให้ได้	439. 해내야해.	떠＾엉 탐 하＾이 다＾이 ~ 해야한다 하다 ~ 하도록 ~ 할수있다	\N	\N		기타
12501	อัน เดียวพอ	441. 한 개면 충분해.	안   디여우 퍼어 ~ 개 (갯수) 하나의 충분하다	\N	\N		기타
12507	จู่ ๆก็ได้เจอ	447. 우연히 만났어.	쭈↘ 쭈↘ 꺼＾ 다＾이 쯔ㅓ어 예고없이, 갑자기 ~하게도 했다 (우연히) 만나다	\N	\N		기타
12509	อย่า ไปกวน เขา	448. 그를 성가시게 하지 마.	야아↘ 빠이  꾸안   카오↗ ~ 하지 마라 앞에 행위을 계속 함 성가시게 굴다 그	\N	\N		기타
12511	บริการ ที่ยอดเยี่ยม	450. 최고의 서비스	버리까안 티＾이 여＾엇   이＾이암 서비스 ~ 한   최고, 정상, 첨단 최고, 최우수	\N	\N		기타
12512	ทำอะไรอย่	1.뭐하는 중이야.	(탐 아↘라이 유우↘)	\N	\N	thai-conversation	기타
12513	ทำไมถึงไม่ไป	2.왜 안가.	탐마이   틍v   마＾이 빠이	\N	\N	thai-conversation	기타
12514	เดี๋ยวก่อน	3. 잠깐만 기다려	디여v우 꺼언↘ 잠깐        before	\N	\N	thai-conversation	기타
12515	แป๊บนึง	4.잠깐만.	(뻽↗ 능)	\N	\N	thai-conversation	기타
12516	ว่าไง	5.뭐라고 말할건 데	(와＾아 응아이)	\N	\N	thai-conversation	기타
12517	อะไรยังเงี้ยะ	6. 이게 뭐야 ? 어떻게 된거야 ?	(아↘라이 양이야↗)	\N	\N	thai-conversation	기타
12518	ทำปุ๊บเสร็จปั๊บ	7.하는 대로, 끝난다.	(탐뿝↗ 쎗↘빱↗)	\N	\N	thai-conversation	기타
12519	มันไม่คุ้ม	8.수지가 안 맞아.	(만 마＾이 쿰↗)	\N	\N	thai-conversation	기타
12520	พอได้	9.쓸만해.	(퍼어 다＾이)	\N	\N	thai-conversation	기타
12521	พอดีเจอกันเขา	10.그사람이랑 우연히 딱 마주쳤어.	(퍼어디 쩌어 깐 카오↗)	\N	\N	thai-conversation	기타
12522	ทำไปเลย	11.하던 일 계속해./가서 일해.	(탐 빠이 러이)	\N	\N	thai-conversation	기타
12523	สวยขึ้น	12.더 예뻐졌는 데.	(쑤v어이 큰＾)	\N	\N	thai-conversation	기타
12524	แล้วเจอกัน	13.다음에 봐.	(래우↗쩌어 깐)	\N	\N	thai-conversation	기타
12525	แค่นี้นะ	14.그럼, 이만 (전화끊을 때)	(캐＾애 니이↗ 나↗)	\N	\N	thai-conversation	기타
12526	อะไรนะ	15.뭐라고 ?	(아↘라이 나↗)	\N	\N	thai-conversation	기타
12527	พาเพื่อนไปเลี้ยง	16.친구 데려가서 대접했어.	(파아 프＾안 빠이 리앙↗)	\N	\N	thai-conversation	기타
12528	แถวนี้มีของอร่อย ๆ	17.이 근방은 맛있는 것들이 많아.	(태v우 니이↗ 미이 커v엉 아↘러이 아↘러이)	\N	\N	thai-conversation	기타
12529	ลองใส่ดู	18.한번 입어 봐.	(러엉 싸이↘ 두우)	\N	\N	thai-conversation	기타
12530	แล้วไง	19.그래서 ?/더 말해 봐.	(래우↗ 응아이)	\N	\N	thai-conversation	기타
12531	หิวจะตายอย่แล้ว	20.배고파 죽겠어.	(히v우 짜 따이 유우↘ 래우↗)	\N	\N	thai-conversation	기타
12532	น่ารัก เหมือน เดิม	21. 여전히 귀여워.	(나＾아락↗ 므v언 드 ㅓ ㅁ) 귀엽다 ~ 와 같다, ~ 대로 원래	\N	\N	thai-conversation	기타
12533	ขอ เข้า ห้องน้ำก่อน	22. 내가 먼저 화장실 좀 쓸께.	(커v어  카＾오  허＾엉남 ↗ 꺼언↘) ~ 해 달라 들어가다 화장실 먼저	\N	\N	thai-conversation	기타
12534	เดี๋ยวมา	23. 곧 올게.	(디여v우 마) 곧  오다	\N	\N	thai-conversation	기타
12535	หยุดกลางทาง	24. 길 가운데서 멈췄다.	(윳↘ 까앙 타앙) 멈추다 가운데 길	\N	\N	thai-conversation	기타
12536	ไม่ถือ	25. 신경 안써.	마＾이 트v으 아니다 (손에)잡다, 가지다, 유지하다, 간주하다, 마음에 두다, 걱정하다	\N	\N	thai-conversation	기타
12537	เขา พูด ภาษา พื้น ๆ	26. 그는 쉬운 말로 얘기해.	카오↗ 푸＾웃 파아싸v아 프은↗ 프은↗ 그 말하다 언어, 말 기초적인	\N	\N	thai-conversation	기타
12538	ทำไป เรื่อย ๆ	27. 계속 하세요.	탐 빠이 르어＾이 르어＾이 하다 앞에 나와 있는 동사의 계속 계속, 조금씩	\N	\N	thai-conversation	기타
12539	มันยังไง กัน	28. 그게 다 뭐야 ?	만 양아이 깐 그것 어떻게 서로, 함께	\N	\N	thai-conversation	기타
12540	เราจะเหมารถไป	29. 차하고 기사랑 함께 렌트하려구요.	라오 짜 마v오 롯↗ 빠이 우리 할것이다 (통째로) 빌리다 차 앞의 동사의 계속	\N	\N	thai-conversation	기타
12541	ผมเป็นหนี้บุญคุณเขา	30. 저는 그분에게 은혜를 입었습니다.	폼v 뻰 니＾이분쿤 카오↗ 저 이다 은혜 그	\N	\N	thai-conversation	기타
12542	ขอเป็นโอกาสห้นา	31. 다음 기회로 미룰께요.	커v어 뻰 오오까앗↘ 나＾아 요구하다, 바라다 로서 기회 다음	\N	\N	thai-conversation	기타
12543	เรา ได้ กำไร	32.우리는 이익이야.	라오 다＾이 깜라이 우리 얻다 이익	\N	\N	thai-conversation	기타
12544	เขา พูดไม่รู้เรื่อง	33. 나는 그가 무슨 얘기하는 지 모르겠어.	카오↗ 푸＾웃 마＾이 루우↗ 르＾앙 그 말하다 아니다 알다 이야기, 일	\N	\N	thai-conversation	기타
12545	พอได้ ก็ได้มาก	34. 충분한데 그 이상이다. (비만 오면, 쏟아붓는다.)	퍼어  다＾이   꺼   다＾이 마＾악 충분하다 가능하다 ~도, ~면 가능하다 많이	\N	\N	thai-conversation	기타
12546	รอไม่ไหวแล้ว	35.더 이상 기다릴 수 없어.	러어  마＾이 와v이  래우↗ 기다리다 아니다 할수있다 이미	\N	\N	thai-conversation	기타
12547	ไม่มี ประโยชน์	36.소용 없어. / 쓸모 없어	마＾이 미이 쁘라요＾옷 아니다 있다 쓸모, 효과	\N	\N	thai-conversation	기타
12548	ใครบอก	37. 누가 그래 ?	크라이 버억↘ 누구 말하다	\N	\N	thai-conversation	기타
12685	แล้งแต่คุณ	166. 당신에게 달려 있지.	(래우↗ 때애↘ 쿤) 택시를 탔는 데, 기사가 고속도로 로 갈지 아니면 국도로 갈 지 물어 봤을 때,기사 맘대로 하라고 말하고 싶을 때 이 표현을 쓰면 된다.	\N	\N	thai-conversation	\N
12689	ไม่น่าฟัง	들을만 하지 않아	(마＾이 나＾아 황)	\N	\N	thai-conversation	\N
12693	พูดดัง ๆหน่อย	171. 좀 크게 말해 줘.	푸＾웃 당당 너이↘ 말하다 (소리가) 크다 좀, 약간	\N	\N	thai-conversation	\N
12697	ได้ยินกับหู	1) 귀로 직접 들었어.	(다＾이 인 깝↘ 후v우)	\N	\N	thai-conversation	\N
12701	บิ๊กซิ	Big-C	(빅↗ 씨)	\N	\N	thai-conversation	\N
12705	โพรโมชั่น	프로모션	이러한 마트에서 프로모션 (โพรโมชั่น : 프로오 모오 찬＾) 행사할 때, 사용하는 문구중의 하나가 바로,	\N	\N	thai-conversation	\N
810	criminal	범죄자	\N	\N	\N		하
841	publishing company	출판사	\N	\N	\N		중
12557	โอ้โห	46. 와아 !/ 오오 !	오＾오 호v오 와아 ! / 오오 !	\N	\N	thai-conversation	기타
12561	ขอที เถอะ	50.제발 그만이요.	커v어 티이 트ㅓ↘ 요구하다, 부탁하다 ~ 번, 시기 ~ 라, ~ 자, ~ 요 부탁이니까 그만둬 주기를 요구하다	\N	\N	thai-conversation	기타
12565	เขาหนี ไปแล้ว	54.그는 이미 도망쳤어.	카오↗ 니v이 빠이 래우↗ 그 도망치다 가다 이미	\N	\N	thai-conversation	기타
12569	มันไร้ สาระ	58.그건 넌센스야.	만 라이↗ 싸v아 라↗ 그것 ~ 이 없다 내용	\N	\N	thai-conversation	기타
12573	เดี๋อว ก็รู้	62.곧 알게 될거야.	디여v우 꺼＾ 루우↗ 곧   ~ 하면 알다	\N	\N	thai-conversation	기타
12577	รับรองทำได้	66.된다는 걸 보장할께.	랍↗ 러엉 탐 다＾이 보장하다 하다 할 수 있다	\N	\N	thai-conversation	기타
12581	ไปแป๊บเดียวก็ถึง	70.조금만 가면 도착해.	빠이 뺍↗ 디여우 꺼＾ 틍v 가다 잠깐 하나의 ~ 하면 도착하다	\N	\N	thai-conversation	기타
12585	ขึ้น รถ	74.차에 타다	큰＾  롯↗ 타다 차	\N	\N	thai-conversation	기타
12589	คืออย่างงี้นะ	78.말하자면 이런 거야.	크으 야앙↘ 이이↗ 나↗ 즉, 말하자면 ~ 처럼, ~ 같이 이 ~ 야, ~ 요	\N	\N	thai-conversation	기타
12593	ทุกซอก ทุกมุม	82.구석구석	툭↗ 써＾억 툭↗ 뭄 모든 틈새, 골목 모든 구석, 모서리	\N	\N	thai-conversation	기타
12597	ตกลงเอายังงี้	86.이렇게 하는 걸로 하자.	똑↘롱   아오   양 이이↗ 결정하다, 동의하다 사용하다, 이용하다 이렇게	\N	\N	thai-conversation	기타
12601	ความฝัน ที่ เป็นจริง	90.실현된 꿈.	콰암환v 티＾이 뻰 찡 꿈 ~ 인, ~ 한 ~ 되다 진짜	\N	\N	thai-conversation	기타
12605	ช่าง มัน	94.그냥 둬, 내버려 둬.	차＾앙   만 무관심하다, 방치하다, 마음대로 하다 그것	\N	\N	thai-conversation	기타
12613	เป็นแรง จูงใจ	102. 흡입력(유인, 끌림)이 있어.	뻰   래앵 쭈웅짜이 ~ 이다 힘, 능력 유인하다, 권유하다	\N	\N	thai-conversation	기타
12617	ยิ่งกว่านั้น	106. 그보다 더 (그이상).	잉＾   꽈아↘   난↗ 더욱 더, 점점 ~ 보다.~이상으로 그것	\N	\N	thai-conversation	기타
12621	ผมผิดหวัง ในตัวคุณ	110. 저는 당신에게 실망했어요.	폼v 핏↘ 왕v   나이   뚜아 쿤 저 틀리다 기대하다 안에, 에게 몸, 자신 당신	\N	\N	thai-conversation	기타
12625	จะเป็น กำลังใจให้ คุณ	114. 당신에게 힘이 될께요.	짜   뻰 깜랑짜이 하＾이 쿤 ~ 할 것이다 ~ 이다 정신력, 사기 ~ 에게 당신	\N	\N	thai-conversation	기타
12629	นึกออกแล้ว	118. 아하, 알았어.	늑↗ 어억↘ 래우↗ 생각하다 나오다 이제	\N	\N	thai-conversation	기타
12633	คุณเข้าใจผมผิด	122. 당신은 저를 오해했어요.	쿤 카＾오  짜이 폼v   핏↘ 당신 들어가다 마음 저 (남성) 틀리다	\N	\N	thai-conversation	기타
12637	แล้วแต่ คุณ	126. 당신에게 달려 있어요.	래우↗ 때＾애 쿤 ~ 에 달려 있다 당신	\N	\N	thai-conversation	기타
12641	ไม่เอาได้มั้ย	130. 원치 않아요.	마＾이 아오 다＾이 마이↗ ~아니다 원하다 ~할 수 있다 ~인가요 ?	\N	\N	thai-conversation	기타
12645	เดี๋ยวอย่างนี้เดี๋ยวอย่างนั้น	131. 이 순간은 이렇게, 저 순간은 저렇게.	디v여우 야앙↘ 니이↗ 디v여우 야앙↘ 난↗ 순간, 잠시 ~ 처럼 이 순간, 잠시 ~ 처럼 그	\N	\N	thai-conversation	기타
12649	จะไปส่งคุณ ที่ รถ	135. 당신을 차있는 데까지 바래다 줄께요.	짜 빠이 쏭↘ 쿤 티＾이 롯↗ ~할것이다 가다 보내다 당신 ~ 에 차	\N	\N	thai-conversation	기타
12653	กรรม ตาม สนอง	139. 업보 (불행) 가 뒤따르다.	깜 따암 싸↘너v엉 업보, 불행 따라오다 보답하다, 부응하다	\N	\N	thai-conversation	기타
12657	คิด ออกรึยัง	143. 생각났어요 안 났어요 ?	킷↗ 어억↘   르↗양 생각하다 나오다 ~ 인가요 아닌가요 ?	\N	\N	thai-conversation	기타
12661	เรื่อง มันเป็นยังงี้	147. 얘기가 이렇게 된거야.	르＾앙 만 뻰   양 이이↗ 이야기, 일 그것 ~ 이다 이렇게	\N	\N	thai-conversation	기타
12665	ทั้งสวยทั้งเก่ง	151. 이쁘고도 똑똑해.	탕↗ 쑤v어이 탕↗ 껭↘ 모두, ~랑 이쁘다 모두, ~ 랑 잘한다, 능력있다	\N	\N	thai-conversation	기타
12669	ไม่มีเงินดาวน์	154. 인도금이 없어.	마＾이 미이 응언 다우 아니다 있다 돈 계약금(선불)로 지불하다 할부금의 첫 지불액 (차 살 때의 인도금)	\N	\N	thai-conversation	기타
12673	เอาใจเก่ง	158. 잘 돌보고 관심 써 줘.	아오 짜이   껭↘ 관심쓰다, 비위 맞추다 ~ 을 잘한다	\N	\N	thai-conversation	기타
12677	ดูไม่ออก	보긴 보는 데 뭔지 잘 구분 못할 때	(두우 마＾이 어억↘)	\N	\N	thai-conversation	기타
12681	อย่าให้ จับ ได้	162. 잡히지 마.	야아↘ 하＾이 짭↘ 다＾이 ~ 하지 마 ~ 하게 잡다 ~ 할 수 있다	\N	\N	thai-conversation	기타
12550	อย่าหลอกกันนะ	39. 날 속이지 마.	(야아↘ 러억↘ 깐 나↗) 하지 마라 속이다 서로, 동시에 ~구요	\N	\N	thai-conversation	\N
12554	หมดตัวแล้ว	43. 난 빈털털이야.	못↘   뚜아   래우↗ 다하다, 없어지다 자기, 몸, 수 이미	\N	\N	thai-conversation	\N
12558	รัก คุณเท่าฟ้า	47.하늘만큼 당신을 사랑해.	락↗  쿤 타＾오 화아↗ 사랑하다 당신 ~ 만큼 하늘	\N	\N	thai-conversation	\N
12562	อย่าย่ง ได้ มั้ย	51.신경 좀 안 써줄 수 있니 ?	야아↘ 융＾   다＾이 마이↗ ~ 하지마라 혼란하다, 바쁘다 할 수 있다 ~ 요 ?	\N	\N	thai-conversation	\N
12566	คุณ นอน ละเมอ	55.당신은 자면서 잠꼬대한다.	쿤 너언 라↗머어 당신 자다, 눕다 잠꼬대하다, 망상하다	\N	\N	thai-conversation	\N
12570	เขาดวง ไม่ดี	59.그는 운이 안 좋아.	카오↗ 두엉 마＾이 디이 그 운 아니다 좋다	\N	\N	thai-conversation	\N
12574	สมน้ำหน้า	63.쌤통이다, 꼴좋다	쏨v 남↗ 나＾아 적합하다 얼굴, 안면 (비꼼, 혐오의 감정)	\N	\N	thai-conversation	\N
12578	ทำแค่ นี้ก็ ไม่ ได้	67.이 정도인 데 (쉬운데)할 수 없다니.	탐 캐＾애 니이↗ 꺼＾ 마＾이 다＾이 하다 겨우 ~ 뿐 이 ~ 해도 아니다 할 수 있다	\N	\N	thai-conversation	\N
12582	เขาเอาตัวไม่รอด	71.그는 몸을 피할 수 없었어.	카오↗ 아오 뚜아 마＾이 러＾엇 그 가지고 가다 몸 아니다 면하다, 피하다	\N	\N	thai-conversation	\N
12586	ไม่ต้อง แล้ว	75.이젠 필요 없어	마＾이 떠＾엉 래우↗ 아니다 ~ 해야 한다 이미	\N	\N	thai-conversation	\N
12590	คอยดูก็แล้วกัน	79.조금만 기다려 보자.	커이 두우 꺼＾ 래우↗ 깐 기다리다 보다 (~ 하도록) 합시다	\N	\N	thai-conversation	\N
12594	เป็นไปได้ยังไร	83.어떻게 그렇게 될 수 있어 ?	뻰   빠이   다＾이 양라이 ~ 이다, ~ 되다 앞동작의 계속 할 수 있다 어떻게 진행되다, 경과하다	\N	\N	thai-conversation	\N
12598	ไม่ใช่ เรื่องเลวร้าย	87.나쁜 일이 아냐.	마＾ 이 차＾ 이 르＾ 앙 레우라이↗ 아니다   일, 이야기 나쁘다	\N	\N	thai-conversation	\N
12602	ไม่ ทำเด็ดขาด	91.절대로 그 일 안 해.	마＾이 탐 뎃↘ 카앗↘ 아니다 하다 절대로, 전혀	\N	\N	thai-conversation	\N
12606	ทีหลังอย่า ทำ	95.다음 번에는 하지 마.	티이   랑v 야아↘ 탐 ~ 번, ~ 차례 뒤의, 다음의 하지 마라 하다	\N	\N	thai-conversation	\N
12610	หา ไม่ ได้ ง่าย ๆ	99.찾기가 쉽지 않아.	하v아 마＾이 다＾이 응＾아이 응＾아이 찾다   아니다 할 수 있다 쉽다	\N	\N	thai-conversation	\N
12614	เชิญนั่งก่อน	103. 먼저 앉으시죠.	츠ㅓㄴ   낭＾   꺼언↘ ~ 하세요 앉다 먼저	\N	\N	thai-conversation	\N
12618	เสียเวลา	107. 시간낭비야.	씨v아   웨라 잃다, 낭비하다 시간	\N	\N	thai-conversation	\N
12626	พยายาม อยู่	115. 노력하고 있어.	파야아야암 유우↘ 노력하다 ~ 하고 있다	\N	\N	thai-conversation	기타
12630	อย่าหู เบา	119. 너무 쉽게 믿지 마.	야아↘   후v우 바오 ~ 하지 마라 귀 가볍다 다른 사람의 말을 잘 믿다	\N	\N	thai-conversation	기타
12634	อีกสัก ครู่	123. 잠시후에.	이익↘ 싹↘  크루＾우 다시, 또, 다른, 더 ~ 만큼, ~ 정도 잠시, 잠깐	\N	\N	thai-conversation	기타
12642	ไม่เอาเลย	원치 않는다니까.	싸가지 없게 :  (마＾이 아오 르ㅓ이)	\N	\N	thai-conversation	기타
12646	ไม่ย่อท้อ	132. 기죽은 게 아냐, 의기소침한 게 아냐.	마＾이 여＾어 터어↗ ~ 아니다 기죽다, 의기소침해지다, 전의를 상실하다	\N	\N	thai-conversation	기타
12650	รับรองคุณต้อง ชอบ	136. 당신이 이걸 좋아하리라 보장해요.	랍↗ 러엉   쿤 떠＾엉   처＾업 보증하다, 증명하다 당신 적중하다, ~ 에 맞다 좋아하다	\N	\N	thai-conversation	기타
12654	ถอยไป	140. 물러서.	터v이   빠이 뒤로 물러나다, 철수하다 앞동작의 계속됨, 말하는 사람으로부터 멀어져 가는 것을 뜻함.	\N	\N	thai-conversation	기타
12658	ออกไป เดี๋อวนี้	144. 당장 여기서 나가 !	어억↘ 빠이 디v여우 니이↗ 나가다 가다 지금, 당장	\N	\N	thai-conversation	기타
12662	ผมผิดเอง	148. 제가 잘못한 거에요.	폼v 핏↘ 에앵 저 잘못하다 자신의, 스스로	\N	\N	thai-conversation	기타
12666	ผม ซื้อเงินสด	152. 나는 현찰로 샀어.	폼v 쓰으↗ 응언 쏫↘ 나 사다 돈 싱싱하다, 현금의, 순결하다,현찰 สด (쏫↘ : 순결하다) 과 โสด (쏘옷↘ : 독신의, 씽글) 의 단음 /오/ 와 장음 /오오/ 를 꼭 구별하자.	\N	\N	thai-conversation	기타
12670	รอด ตัว ไป	155. 위험에서 벗어났어 (휴, 살아났어 의 느낌)	러＾엇   뚜아 빠이 (위험에서) 벗어나다 몸 앞동사의 지속	\N	\N	thai-conversation	기타
12674	เก็บ เป็นความลับ	159. 비밀로 해 둬.	껩↘   뻰 콰암랍↗ 챙기다, 보관하다, 숨겨두다 ~ 으로 비밀	\N	\N	thai-conversation	기타
12678	ฟังไม่ออก	듣긴 듣는 데 뭔소린지 잘 모를 때	(황 마＾이 어억↘)	\N	\N	thai-conversation	기타
12682	รักแรก พบ	163. 첫눈에 반했어.	락↗   래＾액 폽↗ 사랑하다 처음 만나다	\N	\N	thai-conversation	기타
12686	ไม่น่าดู	167. 볼만 하지 않아.	마＾이 나＾아 두우 ~아니다 ~ 할만한 보다	\N	\N	thai-conversation	기타
12690	มาเป็น เพื่อนคุณ	168. 당신과 길동무하려고 왔어요.	마아 뻰   프＾안 쿤 오다 ~ 로서 친구 당신	\N	\N	thai-conversation	기타
12694	เคลียงาน อยู่	172. 일 끝내는 중이야.	클리아   응안 유우↘ clear (끝내다) 일 ~ 하고 있다	\N	\N	thai-conversation	기타
12698	ทำกับมือ	2) 손으로 직접 만들었어.	(탐 깝↘ 므으)	\N	\N	thai-conversation	기타
12702	คาร์ฟูร์	Carrefour	(카아 후우)	\N	\N	thai-conversation	기타
12706	ซื้อ 1 แถม 1	Buy 1 Get 1 (하나 사면 하나 덤)	(쓰으↗ 능↘ 태앰 능↘) =	\N	\N	thai-conversation	기타
12872	ที่ เหรือ	278. 나머지	티＾이   르v아 ~ 한 것 (영어의 that : 관계대명사) 남다	\N	\N	thai-conversation	기타
12555	ขอหลับแป๊บนึง	44.잠깐만 눈좀 붙일께요.	커v어   랍↘ 뺍↗능 ~해 주세요 눈을 감다, 자다 잠깐	\N	\N	thai-conversation	기타
12563	บอก ตรง ๆ	52.까놓고 얘기할께.	버억↘   뜨롱뜨롱 이야기하다 곧이곧대로, 있는대로	\N	\N	thai-conversation	기타
12567	ไม่คิดเลยว่าจะเป็นแบบ นี้	56. 이렇게 되리라고는 생각도 못했어.	마＾이 킷↗  러이 와＾아 짜 뻰   배앱 ↘ 니↗ ~ 아니다 생각하다 전혀 ~라고 ~ 일 것이다 ~ 이다 형식, 모양 이	\N	\N	thai-conversation	기타
12571	มันไม่เหมือนแต่ก่อน	60.그건 전과 같지 않은 데.	만 마＾이 므v언 때애↘ 꺼언↘ 그것 아니다 같다 ~부터, ~에서 전, 지나간 이전에는, 옛날에는	\N	\N	thai-conversation	기타
12575	มันเป็นเรื่องใหญ่	64.그거 큰일인 데.	만 뻰   르＾앙 야이↘ 그것 ~ 이다 일, 이야기 크다	\N	\N	thai-conversation	기타
12579	เรื่องนี้ผมถนัด	68.이 일은 내가 익숙해.	르＾앙 니이↗ 폼v 타낫↘ 일, 이야기 이 나 능숙하다, 숙달되다	\N	\N	thai-conversation	기타
12583	ค่อยยังชั่ว	72.(병세가) 많이 나아졌어.	커＾이 양 추＾아 슬슬, 점점 아직도, 계속 시종, 내내, 기간	\N	\N	thai-conversation	기타
12587	จ้าง ก็ ไม่บอก	76.뭐라 해도 말 안할 거야.	짜＾앙 꺼＾ 마＾이 버억↘ 고용하다 ~ 해도 아니다 말하다	\N	\N	thai-conversation	기타
12591	ขับรถปาดซ้ายปาดขวา	80.왼쪽 오른쪽 왔다갔다 끼어들면서 운전하다	캅↘ 롯↗ 빠앗↘ 싸이↗ 빠앗↘ 콰v아 운전하다 차 깎아내다 왼쪽 깎아내다 오른쪽	\N	\N	thai-conversation	기타
12595	นั่นน่ะสิ	84.너에게 동의해. (그것 봐.)	난＾ 나＾ 씨↘ 그것 ~ 요 ~ 해 (명령, 강조)	\N	\N	thai-conversation	기타
12599	มี ข้อแลกเปลี่ยน	88. 바꿔야 할 항목이 있어.	미이 커＾어   래＾액 쁘리↘얀 있다 사항, 항목 교환하다, 바꾸다	\N	\N	thai-conversation	기타
12603	คุณทำไปได้ยังไง	92.당신 어떻게 그 일을 했어요 ?	쿤 탐 빠이 다＾이 양아이 당신 하다 동작의 계속 할 수 있다 어떻게	\N	\N	thai-conversation	기타
12607	ต้องดีแน่ ๆ	96.확실히 좋을 거야.	떠＾엉   디이 내＾애 내＾애 일치하다, 명중하다, ~ 해야 한다 좋다 정말, 반드시	\N	\N	thai-conversation	기타
12611	เขา นอกใจเมีย	100.그는 아내로부터 마음이 떠났다.	카오↗ 너＾억 짜이 미아 그 밖에   마음 부인 (부부중 한 쪽이) 변심하다	\N	\N	thai-conversation	기타
12615	มัวแต่ ทำงาน	104. 일밖에 안 해.	무어 때애↘   탐 응안 (무턱대고) ~ 하고 있을 뿐이다 하다 일	\N	\N	thai-conversation	기타
12619	หาย ไปไหนหมด	108. 다 어디로 사라졌어 ?	하v이   빠이 나v이 못↘ 사라지다, 없어지다 동작의 지속 어디로 모두, 전부	\N	\N	thai-conversation	기타
12623	ดีพอ รึยัง	112. 충분히 좋아 안좋아 ?	디이 퍼어 르양 좋다 충분하다 ~ 인가요 아닌가요 ?	\N	\N	thai-conversation	기타
12627	รวม หัวกัน โกง	116. 함께 작당해서 속였어.	루엄   후v아 깐   꼬옹 모으다 머리 함께 속이다 머리를 맞대고 함께 행하다, 연합하다	\N	\N	thai-conversation	기타
12631	เขาเป็นเจ้าของความคิด	120. 이건 그사람 아이디어야.	카오↗ 뻰 짜＾오 커v엉 콰암킷↗ 그 ~ 이다 주인 ~ 의 생각	\N	\N	thai-conversation	기타
12635	คุณมาทำอะไรที่นี่	124. 당신 여기서 뭐 해요 ?	쿤 마아  탐 아라이 티＾이 니＾이 당신 현재까지 지속 하다 무엇 ~ 에 이것 ,여기에	\N	\N	thai-conversation	기타
12639	โง่เหมือนควาย	128. 물소처럼 멍청해.	옹＾오 므v안   콰이 멍청하다 ~ 처럼, ~ 같이 물소	\N	\N	thai-conversation	기타
12643	ไม่เอาครับ	원치 않아요.	접대성 멘트 : (마＾이 아오 캅↗)	\N	\N	thai-conversation	기타
12647	รอ เดี๋ยวนะ	133. 잠시만 기다려.	러어 디v여우 나↗ 기다리다 잠시 ~ 요	\N	\N	thai-conversation	기타
12655	หันมานี่หน่อย	141. 조금만 이쪽을 봐주세요.	한v 마아   니＾이   너이↘ 향하다  오다 , 지속되는 상태 이것, 여기 좀, 약간	\N	\N	thai-conversation	기타
12659	เขาเป็นนายหน้า	145. 그는 중개인이야.	카오↗ 뻰   나이 나＾아 그   ~ 이다 중개인	\N	\N	thai-conversation	기타
12663	พูดจา น่ารัก	149. 귀엽게 말하다	푸＾웃 짜아 나＾아 락↗ 말하다 말하다 ~ 할만한 사랑하다	\N	\N	thai-conversation	기타
12667	โสดแต่ไมสด	&ldquo;독신이지만 처녀나 총각이 아니다&rdquo;	(쏘옷↘ 때애↘ 마＾이 쏫↘)	\N	\N	thai-conversation	기타
12671	ไม่ดีมั้ง	156. 좋은 생각이 아닌 걸.	마＾이 디이 망↗ 아니다 좋다 ~ 일 걸 (불확실함, 상상, 추측) (끄라망) 의 줄임말	\N	\N	thai-conversation	기타
12675	พูดไม่ออก	160. 말이 안 나와.	푸＾웃 마＾이 어억↘ 말하다 아니다 나오다	\N	\N	thai-conversation	기타
12679	อะไรนะ		(아라이 나↗) 와 쌍벽을 이룬다	\N	\N	thai-conversation	기타
12683	ผม ไม่ค่อยถนัด	164. 저는 능숙치 않아요.	폼v 마＾이 커＾이 타↘낫↘ 저 그다지 ~ 아니다 능숙하다, 숙련되다	\N	\N	thai-conversation	기타
12687	ไม่น่ากิน	먹음직스럽지 않은 데	(마＾이 나＾아 낀)	\N	\N	thai-conversation	기타
12691	ตายแล้ว	169. 이런 ! (Oh, my God !)	따이 래우↗ 죽다 이미, 벌써	\N	\N	thai-conversation	기타
12695	มี ลางสังหรณ์	173. 뭔가 조짐이 있어.	미이 라앙 쌍v헌v 있다 조짐, 징조 예감이 들다	\N	\N	thai-conversation	기타
12699	มี เยอะแยะ	175. 굉장히 많아.	미이 으ㅕ↗ 얘↗ 있다 많다, 충분히 있다 매우 많다, 잔뜩	\N	\N	thai-conversation	기타
12703	เทสโก้ โลตัส	Tesco Lotus	(테쓰꼬＾오 로오땃↘ 이지만 다들 줄여서 &ldquo; 로오땃↘ &rdquo; 이라고 함)	\N	\N	thai-conversation	기타
815	ability to ride horse	말 타는 능력	\N	\N	\N		기타
12556	รู้แล้วล่ะ	45.이제 알겠어요.	루우↗ 래우↗ 라＾ 알다 이미, 벌써 ~ 죠, ~ 라	\N	\N	thai-conversation	기타
12564	ขับรถ เมา	53.음주운전하다	캅↘   롯↗ 마오 운전하다 차 취하다	\N	\N	thai-conversation	기타
12568	อย่างอนไปหน่อย เลย	57.너무 삐지지좀 마.	야↘ 우언 빠이 너이↘ 러이 ~ 하지마라 토라지다 앞의 동작의 계속 좀 전혀, 완전	\N	\N	thai-conversation	기타
12572	คุณเอาแต่ใจตัว เอง	61.당신은 제 멋대로 한다.	쿤 아오 때애↘ 짜이 뚜아 에앵 당신 원한다 단지 마음 몸 자기의,제멋대로 하다	\N	\N	thai-conversation	기타
12576	บอกแล้วไง	65.이미 말했잖아.	버억↘ 래우↗ 응아이 말하다 이미 어때 ? 어째 ?	\N	\N	thai-conversation	기타
12580	ไม่ ได้พูดเล่น	69.농담이 아냐.	마＾이 다＾이 푸＾웃 레＾앤 아니다 했다 말하다 장난하다,농담하다	\N	\N	thai-conversation	기타
12584	เชื่อใจ ได้	73. 믿을 수 있어.	츠＾아 짜이 다＾이 믿다   할 수 있다	\N	\N	thai-conversation	기타
12588	จริง หรือเปล่าก็ไม่ รู้	77.진짠지 아닌 지 몰라.	찡 르v 빠오 꺼＾   마＾이 루우↗ 진짜 또는 아니다 ~ 해도, ~ 하면 아니다 알다	\N	\N	thai-conversation	기타
12592	เขาถังแตก	81.그는 빈털털이다.	카오↗ 탕v 때액↘ 그 (물)통 깨지다 매우 가난하다, 돈이 없다	\N	\N	thai-conversation	기타
12596	เกิดมาจน	85.가난하게 태어났어.	끄ㅓㅅ ↘ 마아 쫀 태어나다 동사의 지속적 상태 가난하다	\N	\N	thai-conversation	기타
12600	เรารู้จักกันมาก่อนรึเปล่า	89.우리 전에 알던 사이 아닌가 ?	라오 루우↗ 짝↘ 깐 마아 꺼언↘ 르↗ 빠오↘ 우리 알고 있다 서로 동사의 지속적 상태 전에 ~ 인가 아닌가	\N	\N	thai-conversation	기타
12604	เจอกันชาติ หน้า	93.다음 생애에 만나.	쯔ㅓ어 깐 차＾앗 나＾아 만나다 같이 인생, 삶 다음의	\N	\N	thai-conversation	기타
12608	เขาไม่ยอมกิน	97.그는 먹으려고 하지 않아.	카오↗ 마＾이 여엄   낀 그 아니다 동의하다, 허락하다 먹다	\N	\N	thai-conversation	기타
12612	เขาชอบพูด เพ้อเจ้อ	101. 그는 쓸데없는 말을 잘 해.	카오↗ 처＾업 푸＾웃 프ㅓ↗ 쯔ㅓ＾ 그 좋아하다 말하다 쓸데없는 소리를 지껄이다	\N	\N	thai-conversation	기타
12616	มัน คนละ เรื่อง	105. 그건 다른 이야기야.	만 콘 라↗   르＾앙 그것 사람 ~ 마다 이야기	\N	\N	thai-conversation	기타
12620	มา ถึงแล้ว	109. (와서) 도착했어.	마아 틍v   래우↗ 오다 도착하다 이미, 벌써	\N	\N	thai-conversation	기타
12624	ยังไงก็แล้วแต่	113. 어쨌든, 좌우간	양아이 꺼＾ 래우↗ 때애↘ 어떻게 ~ 해도, ~ 하면 ~ 에 달려 있다	\N	\N	thai-conversation	기타
12628	เขา ไม่ยอมรับ	117. 그는 수락 (인정) 하지 않아.	카오↗ 마＾이 여엄랍↗ 그 ~ 아니다   인정하다, 수락하다	\N	\N	thai-conversation	기타
12632	เชิญขึ้น ข้างบน	121. 윗층으로 올라 가세요.	츠ㅓㄴ 큰＾ 카＾앙   본 하세요 오르다 ~쪽, ~ 방향 위	\N	\N	thai-conversation	기타
12640	คิดมากไป รึเปล่า	129. 너무 깊게 생각하는 거 아니예요 ?	킷↗ 마＾악 빠이 르↗ 빠오↘ 생각하다 많이 상태의지속 ~인가요 아닌가요 ?	\N	\N	thai-conversation	기타
12644	ไม่เอาได้มั้ยครับ	원치 않아도 되나요 ?	싸가지 있게 :  (마＾이 아오 다＾이 마이↗ 캅↗ )	\N	\N	thai-conversation	기타
12648	มาทำงานสาย	134. 일하러 늦게 오다. (직장에 지각하다.)	마아 탐응안 싸v이 오다 일하다 늦다	\N	\N	thai-conversation	기타
12652	ไปตามเขามา	138. 가서 그를 불러 와.	빠이 따암 카오↗ 마아 가다 불러오다 그 오다	\N	\N	thai-conversation	기타
12656	มานี่ ได้ ยังไง	142. 어떻게 여기에 왔나요 ?	마아 니＾이 다＾이   양아이 오다 이것, 여기 ~ 할 수 있다 어떻게	\N	\N	thai-conversation	기타
12660	หมั่นไส้	146. 싫어, 미워, 불쾌해.	만↘   싸＾이 부지런하다, 애쓰다 내장, 실정, (만두) 속, 가족같은 사람 싫어하다, 미워하다	\N	\N	thai-conversation	기타
12664	รัก จริง หวังแต่ง	150. 진짜로 사랑하고, 결혼하고 싶어.	락↗ 찡  왕v   때앵↘ 사랑하다 진짜로 희망하다 결혼하다	\N	\N	thai-conversation	기타
12668	เขาซื้อเงินผ่อน	153. 그는 할부로 샀어.	카오↗ 쓰으↗ 응언 퍼언↘ 그 사다 돈 분할로 지불하다, 긴장을 풀다	\N	\N	thai-conversation	기타
12672	เดี๋ยวอีเมล์ไป หา	157. 바로 이메일 보낼께.	디v여우 이이 메애 빠이 하v아 곧, 순간 이메일 가다 찾다	\N	\N	thai-conversation	기타
12676	คิดไม่ออก	&ldquo;생각이 안 나&rdquo;	(킷↗ 마＾이 어억↘)	\N	\N	thai-conversation	기타
12680	ไม่มีกำลัง เลย	161. 힘이 하나도 없어.	마＾이 미이 깜랑 르ㅓ이 아니다 있다 힘, 기운 전혀, 절대로	\N	\N	thai-conversation	기타
12684	หุบ ปาก	165.닥쳐 !	훕↘ 빠악↘ 다물다, 접다 입	\N	\N	thai-conversation	기타
12688	ไม่น่าอย่	있을만 하지 않아	(마＾이 나＾아 유우↘)	\N	\N	thai-conversation	기타
12692	หูอื้อ	170. 귀가 먹먹해.	후v우 으＾으 귀   귀가 울리다, 잘 안들리다	\N	\N	thai-conversation	기타
12696	เห็นกับตา	174. 눈으로 직접 봤어.	헨v 깝↘   따아 보다 ~ 으로 직접, ~ 와 함께 눈	\N	\N	thai-conversation	기타
12700	แถม ให้	176. 덤으로 주는 거에요.	태v앰   하＾이 덤 (경품)으로 주다, 그밖에 따로 주다	\N	\N	thai-conversation	기타
12704	แม็คโคร	Makro	(맥↗크로)	\N	\N	thai-conversation	기타
12708	มิน่าล่ะ	178. 별 거 없어.	미↗   나＾아라＾ ~ 아니다 (= ไม่) ~ 할 만 하다 의문, 명령, 간청할 때 문장끝에 붙이는 말	\N	\N	thai-conversation	기타
12874	คนที่เหรือ	나머지 사람	(콘 티＾이 르v아)	\N	\N	thai-conversation	기타
12711	คุณไม่ยอมไป	당신은가지 않으려고 한다.	(쿤 마＾이 여엄 빠이)	\N	\N	thai-conversation	기타
12719	ไปไหนก็ได้	187. 어디든지 가도 좋아요.	빠이 나v이   꺼＾   다이＾ 가다 어디 ~ 해도, ~ 하면 ~ 할 수 있다	\N	\N	thai-conversation	기타
12723	คุณจะ ให้ ฉันทำ ยังไง	189. 당신은 내가 어떻게 했으면 좋겠어요 ?	쿤 짜↘ 하＾이 찬 탐 양아이 당신 ~ 할 것이다 ~하도록 나 하다 어떻게	\N	\N	thai-conversation	기타
12727	ใบเบิกเงิน	(돈을) 인출하다	(바이 브ㅓㄱ↘ 응언) = (은행의) 출금전표	\N	\N	thai-conversation	기타
12731	ทำแล้วดี	했더니 좋아.	(탐 래우↗디이)	\N	\N	thai-conversation	기타
12735	รอด ตาย	193. 살아남았다	러＾엇   따이 (위험에서) 벗어나다 죽다	\N	\N	thai-conversation	기타
12739	มันก็ดี	나도 좋다고 생각해. (그건 좋아.)	(만 꺼＾ 디이)	\N	\N	thai-conversation	기타
12743	ไปกินอะไรมา	너 뭐 먹었어 ?	빠이 낀 아라이 마아 가다 먹다 무엇 오다 이 문장에서ไป 는 &ldquo;가다&rdquo;의 뜻이 아니고, มา 역시 &ldquo;오다&rdquo; 의 뜻이 아니다.	\N	\N	thai-conversation	기타
12747	คน หลายใจ	203. 바람기 있는 사람 (변덕스러운 사람)	콘 라v이 짜이 사람 많다 마음	\N	\N	thai-conversation	기타
12751	ห้ามจอดรถ	주차 금지	(하＾암 쩌엇↘ 롯↗)	\N	\N	thai-conversation	기타
12755	ห้ามสูบบุหรี่	금연	(하＾암 쑤웁↘ 부리이↘)	\N	\N	thai-conversation	기타
12759	ทำกับ มือ	209. 내 손으로 직접 했어.	탐 깝↘   므으 하다 ~ 을 가지고 손	\N	\N	thai-conversation	기타
12763	เหลืองอ๋อย	샛노랗다	(르v앙 어v이)	\N	\N	thai-conversation	기타
12767	ปัสสาวะ	소변 보다	(빳↘ 싸v아 와↗)	\N	\N	thai-conversation	기타
12771	ปวดขี้	(속어) 똥 마려워.	(뿌엇↘ 키＾이) (속어) 똥싸다	\N	\N	thai-conversation	기타
12775	นึกว่า คุณ ไม่ชอบ	213. 당신은 안 좋아한다고 생각했어.	늑↗  와＾아 쿤 마＾이 처＾업 생각하다 ~ 라고 당신 아니다 좋아하다	\N	\N	thai-conversation	기타
12779	อยู่เฝ้าบ้าน	215. 집 보고 있는 중이야.	유우↘   화＾오 바＾안 있다 지키다 집	\N	\N	thai-conversation	기타
12783	คุณตัวร้อน	218. 당신 열이 있어요.	쿤 뚜아 러언↗ 당신 몸 뜨겁다, 덥다	\N	\N	thai-conversation	기타
12787	ชอบรึไม่ชอบ	좋아해요, 안 좋아해요 ?	(처＾업 르＾ 마＾이 처＾업)	\N	\N	thai-conversation	기타
12791	เวลาฉันอยากจะทำ	내가 하고 싶을 때	(웰라 폼 야악↘ 짜↘ 탐)	\N	\N	thai-conversation	기타
12799	ไม่เห็น จริง ๆ	225. 정말로 안 봤어.	마＾이 헨v 찡찡 ~ 아니다 보다 정말로	\N	\N	thai-conversation	기타
12803	ไว้ใจไม่ได้	229. 믿을 수 (신뢰할 수) 없어.	와이↗ 짜이 마＾이 다＾이 믿다, 신뢰하다 ~ 할 수 없다	\N	\N	thai-conversation	기타
12807	สอบตก	233. 시험에 떨어지다	써업↘ 똑↘ 시험   떨어지다	\N	\N	thai-conversation	기타
12811	นักพนันมือ อาชีพ	236. 프로 도박사	낙↗ 파↗난 므으 아아 치＾입 ~ 사, ~ 가 내기하다 1) 손 2) 도박이나 계 등의 멤버 직업프로	\N	\N	thai-conversation	기타
12815	นักข่าว	기자	(낙↗ 카우↘) &rarr; ข่าว (카우↘) = 뉴스	\N	\N	thai-conversation	기타
12819	นักบิน	조종사	(낙↗ 빈) &rarr; บิน (빈) = 하늘을 날다, 비행하다	\N	\N	thai-conversation	기타
12823	นักแสดง	배우	(낙↗ 싸↘대앵) &rarr; แสดง (싸↘대앵) = 표현하다, 연기하다	\N	\N	thai-conversation	기타
12827	ไม่ รู้จะทำยังไง	239. 어떻게 해야 할 지 모르겠어.	마＾이   루우↗ 짜↘  탐 양아이 ~ 아니다 알다 ~ 할 것이다 하다 어떻게	\N	\N	thai-conversation	기타
12831	ตามใจคุณ	243. 당신 뜻대로 하세요.	따라가다 마음 당신 마음대로 하다	\N	\N	thai-conversation	기타
12835	ปาก หวาน	247. 입바른 칭찬	빠악↘ 와v안 입 달콤하다	\N	\N	thai-conversation	기타
12839	สงสัยว่า ~	~ 라고 의심하다, 의문점을 갖다.	(쏭V 싸V이 와＾아 ~)	\N	\N	thai-conversation	기타
12843	คืนดีกันแล้ว	253. 이미 화해했어.	크은 디이 깐 래우↗ 화해하다 서로 이미	\N	\N	thai-conversation	기타
12847	นอนทั้งวันทั้งคืน	257. 하루종일 (밤낮으로) 자다	너언 탕↗  완 탕↗ 크은 자다 ~ 랑, 모두 낮 ~ 랑, 모두 밤	\N	\N	thai-conversation	기타
12851	อิจฉาตา ร้อน	260. 불타는 눈으로 시기하다 (탐내다)	잇↘ 차v아   따아 러언↗ 시기하다, 샘내다, 탐내다 눈 뜨겁다, 강렬하다	\N	\N	thai-conversation	기타
12855	เอาเป็นว่า~	264. ~ 라고 (결정) 하자.	아오   뻰 와＾아 ~ 사용하다, 있다, 필요하다 ~ 로서 ~ 라고	\N	\N	thai-conversation	기타
12859	เป็นใบ้หูหนวกตาบอด	268. 벙어리가 되고, 귀머거리가 되고, 장님이 되다.	뻰 바＾이 후v우 억↘ 따아 버엇↘ ~ 이 되다 벙어리다 귀 귀머거리다 눈 눈이 멀다	\N	\N	thai-conversation	기타
12863	แพ้อาหารทะเล	해산물 요리에 알레르기 있다	(패애↗ 아아 하v안 탈↗레애)	\N	\N	thai-conversation	기타
12867	ชอบ ใจ ลอย	273. 가끔 멍해 (멍때려).	처＾업 짜이 러이 좋아하다 마음 뜨다, 떠돌아 다니다 멍하다, 우두커니 생각에 잠기다	\N	\N	thai-conversation	기타
12871	ยังมีอีกเยอะ	277. 아직 많이 있어.	양   미이 이익↘ 으ㅕ↗ 아직 있다 더 많다	\N	\N	thai-conversation	기타
12875	บ้ารึเปล่า	279. 미쳤어 ? , 미친거 아냐 ?	바＾아 르↗ 빠오↘ 미치다 ~ 인가요 아닌가요 ?	\N	\N	thai-conversation	기타
819	skill	기술	\N	\N	\N		하
878	be willing to	에 대해 기꺼이 하다	\N	\N	\N		기타
12713	จับตัวคาที่	현장에서 붙잡다	(짭↘ 뚜아 카아 티＾이) =	\N	\N	thai-conversation	기타
12721	ทำยังไงก็ได้	뭘 해도 좋아요.	(탐 양아이 꺼＾ 다이＾)	\N	\N	thai-conversation	기타
12725	ลืมตา	눈을 뜨다	(르음 따아) ลืม (르음) 은 &ldquo; 잊다 &ldquo; 의 뜻뿐만 아니라, &ldquo; (눈을) 뜨다 &ldquo; 의 뜻도 있으니 주의할 것	\N	\N	thai-conversation	기타
12729	หลับนก	(졸음을 참지 못하고) 앉아서 꾸벅꾸벅 졸다	(랍↘ 녹↗)	\N	\N	thai-conversation	기타
12733	แก้ผ้า	192. 옷을 발가벗다	깨＾애   파＾아 벗다, 풀다 옷감, 옷	\N	\N	thai-conversation	기타
12737	ทำแทนเขา	195. 그 사람에게 보답하려고 했어.	탐 태앤   카오↗ 하다 보답하다, ~ 대신에 그 (him)	\N	\N	thai-conversation	기타
12741	จะ บ้าตาย	198. 미쳐 버리겠어 ! (미쳐서 죽을 지경이야 !)	짜↘   바＾아   따이 ~ 할것이다, ~ 하겠다 미치다, 정신이상이다 죽다	\N	\N	thai-conversation	기타
12745	อย่ายุ่ง	201. 간섭 하지마. (참견 마.)	야아↘ 융＾ ~ 하지 마 혼란하다, 바쁘다	\N	\N	thai-conversation	기타
12749	คุณฝีมือ ดี	205. 당신은 실력이 좋다.	쿤   휘v이 므으 디이 당신 실력, 솜씨 좋다	\N	\N	thai-conversation	기타
12753	ห้ามเลี้ยวซ้าย	좌회전 금지	(하＾암 리여우↗ 싸이↗)	\N	\N	thai-conversation	기타
12757	เรา แย่ง กันกิน	207. 우리는 먹을 것 가지고 다투었다.	라오 얘＾앵  깐 낀 우리 탈취하다, 낚아채다 서로 먹다	\N	\N	thai-conversation	기타
12761	ดำปิด๊ปี๋	211. 새까맣다.	(담 삣↘ 삐v이)	\N	\N	thai-conversation	기타
12765	ปวดเยี่ยว	(속어) 오줌 마려워.	(뿌엇↘ 이＾여우) (속어)오줌싸다	\N	\N	thai-conversation	기타
12769	เด็ด ดอกไม้		เด็ด (뎃↘ : 따다, 꺾다) + ดอกไม้ (더억↘ 마이↗ : 꽃 ) = 꽃을 따다 라는 뜻 차 타고 가다가 갓길에 내려서 여자가 소변보다 여성의 숲속 방뇨(?)	\N	\N	thai-conversation	기타
12773	รอบเดือน	생리하다	(러＾업 드안) ประจำเดือน(쁘라짬 드안) periodเม็นส์ (멘) &rarr; menses 에서 유래ระดู (라↗ 두우) &rarr; 의학적 표현	\N	\N	thai-conversation	기타
12777	นึกว่าคุณโกรธผม	당신은 나한테 삐졌다고 생각했어.	(늑↗ 와＾아 쿤 끄롯↘ 폼v)	\N	\N	thai-conversation	기타
12781	บอก แล้ว ไง	217. 내가 말했잖아.	버억↘ 래우↗ 응아이 말하다 이미 어떻게, 어때요	\N	\N	thai-conversation	기타
12785	จะทำยังไง	어떻게 할거에요 ?	(짜↘ 탐 양아이)	\N	\N	thai-conversation	기타
12789	อยู่บ้านเช่า	셋집에 삽니다.	(유우↘ 바＾안 차＾오)	\N	\N	thai-conversation	기타
12793	ขอ แก้แค้น	222. 복수할거야 !	커v어 깨＾애 캐앤↗ 바라다, 요구하다 보복하다, 앙갚음을 하다	\N	\N	thai-conversation	기타
12797	ตายเสียแล้ว	죽어버렸어요	(따이 씨v아 래우↗)	\N	\N	thai-conversation	기타
12801	ดีขนาดนั้น เลย เหรอ	227. 정말로 그렇게 좋아 ?	디이 카↘나앗↘ 난↗ 르ㅓ이   르ㅓ 좋다 그렇게   전혀, 완전히, 확실하다 ~ 해요?	\N	\N	thai-conversation	기타
12805	กลางวันแสก ๆ	231. 백주 대낮에	까앙 완 쌔액↘ 쌔액↘ 가운데 낮 (빛이) 비치다	\N	\N	thai-conversation	기타
12813	นักกีฬา	운동선수	(낙↗ 끼라) &rarr; กีฬา (끼라) = 운동, 스포츠	\N	\N	thai-conversation	기타
12817	นักดนตรี	음악가	(낙↗ 돈뜨리) &rarr; ดนตรี (돈뜨리) = 음악	\N	\N	thai-conversation	기타
12821	นักเรียน	초중고 학생	(낙↗ 끄리안) &rarr; เรียน (리안) = 배우다, 공부하다	\N	\N	thai-conversation	기타
12825	แอบดู	237. 몰래 보다	애앱↘ 두우 몰래 ~ 하다 보다 แอบ (애앱↘) + ~ 라는 구문이다. ~ 부분에 다양한 동사를 넣어서 말하게 되면, &lt; 몰래 ~ 하다 &gt;라는 뜻이 된다.	\N	\N	thai-conversation	기타
12829	หัวเด็ดตีนขาด ยังไงก็ไม่ ทำ	241. 무슨 일이 있어도, 하지 않을 거야.	후v아 뎃↘ 띠인 카앗↘ 양아이 꺼＾   마＾이  탐 머리 꺽다, 따다 다리 잘라지다 어떻게 ~ 해도 ~ 아니다 하다	\N	\N	thai-conversation	기타
12833	ขึ้น ๆ ลง ๆ	245. 오르락 내리락	큰＾큰＾ 롱롱 오르다 내리다	\N	\N	thai-conversation	기타
12837	ฝีมือ ตก	249. 실력이 줄었어.	휘v이 므으 똑↘ 실력, 기량 떨어지다	\N	\N	thai-conversation	기타
12841	เขาเองเหรอ	251. 바로 그 사람이라구 ?	카오↗ 에앵 러v어 그 바로, 자신의, 스스로 그래요 ?, ~ 인가요 ?	\N	\N	thai-conversation	기타
12845	อยู่กันสองต่อสอง	255. 둘이만 서로 있어.	유우↘ 깐 써v엉 떠어↘ 써v엉 있다 서로 둘 ~ 에 대해서, 對 (vs) 둘	\N	\N	thai-conversation	기타
12849	แกล้งโง่หรือโง่ จริง ๆ	258. 멍청한 척 하는 거야 아니면 진짜로 멍청한 거야 ?	끌＾랭 옹＾오 르v으 옹＾오 찡찡 ~ 한 척 하다 멍청하다 아니면 멍청하다 진짜이다	\N	\N	thai-conversation	기타
12853	ผม ไม่เกี่ยว	262. 저는 관계 (상관) 없어요.	폼v 마＾이 끼여우↘ 저 ~ 아니다 상관하다, 관계가 있다	\N	\N	thai-conversation	기타
12857	ไม่อยากคบกับเขา	266. 그사람이랑 어울리고 싶지 않아.	마＾이 야악↘ 콥↗ 깝↘ 카오↗ ~ 아니다 ~ 하고 싶다, 바라다 사귀다, 교제하다 ~ 와 그	\N	\N	thai-conversation	기타
12861	แพ้ยา	약물 과민반응을 보이다	(패애↗ 야아)	\N	\N	thai-conversation	기타
12878	ท่าทางจน	가난해 보여	(타＾아 타앙 쫀)	\N	\N	thai-conversation	기타
825	word list	단어 목록	\N	\N	\N		기타
12714	คุณผอมเกินไป	182. 당신은 너무 말랐어.	쿤 퍼v엄 끄ㅓㄴ빠이 당신 말랐다 너무 ~ 하다, 지나치게 ~ 하다	\N	\N	thai-conversation	기타
12722	ตกลงตามนี้	188. 이대로 하는 걸로 하죠	똑↘ 롱   따암   니이↗ 동의하다, 결정하다 ~ 대로, ~ 에 따라서 이	\N	\N	thai-conversation	기타
12726	เบิกตาดู	눈떠봐	(브ㅓㄱ↘ 따아 두우)	\N	\N	thai-conversation	기타
12730	คิดแล้ว กลุ้ม	191. (그 걸) 생각하면 걱정돼.	킷↗ 래우↗ 끄＾룸 생각하다 그러면, 그리고 나서 걱정하다	\N	\N	thai-conversation	기타
12734	ถอดเสื้อ	옷을 벗다	(터＾엇 쓰＾아)	\N	\N	thai-conversation	기타
12738	มันก็จริง	196. 나도 진짜라고 생각해. (그건 진짜야.)	만 꺼＾   찡 그 (It) ~ 도, ~ 면, 그래서 진짜	\N	\N	thai-conversation	기타
12742	หน้าไปโดนอะไรมา	199. 너 얼굴이 왜 그래 ? (너 얼굴에 무슨 일이야 ?)	나＾아 빠이 도온   아라이 마아 얼굴 상태의 지속 부딪치다, 당하다 무엇 상태의 지속	\N	\N	thai-conversation	기타
12746	เห็นใจ ผมหน่อย	202. 날 좀 동정해 줘.	헨v 짜이 폼v 너이↘ 보다 마음 나 좀	\N	\N	thai-conversation	기타
12750	ห้ามเข้า	206. 출입 금지 (진입 금지)	하＾암 카＾오 금지하다 들어가다	\N	\N	thai-conversation	기타
12754	ห้ามเลี้ยวขวา	우회전 금지	(하＾암 리여우↗ 콰v아)	\N	\N	thai-conversation	기타
12758	ยังไม่ ถึง เดือน	208. 아직 1 달도 안 됐어.	양 마＾이 틍v 드안 아직 아니다 도달하다 달, 月	\N	\N	thai-conversation	기타
12762	แดงแจ๊ดแจ๋	새빨갛다	(대앵 째앳↗ 째v애)	\N	\N	thai-conversation	기타
12766	ชิ้งฉ่อง	(속어) 오줌 싸다	(칭↗ 처엉↘)	\N	\N	thai-conversation	기타
12770	ปวดอึ	똥 마려워	(뿌엇↘ 으↘) 똥 싸다	\N	\N	thai-conversation	기타
12774	ผ้าอนามัย	생리대	"(파＾아 아 나아 마이) ผ้า (파＾아 : 천, 옷감) + อนามัย (아 나아 마이 : 위생) (속어) 생리대 โกเต็ก (꼬오 떽↘) &rarr; Kotex 상표명에서 유래된 표현.	\N	\N	thai-conversation	기타
12778	ไม่นานขนาดนั้น	214. 그렇게 오래 걸리지 않을 거야.	마＾이 나안 카↘ 나앗↘ 난↗ ~ 아니다 오래다, (시간이) 길다 규격, 크기,용량 그	\N	\N	thai-conversation	기타
12782	บอกแล้ว ไม่เชื่อ	(내가) 말했는 데, 안 믿었잖아.	(버억↘ 래우↗ 마＾이 츠＾아)	\N	\N	thai-conversation	기타
12786	คิดว่าดีมั้ย	좋다고 생각해요 ?	(킷↗ 와아 디이 마이↗)	\N	\N	thai-conversation	기타
12790	นี่คือใจตนเอง	내 맘이야.	(니＾이 크으 짜이 똔 애앵)	\N	\N	thai-conversation	기타
12794	เป็นลม	223. 기절했어.	뻰   롬 ~ 이 되다 바람	\N	\N	thai-conversation	기타
12798	รถไฟออกเสียแล้ว	기차가 떠나 버렸어요	(롯↗화이 어억↘ 씨v아 래우↗)	\N	\N	thai-conversation	기타
12802	รู้ไม่ ทันคุณ	228. 나를 속였어.	루우↗ 마＾이 탄 쿤 알다 ~ 아니다 따라잡다, 나란히 되다 당신 (당신을 따라 잡을 만큼 알지 못한다는 뜻으로, 내가 모르는 걸 이용해서 속였다는 의미)	\N	\N	thai-conversation	기타
12806	ได้ เวลาแล้ว	232. 시간이 됐어.	다＾이 웰라 래우↗ 얻다, 획득하다 시간 이미, 벌써 비슷한 말 = ถึงเวลาแล้ว (틍v 웰라 래우↗)	\N	\N	thai-conversation	기타
12810	เขาเพิ่งจะไป	235. 그사람 방금 갔어.	카오↗ 프ㅓㅇ＾ 짜↘ 빠이 그 방금 ~ 할 것이다 가다	\N	\N	thai-conversation	기타
12814	นักกีฬามือสมัครเล่น	아마츄어 운동선수	(낙↗ 끼라 므으 싸↘ 막↘ 레＾앤)&rarr; สมัครเล่น (싸↘막↘ 레＾앤) = 아마추어	\N	\N	thai-conversation	기타
12818	นักธุรกิจ	사업가	(낙↗ 투↗라↗낏↘) &rarr; ธุรกิจ (투↗라↗낏↘) = 사업	\N	\N	thai-conversation	기타
12822	นักศึกษา	대학생	(낙↗ 쓱↘싸v아) &rarr; ศึกษา (쓱↘싸v아) = 연구, 학습, 교육	\N	\N	thai-conversation	기타
12826	ยัง ไม่ เข็ด	238. 아직 고쳐지지 (교정되지) 않았어.	양 마＾이 켓↘ 아직 ~ 아니다 (형벌, 고난을 통해) 고쳐지다, 교정되다	\N	\N	thai-conversation	기타
12830	ทำหลบ ๆซ่อน ๆ	242. 비밀리에 하다	탐 롭↘ 롭↘써＾언 써＾언 하다 (위험을) 피하다, 숨다 숨기다, 감추다	\N	\N	thai-conversation	기타
12834	ไหน ๆ ก็ไหน ๆ	246. 잊어 버려, 내비 둬.	나v이 나v이 꺼＾ 나v이 나v이 어디 어디 ~ 해도 어디 어디	\N	\N	thai-conversation	기타
12838	สัก วันจะทำให้ได้	250. 며칠내로 할 수 있을거야.	싹↘   완 짜↘ 탐 하＾이 다＾이 ~ 만큼, ~ 정도 날, 일 ~ 할 것이다 하다 ~ 하도록 할 수 있다	\N	\N	thai-conversation	기타
12842	อด ไม่ได้	252. 참을 수 없어.	옷↘  마＾이 다＾이 참다, 견디다 할 수 없다	\N	\N	thai-conversation	기타
12846	ขอ แก้ ตัว	256. 해명할 기회를 줘.	커v어  깨＾애   뚜아 요구하다, 바라다 (매듭을) 풀다, 고치다, 변명하다 자기, 본인, 신체	\N	\N	thai-conversation	기타
12850	รีบไป รีบมา	259. 빨리 갔다가 빨리 와.	리＾입 빠이 리＾입 마아 서두르다 가다 서두르다 오다	\N	\N	thai-conversation	기타
12854	มี เรื่องด่วน	263. 급한 일이 있어.	미이 르＾앙 두언↘ 있다 일 급하다	\N	\N	thai-conversation	기타
12858	เขาชอบนินทา	267. 그여자는 험담 (뒷담화) 하는 걸 좋아해.	카오↗ 처＾업 닌타아 그  좋아하다 헐뜯다. 험담하다	\N	\N	thai-conversation	기타
12862	แพ้อากาศ	(피부나 몸이) 기후에 적응하지 못하다	(패애↗ 아아 까앗↘)	\N	\N	thai-conversation	기타
12870	มี พิรุธ	276. 의심스러워, 이상해	미이 피↗룻↗ 있다 의심스럽다, 이상하다	\N	\N	thai-conversation	기타
12716	ไม่ต้องห่วง	184. 걱정할 필요 없어.	마＾이 떠＾엉 후앙↘ ~ 할 필요 없다   걱정하다, 근심하다	\N	\N	thai-conversation	기타
12720	กิอะไรก็ได้	뭘 먹어도 좋아요.	(낀 아라이 꺼＾ 다이＾)	\N	\N	thai-conversation	기타
12724	เกือบลืม	190. 거의 까먹었어.	끄압↘   르음 거의, 하마터면 잊다, 망각하다	\N	\N	thai-conversation	기타
12732	กินแล้วไม่สบาย	먹었더니 속이 안좋아.	(낀 래우↗ 마＾이 싸바이)	\N	\N	thai-conversation	기타
12736	ว่าแล้ว เชียว	194. 나도 그렇게 생각해. (내 생각이 바로 그거야.)	와＾아 래우↗ 치여우 말하여 알게 하다 그러면, 그리고 나서 정말, 꼭 = เทียว (티여우)	\N	\N	thai-conversation	기타
12740	ไปให้ พ้น	197. (내 눈앞에서) 사라져 ! 꺼져 !	빠이 하＾이 폰↗ 가다 ~ 하도록   벗어나다, 면하다	\N	\N	thai-conversation	기타
12744	ทำยังไงดี	200. 전 어떻게 해야죠 ? (전 어쩌면 좋을까요 ?)	탐 양아이 디이 하다 어떻게 좋다	\N	\N	thai-conversation	기타
12748	คิด จนหัวปั่น	204. 생각을 많이 해서 머리가 돌 지경이야.	킷↗ 쫀   후v아 빤↘ 생각하다 ~ 할 때까지 머리 돌다	\N	\N	thai-conversation	기타
12752	ห้ามหยุดรถ	정차 금지	(하＾암 윳↘ 롯↗)	\N	\N	thai-conversation	기타
12756	ห้ามเลือด	지혈하다	(하＾암 르＾앗)	\N	\N	thai-conversation	기타
12760	จ่ายค่าเช่า บ้าน	210. 집세를 내다	짜이↘ 카＾아 차＾오 바＾안 지불하다 비용 빌리다 집	\N	\N	thai-conversation	기타
12764	ปวดฉี่	212. 오줌 마려워.	뿌엇↘ 치이↘ 아프다, 통증이 있다 오줌, 오줌싸다	\N	\N	thai-conversation	기타
12768	ยิง กระต่าย		ยิง (잉 : 쏘다) + กระต่าย (까따이↘ : 토끼) = 토끼사냥을 하다 라는 뜻 차 타고 가다가 갓길에 내려서 남자가 소변보다 남성의 숲속 방뇨(?)	\N	\N	thai-conversation	기타
12772	อุจจาระ	대변 보다	(웃↘ 짜아 라↗)	\N	\N	thai-conversation	기타
12776	นึกว่าคุณจะไม่มา	당신은 안 올거라고 생각했어	(늑↗ 와＾아 쿤 짜↘ 마＾이 마아)	\N	\N	thai-conversation	기타
12784	ว่าแต่ คุณล่ะ	219. 그러면, 당신은요 ?	와＾아 때애↘ 쿤 라＾ 그러면, 그런데 당신 강조를 나타내거나, ~ 라고 하면	\N	\N	thai-conversation	기타
12788	ไม่อยากลองดี	220. 해보고 싶지 않아.	마＾이 야악↘ 러엉   디이 ~ 아니다 하고 싶다 해보다, 시도하다 좋다 (기량, 실력 따위가) 정말로 좋은 지 나쁜 지 시험해 보다	\N	\N	thai-conversation	기타
12792	ไม่บอกก็รู้	221. 말하지 않아도 알아.	마＾이 버억↘ 꺼＾ 루우↗ ~ 아니다 말하다 ~ 해도 알다	\N	\N	thai-conversation	기타
12796	กว่า จะรู้ก็สาย เสียแล้ว	알았을 때는, 이미 늦어 버렸을 거야.	꽈아↘ 짜↘  루우↗ 꺼＾ 싸v이 씨v아 래우↗ ~ 했을 때는 ~ 할 것이다 알다 ~ 하면 늦다 ~ 해 버리다	\N	\N	thai-conversation	기타
12800	น่าสงสาร	226. 불쌍해.	나＾아 쏭v 싸v안 ~ 할 만하다 불쌍하다, 가엾게 여기다	\N	\N	thai-conversation	기타
12804	หนีไป เที่ยว	230. 몰래 도망치듯 놀러 가다.	니v이  빠이 티＾여우 달아나다, 회피하다 가다 놀러 다니다	\N	\N	thai-conversation	기타
12808	สอบได้	시험에 합격하다	(써업↘ 다＾이)	\N	\N	thai-conversation	기타
12812	นักการเมือง	정치가	(낙↗ 까안 므앙) &rarr; การเมือง (까안 므앙) = 정치	\N	\N	thai-conversation	기타
12816	นักเขียน	작가	(낙↗ 키v안) &rarr; เขียน (키v안) = 글을 쓰다	\N	\N	thai-conversation	기타
12820	นักแปล	번역가	(낙↗ 쁠래) &rarr; แปล (쁠래) = 번역하다	\N	\N	thai-conversation	기타
12824	นักร้อง	가수	(낙↗ 러엉↗) &rarr; ร้อง (러엉↗) = 노래하다, 외치다	\N	\N	thai-conversation	기타
12828	ทำแรงเกินไป	240. 너무 심했어.	탐 래앵 끄ㅓㄴ 빠이 하다 강하다, 격렬하다 지나치게 ~ 하다, 너무 ~ 하다	\N	\N	thai-conversation	기타
12832	กิน ไม่ได้นอน ไม่หลับ	244. 먹을 수도 없고, 잘 수도 없어.	낀 마＾이 다＾이 너언 마＾이 랍↘ 먹다 ~ 할 수 없다 눕다, 자다 ~ 아니다 (눈을)감다,자다	\N	\N	thai-conversation	기타
12836	ไม่มียางอาย	248. 뻔뻔해 ! , 수치심도 없나 봐 !	마＾이 미이 야앙아이 없다 수치심	\N	\N	thai-conversation	기타
12840	ไม่แน่ใจว่า ~	~ 라고 확실하진 않지만,,	(마＾이 내＾애 짜이 와＾아 ~)	\N	\N	thai-conversation	기타
12844	ตาม คุณ ไม่ทัน	254. 당신을 따라잡을 수 없어요.	따암 쿤 마＾이 탄 따라가다 당신 아니다 따라잡다	\N	\N	thai-conversation	기타
12848	ทำงานทั้งวันทั้งคืน	하루종일 (밤낮으로) 일하다	(탐 응안 탕↗ 완 탕↗ 크은)	\N	\N	thai-conversation	기타
12852	ดูท่าทางไม่ค่อยดี	261. 별로 좋아 보이지 않는 데.	두우   타＾아 타앙 마＾이 커＾이 디이 보다, 보이다 자세, 태도, 형세 그다지 ~ 아니다 좋다	\N	\N	thai-conversation	기타
12856	ขอบอกก่อน ว่า~	265. ~ 라고 미리 말해두고 싶어.	커v어  버억↘ 꺼언↘ 와＾아 ~ 요구하다, 바라다 말하다 ~ 전에 ~ 라고	\N	\N	thai-conversation	기타
12860	กำลังแพ้ ท้อง	269. 지금 입덧중이야.	깜랑  패애↗     터엉↗ ~ 하는 중이다 지다, 알레르기 증세를 보이다 임신하다, 복부	\N	\N	thai-conversation	기타
12864	ขอ นั่งด้วย คุณได้มั้ย	270. 당신 옆에 앉아도 될까요 ?	커v어   낭＾ 두＾어이 쿤   다＾이 마이↗ 요구하다, 바라다 앉다 ~ 와 함께 당신 ~ 할 수 있나요?	\N	\N	thai-conversation	기타
12868	จริงเหรอ	274. 진짜야 ?	찡 르ㅓv 진짜 ~ 그래 ? ~ 야 ?	\N	\N	thai-conversation	기타
832	others	다른 사람들	\N	\N	\N		하
857	improve	향상시키다	\N	\N	\N		하
12869	แล้วทีจะทำยังไง	275. 그러면 어떻게 해야 돼 ?	래우↗ 티이 짜↘ 탐 양아이 그러면 ~ 회, ~ 번, 차례, 시기 ~ 할 것이다 하다	\N	\N	thai-conversation	기타
12873	ของที่เหร์อ	나머지 물건	(커v엉 티＾이 르v아)	\N	\N	thai-conversation	기타
12877	ท่าทางรวย	부자처럼 보여.	(타＾아 타앙 루어이)	\N	\N	thai-conversation	기타
12885	เสียแรงที่ ไว้ใจคุณ	287. 당신을 믿은 나만 헛수고했잖아.	씨v아  래앵 티＾이 와이↗ 짜이   쿤 고장나다, 손해보다 힘 ~ 한, ~ 해서 ~ 해두다, 유지하다 마음 당신	\N	\N	thai-conversation	기타
12889	เขาไม่สมประกอบ	291. 그 사람은 심신이 건전하지 않아.	카오↗ 마＾이 쏨v 쁘라↘껍↘ 그 ~ 아니다 건전하다	\N	\N	thai-conversation	기타
12893	ทำไมพึ่งจะ บอก	295. 왜 지금에서야 말하는 거야 ? (왜 미리 말하지 않은 거야 ?)	탐마이 픙＾   짜↘ 버억↘ 왜 방금, 막 ~ 하려는 참이다 ~ 할 것이다 말하다	\N	\N	thai-conversation	기타
12897	เปิดอีเมล์ดูรึยัง	299. e-mail 열어 봤어 ?	쁘ㅓㅅ↘ 이이메애 두우 르↗ 양 열다 e-mail 보다 아니면 아직	\N	\N	thai-conversation	기타
12901	ฉัน จับ เขา	나는 그를 잡았다.	(폼v : 나) + (짭↘ : 잡다) + (카오↗ : 그)	\N	\N	thai-conversation	기타
12905	หนีตามแฟน	304. 애인따라 도망갔어.	니v이 따암 홰앤 도망가다 따라서 애인	\N	\N	thai-conversation	기타
12909	เผลอไม่ได้	308. 부주의할 수 없어, (전할 것을) 까먹을 수 없어.	플v르ㅓ   마＾이 다＾이 한순간 멍청해지다, (전할 것을) 잊다 ~ 할 수 없다	\N	\N	thai-conversation	기타
12913	ต้องมีอะไรแน่ ๆ	311. 뭔가 확실히 있어.	떠＾엉   미이 아↘라이  내＾애 내＾애 해야 한다, 명중하다, 일치하다 있다 무엇 확실하다, 분명, 반드시	\N	\N	thai-conversation	기타
12917	ได้ข่าว ว่า~	315. ~ 라는 소식 (뉴스) 을 들었어.	다＾이 카우↘ 와＾아 ~ 얻다, 획득하다 소식, 뉴스 ~ 라고 ~	\N	\N	thai-conversation	기타
12921	ข้ากันไม่ได้	317. 서로 잘 지낼 수 없어.	카＾오 깐   마＾이 다＾이 잘 어울리다, 마음이 맞다, 화합하다 ~ 할 수 없다	\N	\N	thai-conversation	기타
12925	เราเป็นเนื้อ คู่กัน	321. 우리는 천생연분이야.	라오 뻰 느으아↗ 쿠＾우 깐 우리 ~ 이다 고기, 살 쌍, 배우자 서로	\N	\N	thai-conversation	기타
12929	เก็บ แรง ไว้	325. 힘을 모아두다	껩↘ 래앵 와이↗ 모으다 힘 ~ 해 두다	\N	\N	thai-conversation	기타
12933	หัวอกเดีอวกัน	329. 한 배에 탄 운명이다.	후v아 옥↘ 디여우깐 심장, 가슴 같다, 동일하다	\N	\N	thai-conversation	기타
12937	ตายเป็นตาย	333. 죽는 건 죽는 거지.(이걸 하다가 죽어도 좋아.)	따이 뻰 따이 죽다 ~ 이다 죽다	\N	\N	thai-conversation	기타
12941	ไม่น่า ทำ เลย	337. 전혀 해봄직 하지 않은 데.	마＾이 나＾아   탐 르ㅓ이 ~ 아니다 ~ 할 만 하다, ~ 할 가치가 있다 하다 전혀, 절대로	\N	\N	thai-conversation	기타
12945	หาทางแก้ไข	341. 해결할 방법을 찾다	하v아 타앙 깨＾애 카v이 찾다 방법, 길 해결하다, 풀다	\N	\N	thai-conversation	기타
12949	เป็น เมนส์	345. 생리중이야.	뻰 메앤 ~ 이다 생리(menses)	\N	\N	thai-conversation	기타
12953	ลองจินตนาการดู	348. 한번 상상해 봐.	러엉   찐따↘나아까안 두우 해보다, 시도하다 상상, 마음먹은 것 보다	\N	\N	thai-conversation	기타
12957	ผมผิดข้อหาอะไร	350. 내가 잘못한 혐의가 뭡니까	폼v 핏↘ 커＾어 하v아 아↘라이 나 잘못하다 용의점, 혐의 무엇	\N	\N	thai-conversation	기타
12961	จะไม่ยอม ให้คุณทำกับฉันยังงี้	354. 당신이 내게 이렇게 하지 못하게 할거야.	짜↘ 마＾이 여엄  하＾이   쿤   탐 깝↘ 폼v 양이이↗ ~ 할 것이다 ~ 아니다 허락하다 ~ 하도록 당신 하다 ~ 와 나 이렇게	\N	\N	thai-conversation	기타
12965	คุณชอบเถียง	358. 당신은 말다툼 (말대꾸) 하는 걸 좋아해.	쿤 처＾업 티v이앙 당신 좋아하다 논쟁하다, 말대꾸하다	\N	\N	thai-conversation	기타
12969	งาน ต้อง มา ก่อน	362. 일이 먼저다.	응안 떠＾엉 마아 꺼언↘ 일 ~ 해야 한다 오다 먼저	\N	\N	thai-conversation	기타
12973	อย่า หวัง เลย	바라지도 마.	야아↘ 왕v   르ㅓ이 ~하지 마라 바라다, 희망하다 절대로, 전혀	\N	\N	thai-conversation	기타
12977	ผมโดนหักหลัง	368. 나는 배신당했어.	폼v 도온 학↘   랑v 나 당하다 부러지다, 꺾이다 등,배신하다	\N	\N	thai-conversation	기타
12981	คุณเป็นใครกันแน่	372. 당신은 정말로 누구에요 ?	쿤 뻰 크라이  깐   내＾애 당신 ~ 이다 누구 서로, 동시에 정말, 확실히	\N	\N	thai-conversation	기타
12987	ได้ ประโยชน์ อะไร	377. 무슨 이익을 얻나요 ?	다＾이 쁘라↘요＾옷 아↘라이 얻다 이익, 효과   무엇	\N	\N	thai-conversation	기타
12998	ไม่อยากมีเรื่อง	388. 일 (사건) 을 벌이고 싶지 않아.	마＾이 야악↘  미이   르＾으앙 ~ 아니다 원하다, 하고 싶다 가지다 일, 사건	\N	\N	thai-conversation	기타
13003	ที หลังอย่าทำ	393. 다음번엔 하지 마.	티이   랑v 야아↘  탐 ~ 번, ~ 회 다음의 ~하지 마라 하다	\N	\N	thai-conversation	기타
13007	ตัวแทนจากบริษัท	397. 회사 대리인 (대표)	뚜아   태앤 짜악↘ 버↘리↗쌋↘ 자기, 본인, 몸 ~대신에 ~로부터, ~ 의 회사	\N	\N	thai-conversation	기타
13012	ไม่รู้เลย	전혀 모른다	(마＾이 루우↗ 르ㅓ이)	\N	\N	thai-conversation	기타
13016	ไม่ต้องบอกก็รู้	403. 말하지 않아도 알아.	마＾이 떠＾엉 버억↘ 꺼＾ 루우↗ ~ 할 필요 없다 말하다 ~ 해도 알다	\N	\N	thai-conversation	기타
13021	เห็นกับตา	내 눈으로 직접 봤어.	(헨v 깝↘ 따아)	\N	\N	thai-conversation	기타
848	make definition	정의를 내리다	\N	\N	\N		기타
863	nevertheless	그럼에도 불구하고	\N	\N	\N		하
12880	หายป่วยแล้ว	282. 아픈게 싹 나았어.	하v아이 뿌어이↘ 래애우↗ 없어지다, (병이) 낫다 아프다   이미, 벌써	\N	\N	thai-conversation	기타
12884	เอามาทำไม	286. 왜 가져 왔어 ?	아오  마아 탐마이 가지고 오다 왜	\N	\N	thai-conversation	기타
12888	มันเป็น กฎ	290. 그건 규칙이야.	만 뻰 꼿↘ 그것 ~ 이다 규칙, 법률	\N	\N	thai-conversation	기타
12892	ไปคุย กันที่บ้านดีกว่า	294. 집에 가서 얘기하는 게 좋겠어.	빠이 쿠이 깐 티＾이 바＾안 디이 꽈아↘ 가다 대화하다 함께 ~ 에서 집 더 좋다	\N	\N	thai-conversation	기타
12896	เดือนหน้านายจะขึ้นเงินเดือนให้	298. 다음달에 사장이 월급 올려준대.	드언 나＾아 나아이 짜↘ 큰＾ 응언 드안 하＾이 달 다음의 주인 ~ 할 것이다 올리다 돈 달 ~ 해 주다	\N	\N	thai-conversation	기타
12900	ลูกถูกแม่ตี	아이는 엄마에게 맞는다.	(루＾욱 투욱↘ 매＾애 띠) ลูก (루＾욱 : 아이) + ถูก (투욱↘ : 당하다) + แม่ (매＾애 : 엄마) + ตี (띠이 : 때리다)	\N	\N	thai-conversation	기타
12904	ดูแลตัวเองให้ดี	303. 스스로 몸 잘 돌봐 !	두울래애   뚜아 에앵 하＾이 디이 돌보다, 보살피다 몸 스스로 ~ 하도록 좋다	\N	\N	thai-conversation	기타
12908	สวย ไปหมด	307. 아름다움이 다 사라졌어.	쑤v어이 빠이 못↘ 아름답다 가다 다하다, 없어지다	\N	\N	thai-conversation	기타
12912	มาตามผม	나를 따라 와	(마아따암폼) มา(마아 : 오다) +ตาม(따암 : 따라서) +ผม(폼V : 나)	\N	\N	thai-conversation	기타
12916	ทีละ คน	314. 한번에 한명씩	티이   라↗ 콘 ~ 번, ~ 회 ~ 마다 사람	\N	\N	thai-conversation	기타
12920	ทำได้ไง	316. 어떻게 한거야 ?	탐 다＾이 응아이 하다 ~ 할 수 있다 어떻게 (야앙라이) 의 구어체	\N	\N	thai-conversation	기타
12924	ทำตาม สัญญา	320. 약속 (계약) 대로 하다	탐 따암 싼v 야아 하다 ~ 대로 약속, 계약	\N	\N	thai-conversation	기타
12928	มันจะดี เหรอ	324. 그게 좋을 거라구요 ?	만 짜↘   디이 르ㅓv어 그것 ~ 할 것이다 좋다 ~ 라구요 ?	\N	\N	thai-conversation	기타
12932	ไม่รู้ จะทำ ยังไง	328. 어떻게 해야 할지 모르겠	마＾이 루우↗ 짜↘ 탐 양아이 ~아니다 알다 ~ 할 것이다 하다 어떻게	\N	\N	thai-conversation	기타
12936	เขามาตั้งแต่ หัว ค่ำ	332. 그는 초저녁부터 와 있어.	카오↗ 마아 땅＾ 때＾애 후v아 캄＾ 그 오다 ~ 부터(시간) 머리 저녁	\N	\N	thai-conversation	기타
12944	คุณเป็นต้น เหตุ	340. 당신이 문제야, 당신이 (문제의) 근원이야.	쿤 뻰 똔＾ 헤앳↘ 당신 ~ 이다 처음, 최초, 중요한 원인, 이유, 동기 사건을 일으킨 장본인, 일의 발단	\N	\N	thai-conversation	기타
12948	เรื่องน่า ขำ	344. 웃긴 얘기야.	르＾으앙 나＾아 캄v 이야기 ~ 할 만하다 우습다, 유머러스하다	\N	\N	thai-conversation	기타
12952	อย่าโทษตัวเอง	자책하지 마.	야아↘ 토＾옷 뚜아 에앵 ~하지 마라 벌, 나무라다 자기, 본인 자기의, 스스로	\N	\N	thai-conversation	기타
12956	ทำยังงี้ไม่ถูก	349. 이렇게 하면 틀려.	탐 양이이↗ 마＾이 투욱↘ 하다 이렇게 ~ 아니다 옳다	\N	\N	thai-conversation	기타
12960	เขาติดคุกอยู่	353. 그는 감옥에 있다.	카오↗ 띳↘ 쿡↗ 유우↘ 그 붙어 있다 감옥 ~ 하고 있다	\N	\N	thai-conversation	기타
12964	คราวนี้ซวยแน่	357. 이번에는 정말 재수가 없을 거야.	크라우   니이↗ 쑤어이 내＾애 ~ 번, ~ 회, ~ 차 이 재수없다 정말, 반드시	\N	\N	thai-conversation	기타
12968	แค้น ต้อง ชำระ	361. 원한을 꼭 갚을 거야.	캐앤↗ 떠＾엉 참라↗ 원한 ~ 해야 한다 지불하다, 청산하다	\N	\N	thai-conversation	기타
12972	หวัง มาก เกินไป	365. 너무 많은 걸 바라는 데.	왕v   마＾악 끄ㅓㄴ 빠이 바라다, 희망하다 많이 너무 지나치다	\N	\N	thai-conversation	기타
12976	อะไรกันนักกันหนา	367. 도대체 뭐하고 있는 거야 ?	아↘라이 깐   낙↗ 깐 나v아 무엇 동시에, 함께 대단히, 몹시	\N	\N	thai-conversation	기타
12980	ฉันจะไม่ลืมบุญคุณ	371. 저는 은혜 잊지 않을 겁니다.	폼v 짜↘ 마＾이  르음 분쿤 나 ~ 할 것이다 ~ 아니다 잊다 은혜	\N	\N	thai-conversation	기타
12984	พนักงานประจำ	정규직 직원	(파↗낙↗응안 쁘라↘짬)	\N	\N	thai-conversation	기타
12992	อยากได้อะไรบอกได้เลย	382. 무엇을 갖고 싶은 지 말만 해.	야악↘   다＾이 아↘라이 버억↘ 다＾이   르ㅓ이 원하다, 하고 싶다 얻다, 획득하다 무엇 말하다 ~ 할 수 있다 전혀, 완전히	\N	\N	thai-conversation	기타
12997	ขอลองหน่อย	387. 좀 해볼께.	커v어 러엉   너어이↘ 부탁하다, 요구하다 ~ 해 보다, 시도하다 좀	\N	\N	thai-conversation	기타
13009	คิดถึงใจจะขาด	399. 마음이 찢어질 정도로 보고 싶어.	킷↗ 틍v   짜이 짜↘ 카앗↘ 보고 싶다, 그리워하다 마음 ~ 할 것이다 찢어지다	\N	\N	thai-conversation	기타
13014	อย่าลืมติดรูป มานะ	401. 사진 가져오는 것 잊지마.	야아↘   르음 띳↘   루＾웁 마아 나↗ ~ 하지 마라 잊다 붙이다,휴대하다 사진 오다 ~ 구, ~요	\N	\N	thai-conversation	기타
13018	ทำใจให้ดี	마음을 가라앉히다	(탐 짜이 하＾이 디이)	\N	\N	thai-conversation	기타
13023	มัน ไม่เหมาะ	408. 그건 적당하지 (어울리지) 않아.	만 마＾이 머↘ 그것 ~ 아니다 적당하다, 알맞다, 어울리다	\N	\N	thai-conversation	기타
13029	จะพาแฟนไปด้วย	413. 애인을 데리고 같이 갈께.	짜↘  파아 홰앤 빠이 두＾어이 ~ 할 것이다 데리고 애인 가다 같이, 함께	\N	\N	thai-conversation	기타
13041	จะเอายังไง	어떻게 해주길 원하는 건데 ?	(짜↘ 아아오 양아이)	\N	\N	thai-conversation	기타
873	cafeteria	학교 식당	\N	\N	\N		하
12887	ยิดีรับใช้	289. 당신을 시중들게 되어서 기뻐요.	인디이 랍↗ 차이↗ 기쁘다   봉사하다, 떠받치다	\N	\N	thai-conversation	기타
12891	ไม่ อยากยุ่งเรื่องชาวบ้าน	293. 다른 사람 일에 끼여들고 싶지 않아.	마＾이 야악↘ 융＾   르＾앙 차아우 바＾안 ~ 아니다 원하다, 하고 싶다 바쁘다, 혼란하다 일 이웃, 백성	\N	\N	thai-conversation	기타
12895	มี แต่ปัญหา	297. 문제뿐이네.	미이 때애↘ 빤하v아 있다 ~ 뿐, 단지, 오직 문제	\N	\N	thai-conversation	기타
12899	แม่ตีลูก	엄마는 아이를 때린다.	(매＾애 띠이 루＾욱) แม่ (매＾애 : 엄마) + ตี (띠이 : 때리다) + ลูก (루＾욱 : 아이)	\N	\N	thai-conversation	기타
12903	เรื่องอยู่บนข่าวหน้าหนึ่ง	302. 그 얘기는 1 페이지 뉴스에 있어. (누구나 다 아는 얘기야.)	르＾앙 유우↘ 본 카우↘ 나＾아 능↘ 이야기, 일 있다 ~ 위에 소식, 뉴스 페이지 1	\N	\N	thai-conversation	기타
12907	อยาก หารายได้เสริม	306. 부업을 찾아보고 싶어.	야악↘   하v아 라아이 다＾이 쓰ㅓvㅁ 원하다, 하고 싶다 찾다 수입(돈벌이) 강화하다, 보충하다,부업	\N	\N	thai-conversation	기타
12911	เรียนต่อ	310. 공부를 계속 하다, 유학하다	리이안 떠어↘ 공부하다   연장하다, 계속해서	\N	\N	thai-conversation	기타
12915	เร็ว ๆเข้า	313. 서둘러.	레우 레우 카＾오 빨리빨리 재촉할 때, 더욱 더 빠르게 할 때	\N	\N	thai-conversation	기타
12919	รู้สึกว่า ~	~ 라고 느껴져	(루우↗ 쓱↘ 와＾아 ~)	\N	\N	thai-conversation	기타
12923	ถูกแฟนทิ้ง	319. 애인에게 차였어 (버림받았어).	투욱↘ 홰앤 팅↗ 당하다 애인 버리다	\N	\N	thai-conversation	기타
12927	กล้า พูด กล้า ทำ	323. 감히 말하고, 감히 행하다	끌＾라아 푸＾웃 끌＾라아 탐 감히 ~ 하다, 용감하다, 강하다 말하다 감히 ~ 하다	\N	\N	thai-conversation	기타
12931	อย่าหลง เชื่อ	327. 맹신하지 마, 무턱대고 믿지 마.	야아↘ 롱v   츠＾으아 ~ 하지 마라 오해하다, 갈피를 못잡다, 도취하다 믿다,맹신하다, 무턱대고 믿다	\N	\N	thai-conversation	기타
12935	พูดอย่างทำอย่าง	331. 말하는 것 따로, 하는 것 따로.	푸＾웃 야앙↘   탐 야앙↘ 말하다 종류, 방법, ~ 처럼 하다 종류, 방법, ~ 처럼	\N	\N	thai-conversation	기타
12939	ปฏิเสธ ไม่ได้	335. 거절할 수 없어.	빠↘띠쎄앳↘ 마＾이 다＾이 거절하다 ~ 할 수 없다	\N	\N	thai-conversation	기타
12943	ไม่ได้ ตั้งใจ	339. 고의가 아니었어, 일부러 한게 아니야.	마＾이 다＾이 땅＾ 짜이 ~아니다 ~했다 일부러, 뜻을 두다, 심혈을 기울이다	\N	\N	thai-conversation	기타
12947	เกือบ ไป แล้ว	343. 거의, 하마터면 (~ 할 뻔 했어).	끄으압↘   빠이   래애우↗ 거의 ~ 할 뻔하다, 하마터면 가다, 앞동작의 지속 이미	\N	\N	thai-conversation	기타
12951	อย่า ไปโทษเขา	347. 그를 탓하지 마.	야아↘ 빠이 토＾옷   카오↗ ~ 하지 마라 가다, 동작의 지속 벌, 나무라다, 죄를 덮어 씌우다 그	\N	\N	thai-conversation	기타
12955	ลองทำดู	한번 해 봐	(러엉 탐 두우)	\N	\N	thai-conversation	기타
12959	เราเสียลูกค้า	352. 우리는 손님을 잃었다.	라아오 씨v이아 루＾욱 카아↗ 우리 잃다 손님	\N	\N	thai-conversation	기타
12963	พยายามรวบรวมเงิน	356. 돈을 모으려고 노력중이야.	파↗야아야암 루＾우업 루우엄 응언 노력하다 모으다   돈	\N	\N	thai-conversation	기타
12967	มักมาก ใน กาม	360. 욕정에 불타다	막↗ 마＾악 나이   까암 탐욕스럽다, 욕심부리다 ~ 안에, ~ 에 성욕, 욕정	\N	\N	thai-conversation	기타
12971	ผมต้องลงโทษคุณ	364. 나는 당신을 벌해야 합니다.	폼v 떠＾엉 롱 토＾옷 쿤 나 ~ 해야 한다 내리다 벌 당신	\N	\N	thai-conversation	기타
12979	เธอท้อง ได้สามเดือน	370. 그녀는 임신3개월째야.	트ㅓ 터엉↗ 다＾이   싸v암 드으안 그녀 임신하다 얻다, 획득하다,이기다 3 월, 달	\N	\N	thai-conversation	기타
12983	พนักงานชั่วคราว	374. 임시직 (비정규직) 직원	파↗낙↗응안 추＾아 크라우 직원,임시 기간, 간격 ~ 차, ~ 회, ~ 번, 시기, 또래	\N	\N	thai-conversation	기타
12986	ทำไมไม่บอกให้รู้ ก่อน	376. 왜 미리 말하지 않았죠 ?	탐마이 마＾이 버억↘ 하＾이 루우↗ 꺼언↘ 왜 ~ 아니다 말하다 ~ 하도록 알다 미리, 전에	\N	\N	thai-conversation	기타
12990	เขต อันตราย	380. 위험지대	케앳↘   안따라아이 지대, 구역 위험하다	\N	\N	thai-conversation	기타
12993	เลยเวลานัดแล้ว	383. 약속시간이 이미 지났어.	르ㅓ이   웰라아 낫↗ 래애우↗ 지나다, 경과하다 시간 약속 이미	\N	\N	thai-conversation	기타
12995	รอง เท้า กัด	385. 신발이 쓸려.	러엉  타아오↗ 깟↘ 밑에 깔다, 지지하다 발 물다	\N	\N	thai-conversation	기타
13000	งาน นี้สนุกแน่	390. 이 일 (파티, 축제) 은 확실히 재미있을거야.	응안   니이↗ 싸눅↘ 내＾애 일, 파티, 축제 이 재미있다 확실히, 반드시	\N	\N	thai-conversation	기타
13002	มานานรึยัง	392. 온지 오래됐어 ?	마아 나안 르↗ 양 오다 오래다, (시간이) 길다 ~ 인가요 아닌가요 ?	\N	\N	thai-conversation	기타
13005	ตัองพิสูจน์ให้ เห็น	395. 증명해 보여야 해.	떠＾엉  피↗쑤웃↘ 하＾이 헨v ~ 해야 한다 증명하다 ~ 하도록 보이다	\N	\N	thai-conversation	기타
13010	เดินเร็ว ๆหน่อยไม่ได้ เหรอ	400. 좀 빨리 빨리 걸을 수 없어요 ?	드ㅓㄴ 레우레우 너어이↘ 마＾이 다＾이 르ㅓv어 걷다 빨리 빨리 좀   아니다 ~ 할 수 있다 ~ 인가요 ? เหรอ(르ㅓv어) 는 " ~ 인가요 ? " 또는 " ~ 야 ? " 정도의 느낌입니다.	\N	\N	thai-conversation	기타
888	monster bear	괴물 같은 곰	\N	\N	\N		기타
937	at the front	앞쪽의	\N	\N	\N		기타
12890	ไปไหน กัน มา	292. 어디 갔다가 왔어 ?	빠이 나v이 깐 마아 가다 어디 동시에 오다	\N	\N	thai-conversation	기타
12894	อยากคบ คุณเป็นเพื่อน	296. 당신과 친구로 사귀고 싶어요.	야악↘   콥↗   쿤 뻰   프＾안 원하다, 하고 싶다 사귀다, 교제하다 당신 ~ 로서 친구	\N	\N	thai-conversation	기타
12898	กลัวถูกแม่ ด่า	300. 엄마한테 혼날까 봐 무서워.	끌루아 투욱↘ 매＾애 다아↘ 무섭다 당하다 엄마 꾸짖다, 욕하다	\N	\N	thai-conversation	기타
12902	อยากเจอคนที่รู้ใจ	301. 나를 이해해 주는 사람을 만나고 싶어.	야악↘   쯔ㅓ어 콘 티＾이 루우↗  짜이 원하다, 하고 싶다 만나다 사람 ~ 한 (관계대명사) 알다 마음성격, 취향을 다 알고 있다	\N	\N	thai-conversation	기타
12906	เบื่อ ชีวิต	305. 사는 게 지루해.	브아↘ 치이윗↗ 지루하다 삶	\N	\N	thai-conversation	기타
12910	ไม่ไหวแล้ว	309. 더 이상 참을 수 없어.	마＾이 와v이 래애우↗ 아니다 참다 이미	\N	\N	thai-conversation	기타
12914	แทบ จะบ้า	312. 거의 미칠 지경이야.	태＾앱   짜↘  바＾아 거의, ~ 하려는 참이다 ~ 할 것이다 미치다	\N	\N	thai-conversation	기타
12918	สงสัยว่า ~	~ 라고 의심돼	(쏭v 싸v이 와＾아 ~	\N	\N	thai-conversation	기타
12922	ตื่นได้ แล้ว	318. (잠자리에서) 일어나 !	뜨은↘   다＾이   래애우↗ (잠에서) 깨다 (잠자리에서) 일어나다 ~ 할 수 있다 이미	\N	\N	thai-conversation	기타
12926	ขอปิดเป็นความลับ	322. 비밀로 해두고 싶어요.	커v어 삣↘ 뻰 콰암 랍↗ 요구하다, 바라다 닫다, 잠그다 ~ 으로 비밀	\N	\N	thai-conversation	기타
12930	ดู แต่ตา มืออย่าต้อง	326. 눈으로만 보고, 손으로 만지지 마세요.	두우 때애↘ 따아 므으 야아↘ 떠＾엉 보다 단지, ~ 만 눈 손 ~ 하지 마라 만지다, 접촉하다	\N	\N	thai-conversation	기타
12934	ว่าง ๆจะมา หา	330. 시간나면 들를께요.	와＾앙 와＾앙 짜↘ 마아 하v아 한가하다 ~ 할 것이다 오다 찾다 찾아 오다, 방문오다	\N	\N	thai-conversation	기타
12938	จะ พาไปส่งบ้าน	334. 집까지 데려다 줄께.	짜↘   파아  빠이 쏭↘ 바＾안 ~ 할 것이다 데리고 가서 보내다 집	\N	\N	thai-conversation	기타
12942	นี่มันเรื่องส่วน ตัว	338. 이건 개인적인 일이야.	니＾이 만 르＾으앙 쑤언↘   뚜아 이것 그것 일, 이야기 부분, 비율, ~ 에 대해서는 자기, 본인	\N	\N	thai-conversation	기타
12946	เมียขอ หย่า	342. 아내가 이혼을 요구했어.	미이아 커v어   야아↘ 아내 요구하다, 바라다 이혼하다	\N	\N	thai-conversation	기타
12950	จะเล่าความจริง ให้ฟัง	346. 사실을 말해 줄께.	짜↘   라＾아오 콰암찡 하＾이 황 ~ 할 것이다 말하다 사실, 진실 ~하도록 듣다	\N	\N	thai-conversation	기타
12954	ลองคิดดู	한번 생각해 봐	(러엉 킷↗ 두우)	\N	\N	thai-conversation	기타
12958	โมโห หิว	351. 배고파서 화나.	모오 호v오 히v우 화나다 배고프다	\N	\N	thai-conversation	기타
12962	ซึ้งแล้วใช่มั้ย	355. 감동한 게 맞지 ?	씅↗ 래애우↗ 차＾이 마이↗ 감동하다 이미 옳다, 맞다 ~ 지 ?	\N	\N	thai-conversation	기타
12970	ค่าจ้างงวดแรก	363. 첫번 째 지불한 인건비	카＾아 짜＾앙 응＾옷 래＾액 비용 고용하다 ~ 회, ~ 차 처음의, 첫번째의	\N	\N	thai-conversation	기타
12974	อย่าพึ่งหมดหวัง	절망하지 마.	야아↘   픙＾   못↘   왕v ~ 하지 마라 방금, 막~ 하려는 참이다 다하다, 없어지다 바라다, 희망하다	\N	\N	thai-conversation	기타
12978	หายโกรธ รึยัง	369. 화난 (삐진) 것 풀어졌어 ?	하v아이   끄으롯↘ 르↗ 양 없어지다, (병이) 낫다 화내다, 삐지다 아니면 아직	\N	\N	thai-conversation	기타
12982	ไม่มีอะไร สำคัญกว่านี้	373. 이보다 중요한 건 없어.	마＾이 미이 아↘라이 쌈v 칸 꽈아↘ 니이↗ ~ 아니다 있다 무엇 중요하다 ~ 보다 이	\N	\N	thai-conversation	기타
12985	คุณ หมายถึง อะไร	375. 당신의 뜻 (의미) 이 뭔가요 ?	쿤 마v아이 틍v   아↘라이 당신 의미하다, 뜻하다 도달하다,~에이르다 무엇	\N	\N	thai-conversation	기타
12988	ใครรับผิดชอบ	378. 누가 책임지죠 ?	크라이 랍↗핏↘처＾업 누가 책임지다	\N	\N	thai-conversation	기타
12989	ฉันเป็นคน ช่างฝัน	379. 나는 몽상가에요.	폼v 뻰 콘 차＾앙 환v 나 ~ 이다 사람 ~ 하는 경향이 있다, ~ 하기를 좋아하다 꿈꾸다	\N	\N	thai-conversation	기타
12991	เขาทำงาน แบบไม่ลืม หูลืมตา	381. 그는 다른 건 신경쓰지 않고 일만 한다.	카오↗ 탐 응안 배앱↘ 마＾이 르음 후v우 르음 따아 그 일하다   모양, 형식 ~ 아니다 (귀를) 열다 귀 (눈을) 뜨다 눈	\N	\N	thai-conversation	기타
12994	จะอธิบายยังไงดี	384. 어떻게 설명하는 게 좋을까 ?	짜↘   아↘티↗바아이 양아이 디이 ~ 할 것이다 설명하다   어떻게 좋다	\N	\N	thai-conversation	기타
12996	ทำ แล้วก็ไม่ ดีขึ้น	386. 이미 해봤는 데도 더 좋아지지 않아.	탐 래애우↗ 꺼＾ 마＾이 디이 큰＾ 하다 이미 ~ 해도 ~아니다 좋다 상승, 증대하다	\N	\N	thai-conversation	기타
12999	หวงไว้ทำไม	389. 왜 기대하고 (바라고) 있는 거야 ?	후v앙 와이↗   탐마이 기대하다, 바라다 ~ 해 두다, 유지하다 왜	\N	\N	thai-conversation	기타
13001	ไปก่อนนะ	391. 먼저 갈께요.	빠이 꺼언↘ 나↗ 가다 먼저 ~ 요	\N	\N	thai-conversation	기타
13004	ไปได้ แล้ว	394. 그만 가봐도 돼.	빠이 다＾이 래애우↗ 가다 ~ 할 수 있다 이미	\N	\N	thai-conversation	기타
13006	ตั้งหน้าตั้งตารอ	396. (누군가 / 무언가) 보기를 학수고대하다	땅＾   나v아 땅＾ 따아 러어 세우다, 유지하다, 설립하다 얼굴 세우다...눈 기다리다	\N	\N	thai-conversation	기타
12638	ฉัน ไม่พอใจคุณ	127. 난 당신이 (한 일이) 만족스럽지 않군요.	찬↗ 마＾이 퍼어 짜이 쿤 나 ~ 아니다 만족하다 당신	\N	\N	thai-conversation	기타
12551	เขา ถูก เมียทิ้ง	40. 그는 아내에게 버림받았다.	카오↗ 투욱↘ 미아 팅↗ 그  당하다   부인 버리다	\N	\N	thai-conversation	기타
12559	เอาไปซ่อนไว้ไหน	48.어디다 숨겨 놨어 ?	아오 빠이 써＾언 와이↗ 나v이 가지다, 소지하다 가다 숨기다 ~ 해 두다 어디	\N	\N	thai-conversation	기타
12651	ช่วยฝากให้ เขา ด้วย	137. 그에게 이걸 좀 전해 줘.	추＾어이 화악↘ 하＾이 카오↗ 두＾어이 도와주다 맡기다 ~ 에게 그 ~ 해 주세요	\N	\N	thai-conversation	기타
13013	ไม่ได้เลย	절대로 불가능하다	(마＾이 다＾이 르ㅓ이)	\N	\N	thai-conversation	기타
13015	ชื่นใจจังเลย	402. 진짜 개운해 (후련해)	츠＾은 짜이 짱 르ㅓ이 개운하다, 후련하다 매우, 굉장히, 정말로	\N	\N	thai-conversation	기타
13022	ได้เสียกันแล้ว	407. 이미 잠자리 (성관계) 를 가졌어.	다＾이 씨v이아 깐 래애우↗ 얻다 잃다 서로 이미	\N	\N	thai-conversation	기타
13025	มา ตั้งแต่ เมื่อไร	410. 언제부터 와 있는 거야 ?	마아 땅＾ 때애↘ 므＾으어 라이 오다 ~ 부터 언제	\N	\N	thai-conversation	기타
13028	มันไม่ ใช่ของ ง่าย	412. 그건 쉬운 일이 아니야.	만 마＾이 차＾이 커v엉   응＾아이 그것 ~ 아니다 맞다, 옳다 일, ~ 것 쉽다	\N	\N	thai-conversation	기타
13035	ขอให้รวย ๆ	418. 부자되세요.	커v어   하＾이   루어이 루어이 요구하다, 부탁하다 ~ 하도록 부유하다	\N	\N	thai-conversation	기타
13040	จะ ให้ ทำยังไง	421. 내가 어떻게 했으면 좋겠어 ?	짜↘   하＾이 탐 양아이 ~ 할 것이다 ~ 하도록 하다 어떻게	\N	\N	thai-conversation	기타
13048	กำลังยืดเส้น ยืดสาย	427. 스트레칭하고 있는 중이야.	깜랑  으＾읏  쎄＾앤  으＾읏  싸v아이 ~하는중이다 늘어나다, 연장하다 선, ~관(신체근육) 늘리다 선, 줄	\N	\N	thai-conversation	기타
896	follow	추적하다 쫓다	\N	\N	\N		하
901	discouraging	좌절감을 주는	\N	\N	\N		하
910	flight instructor	비행교관	\N	\N	\N		기타
944	harmful	해로운	\N	\N	\N		하
968	personality	성격	\N	\N	\N		하
1011	chief of the Forest Service	산림청장	\N	\N	\N		기타
1034	association	모임	\N	\N	\N		하
1060	fire fighter	소방관	\N	\N	\N		기타
1067	on display	전시 중에 있는	\N	\N	\N		기타
1094	escape	탈출하다 도피하다	\N	\N	\N		하
1180	collect	모으다	\N	\N	\N		하
1245	every timewhen	할 때마다	\N	\N	\N		기타
1264	expect	기대하다	\N	\N	\N		하
1284	for the first time	처음으로	\N	\N	\N		기타
1296	regretful	후회하는	\N	\N	\N		중
1317	fill A with B A B	를 로 채우다	\N	\N	\N		기타
1325	comfort	안락하게 하다	\N	\N	\N		하
1354	news industry	뉴스 산업	\N	\N	\N		기타
1366	besides	게다가 더욱이	\N	\N	\N		하
1374	brilliance	훌륭함 재기 발랄	\N	\N	\N		하
1401	protect	보호하다	\N	\N	\N		하
1423	anyone who	하는 사람은 누구나	\N	\N	\N		기타
1451	rather	차라리 오히려 어느 쪽인가 하면	\N	\N	\N		하
1466	nap	선잠 잠시 졸기 낮잠	\N	\N	\N		하
8943	manipulate	v. *조종하다	\N	\N	\N	suneung	하
8974	contemplate	v. *~을 숙고하다	\N	\N	\N	suneung	하
9112	ballot	n. *투표	\N	\N	\N	suneung	하
10383	primitive	원시의	\N	\N	\N	gtelp	하
8958	v. *석쇠로 굽다	* 심문하다	\N	\N	\N	suneung	기타
9095	afford	v. *~할 여유가 있다*	\N	\N	\N	suneung	하
9006	transition	n. *변천	\N	\N	\N	suneung	하
9033	incline	v. *내키게 하다	\N	\N	\N	suneung	하
9061	v. *등록하다	 기재하다*	\N	\N	\N	suneung	기타
9092	deform	v. *불구로 만들다	\N	\N	\N	suneung	중
9495	manuscript	n. *손으로 쓴 것	\N	\N	\N	suneung	하
9535	monotonous	a. *단조로운	\N	\N	\N	suneung	하
9575	tackle	v. (일 · 문제를) *다루다*	\N	\N	\N	suneung	하
9613	productive	a. *생산적인	\N	\N	\N	suneung	하
9237	shelter	v. *피난하다	\N	\N	\N	suneung	하
9404	blush	v. *얼굴을 붉히다	\N	\N	\N	suneung	하
9447	headquarters	n. *본부*(단수 취급)	\N	\N	\N	suneung	하
9514	innermost	a. *가장 깊숙한*	\N	\N	\N	suneung	하
9268	paradigm	n. *패러다임	\N	\N	\N	suneung	하
9316	approximate	v. (수량 등이) *~에 가까워지다*	\N	\N	\N	suneung	하
9784	vehicle	탈 것 차량	\N	\N	\N	gtelp	하
12167	หลับตา	눈감아	(랍↘ 따아) หลับ 은 &ldquo; (눈을) 감다 &ldquo; 의 뜻 이외에 &ldquo; 자다 &rdquo; 라는 뜻도 가지고 있다.	\N	\N		기타
12253	นักกีฬามือสมัครเล่น	아마츄어 운동선수	(낙↗ 끼라 므으 싸↘ 막↘ 레＾앤)&rarr; สมัครเล่น (싸↘막↘ 레＾앤) = 아마추어	\N	\N		기타
12334	มี แต่ปัญหา	297. 문제뿐이네.	미이 때애↘ 빤하v아 있다 ~ 뿐, 단지, 오직 문제	\N	\N		기타
12419	ฉันจะไม่ลืมบุญคุณ	371. 저는 은혜 잊지 않을 겁니다.	폼v 짜↘ 마＾이  르음 분쿤 나 ~ 할 것이다 ~ 아니다 잊다 은혜	\N	\N		기타
12487	กำลังยืดเส้น ยืดสาย	427. 스트레칭하고 있는 중이야.	깜랑  으＾읏  쎄＾앤  으＾읏  싸v아이 ~하는중이다 늘어나다, 연장하다 선, ~관(신체근육) 늘리다 선, 줄	\N	\N		기타
12553	เผลอ ไม่ได้	42.부주의해선 안 돼.	플v르ㅓ   마＾이 다＾이 부주의하다 ~ 아니다 ~ 할수 있다	\N	\N	thai-conversation	기타
13020	ได้ยิน กับ หู	406. 내 귀로 직접 들었어.	다＾이 인 깝↘ 후v우 듣다 ~으로, ~을 가지고 귀	\N	\N	thai-conversation	기타
13026	ผู้ชายหน้าโง่	411. 멍청한 남자	푸＾우 차아이 나＾아 오＾옹 남자  얼굴   멍청하다, 어리석다	\N	\N	thai-conversation	기타
13031	ถึงเวลาแล้ว	415. 시간 다 됐어.	틍v   웰라아 래애우↗ 도달하다, ~ 에 닿다 시간 이미	\N	\N	thai-conversation	기타
13033	คุยออกรส	재미있게 얘기하다	(쿠이 어억↘롯↗)	\N	\N	thai-conversation	기타
13036	ขอให้ได้แฟนสวย ๆ	이쁜 애인 생기기 바래요.	(커v어 하＾이 다＾이 홰앤 쑤v어이 쑤v어이)	\N	\N	thai-conversation	기타
13038	เป็นคนละคน	419. 예전과 다른 사람이 됐어.	뻰 콘 라↗ 콘 ~ 이 되다 각각 다른 사람	\N	\N	thai-conversation	기타
13043	ต้อง รีบ ทำ	423. 서둘러서 해야 돼.	떠＾엉   리＾입 탐 ~ 해야 한다 서두르다 하다	\N	\N	thai-conversation	기타
13046	เขาทนอยู่	426. 그는 참고 머물러 있다.	카오↗ 톤 유우↘ 그 참다, 견디다 있다	\N	\N	thai-conversation	기타
923	instructions	지시사항	\N	\N	\N		하
931	solar	태양의	\N	\N	\N		하
973	get a stomachache	배가 아프다	\N	\N	\N		기타
996	weigh	무게가 나가다	\N	\N	\N		하
271	nothing left	남겨진 것이 아무것도 없다	\N	\N	\N		기타
829	finger	손가락	\N	\N	\N		하
1031	common	평범한	\N	\N	\N		하
1051	blast	폭발 센 바람	\N	\N	\N		하
1075	cleaners and soap for the home	가정용 비누와 세제	\N	\N	\N		기타
1091	class president	학급 반장	\N	\N	\N		기타
1099	unavoidable circumstance	불가피한 상황	\N	\N	\N		기타
1122	individually	개인적인	\N	\N	\N		하
1192	acceptable	수용할 수 있는 받아들일 수 있는	\N	\N	\N		하
1208	leave	남기다	\N	\N	\N		하
1216	investment	투자	\N	\N	\N		하
1229	physics	물리학	\N	\N	\N		하
1251	desirable	바람직한 호감이 가는	\N	\N	\N		하
1294	beat throb	심장맥박 따위가 뛰다	\N	\N	\N		기타
1369	relationship	관계	\N	\N	\N		하
1385	cause	의 원인이 되다	\N	\N	\N		하
1408	neither A nor B A B	도 도 아니다	\N	\N	\N		기타
1433	opportunity	기회	\N	\N	\N		하
1438	sweat	땀을 흘리다	\N	\N	\N		하
1444	predict	예언하다	\N	\N	\N		하
1463	with	때문에	\N	\N	\N		하
1472	research	연구하다 조사하다	\N	\N	\N		하
78	in other words	즉 다시 말해서	\N	\N	\N		기타
248	rich connection	풍부한 연결고리	\N	\N	\N		기타
489	big mean	양이 많은 식사	\N	\N	\N		기타
1190	unsportsmanlike	스포츠맨 정신에 어긋나는	\N	\N	\N		중
1285	offer	제공하다	\N	\N	\N		하
1555	athletic	운동경기의 운동선수다운 활발한	\N	\N	\N		하
15897	fulfill	v . 이행 하다 ; 충족 시키다 . 달성 ( 성취 ] 하다	\N	\N	\N	toeic	하
4339	furtive	A. 남몰래 하는	\N	\N	\N	toefl	중
4363	glimmer	희미하게 빛나다	\N	\N	\N	toefl	하
4282	float	뜨다	\N	\N	\N	toefl	하
6936	subliminal	의식되지 않는; 잠재의식의	\N	\N	\N	gongmuwon	하
8941	spontaneous	a. *자발적인	\N	\N	\N	suneung	하
9155	patrol	n. *순찰	\N	\N	\N	suneung	하
9239	autonomy	n. *자치	\N	\N	\N	suneung	하
9594	refraction	n. (빛 · 소리 따위의) *굴절*	\N	\N	\N	suneung	하
9838	in order to Root	하기 위해서	\N	\N	\N	gtelp	기타
1052	sound of exploding glass	유리 폭발 소리	\N	\N	\N		기타
16645	direct	v.- 에게 길 을 안내 하다 . 가르쳐 주다 . ( ~ 로 ) 향하게 하다 . ( 편지 등 을 ) 보내다 adj . 직접적인 	\N	\N	\N	toeic	하
4807	multiracial	a. 다(多)민족의	\N	\N	\N	toefl	하
9988	sympathy pl	동정 헤아림 종종 조위 문상 위문	\N	\N	\N	gtelp	기타
9656	for oneself	혼자의 힘으로	\N	\N	\N	gtelp	기타
9693	a color photograph accompanied by a story	이야기사연 가 동반된 컬러사진 한 장	\N	\N	\N	gtelp	기타
9662	woodcutter	나무꾼	\N	\N	\N	gtelp	중
9664	by signalling	신호로서	\N	\N	\N	gtelp	기타
9691	amazing animal	놀라운 동물	\N	\N	\N	gtelp	기타
9746	safety tips	안전 충고수칙	\N	\N	\N	gtelp	기타
9776	scrap	까지다 찢어지다	\N	\N	\N	gtelp	하
9800	suffer from	로 고통 받다	\N	\N	\N	gtelp	기타
9899	communicative connection	의사소통연결고리	\N	\N	\N	gtelp	기타
9944	celebrate	축하하다	\N	\N	\N	gtelp	하
10046	textmessage	문자를 주고받다	\N	\N	\N	gtelp	기타
10118	backward	뒤쪽으로	\N	\N	\N	gtelp	하
10163	amazingly	놀랍게	\N	\N	\N	gtelp	하
10232	behind	뒤	\N	\N	\N	gtelp	하
10445	attractive	매력적인	\N	\N	\N	gtelp	하
10089	function	기능	\N	\N	\N	gtelp	하
12488	เอาไว้คราวหน้า ก็แล้วกัน	428. 다음번으로 미뤄두죠.	아아오 와이↗ 크라우 나아↗ 꺼＾래애우↗깐 가져가다 ~ 해 두다 ~ 번, ~ 회 다음의 ~ 하도록 하죠	\N	\N		기타
12497	สัก พักใหญ่ ๆ	437. 오랫동안	싹↘ 팍↗   야이↘ 야이↘ ~ 만큼, ~정도 일정한 시간의 길이, 잠깐동안 크다	\N	\N		기타
12505	ชอบ นั่งริมหน้าต่าง	445. 창가에 앉는 걸 좋아해.	처＾업 낭＾ 림 나＾아 따앙↘ 좋아하다 앉다 가장자리 창문 『 ริม (림 : 가장자리) 의 다양한 모습들 』ริมฝีปาก (림 휘v이 빠악↘ : 입술) ริมทะเล (림 탈↗레애 : 바닷가)ริมแม่น้ำ (림 매＾애 나암↗ : 강가) ริมทาง (림 타앙 : 길가)	\N	\N		기타
12622	เที่ยวบินขาออก	111. 출국 비행기편	티＾여우 빈 카v아 어억↘ (교통) 편 날다 나가다, 수출하다	\N	\N	thai-conversation	기타
12707	มา ไม้ไหน	177. 어떤 수단 (수법) 을 쓴거야 ?	마아 마이↗ 나v이 현재까지 지속되는 상태 나무, 수단, 수법, 꼬치를 세는 말 어느	\N	\N	thai-conversation	기타
12886	ขอสงบสติ อารมณ์	288. 진정할 시간을 좀 줘요.	커v어   싸↘옵↗   싸↘띠↘ 아아롬 요구하다, 바라다 안정되다, 평화롭다 지각, 의식, 이성 감정, 기분 진정하다, 마음을 가라앉히다	\N	\N	thai-conversation	기타
12966	ต้องจัดการให้เร็วที่สุด	359. 가능한 한 빨리 처리해야 돼.	떠＾엉 짯↘ 까안 하＾이 레우 티＾이 쑷↘ ~해야 한다 처리하다 ~ 하도록 빠르다 가장	\N	\N	thai-conversation	기타
12430	เขาทำงาน แบบไม่ลืม หูลืมตา	381. 그는 다른 건 신경쓰지 않고 일만 한다.	카오↗ 탐 응안 배앱↘ 마＾이 르음 후v우 르음 따아 그 일하다   모양, 형식 ~ 아니다 (귀를) 열다 귀 (눈을) 뜨다 눈	\N	\N		기타
13019	มี แค่นี้ เอง	405. 가진 게 바로 이것뿐이야.	미이 캐＾애 니이↗ 에앵 가지고 있다 단지, ~ 뿐 이 바로 (앞 단어 강조)	\N	\N	thai-conversation	기타
13030	แน่นะ	414. 확실한거야 ?	내＾애 나↗ 확실하다 ~ 라구 ?	\N	\N	thai-conversation	기타
13032	ออกรถ	416. 드라이브하다	어억↘   롯↗ 출발하다, 나가다 자동차 발음이 똑같은 ออกรส (어억↘롯↗) 은 맛이 나다, 재미있다 의 뜻이다.	\N	\N	thai-conversation	기타
13037	ขอให้สอบได้	시험에 합격하기 바래요.	(커v어 하＾이 써업↘ 다＾이)	\N	\N	thai-conversation	기타
13042	นอนก่อนนะ	422. 먼저 자.	너언 꺼언↘ 나↗ 자다 먼저 ~ 라구	\N	\N	thai-conversation	기타
13045	ตายเป็น ผี	425. 죽어서 귀신이 되다	따아이 뻰 피v이 죽다 ~ 이 되다 귀신	\N	\N	thai-conversation	기타
954	milky	우유가 들어있는	\N	\N	\N		하
958	add	덧붙여 말하다	\N	\N	\N		하
959	compare A to B A B	를 에 비유하다	\N	\N	\N		기타
984	the Baseball Hall of Fame	야구 명예의 전당	\N	\N	\N		기타
988	spread	퍼지다	\N	\N	\N		하
131	motorist	자가용 운전수	\N	\N	\N		하
555	realistic style	사실주의적인 양식	\N	\N	\N		기타
1002	fall continuously	계속 떨어지다	\N	\N	\N		기타
1025	active	적극적인	\N	\N	\N		하
1043	rename	새로운 이름을 짓다	\N	\N	\N		하
1108	an easy source of money	쉬운 돈 벌이의 원천	\N	\N	\N		기타
1184	natural resources	천연 자원	\N	\N	\N		기타
1221	match	맞추다 조화시키다	\N	\N	\N		하
1095	occur to	에 생각나다	\N	\N	\N		기타
1231	though	임에도 불구하고	\N	\N	\N		하
1240	many of	대부분	\N	\N	\N		기타
1270	in the world	비교급 강조 도대체	\N	\N	\N		기타
1279	relate	관련시키다	\N	\N	\N		하
1308	toward	에 대하여	\N	\N	\N		하
1332	automatic	자동의 자동적인	\N	\N	\N		하
1340	tray	칸막이 한 작은 상자 쟁반	\N	\N	\N		하
1359	lead A toR A R	에게 할 마음이 생기게 하다	\N	\N	\N		기타
1394	sound like	처럼 들리다 소리 나다	\N	\N	\N		기타
1417	those who	하는 사람들	\N	\N	\N		기타
114	biological need	생물학적인 욕구	\N	\N	\N		기타
223	in gaining support	지원을 얻는데	\N	\N	\N		기타
263	festive	축제 같은 즐거운	\N	\N	\N		하
1014	diseased trees	죽은 나무	\N	\N	\N		기타
1446	even	비교급 훨씬 더욱	\N	\N	\N		하
4892	plastic surgeon	성형외과 의사	\N	\N	\N	toefl	기타
5634	chagrin	억울하게 하다; 분하게 하다	\N	\N	\N	gongmuwon	하
6456	meticulous	세심한	\N	\N	\N	gongmuwon	하
8124	n. *찍은 자국	 인상*	\N	\N	\N	suneung	기타
9206	underprivileged	a. (경제적 · 사회적으로) *권리가 적은	\N	\N	\N	suneung	하
9222	pest	n. *해충	\N	\N	\N	suneung	하
9808	stiff	뻐근한 뻣뻣한	\N	\N	\N	gtelp	하
1124	charity	자선 단체	\N	\N	\N		하
5391	aboard	배로; 승선하여	\N	\N	\N	gongmuwon	하
9967	by sight	시각으로	\N	\N	\N	gtelp	기타
9870	award n v	상 상을 주다	\N	\N	\N	gtelp	기타
9912	passerby	지나가는 사람 행인	\N	\N	\N	gtelp	중
9670	longlasting pain	오랫동안 지속되는 통증	\N	\N	\N	gtelp	기타
9821	mill n v	분쇄기 가루로 만들다	\N	\N	\N	gtelp	기타
9989	take time from sleep	잠 잘 시간을 뺐다	\N	\N	\N	gtelp	기타
10025	strangely	이상하게	\N	\N	\N	gtelp	하
10097	determine	결정하다	\N	\N	\N	gtelp	하
10247	volunteer	자원 봉사자	\N	\N	\N	gtelp	하
10020	bowl	주발 공기	\N	\N	\N	gtelp	하
10053	for the first time	처음으로	\N	\N	\N	gtelp	기타
10242	suggest	제안하다	\N	\N	\N	gtelp	하
10497	gain popularity	인기를 얻다	\N	\N	\N	gtelp	기타
10213	troublesome	골치 아픈	\N	\N	\N	gtelp	하
10249	although	일지라도	\N	\N	\N	gtelp	하
10267	nod	고개를 끄덕이다	\N	\N	\N	gtelp	하
10472	rather than	라기 보다는	\N	\N	\N	gtelp	기타
12549	คนใจดำ	38. 잔인한 (인정머리없는) 사람이야.	(콘 짜이 담) 사람 마음 검다	\N	\N	thai-conversation	기타
1598	seriously	심각하게 진지하게	\N	\N	\N		하
15802	critical	adj . 대단히 중요한 : 비판적인	\N	\N	\N	toeic	하
3905	If you deflect something such as criticism or attention	 you act in a way that prevents it from being directed towards you or affecting you.	\N	\N	\N	toefl	기타
12552	ทำไป ทำไม	41.왜 그걸 하고 있어 ?	탐 빠이   탐마이 하다 앞의 동작을 계속 하다 왜	\N	\N	thai-conversation	기타
4658	kitschy	a. 천박한; 대중에게 영합하는 [= funny and cheap	\N	\N	\N	toefl	중
11462	extracurricular activities	교과 외 활동의특활	\N	\N	\N	gtelp	기타
5848	desultory	종잡을 수 없는; 산만한; 주제를 벗어난	\N	\N	\N	gongmuwon	중
4324	worry about	걱정하다	\N	\N	\N	toefl	기타
13440	Next (to)	옆	\N	\N	\N	kr-en-basic	기타
13027	ผู้หญิงหน้าเงิน	돈만 밝히는 여자	(푸＾우 잉v 나＾아 응언)	\N	\N	thai-conversation	기타
13034	จะอยู่อีกนานมั้ย	417. 더 오래 있을거야 ?	짜↘   유우↘ 이익↘ 나안 마이↗ ~ 할 것이다 있다 더 오래 ~ 야 ?	\N	\N	thai-conversation	기타
13044	เลือก ไม่ถูก	424. 고를 수가 없어.	르＾으악 마＾이 투욱↘ 고르다 ~ 아니다 옳다, 맞다	\N	\N	thai-conversation	기타
13047	เขาอยู่ทน	그는 오랫동안 머물러 있다.	(카오↗ 유우↘ 톤)	\N	\N	thai-conversation	기타
13050	ที ละเล็กทีละน้อย	429. 조금씩, 점차, 차츰차츰	티이   라↗ 렉↗ 티이  라↗ 너어이↗ 차례, 기회, 시기  마다 작다 차례, 기회, 시기 ~ 마다 적다, 작다, 낮다, 어리다	\N	\N	thai-conversation	기타
13051	เงินล่วง หน้า	430. 선불, 가불	응언 루＾앙   나＾아 돈 지나다, 앞서다, 넘다, 경과하다 앞, 미리 앞서, 먼저	\N	\N	thai-conversation	기타
13052	รับ ไม่ได้	431. 받아 들일 수 없어.	랍↗   마＾이 다＾이 받아들이다 ~할수없다	\N	\N	thai-conversation	기타
13053	เสร็จธุระแล้วรีบกลับบ้าน	432. 볼일 (용건)을 마치고 집으로 서둘러 돌아 가다	쎗↘   투↘라↗ 래애우↗ 리＾입 끌랍↘ 바＾안 끝내다, 마치다 일, 용건 이미 서두르다 돌아가다 집	\N	\N	thai-conversation	기타
13054	ทำเป็นไม่รู้ไม่ชี้	433. 전혀모르는척 하다	탐 뻰 마＾이 루우↗ 마＾이 치이↗ 하다 ~ 로서 ~ 아니다 알다 지시하다, (길을) 가르쳐주다	\N	\N	thai-conversation	기타
13055	ทำ เป็น ไม่รู้ไม่เห็น	434. 모르는척, 안본척한다	탐 뻰 마＾이 루우↗ 마＾이 헨v 하다 ~로서 ~아니다 알다 ~ 아니다 보다	\N	\N	thai-conversation	기타
13056	ไม่ต้องรอทานข้าว	435. 식사하는것 기다릴 필요없어요.	마＾이 떠＾엉 러어 타안 카＾아우 ~ 할필요없다   기다리다 드시다 밥 กิน (낀 : 먹다) 보다정중한말	\N	\N	thai-conversation	기타
13057	มองตา ค้าง	436. 눈길이 떨어지지 않아.	머엉 따아 카앙↗ 바라보다 눈 남아있다, 도중에 멈춰있다	\N	\N	thai-conversation	기타
13058	สัก พักใหญ่ ๆ	437. 오랫동안	싹↘ 팍↗   야이↘ 야이↘ ~ 만큼, ~정도 일정한 시간의 길이, 잠깐동안 크다	\N	\N	thai-conversation	기타
13060	ต้องทำให้ได้	439. 해내야해.	떠＾엉 탐 하＾이 다＾이 ~ 해야한다 하다 ~ 하도록 ~ 할수있다	\N	\N	thai-conversation	기타
13061	อย่าหาเรื่อง	440. 문제 일으키지마.	야아↘  하v아 르＾으앙 ~ 하지마라 찾다 일, 사건	\N	\N	thai-conversation	기타
13062	อัน เดียวพอ	441. 한 개면 충분해.	안   디여우 퍼어 ~ 개 (갯수) 하나의 충분하다	\N	\N	thai-conversation	기타
13063	ไม่ชอบนั่งเฉย ๆ	442. 아무것도 안하고 그냥 앉아있는 걸 싫어해.	마＾이 처＾업  낭＾ 츠ㅓv이 츠ㅓv이 ~ 아니다 좋아하다 앉다 그냥, 아무것도 안 하고	\N	\N	thai-conversation	기타
13064	จะ ดูลาย มือ ให้	443. 손금 봐줄께.	짜↘  두우 라아이  므으 하＾이 ~ 할 것이다 보다 (줄)무늬, 반점, 문양 손 ~ 해 주다	\N	\N	thai-conversation	기타
13065	ไม่ เข้ากับบรรยากาศ	444. 분위기와 어울리지 않아.	마＾이 카＾아오 깝↘   반야아까앗↘ ~ 아니다 ~ 와 어울리다, 조화를 이루다 분위기	\N	\N	thai-conversation	기타
13066	ชอบ นั่งริมหน้าต่าง	445. 창가에 앉는 걸 좋아해.	처＾업 낭＾ 림 나＾아 따앙↘ 좋아하다 앉다 가장자리 창문 『 ริม (림 : 가장자리) 의 다양한 모습들 』ริมฝีปาก (림 휘v이 빠악↘ : 입술) ริมทะเล (림 탈↗레애 : 바닷가)ริมแม่น้ำ (림 매＾애 나암↗ : 강가) ริมทาง (림 타앙 : 길가)	\N	\N	thai-conversation	기타
13067	โดนเล่น งาน	446. 꾸짖음을 당하다, 공격당하다, 압박당하다	도온 레＾앤 응안 당하다 놀다, 몰두하다, 저지르다, 해를 가하다, 놀리다 일, 업무, 사정 꾸짖다, 공격하다, 압박하다, 행사에서 오락을 하다	\N	\N	thai-conversation	기타
13068	จู่ ๆก็ได้เจอ	447. 우연히 만났어.	쭈↘ 쭈↘ 꺼＾ 다＾이 쯔ㅓ어 예고없이, 갑자기 ~하게도 했다 (우연히) 만나다	\N	\N	thai-conversation	기타
13069	จู่ ๆฝนตกลง มา	갑자기 비가 온다.	쭈↘ 쭈↘ 혼v 똑↘  롱   마아 갑자기  비  떨어지다 내리다 오다	\N	\N	thai-conversation	기타
13070	อย่า ไปกวน เขา	448. 그를 성가시게 하지 마.	야아↘ 빠이  꾸안   카오↗ ~ 하지 마라 앞에 행위을 계속 함 성가시게 굴다 그	\N	\N	thai-conversation	기타
13071	ต้องระวังเป็นพิเศษ	449. 특히 조심해야 돼.	떠＾엉 라↗왕 뻰 피↗쎄앳↘ ~ 해야 한다 조심하다 ~ 로서 특별하다, 특별히, 특수하게	\N	\N	thai-conversation	기타
13072	บริการ ที่ยอดเยี่ยม	450. 최고의 서비스	버리까안 티＾이 여＾엇   이＾이암 서비스 ~ 한   최고, 정상, 첨단 최고, 최우수	\N	\N	thai-conversation	기타
1486	rent	빌리다	\N	\N	\N		하
1489	purchase	구입하다	\N	\N	\N		하
1523	ring	종을울리다	\N	\N	\N		하
1530	consider	라고 여기다	\N	\N	\N		하
1534	reason	추론하다 논리적으로 생각하다	\N	\N	\N		하
1563	talent	재주	\N	\N	\N		하
1567	fall upon	에게 일어나다	\N	\N	\N		기타
1575	well known	잘 알려진	\N	\N	\N		기타
1616	as for	로 말하자면 은 어떠냐 하면	\N	\N	\N		기타
1636	spread out	펼치다	\N	\N	\N		기타
1654	necessity	필수품	\N	\N	\N		하
1659	prefer A to B B A	보다 를 더 좋아하다	\N	\N	\N		기타
1668	political	정치의	\N	\N	\N		하
1677	conclude	결론짓다	\N	\N	\N		하
1698	appeal	간청하다	\N	\N	\N		하
1722	gifted	재능이 있는	\N	\N	\N		하
1506	spirit	마음 정신	\N	\N	\N		하
1507	all of sudden	갑자기	\N	\N	\N		기타
1513	sense	알아채다 느껴 알다	\N	\N	\N		하
1591	calm	침착한 고요한	\N	\N	\N		하
1625	campaign	캠페인 조직적인 운동	\N	\N	\N		하
1684	prepare	준비하다	\N	\N	\N		하
1715	extraordinary	비범한	\N	\N	\N		하
1756	determine	결정하다	\N	\N	\N		하
1762	consumer	소비자	\N	\N	\N		하
1824	keep A from B A B	가 하는 것을 막다	\N	\N	\N		기타
1875	to the point ofA A	정도까지	\N	\N	\N		기타
1895	approach	접근하다 다가가다	\N	\N	\N		하
1933	entertain	을 즐겁게 해주다	\N	\N	\N		하
1959	recreate	다시 만들다 재창조하다	\N	\N	\N		하
1969	hot flue gases	뜨거운 통기관의 가스	\N	\N	\N		기타
15591	recognize	v . ( 공로 를 ) 인정 하다 : 알아 보다	\N	\N	\N	toeic	하
15650	remaining work/employees	남은 일 / 직원 들	\N	\N	\N	toeic	기타
15690	prevent prohibit 목 rom - ing	- 하는 것을 막다	\N	\N	\N	toeic	기타
15824	be committed[dedicated/devoted) to	~에 기여하다 헌신하다	\N	\N	\N	toeic	기타
15918	setback	n . 차질	\N	\N	\N	toeic	하
15937	demonstrate	v . 설명 ( 증명 ) 하다 : 시연 하다	\N	\N	\N	toeic	하
16061	funding	n . 자금 : 자금 제공 [ 재정 지원 ]	\N	\N	\N	toeic	하
15771	result	n . 결과 v.- 로부터 발생 하다 ( from ) : - 을 초래 하다 ( in )	\N	\N	\N	toeic	하
15850	be bound to V	phr . 틀림 없이 / 반드시 ~ 할 것이다	\N	\N	\N	toeic	기타
16224	establish	v . 설립 하다 . 세우다 확고히 하다	\N	\N	\N	toeic	하
16524	develop	v . ( 필름 을 ) 현상 하다 : 발전 시키다	\N	\N	\N	toeic	하
15604	be credited with	~로 인정 받다	\N	\N	\N	toeic	기타
15715	suggest -ing	제안 하다	\N	\N	\N	toeic	기타
15814	adjacent	adj . ( 지역 · 건물 등 이 ) 인접한 . 가까운	\N	\N	\N	toeic	하
16035	lead	v . 이끌다 . 안내 하다 : 이어 지다 . 초래 하다 ( in )	\N	\N	\N	toeic	하
13343	Goodbye! (You leave / they stay)	안녕히 계세요!	\N	\N	\N	kr-en-basic	기타
13358	To dislike (V)	싫어하다	\N	\N	\N	kr-en-basic	기타
13359	To be delicious (V)	맛있다	\N	\N	\N	kr-en-basic	기타
13360	To not be delicious (V)	맛없다	\N	\N	\N	kr-en-basic	기타
13365	What?	뭐예요?	\N	\N	\N	kr-en-basic	기타
13372	To be sorry (V) (casual)	미안하다	\N	\N	\N	kr-en-basic	기타
13374	To be ok / To be alright (V)	괜찮다	\N	\N	\N	kr-en-basic	기타
13378	Four (K)	넷	\N	\N	\N	kr-en-basic	기타
13389	Age	살	\N	\N	\N	kr-en-basic	하
13393	Two (S)	이	\N	\N	\N	kr-en-basic	기타
13419	Yesterday	어제	\N	\N	\N	kr-en-basic	하
13426	Student/Young person	학생	\N	\N	\N	kr-en-basic	기타
13432	Rice / Meal	밥	\N	\N	\N	kr-en-basic	기타
13434	To be thirsty (V)	목 말라다	\N	\N	\N	kr-en-basic	기타
13437	Back / Behind	뒤	\N	\N	\N	kr-en-basic	기타
13444	Bank	은행	\N	\N	\N	kr-en-basic	하
13453	Fast / Quickly	빨리	\N	\N	\N	kr-en-basic	기타
13502	To hurt / To be sick (V)	아프다	\N	\N	\N	kr-en-basic	기타
13506	Want ...	... 고 싶어	\N	\N	\N	kr-en-basic	기타
13509	Soju	소주	\N	\N	\N	kr-en-basic	중
13510	Cola drink	콜라	\N	\N	\N	kr-en-basic	기타
13520	To cry (V)	울다	\N	\N	\N	kr-en-basic	기타
13541	Dad	아빠	\N	\N	\N	kr-en-basic	하
13553	What are you doing?	뭐해?	\N	\N	\N	kr-en-basic	기타
13556	Internet	인터넷	\N	\N	\N	kr-en-basic	하
13579	Long (intimate)	길어	\N	\N	\N	kr-en-basic	기타
13584	To be small (V)	작다	\N	\N	\N	kr-en-basic	기타
13594	Please give me ...! (Informal)	... 줘!	\N	\N	\N	kr-en-basic	기타
16334	solidify	v . 굳히다 . 확고히 하다	\N	\N	\N	toeic	하
15719	involve -ing	포함 하다	\N	\N	\N	toeic	기타
15598	knowledge	n . 지식 ( 불가 산 명사 ) : 이해 ( 가산 명사 )	\N	\N	\N	toeic	하
15972	coincide with	phr . 동시에 일어나 다 	\N	\N	\N	toeic	기타
15601	recognition	n . 알아 봄 	\N	\N	\N	toeic	하
15634	disabled/handicapped people	장애인	\N	\N	\N	toeic	기타
16121	traditionally	adv . 전통적 으로	\N	\N	\N	toeic	하
16627	leave	v . 떠나다 : 남기다 . 남겨 두다 : 내버려 두다 . 방치 하다 n 	\N	\N	\N	toeic	하
16757	assume	v . ( 임무 / 역할 / 책임 을 ) 맡다 . 가정 [ 추측 	\N	\N	\N	toeic	하
16510	sponsor	n . 후원자 스폰서 v . 후원 하다	\N	\N	\N	toeic	하
16533	application	n . 적용 	\N	\N	\N	toeic	하
4951	pensive	깊은 생각에 잠긴	\N	\N	\N	toefl	하
3398	mature	성숙한	\N	\N	\N	toefl	하
3404	affability	상냥함	\N	\N	\N	toefl	중
16564	upcoming	adj . 다가오는 	\N	\N	\N	toeic	하
3450	amalgamate	합병시키다	\N	\N	\N	toefl	중
3502	appreciate	감사하다	\N	\N	\N	toefl	하
3523	arid	건조한	\N	\N	\N	toefl	하
3530	enunciate	명확히 발음하다; 명확히 표현/설명하다	\N	\N	\N	toefl	중
3565	available	이용할 수 있는	\N	\N	\N	toefl	하
3422	agnostic	N. 불가지론자(신이 존재하는지 아닌지 알 수 없다는 사람)	\N	\N	\N	toefl	하
3500	appliance	기구	\N	\N	\N	toefl	하
3531	artificial	인공적인	\N	\N	\N	toefl	하
3595	bed	하천(호수)바닥	\N	\N	\N	toefl	하
3622	bicker	말다툼하다	\N	\N	\N	toefl	중
3489	aperture	틈	\N	\N	\N	toefl	하
3506	apprise	정보를 주다	\N	\N	\N	toefl	중
3539	assiduous	근면 성실한	\N	\N	\N	toefl	중
3741	crash	충돌하다	\N	\N	\N	toefl	하
3772	focus on	~에 집중하다	\N	\N	\N	toefl	기타
3784	confirm	v. 확인하다	\N	\N	\N	toefl	하
3790	conglomerate	N. (거대) 복합 기업	\N	\N	\N	toefl	하
3849	crumble	바스러지다; 무너지다	\N	\N	\N	toefl	하
4137	enormous	거대한	\N	\N	\N	toefl	하
3980	diminish	감소하다	\N	\N	\N	toefl	하
4122	encounter	우연히 만나다	\N	\N	\N	toefl	하
1554	adventurous	모험을 좋아하는 대담한	\N	\N	\N		하
1584	afterward	후에 나중에	\N	\N	\N		하
1610	realize	깨닫다	\N	\N	\N		하
1645	goat	염소	\N	\N	\N		하
1649	playfully	장난스럽게	\N	\N	\N		하
1691	suppose	라고 가정하다	\N	\N	\N		하
1705	think of A as B A B	를 로 생각하다	\N	\N	\N		기타
1739	academic	학문의 학구적인	\N	\N	\N		하
1748	pass by	지나가다	\N	\N	\N		기타
1770	blacksmith	대장장이	\N	\N	\N		하
1776	faintly	희미하게	\N	\N	\N		하
1788	cane pole	낚싯대	\N	\N	\N		기타
1811	extracurricular activities	교과 외 활동의특활	\N	\N	\N		기타
1839	square	평방제곱 광장 사각형	\N	\N	\N		하
1850	pace	보폭 속도 페이스	\N	\N	\N		하
1857	clearly and directly	명확하고 직접적으로	\N	\N	\N		기타
1881	realize	깨닫다 알다	\N	\N	\N		하
1887	relax	편안해 지다 긴장을 풀다	\N	\N	\N		하
1925	poet	시인	\N	\N	\N		하
1930	myth	신화	\N	\N	\N		하
1980	notice	알다 주의하다 알아차리다	\N	\N	\N		하
1991	participate in A A	에 참여참석하다	\N	\N	\N		기타
15592	updated	adj . 최신 의 	\N	\N	\N	toeic	하
15914	treat	v . 대접 하다 : ( 특정한 태도 로 ) 대하다 . 처리 하다 ; 치료 하다 n . 특별한 대접	\N	\N	\N	toeic	하
13344	Goodbye! (You stay or leave / they leave)	안녕히 가세요!	\N	\N	\N	kr-en-basic	기타
13345	Yes!	네!	\N	\N	\N	kr-en-basic	기타
13362	To exist / To be there / To have (V)	있다	\N	\N	\N	kr-en-basic	기타
13376	Two (K)	둘	\N	\N	\N	kr-en-basic	기타
13386	Twenty	스물	\N	\N	\N	kr-en-basic	하
13405	When?	언제?	\N	\N	\N	kr-en-basic	기타
13433	Sleep	자	\N	\N	\N	kr-en-basic	하
13449	100	백	\N	\N	\N	kr-en-basic	기타
13460	Very	아주	\N	\N	\N	kr-en-basic	하
13464	To not know (V)	몰르다	\N	\N	\N	kr-en-basic	기타
13466	Girlfriend	여자친구	\N	\N	\N	kr-en-basic	하
13470	Only	만	\N	\N	\N	kr-en-basic	하
13479	Let's eat!	먹자!	\N	\N	\N	kr-en-basic	기타
13488	Blue	파란	\N	\N	\N	kr-en-basic	하
13490	Black	까만	\N	\N	\N	kr-en-basic	하
13516	Teacher	선생님	\N	\N	\N	kr-en-basic	하
13521	To laugh (V)	웃다	\N	\N	\N	kr-en-basic	기타
13525	Too Much / Very	많이	\N	\N	\N	kr-en-basic	기타
13536	Coffee	커피	\N	\N	\N	kr-en-basic	하
13560	Shoes	구두	\N	\N	\N	kr-en-basic	하
13562	Be quiet!	시끄러워!	\N	\N	\N	kr-en-basic	기타
13574	To sleep (V)	자다	\N	\N	\N	kr-en-basic	기타
13577	Leg	다리	\N	\N	\N	kr-en-basic	하
13578	Fingernail	손톱	\N	\N	\N	kr-en-basic	하
13597	So so / Not particularly	볠로	\N	\N	\N	kr-en-basic	기타
16252	humidity	n . 습도 	\N	\N	\N	toeic	하
15605	in recognition of	~를 인정하여	\N	\N	\N	toeic	기타
16133	prompt	v . ( 어떤 일 이 일어나 도록 ) 하다 . 촉발 하다 . 유도 하다 adj . 즉각적인 : 신속한	\N	\N	\N	toeic	하
16321	function	n . 기능 ; 역할 v . 기능 하다 . 작동 하다	\N	\N	\N	toeic	하
16513	entrance	n . 입구 : 문 들어가기 	\N	\N	\N	toeic	하
15616	emerging technology	| 떠오르는 기술	\N	\N	\N	toeic	기타
15681	updated version/line	업데이트 된 버전 / 제품군	\N	\N	\N	toeic	기타
15913	serve	v . ( 상품 / 서비스 를 ) 제공 하다 . 근무 하다 	\N	\N	\N	toeic	하
16042	grant	n . ( 정부 ) 보조금 v . 주다 . 수여 하다	\N	\N	\N	toeic	하
16241	drastically	adv . 대폭 으로 	\N	\N	\N	toeic	하
15886	regarding	prep.- 에 관하여	\N	\N	\N	toeic	하
16114	equip	v . ( 장비 를 ) 갖추어 주다	\N	\N	\N	toeic	하
16449	manufacture	v . 제조 하다 . 생산 하다 n . 제조 	\N	\N	\N	toeic	하
16594	insufficient	adj 불충분 한 	\N	\N	\N	toeic	하
15700	be devoted/dedicated/committed to N/-ing	~에 전념 헌신 기여하다	\N	\N	\N	toeic	기타
15819	on-call	adj 대기 중인 ( 전화 만 하면 언제든지 달려가 는 )	\N	\N	\N	toeic	기타
15932	keep up with	phr . ( 소식 에 대해 계속 ) 알다 . ( 뒤쳐 지지 않고 상태 를 ) 계속 유지 하다 . 뒤쳐 지지 않다	\N	\N	\N	toeic	기타
16230	in case	con . ~ 인 경우를 대비해서 : 만약 ~ 인 경우에	\N	\N	\N	toeic	기타
16331	directory	n . ( 이름 · 주소 등 의 ) 안내 책자 : ( 빌딩 의 ) 입주자 안내판	\N	\N	\N	toeic	하
16924	additionally	adv . 게다가 	\N	\N	\N	toeic	하
16520	rent	v . ( 집을 ) 빌리다 . 임대 [ 임차 ] 하다 n . 집세	\N	\N	\N	toeic	하
4799	mortify	V. 굴욕감을 주다	\N	\N	\N	toefl	중
4828	negligent	태만한	\N	\N	\N	toefl	하
4895	ENT doctor	이비인후과 의사	\N	\N	\N	toefl	기타
4936	parsimonious	인색한	\N	\N	\N	toefl	중
3414	afford	~할 여유가 있다	\N	\N	\N	toefl	하
3419	agile	민첩한	\N	\N	\N	toefl	하
3696	celebrity	유명인사	\N	\N	\N	toefl	하
3711	chilling	a. (날씨가)쌀쌀한(=cold); 냉정한; 무서운(=frightening 	\N	\N	\N	toefl	하
3418	aggrieved	분개한	\N	\N	\N	toefl	하
3549	attribute	~의 탓으로 돌리다	\N	\N	\N	toefl	하
3644	bond	채권	\N	\N	\N	toefl	하
3658	bullion	금(은) 덩어리	\N	\N	\N	toefl	하
3754	compel	강요하다	\N	\N	\N	toefl	하
3415	aftermath	결과	\N	\N	\N	toefl	하
3566	avaricious	탐욕스러운	\N	\N	\N	toefl	중
3590	barter	물물교환하다	\N	\N	\N	toefl	하
3708	chatterbox	수다쟁이	\N	\N	\N	toefl	하
3832	spurious	가짜의	\N	\N	\N	toefl	하
3884	deception	속임수	\N	\N	\N	toefl	하
3892	decry	비난하다	\N	\N	\N	toefl	하
3950	despise	경멸하다	\N	\N	\N	toefl	하
3966	detest	몹시 싫어하다	\N	\N	\N	toefl	중
3889	decorate	장식하다	\N	\N	\N	toefl	하
3935	reliable	신뢰할 수 있는	\N	\N	\N	toefl	하
3823	persuade	설득하다	\N	\N	\N	toefl	하
1794	companionship	교류 교제	\N	\N	\N		하
1800	species	생물학적 종	\N	\N	\N		하
1806	chase	추적하다	\N	\N	\N		하
1834	solid	단단한 견고한	\N	\N	\N		하
1866	unfailingly	틀림없이	\N	\N	\N		중
1902	regard A as B A B	를 로 간주하다	\N	\N	\N		기타
1920	be supposed toV	하기로 되어있다	\N	\N	\N		기타
1944	heap	쌓아 놓는 것 더미	\N	\N	\N		하
1952	apparently	분명히 확실히	\N	\N	\N		하
15666	featured attraction/spot	특징 이 되는 장소	\N	\N	\N	toeic	기타
15612	declining demand	감소 하는 수요	\N	\N	\N	toeic	기타
15906	occasion	n . 행사 : 때 	\N	\N	\N	toeic	하
16110	encounter	v . ( 난관 에 ) 부딪 히다 . 우연히 마 주 치다	\N	\N	\N	toeic	하
16357	commute	v . 통근 하다 . 통학 하다 n 통근 ( 거리 )	\N	\N	\N	toeic	하
16407	commensurate	adj . ( 자질 등에 ) 상응 하는 . 비례 하는	\N	\N	\N	toeic	하
15595	precisely	adv . 정확히	\N	\N	\N	toeic	하
15768	outline	v . 윤곽 을 나타내 다 . 개요 를 서술 하다 n . 개요 	\N	\N	\N	toeic	하
15596	perspective	n . 관점 	\N	\N	\N	toeic	하
16150	resolve	v . ( 문제 등 을 ) 해결 하다	\N	\N	\N	toeic	하
16441	cover	v . ( 비용 따위 를 ) 충당 하다 . 대다 ; 다루다 . 포함 하다 : ( 보험 으로 ) 보장 하다	\N	\N	\N	toeic	하
15665	featured article/speaker	특집 기사 / 특별 연사	\N	\N	\N	toeic	기타
15792	distributive	adj . ( 상품 ) 유통 의	\N	\N	\N	toeic	하
16120	charge	n . ( 상품 / 서비스 에 대한 ) 요금 : 책임 의무 : 충전 v . ( 요금 을 ) 청구 하다 . 맡기다 . 충전 하다	\N	\N	\N	toeic	하
16194	length	n . 길이 : 기간	\N	\N	\N	toeic	하
16499	valid	adj . 유효한 	\N	\N	\N	toeic	하
16536	organize	v . 준비 ( 조직 ] 하다 정리 하다 . 체계화 ( 구조화 ] 하다	\N	\N	\N	toeic	하
16548	conservative	adj. 보수적인	\N	\N	\N	toeic	하
4772	millennium	'천년의 기간	\N	\N	\N	toefl	하
4849	nurture	양육하다	\N	\N	\N	toefl	하
4871	odds and ends	잡동사니	\N	\N	\N	toefl	기타
16534	apply	v . 쓰다 . 적용 하다 . 바르다 . 지원 하다 . 신청 하다	\N	\N	\N	toeic	하
3380	acrimonious	신랄한	\N	\N	\N	toefl	중
3389	adjacent to	~에 인접한	\N	\N	\N	toefl	기타
3479	anonymous	무명의	\N	\N	\N	toefl	하
3610	generous	관대한	\N	\N	\N	toefl	하
3617	better off	형편이 더 나은	\N	\N	\N	toefl	기타
3640	bona fide	A. 진실된	\N	\N	\N	toefl	기타
3765	comprehensive	종합적인	\N	\N	\N	toefl	하
3413	affluence	풍부함	\N	\N	\N	toefl	하
3685	overturn	뒤집다	\N	\N	\N	toefl	하
3707	chasten	Vt. 잘못을 깨닫게 하다	\N	\N	\N	toefl	중
3439	alter	바꾸다	\N	\N	\N	toefl	하
3927	indicate	나타내다	\N	\N	\N	toefl	하
4047	dose	복용량	\N	\N	\N	toefl	하
4080	eavesdropper	남의 이야기를 엿듣는 사람	\N	\N	\N	toefl	중
3788	confrontation	대립	\N	\N	\N	toefl	하
3789	congenial	마음이 맞는	\N	\N	\N	toefl	하
3864	bane	맹독; 고통의 원인	\N	\N	\N	toefl	하
3954	desultory	두서없는	\N	\N	\N	toefl	중
3987	discharge	V. 1. 해고하다; 제대시키다[하다]; 해방[방면]하다	\N	\N	\N	toefl	하
4121	encompass	둘러싸다	\N	\N	\N	toefl	하
3853	culpable	비난 받을 만한	\N	\N	\N	toefl	하
4078	dystopic	반이상향의	\N	\N	\N	toefl	상
4096	elective	선택의	\N	\N	\N	toefl	하
4135	enkindle	v. 불을 붙이다	\N	\N	\N	toefl	기타
4161	erode	침식하다	\N	\N	\N	toefl	하
4157	equivalent	상응하는	\N	\N	\N	toefl	하
1065	United Kingdom	영국	\N	\N	\N		기타
1859	freeze froze frozen	그자리에서 꼼짝못하게 하다 얼다	\N	\N	\N		기타
16235	finalize	v . 마무리 짓다 	\N	\N	\N	toeic	하
16395	stand	v . 서다 . 서 있다 n . ( 공개적 으로 드러내는 ) 태도 [ 의견 ] : 가판대 	\N	\N	\N	toeic	하
16825	upscale	adj . 평균 이상의 : 부자 의	\N	\N	\N	toeic	하
16754	vote	v . 투표 하다 ; ( 누군가 의 제안 에 ) 동의 하다 n . 투표 	\N	\N	\N	toeic	하
4306	foster	촉진하다	\N	\N	\N	toefl	하
5612	cadaverous	시체와 같은; 창백한	\N	\N	\N	gongmuwon	중
8267	jealous	a. *질투하는*	\N	\N	\N	suneung	하
9059	v. 흐릿하게 보이다	 불쑥 나타나다	\N	\N	\N	suneung	기타
9266	transport	v. *수송[운송]하다*	\N	\N	\N	suneung	하
9389	encircle	v. *에워싸다	\N	\N	\N	suneung	중
9409	cuisine	n. (독특한) *요리	\N	\N	\N	suneung	하
9446	aviate	v. *비행하다	\N	\N	\N	suneung	기타
9829	be designed to Root	하도록 고안되어져 있다	\N	\N	\N	gtelp	기타
190	deal with	다루다 치료하다	\N	\N	\N		기타
934	planet	행성	\N	\N	\N		하
16433	clerical	adj . 사무직 의	\N	\N	\N	toeic	하
8139	conference	n. *회담	\N	\N	\N	suneung	하
8550	navigate	v. (배 · 비행기를) *조종하다	\N	\N	\N	suneung	하
9301	n. *전진	 증진*	\N	\N	\N	suneung	기타
9886	social context	사회적 상황	\N	\N	\N	gtelp	기타
9946	cultural events	문화 행사	\N	\N	\N	gtelp	기타
10027	miss	그리워하다	\N	\N	\N	gtelp	하
9655	distributor	분배업자 도매상인	\N	\N	\N	gtelp	하
9671	natural response	자연스러운 반응	\N	\N	\N	gtelp	기타
9738	confused	혼란스러운	\N	\N	\N	gtelp	하
9771	cafeteria	학교식당구내식당	\N	\N	\N	gtelp	하
9837	counseling service	상담서비스	\N	\N	\N	gtelp	기타
9954	block up	막다 방해하다	\N	\N	\N	gtelp	기타
9978	loss	상실 잃음	\N	\N	\N	gtelp	하
9717	predict	예측하다	\N	\N	\N	gtelp	하
9730	that is	즉 다시 말해서	\N	\N	\N	gtelp	기타
9995	television station TV	방송국	\N	\N	\N	gtelp	기타
10271	get bored	지루해하다	\N	\N	\N	gtelp	기타
13373	I'm sorry! (formal)	죄송합니다!	\N	\N	\N	kr-en-basic	\N
13383	Nine (K)	아홉	\N	\N	\N	kr-en-basic	\N
13390	How many?	몇?	\N	\N	\N	kr-en-basic	\N
13394	Three (S)	삼	\N	\N	\N	kr-en-basic	\N
13401	Ten (S)	십	\N	\N	\N	kr-en-basic	\N
13442	Here / This place	여기	\N	\N	\N	kr-en-basic	\N
13447	I understand / OK / Alright	알았어	\N	\N	\N	kr-en-basic	\N
13454	Pizza	피자	\N	\N	\N	kr-en-basic	\N
13462	Big	큰	\N	\N	\N	kr-en-basic	\N
13467	Friend	친구	\N	\N	\N	kr-en-basic	\N
13473	Green Tea	눅차	\N	\N	\N	kr-en-basic	\N
13474	Welcome!	어서오세요!	\N	\N	\N	kr-en-basic	\N
13491	White	하얀	\N	\N	\N	kr-en-basic	\N
13495	Be careful!	조심해!	\N	\N	\N	kr-en-basic	\N
13537	Cold	추워	\N	\N	\N	kr-en-basic	\N
13540	What's this? (Intimate)	뭐야?	\N	\N	\N	kr-en-basic	\N
13561	And / Also	그리고	\N	\N	\N	kr-en-basic	\N
13585	How about ...? / How is it?	어때요?	\N	\N	\N	kr-en-basic	\N
13598	Honey" (married couple nickname)\r\n사랑해!,I love you!\r\n잠깐!,Just a moment! Wait!\r\n미안하다,To be sorry (V)\r\n늦었어!,(You) are late!\r\n안 돼,Can't do / Cannot / It can't be\r\n조금만,Just a little bit\r\n기다리다,To wait (V)\r\n소금,Salt\r\n몾,Can't / Won't\r\n싱거워,Flat tasting\r\n짜,Salty tasting\r\n바지,Trousers\r\n자켓,Jacket\r\n다,All / Everything\r\n책상,Desk\r\n... 위에,On top of ...\r\n... 밑에,Under / beneath ...\r\n뭐 해?,What are you doing?\r\n잘,Well\r\n봐,Too look / see\r\n가다,To go / To leave (V)\r\n약,Medicine\r\n더,More\r\n월화수,Mon/Tue/Wed\r\n월수금,Mon/Wed/Fri\r\n남자,Man / Male / Boy\r\n먼저,First / Before\r\n치마,Skirt\r\n전화,Telephone\r\n전화 하다,To call (on the phone) (V)\r\n주부,Housewife\r\n회사원,Office worker\r\n경찰,Police\r\n간호사,Nurse\r\n뭐 하세요?,What do you do? (For a living)\r\n요리사,Cook / Chef\r\n가수,Singer\r\n의사,Doctor\r\n할아버지,Grandfather\r\n할머니,Grandmother\r\n데이트,Date\r\n이상하다,To be strange (V)\r\n티셔츠,T-Shirt\r\n블라우스,Blouse\r\n입어,To wear / To put on (clothes)\r\n벗어,To take off (clothes)\r\n냄새,To smell\r\n닦았어,To wipe (with a cloth) (past tense)\r\n이,Teeth\r\n세수했어,To wash one's face (past tense)\r\n씻었어,To wash / To wash up (past tense)\r\n이러났어,To wake up (past tense)\r\n갔어,To go (past tense)\r\n잤어,To sleep (past tense)\r\n왔어,To come (past tense)\r\n수업,Class\r\n시간,Time\r\n늦게,Late\r\n아무튼,Anyway / Anyhow\r\n모기,Mosquito\r\n모기약,Insecticide\r\n가려워,To be itchy\r\n뿌리다,To spray (V)\r\n잡다,To catch (V)\r\n누구?,Who?\r\n회사,Company\r\n요금,Price / Fee\r\n카드,Card / Credit Card\r\n들리다,To hear (V)\r\n들다,To listen (V)\r\n계산서,Check / Bill\r\n피곤하다,To be tired (V)\r\n안마하다,To massage (V)\r\n용돈,Allowance / Spending Money\r\n멀랐어,To not know (past tense)\r\n볼써,Already\r\n썼어,To use / To spend (past tense)\r\n다,All / Everything\r\n잠깐!,Just a moment! / Wait!\r\n한테,Towards (a person)\r\n거야 / 거예요,(Future tense suffix)\r\n전화하세요!,Please call (me)!\r\n들어오세요,Please come in!\r\n잠깐만요!,Just a moment!\r\n지 마/세요,(Negative imperative suffix)\r\n번호,Number\r\n우산,Umbrella\r\n같이,Together\r\n불만,Complaint\r\n차,Car\r\n비가 오다,To rain (V)\r\n방,Room\r\n부엌,Kitchen\r\n새,New\r\n전망,View / Landscape\r\n안,Inside\r\n정도,Approximately / About\r\n며칠 ...?,How many days ...?\r\n명,People counter (non-honorific)\r\n간식,Snack\r\n빵,Bread\r\n나머지,The rest (of the whole)\r\n분,People counter (honorific)\r\n도서관,Library\r\n소설,Novel\r\n잡지,Magazine\r\n다음에,Next time\r\n먹었어,To eat (past tense)\r\n갔어,To go (past tense)\r\n왔어,To come (past tense)\r\n읽었어,To read (past tense)\r\n만났어,To meet (past tense)\r\n휴가,Holiday / Day off (from work)\r\n다음 달,Next month\r\n여행하세요,To travel\r\n동안,While\r\n이주일,Two weeks\r\n비행기표,Plane ticket\r\n방학,Holiday (from school)\r\n갈 거예요,To go (future tense)\r\n할 거예요,To do (future tense)\r\n살 거예요,To buy (future tense)\r\n있을 거예요,To be (future tense)\r\n영화,Movie / Film\r\n갈래?,Shall we go?\r\n살래?,Shall we buy?\r\n먹을래?,Shall we eat?\r\n마실래?,Shall we drink?\r\n거,Thing / Object\r\n사진,Picture / Photo\r\n내 거,Mine\r\n니 거,Yours\r\n누구 거?,Whose?\r\n맞아요!,That's correct! (To agree)\r\n아니예요!,That's not true! (To disagree)\r\n연기,Acting\r\n춤,Dancing\r\n운전,Driving\r\n노래,Singing\r\n술,Alcohol\r\n... 잘 해요,I can do ... (Good at)\r\n... 못 해요,I can't do ... (Not good at)\r\n호주,Australia\r\n고기,Meat\r\n어디어디?,Which places?\r\n누구누구?,Which people?\r\n일찍,Early\r\n아직,Not yet / Still\r\n밖,Outside\r\n나갈 거예요,To go out (future tense)\r\n올 거예요,To come (future tense)\r\n문,Door\r\n핸드폰,Mobile Phone\r\n나와!,Come out!\r\n잠궜어,To lock (past tense)\r\n껐어,To turn off (past tense)\r\n챙겼어,To take / not forget (past tense)\r\n지갑,Wallet / Purse\r\n약속,Appointment\r\n과속,Speeding\r\n면허증,Driver's License\r\n그래서 (?),So (So?)\r\n과자,Snacks\r\n병원,Hospital\r\n음료수,Beverage / Drink\r\n과일,Fruit\r\n만화책,Comic Book\r\n코드,Cord / Cable\r\n갑자기,Suddenly\r\n다시,Again / Once Again\r\n고장났어,To break / be broken (past tense)\r\n근데,But\r\n꺼졌어,To be off / shut down (past tense)\r\n되고 싶어요,Want to become\r\n자고 싶어요,Want to sleep\r\n가고 싶어요,Want to go\r\n볼까요?,Shall we watch?\r\n재미있을까요?,Will it be fun?\r\n공상 과학,Science Fiction\r\n있습니다,To have / exist (very formal)\r\n손님,Customer / Guest\r\n겨울,Winter\r\n없습니다,To not have / not exist (very formal)\r\n북한,North Korea\r\n도,Province\r\n산,Mountain\r\n어디 에 있어요?,Where is it?\r\n퇴근해요,To leave work (present tense)\r\n출근해요,To go to work (present tense)\r\n사장님,President / CEO\r\n남자,Male / Man / Boy\r\n저 ...,That ... (Visible object)\r\n이 ...,This ...\r\n그 ...,That ... (Non-visible object)\r\n... 누구예요?,Who is ...?\r\n누구세요?,Who are you?\r\n이거 뭐예요?,What is this? (Formal)\r\n이거 뭐야?,What is this? (Informal)\r\n감자 튀김,French fries\r\n... 어떻게 해요?,How do you do ... ?\r\n이렇게!,Like this!\r\n... 어떻게 먹어요?,How do you eat ... ?\r\n... 어떻게 가요?,How do you go to ... ?\r\n치즈,Cheese\r\n요구르트,Yoghurt\r\n뭐 마실래?,What would you like to drink?\r\n줄래요,Would like to give\r\n잘래요,Would like to sleep\r\n볼래요,Would like to watch\r\n갈래요,Would like to go\r\n할래요,Would like to do\r\n먹을래요,Would like to eat\r\n외국 사람,Foreigner\r\n한국말,Korean Language\r\n... 잘 못해요,Not very good at doing ...\r\n... 못해요,Can't do ...\r\n... 잘 해요,Very good at ...\r\n죄송 합니다,I'm sorry (formal)\r\n공부 잘 못해요,Not very good at studying\r\n운전 못해요,I can't drive\r\n... 가 봐요!,Try going ...!\r\n... 먹어 봐요!,Try eating ...!\r\n... 해 봐요!,Try doing ...!\r\n... 얼마예요?,How much is ...?\r\n버스,Bus\r\n기차,Train\r\n지하철,Subway\r\n가야 되요,Have to go\r\n해야 되요,Have to do\r\n공부해야 되요,Have to study\r\n와야 되요,Have to come\r\n괜찮아서 ...,Because it's ok ...\r\n늦어서 ...,I'm late, so ...\r\n비가 와서 ...,It's raining, so ...\r\n돈 없어서 ...,I have no money, so ...\r\n안녕히 주무세요,Good night (formal)\r\n잘 자,Good night (informal)\r\n저 갈게요,Goodbye! (I am going)\r\n오랜만이에요!,It's been a long time!\r\n잘 지내셨어요?,Have you been good?\r\n반가워요!,Nice to see you!\r\n쉬워요,Easy\r\n어려워요,Hard / Difficult\r\n수업,Class (academic)\r\n교수님,Professor (not teacher)\r\n우리,We / Us / Our\r\n내 거,Mine (informal)\r\n제 거,Mine (formal)\r\n니 거,Yours\r\n내 거야,Is Mine (informal)\r\n니 거예요,Is Yours (formal)\r\n누구 거?,Whose?\r\n기다리지 마세요!,Don't wait!\r\n전화하지 마세요!,Don't call!\r\n가지 마세요!,Don't go!\r\n오지 마세요!,Don't come!\r\n자전거,Bicycle\r\n운전하다,To drive (V)\r\n해봐!,Do it! / Try! / Show me!\r\n다쳤어요,To get hurt/injured (past tense)\r\n할 수 있어요!,I can do it!\r\n할 수 없어요!,I can't do it!\r\n나 자전거 탈 수 있어요,I can ride a bicycle\r\n갈 수 없어요!,I can't go!\r\n존댄말,Formal Language\r\n당신,You (Formal)\r\n그,He\r\n그녀,She\r\n그들,They\r\n당신들,You Plural (Formal)\r\n은 / 는,Topic Marking Particles\r\n가 / 이,Subject Marking Particles\r\n을 / 를,Object Marking Particles\r\n식구,Family Member\r\n동생,Younger Sibling\r\n티비,TV\r\n반찬,Side Dish\r\n... 들,Plural suffix\r\n자리,Seat / Table / Position\r\n이것들,These\r\n저것들,Those\r\n옷,Clothes\r\n신발,Shoes\r\n의,Possessive Marking Adjective\r\n운동,Exercise / Sports\r\n농구,Basketball\r\n야구,Baseball\r\n수영,Swimming\r\n수영장,Swimming Pool\r\n좋아! 좋아!,Sounds good! (Total Agreement)\r\n와 / 과,And\r\n오전,A.M. (Time)\r\n오후,P.M. (Time)\r\n정도,About / Around / O'clock\r\n걸렸어,To take time (past tense)\r\n로 / 으로,Method Suffix\r\n총,Total\r\n당,Per (person, item)\r\n요즘,Nowadays\r\n부인,Wife (normal)\r\n집사람,Wife (informal)\r\n사업,Business\r\n근데 ...,By the way ... (Change of subject)\r\n잘 가!,Goodbye (very casual)\r\n... 에서 부터,From ...\r\n... 까지,To ...\r\n... 몇 개 있어요?,How many ... are there?\r\n일 인분,One serving (counter)\r\n병,Bottle (counter)\r\n이제,Now\r\n지금은 두시 사십분 입니다,Now it is 2:40\r\n올해,This year\r\n추석,Korean Thanksgiving Day\r\n함께,Together\r\n가족,Family\r\n무엇임니까?,What is it? (Formal)\r\n무엇?,What? (Version 2)\r\n아침,Morning / Breakfast\r\n점심,Lunch\r\n저녁,Evening / Dinner\r\n밤,Night\r\n숙제,Homework\r\n같이 집에 가자!,Let's go home!\r\n저는 아침에 일곱시에 일어나요,I wake up at 7 in the morning\r\n어디에서 만날까?,Where shall we meet?\r\n명동에서 만나자!,Let's meet at Myeondong!\r\n순대,Korean Blood Sausage\r\n떡볶이,Korean Rice Cakes\r\n냉면,Korean Cold Noodles\r\n매워서,Spicy\r\n난 떡볶이가 좋아요!,I like Korean Rice Cakes!\r\n저는 커피 안 좋아해!,I don't like coffee!\r\n나는 공부를 싫어해요!,I hate studying!\r\n조금 더 주세요!,Please give me a bit more!\r\n조금 더 깎아 주세요!,Please give me a bit more of a discount!\r\n너무 비싸요!,Too expensive!\r\n조금만 / 좀,A little / A bit\r\n오전 열시에,At 10 A.M.\r\n토요일에,On Saturday\r\n저는 미국에 가요!,I'm going to America!\r\n불고기 일 인분에 얼마예요?,How much is it for one serving of Bulgogi?\r\n팀은 뚱뚱해,Tim is fat\r\n저는 날씬해,I am slim\r\n주환은 귀여워,J is cute\r\n목,Throat/Neck\r\n커피를 마시자!,Let's drink Coffee!\r\n머리가 아파요,My head hurts\r\n목이 아파요,I have a sore throat\r\n그는 커피도 좋아해요,He also likes coffee\r\n발,Arm\r\n다리,Leg\r\n걱정마!,Don't worry!\r\n배는 어때?,How is your stomach?\r\n배는 좀 괜찮아요?,Is your stomach alright?\r\n특히,Especially / Particularly\r\n감기,Cold (sickness)\r\n주사,Shot (medical)\r\n난 특히 한국이 좋아!,I especially like Korea!\r\n저는 특히 일본에 가고 싶어요!,I particularly want to go to Japan!\r\n저 감기에 걸렸어요,I got a cold\r\n어디가 아파요?,Where does it hurt?\r\n약사,Pharmacist\r\n약국,Pharmacy\r\n문,Door\r\n잠시만요!,Just a moment please!\r\n너 때문에 난 감기가 걸려서,I caught a cold because of you\r\n감기 때문에 저는 약국에 왔어,I came to the Pharmacy because I have a cold\r\n이제,Now / From now on\r\nㅂ니다,Present Tense Verb Suffix (vowel-ending stem)\r\n습니다,Present Tense Verb Suffix (consonant-ending stem)\r\nㅂ니까?,Present Tense Question Verb Suffix (vowel-ending stem)\r\n습니까?,Present Tense Question Verb Suffix (consonant-ending stem)\r\n어느,Which\r\n나라,Country\r\n가수,Singer\r\n배우,Actor\r\n변호사,Lawyer\r\n너는 일본사람이 아님니다,You are not Japanese (formal)\r\n너는 여자친구가 있습니까?,Do you have a girlfriend? (formal)\r\n저는 중국친구가 없습니다,I don't have Chinese friends (formal)\r\n공,Zero (Type A)\r\n영,Zero (Type B)\r\n전화번호,Telephone Number\r\n극장,Theatre / Movie Theatre\r\n약속,Appointment / Promise / Plan\r\n명,Counter (People)\r\n장,Counter (Flat items)\r\n잔,Counter (Cups, Mugs, Glasses)\r\n대,Counter (Devices, Vehicles)\r\n두시 반에,At two thirty\r\n역할,Role\r\n건물,Building\r\n먹다,To eat (V)\r\n가다,To go (V)\r\n오다,To come (V)\r\n있다,To be (V)\r\n화장실,Bathroom / Toilet\r\n알다,To know (V)\r\n몰르다,To not know (V)\r\n저는 잘 몰라요!,I don't know well!\r\n계획,Plans / Arrangement / Schedule\r\n보다,To watch / To see / To look at (V)\r\n마시다,To drink (V)\r\n만나다,To meet (V)\r\n시작하다,To start (V)\r\n일하다,To work (V)\r\n사랑하다,To love (V)\r\n텔레비,TV\r\n커요,Big\r\n작아요,Small\r\n나빠요,Bad\r\n그림,Painting\r\n얘기하다,To talk / have a conversation (V)\r\n결혼하다,To get married (V)\r\n사실,Actually / In fact\r\n배우다,To learn (V)\r\n써요,To use / to write (Present Tense)\r\n나와요,To come out (Present Tense)\r\n추워요,To be cold (Present Tense)\r\n더워요,To be hot (Present Tense)\r\n야 / 이야,To be (Intimate Politeness)\r\n아나야,To not be (Intimate Politeness)\r\n기억해요,To remember (Present Tense)\r\n식당,Restaurant\r\n요리,Cooking / Dish / Food\r\n혹시,Maybe / Perhaps\r\n동네,Neighbourhood / Town\r\n가세요,To go (Honorific)\r\n보세요,To look (Honorific)\r\n오셔요,To come (Honorific)\r\n마셔요,To drink (Honorific)\r\n앉아요,To sit (Present Tense)\r\n있으세요,To have (Honorific)\r\n을 수 있어요,Ability to do something (Suffix)\r\n을 수 없어요,Inability to do something (Suffix)\r\n필요해요,To need (Present Tense)\r\n공,Ball\r\n치즈,Cheese\r\n오렌지,Orange\r\n딸,Daughter\r\n딸기,Strawberry\r\n혼자,Alone\r\n딸리기,Race / Run\r\n공원,Park\r\n운동화,Sneakers\r\n기,Verb Nominalisation Suffix 1\r\n는 것,Verb Nominalisation Suffix 2\r\n기다려요,To wait (Present Tense)\r\n힘들어요,To be tired / to be difficult (Present Tense)\r\n재미있어요,To be fun (Present Tense)\r\n지 않아요,Negative Suffix (Present Tense)\r\n골프,Golf\r\n독서요,To read (books) (Present Tense)\r\n낮잠,Nap\r\n어떤,What kind of?\r\n주말,Weekend\r\n나,Or\r\n얼굴,Face\r\n뭔가,Something\r\n하루 종일,All day long\r\n누군가,Someone\r\n어딘가,Somewhere\r\n언젠가,Sometime\r\n거울,Mirror\r\n손,Hand\r\n살아요,To live (Present Tense)\r\n영화관,Cinema / Movie Theatre\r\n샤워해요,To shower (Present Tense)\r\n저는 자기 전에 못 먹어요,I can't eat before sleeping\r\n청소해요,To clean (Present Tense)\r\n빨래해요,To do laundry (Present Tense)\r\n피곤해요,To be tired (Present Tense)\r\n만들어요,To make (Present Tense)\r\n힘들어요,To be difficult (Present Tense)\r\n월요일 저는 학교에 갔고 공부했고 밥 먹었어요,On Monday, I went to school, studied and ate\r\n심심해요,To be bored (Present Tense)\r\n으면서,While suffix\r\n골프,Golf\r\n축구,Soccer / Football\r\n불꽃놀이,Fireworks\r\n티비를 볼까요?,Shall we watch TV?\r\n김치지깨를 먹을까요?,Shall we eat Kimchi Stew?\r\n을까요,"Shall we" Suffix\r\n빨리 일어나서, 학교 가요,Get up fast so we go to school\r\n꼭,Surely, certainly, absolutely\r\n너무 비사기 때문에 살 수 없어요!,I can't buy it because it is too expensive!\r\n졸업식,Graduation Ceremony\r\n결혼식,Wedding Ceremony\r\n몸,Body\r\n어제는 피곤해서 일찍 자서,Yesterday I went to bed early because I was tired\r\n하지 마!,Don't do it!\r\n오늘은 몸이 안 좋아서 하교 못 가요,I can't go to school today since I'm not feeling too well\r\n늦게 와서 죄송합니다,I'm sorry for coming late\r\n늦어서 미안해요,I'm sorry for being late\r\n이제,From now on\r\n아무도,Nobody, anyone\r\n끝나요,To end, to be over (Present Tense)\r\n사진 찍자!,Let's take a picture!\r\n가족,Family\r\n... 기 때문에,Because of ... (Suffix 1) (for past events - formal)\r\n... 서,Because of ... (Suffix 2) (for past events - informal)\r\n... 으니까,Because of ... (Suffix 3) (for future events or command)\r\n괴롭혀요,To bother, to annoy (Present Tense)\r\n게임,Game\r\n나중,Later\r\n오빠,Older brother (for females)\r\n거는 받으려고 해요,I am going to receive it / I intend to receive it\r\n자려고,I am going to sleep (Intimate)\r\n한국어를 공부하려고 해요,I am going to study Korean\r\n오빠 거는 컴퓨터를 할게,(Older brother) I'm going to use the computer, ok?\r\n나 먼저 갈게! 안녕!,I'm leaving first! Bye!\r\n너희들,You (Plural)\r\n싸워요,To fight (Present Tense)\r\n자꾸,Often, continuously\r\n카를로스네 (집),Carlos' (home)\r\n동생,Younger sibling\r\n자꾸 전화하지 마!,Don't keep calling me! (Intimate)\r\n나도 내일 영화를 볼 거야!,I will watch a movie tomorrow too! (Intimate)\r\n둘이 뭐 하고 있어요?,What are you two doing? (Standard)\r\n나는 지금 서울에 가고 있습니다,I am going now to Seoul (Formal)\r\n나가 줄까요?,Do you want me to go out? (Standard)\r\n무리해요,To be overworked (Present Tense)\r\n이상해요,To be strange (Present Tense)\r\n까먹어요,To forget (Present Tense)\r\n혹시,Maybe, perhaps\r\n헤어져요,To break up (Present Tense)\r\n나 밥 사 줘!,Buy me food!\r\n내일 전화해 주세요!,Please give me a call tomorrow!\r\n도와줘요,To help (Present Tense)\r\n남겨요,To leave (a comment, food) (Present Tense)\r\n들어가요,To enter, to go into (Present Tense)\r\n등,Back (of the body)\r\n어깨,Shoulder\r\n팔,Arm\r\n다리,Leg\r\n곧,Soon, shortly\r\n잔소리 하지 마!,Stop nagging (me)!\r\n귀찮게하지 마세요!,Stop bothering (me)!\r\n걱정하지 마세요!,Don't worry!\r\n열심히,Hard\r\n계속,Continuously\r\n당분간 ...,For the time being ...\r\n일찍,Early\r\n저는 공부해요,I study (in general)\r\n저는 공부하고 있어요,I am studying (right now)\r\n기계,Machine\r\n어제 먹은 피자 너무 맛있었어요,The pizza I ate yesterday was delicious (Adnominal Suffix Past Tense)\r\n날마다 먹는 음식이 지겨워요,I'm tired of the food I eat everyday (Adnominal Suffix Present Tense)\r\n이건 내일 아침에 먹을 빵이에요,This is the bread I will eat tomorrow (Adnominal Suffix Future Tense)\r\n식구,Family member\r\n형제,Brothers\r\n언니,Older sister\r\n여동생,Younger sister\r\n자매,Sisters\r\n저희,We (humbling)\r\n우리 아빠 몇 살이에요?,How old is our father?\r\n내 방이 집에서 제일 커,My room is the biggest in the house\r\n너는 친구 몇 명 있어요?,How many friends do you have?\r\n저는 친구 두 명 있어요,I have 2 friends\r\n가적이 몇 명 이세요?,How many people are in your family?\r\n개,Dog\r\n소,Cow\r\n고양이,Cat\r\n버전,Version\r\n출시,Release (SW)\r\n단말,Device / Terminal\r\n자동차,Car\r\n기념일,Anniversary\r\n준비해요,To prepare (Present Tense)\r\n겨우,With difficulty\r\n코멘트 세 줄 써 주세요,Please write a comment in three lines\r\n주문해요,To order (Present Tense)\r\n저는 컴퓨터 열 대 주문하고 싶어,I want to order ten computers\r\n나무,Wood / Tree\r\n정원,Garden\r\n벽,Wall\r\n이번 달,This month\r\n지난 달,Last month\r\n다음 달,Next month\r\n일주일,One week\r\n이주,Two weeks\r\n삼주,Three weeks\r\n멀어요,To be far (Present Tense)\r\n대회,Competition\r\n중요해요,To be important (Present Tense)\r\n뛰어요,To run (Present Tense)\r\n몇 번 ...?,How many times ...?\r\n참가해요,To participate (Present Tense)\r\n다음 주부터 오지 마세요!,From next week, don't come!\r\n더러워요,To be dirty (Present Tense)\r\n알고 싶어요!,(I) want to know!\r\n지금 나가야 해요!,(I) have to go now!\r\n조용히,Quietly\r\n하교에 갈 데 같이 가자!,When you go to school, let's go together!\r\n공부할 데 음악을 들어요,When I study, I listen to music\r\n챙겨요,To take / To not forget (Present Tense)\r\n열쇠,Key\r\n연락해요,To contact / To keep in touch (Present Tense)\r\n자주,Often / Frequently\r\n돌아와요,To come back (Present Tense)\r\n군대,Army / Military\r\n유학해요,To study abroad (Present Tense)\r\n신용카드,Credit Card\r\n힘내!,Cheer up!\r\n여행,Trip\r\n설마,Impossible / By any chance\r\n하루,One day (K)\r\n이틀,Two days (K)\r\n일일,One day (S)\r\n이일,Two days (S)\r\n삼일,Three days (S)\r\n한해,One year (K)\r\n두해,Two years (K)\r\n일년,One year (S)\r\n이년,Two years (S)\r\n한달,One month (K)\r\n두달,Two months (K)\r\n일개월,One month (S)\r\n이개월,Two months (S)\r\n주머니,Pocket\r\n삼일만에 십에 돌아왔어요!,(I) came back home three days after\r\n한달만에 학교에 갔어요!,(I) went to school a month after\r\n오냔만에 다시 영어 공부를 시작했어요!,(I) started studying English again after 5 years\r\n이 집 떡볶이가 진짜 맛있어요!,The dokbokki here is really delicious!\r\n유리창에 달팽이가 있어요,There is a snail on the window\r\n... 라도,At least ... (Noun Suffix)\r\n영화라도 볼까?,Shall (we) at least watch (some) movies?\r\n너는 함버거까지 사왔어?,Did you even buy (and brought) hamburgers?\r\n서울까지 꼭 갈거에요?,Are (you) even going (all the way) to Seoul?\r\n감기,Cold (disease)\r\n감기 때문에 모리가 아파요,I have a headache because I have a cold\r\n어제는 피곤해서 일직 잤어요,(I) went to bed early yesterday because I was tired\r\n온종일 설사를 했어요,I had diarrhea the whole day\r\n어디 아파요?,Are you feeling sick?\r\n저는 내일 아침에 올지도 몰라요,I might come tomorrow morning\r\n감기 일지도 몰라요,It might be a cold\r\n올굴색이 안 좋아!,(You) don't look so well!\r\n내일 민경이 만날지도 몰라요!,I might meet Mingyeong tomorrow!\r\n글세,Well / Let me think ...\r\n방금,Just now / A few minutes ago\r\n찾아요,To look for (Present Tense)\r\n오기 전에 전화해요!,Call (me) before (you) come!\r\n영화 보기 전에 팝콘 사자!,Let's buy popcorn before watching the movie!\r\n친구 만나기 전에 선물 살 거야!,(I) will buy a present before meeting (my) friend!\r\n미국 가기 전에 연락해!,Contact (me) before going to the US!\r\n시험 본 다임에 술 마셨어,After taking the test, (we) drank alcohol\r\n술 마신 다음에 노래방 가자!,After drinking alcohol, let's go to Karaoke!\r\n오른쪽,Right side\r\n왼쪽,Left side\r\n건물,Building\r\n아파트,Apartment\r\n설명해요,To explain (Present Tense)\r\n배달,Delivery (service)\r\n거기,There\r\n찾아,To search / look for (Present Tense)\r\n식당,Restaurant\r\n버튼,Button\r\n한국어 정말 쉬워요!,Korean is really easy!\r\n읽기 쉬워요,(It is) easy to read\r\n찾기 힘들어요,(It is) difficult to find\r\n수업 이해하기 어려워요,The class is hard to understand\r\n이해해요,To understand (Present Tense)\r\n날씨,Weather\r\n건강해요,To be healthy (Present Tense)\r\n지내요,To spend time / To get along (Present Tense)\r\n생겨요,To get / to acquire / to come into existence (Present Tense)\r\n달리기 시작했어요,(I) started running\r\n어제부터 추워지기 시작했어요,It started to get cold since yesterday\r\n저는 오늘 일하기 시작했어요,I started working today\r\n내일부터 바빠지기 시작할 거예요,(I) will start getting busy from tomorrow\r\n방해해요,To bother / To disturb (Present Tense)\r\n귀찮게 해요,To annoy someone (Present Tense)\r\n시험,Test / Exam\r\n말 시켜요,To talk to / To speak to (Present Tense)\r\n거짓말,Lie\r\n거짓말해요,To lie (Present Tense)\r\n벌써,Already\r\n킅나요,To be over (Present Tense)\r\n영화는 벌써 킅났어요!,The movie is already over!\r\n방해하지 마세요!,Stop bothering (me)!\r\n질투해요,To be jealous (Present Tense)\r\n잘못,Error / Mistake\r\n잘못해요,To make a mistake (Present Tense)\r\n이 책은 읽으면 읽을 수록 재미있어요!,The more (I) read this book, the more interesting it is\r\n술은 마시면 마실 수록 마시고 싶어요,The more (I) drink alcohol, the more I want to drink\r\n무리해요,To overwork (Present Tense)\r\n들어가요,To enter (Present Tense)\r\n들어와요,To come in (Present Tense)\r\n요즘,These days / Nowadays\r\n얼음,Ice\r\n자꾸 거짓말을 하니까 친구 없어요!,(You) don't have friends because you constantly tell lies\r\n밥 먹기 전에 손 씻어!,Wash your hands before eating!\r\n영화를 보고, 옷을 사고, 김치를 먹을 거예요,(I) am going to watch a movie, buy clothes and eat kimchi\r\n먹으면서 영화 봐요,(I) eat while watching a movie\r\n회식,Company dinner\r\n회식해요,To go on a company dinner (Present Tense)\r\n신나요,To be exciting (Present Tense)\r\n가격,Price\r\n종류,Type / Kind / Sort\r\n중에서,Amongst / Between / Out of\r\n나는 수학이 제일 싫어해요!,I hate Mathematics the most!\r\n이 호수는 세계에서 가장 거요!,This lake is the biggest in the world!\r\n이 학생들 중에서 주환 제일 예뻐요,Johnny is the most beautiful of the students\r\n나는 머리가 좋아해요,I am smart\r\n너는 선생님만큼 예뻐어,You are as pretty as Seonsaengnim\r\n이것은 그것만큼 좋아지 않아요,This one is not as good as that one\r\n나랑 비교해요,To compare with me (Present Tense)\r\n저를 제 친구하고 비교하지 마세요!,Don't compare me to my friends!\r\n저는 못 했어요,I couldn't do it\r\n나도 몰라!,I don't know either!\r\n어제 잡채라는 한국 음식을 먹었어요,(I) ate a Korean dish called Japchae yesterday\r\n월요일에 민수라는 사람이 전화했어,Someone called Minsu called on Monday\r\n결석,Absence\r\n일주일에 몇 번 술 마셔요?,How many times a week do (you) drink alcohol?\r\n내일 비가 안 오면 갈 거야,If it doesn't rain tomorrow, (we) will go\r\n빨리 오지 않으면 혼자 갈거야!,If (you) don't come quickly, (I) will go by myself\r\n만약 전화 안 해면 먼저 밥 먹거!,If (I) don't call you, (you) eat first!\r\n회식,Company dinner\r\n신나다,Exciting\r\n저는 맥주 6병까지 마실 수 있어요,I can drink up to 6 bottles of beer\r\n내일 병원에 갈 수도 있어요,(I) might go to the hospital tomorrow\r\n저는 내일 시간이 없을 수도 있어요,I might not have time tomorrow\r\n억,100 million\r\n복권,Lottery\r\n소주를 마시든지 물을 마시든지 해!,Drink either soju or water!\r\n일을 하든지 공부를 하든지, 열심히 해!,Weather (you) work or study, so your best!\r\n결혼을 하거나 말거나, 나는 다 궨찮아요!,Whether you get married or not, I'm all ok with it!\r\n중요해요,To be important (Present Tense)\r\n잡아요,To catch (Present Tense)\r\n잡혀요,To be caught (Present Tense)\r\n경험은 정말 중요해요,Experience is really important\r\n미안해! 목소리가 안 들려!,I'm sorry! (I) can't hear (you)!\r\n보여요?,Can (you) see it? (Is it seen?)\r\n도둑이 잡혔어요,The thief got caught\r\n어려 보여요?,Do (I) look young?\r\n어려요,To be young (Present Tense)\r\n화장,Make up / Cosmetics\r\n써요,To put on (Present Tense)\r\n이것 너무 비싸 보여요!,This looks very expensive!\r\n너는 학생 같아 보여요,You look like a student\r\n살 쪄요,To gain weight (Present Tense)\r\n생각해요,To think (Present Tense)\r\n맞아요!,That's correct!\r\n간식,Snack\r\n요새 / 요즘,These days\r\n당분간,For the time being / For now\r\n오는 것 같아요!,(I) think it's coming! (Present Tense opinion)\r\n예쁜 것 같아요!,(I) think it's pretty! (Present Tense opinion)\r\n도착한 것 같아요!,(I) think (we) have arrived! (Past Tense opinion)\r\n살 것 같아요!,(I) think (I) will buy it! (Future Tense opinion)\r\n요기 없는 것 같아요!,(I) think it is not here! (Present Tense opinion)\r\n당분간,For the time being / For now\r\n오는 것 같아요!,(I) think it's coming! (Present Tense opinion)\r\n예쁜 것 같아요!,(I) think it's pretty! (Present Tense opinion)\r\n도착한 것 같아요!,(I) think (we) have arrived! (Past Tense opinion)\r\n살 것 같아요!,(I) think (I) will buy it! (Future Tense opinion)\r\n요기 없는 것 같아요!,(I) think it is not here! (Present Tense opinion)\r\n저저럼 할 수 있어요?,Can (you) do it like me?\r\n아빠저럼 말하지 마!,Don't talk like my father!\r\n어려요,To be young (Present Tense)\r\n유치원,Kindergarten\r\n비가 오지만 우산은 필요 없어요,Even though it's raining, (we) don't need an umbrella\r\n알지만 말 안 할 거예요,(I) won't tell you, even though I know\r\n가져 와요!,Bring it over!\r\n왜 이렇게 많이 필요해요?,Why do (you) need so many?\r\n주환가 그렇게 멋있어요?,Is Johnny that cool?\r\n이것 진짜 멋있다!,This is really cool!\r\n많이 배웠어요!,(I) learned a lot!\r\n왜 이렇게 늦었어요?,Why are (you) so late?\r\n회사 그만두고 싶어,(I) want to quit my job\r\n내 나이에,At my age\r\n니 나이에,At your age\r\n회사는 어디 있어요?,Where is the company located?\r\n이 문제 너무 어려워요!,This problem is too difficult!\r\n도서관을 찾고 있어요,(I) am looking for the library\r\n혼자는 못 해요,(I) can't do it alone\r\n요즘 날씨 어때요?,How is the weather these days?\r\n요즘 경제가 어려워요,The economy is bad nowadays\r\n늦으면 안 돼요!,(You) shouldn't be late!\r\n오래,For a long time\r\n잊어버려요,To forget (Present Tense)\r\n밖에 있는 동안 전화가 왔어요,I received a phone call while I was outside\r\n밥 먹는 동안 책 보지 마세요,Don't read books while you are eating\r\n불,Fire / Light\r\n대답해요,To answer / To reply (Present Tense)\r\n질문,Question\r\n들어가요,To enter (Present Tense)\r\n피해요,To avoid / To move out of the way (Present Tense)\r\n대답해 주새요!,Please answer me!\r\n이러지 마새요!,Don't do this to me!\r\n차가 와요; 피하새요!,A car is coming; please move out of the way!\r\n지금은 전화를 받지도 하지도 못 해요,Right now (I) can't either make nor receive phone calls\r\n좋지도 나쁘지도 안아요,It's neither good nor bad\r\n만저요,To touch (Present Tense)\r\n처음,The first time\r\n그러지 마새요!,Don't do that!\r\n그거 거짓말이야!,That's a lie!\r\n택시에 탄 다음에 전화 주새요!,Call me after you ride the taxi!\r\n경찰서에 가야 해요!,(I) have to go to the police station!\r\n이 영화를 본 적이 없어요!,(I) have never seen this movie!\r\n수업에 늦은 적이 없어요!,(I) have never been late for class!\r\n너를 만난 적이 있어요,(I) have met you before\r\n누나,Older sister / older GF\r\n어울려요,To look good on someone / To go well with / To suit (Present Tense)\r\n기분 좋아해요,To be happy / To feel good\r\n나는 너랑 사귀고 싶어,I want to date you / go out with you\r\n나 꼭 나이들어 보여요?,Do I certainly look old?\r\n부모님,Parents\r\n무슨 므라마 봐?,What kind of drama are (you) watching?\r\n날씨가 좋아서 내 기분도 너무 좋아!,I'm feeling very happy because of the good weather!\r\n어제는 피곤해서 일찍 잤어요,I went to bed early yesterday because I was tired\r\n어려워 보여요,(It) looks difficult\r\n너무 비싸 보여요,(It) looks very expensive\r\n같이 사진 찍일래?,Do (you) want to take a picture together?\r\n사진 찍자!,Let's take a photo!\r\n맥주보다 소주가 싸요,Soju is cheaper than beer\r\n만원 짜리 시계,A 10,000 won watch\r\n한 시간 짜리 수업,A one-hour class\r\n십일 짜리 여행 코스,A ten-day travel course\r\n먹일거,Something to eat\r\n바삭바삭하다,To be crispy (verb)\r\n나 먹을거 사줘!,Buy me something to eat!\r\n오분만 주새요!,Please give me only 5 minutes!\r\n나는 함버거 한 개만 먹을게,I will eat only one hamburger\r\n목도리,Scarf\r\n장갑,Gloves\r\n작다,To be small (V)\r\n물감,Paint\r\n먼저 나가새요!,Please go outside first!\r\n이것 밖에 없어요?,Is this all there is?\r\n오늘은 저 밖에 안 왔어요,I'm the only one who came today\r\n저는 지금 1000원 밖에 없어요,I only have 1,000 won right now\r\n이렇게 밖에 못 해요?,Is this your best?\r\n먼저 냄비에 좀 간장을 넣어요!,First add some soybean sauce/paste in a pot\r\n그럼 고기랑 마닐하고 참기름을 볶아요!,Then stir-fry meat, garlic and sesame oil\r\n치킨하고 맥주 주세요,Please give me chicken and beer\r\n생일날 뭐 했어?,What did (you) do on (your) birthday?\r\n설탕 좀 주세요,Please give me some sugar\r\n참기름을 넣고 볶아 주세요,Please add some sesame oil and stir-fry it\r\n물건,Object / Thing\r\n상자,Box\r\n가지러 오다,To come to pick up (V)\r\n보내다,To send (V)\r\n받다,To receive (V)\r\n택배,Home delivery service\r\n라면 먹으러 가자!,Let's go to eat ramen!\r\n뭐 하러 가요?,What are you going there for?\r\n영화 보러 갈래?,Do (you) want to go and watch a movie?\r\n오늘 우리 집에 자러 오세요,Please come to spend the night (sleep) at mine\r\n짧다,To be short (V)\r\n길다,To be long (V)\r\n자르다,To cut (V)\r\n후회,Regret\r\n눈물,Tear (from crying)\r\n머리를 짧게 잘라주세요,Please, cut (my) hair short\r\n이상할 정도로 싸요,It's so cheap it's strange\r\n지금 함버거가 싫을 정도로 많이 먹었어요,I ate so many hamburgers I hate them now\r\n기다리지 말고, 먼저 가세요!,Don't wait (for me), please go first!\r\n이거 분명히 실수 일 거예요!,This must be a mistake!\r\n분명히 한국에 10년 살았을 거예요,(He) must have lived in Korea for 10 years\r\n약하다,To be weak (V)\r\n자주,Frequently / Often\r\n공휴일,Public holiday\r\n보고 싶다,To miss (someone) (V)\r\n오늘이다,To be today (V)\r\n오늘 몇 시까지 일해요?,Until what time do (you) work today?\r\n우리 반은 너무 시끄러워요!,My class is too noisy!\r\n이 답이 맞아!,This answer is correct!\r\n우리 엄마 아빠가 너무 보고 싶어요,I miss my parents very much\r\n오늘 일요일이잖아요,You know today is Sunday\r\n일요일이잖아요?,Can't you see it's Sunday?\r\n제가 어제 말했잖아요,You know I told you yesterday\r\n저 지금 운전하고 있잖아요?,Can't (you) see I'm driving now?\r\n감기약,Cold medicine\r\n저는 하루에 책을 두권 읽어요,I read two books a day\r\n미국에거 가고 싶지 않아요,I don't want to go to the US\r\n한 번에 한 명씩,One person at a time\r\n일 년에 두 번씩,Twice a year\r\n조금씩 마셔요,Drink little by little\r\n하루에 몇 시간씩 자요?,How many hours a day do (you) sleep?\r\n열 받다,To get upset (V)\r\n잃어버리다,To lose (V)\r\n최악,The worst\r\n빌려주다,To lend (V)\r\n네 역할은 뭐예요?,What is your role?\r\n저도 잘 몰라요,I don't know much (about it) either\r\n지우다,To erase (V)\r\n네 번호를 지워 버렸어요,(I) erased your number by accident\r\n이것 비밀이에요, 근데 말해 버렸어요,This is a secret, but I told it by mistake\r\n미현이가 알아 버렸어요,Mihyeon found out (she wasn't supposed to)\r\n쏘다,To treat (someone to a meal) (V)\r\n춤,Dance\r\n저녁,Dinner\r\n기다리지 말고, 먼저 가세요!,Don't wait (for me), please go first!\r\n이거 분명히 실수 일 거예요!,This must be a mistake!\r\n분명히 한국에 10년 살았을 거예요,(He) must have lived in Korea for 10 years\r\n우리는 내일 만나기로 했아요,We have arranged/planned to meet tomorrow\r\n친구랑 먹기로 했어요,(I) have plans to eat with a friend\r\n영화 보러 가기로 했어요,(I) have arranged/planned to go to watch a movie\r\n그렇게 하기로 했어요,(I) decided/planned to do that\r\n박물관,Museum\r\n조용하다,To be quiet (V)\r\n떠들다,To be noisy (V)\r\n표,Ticket\r\n데,Place\r\n좋은 데 알아요!,(I) know a good place!\r\n여기 있지 말고, 빨리 가세요!,Don't stay here, and please go quickly!\r\n공부하지 말고, 영화를 보자!,Let's not study, and watch a movie instead!\r\n출장가다,To go on a business trip (V)\r\n후회하다,To regret (V)\r\n도와줘서 고마워요,Thanks for helping (me)\r\n제가 가게 됬어요,It happens that I'm going\r\n그렇게 됬어요,It just happened\r\n만나게 될 거예요,(We) will meet each other\r\n기분,Feeling/Mood\r\n막히다,To be blocked/clogged (V)\r\n바꾸다,To change (V)\r\n바뀌다,To be changed (V)\r\n계획,Plan / Schedule\r\n출발하다,To leave / To depart (V)\r\n다르다,To be different (V)\r\n날씨에 따라 달라요,Depending on the weather, it is different\r\n레벨에 따라서 문제가 바뀌어요,Questions change depending on the level\r\n오늘 기분 어때요?,How are (you) feeling today?\r\n우리는 영화 보러 가요,We are going to watch a movie\r\n그냥 밥을 먹자!,Let's just eat!\r\n예매하다,To buy tickets in advance (V)\r\n저는 서울에 살아요,I live in Seoul\r\n말할 걸 그랬어요,(I) should have told (him)\r\n지하철 타고 올 걸 그랬어요,(I) should have taken the subway to come\r\n집들이,Housewarming party\r\n미리,In advance / beforehand\r\n한국 아파트, 1동, 415호,Hanguk Apartments, Building 1, Flat Number 415\r\n어제 우리 형이랑 컴퓨터 게임 했어요,(I) played yesterday a computer game with (my) older brother\r\n집이 몇 호예요?,What's (your) flat number?\r\n몇 동에 살아요?,In what apartment building (you) live in?\r\n집이 몇 호예요?,What's (your) flat number?\r\n몇 동에 살아요?,In what apartment building (you) live in?\r\n오기 만 하면 돼,All (you) have to do is to come\r\n책을 한 번 읽기 만 하면 돼,All (you) have to do is to read the book just once\r\n나랑 말하기 만 하면 돼,All (you) have to do is tell me\r\n벌써 다 썼어요,(I) spent it all already\r\n누구 한테 줄 거예요?,Who are (you) giving (it) to?\r\n이사하다,To move places (V) (flat, house)\r\n이사 가다,To move out of a place (V)\r\n이사 오다,To move in a place (V)\r\n이쪽,This way / Over here\r\n저쪽,That way / Over there\r\n풀,Glue\r\n가위,Scissors\r\n은행 옆에 김밥 집이 있어요,There is a Kimbab restaurant next to the bank\r\n주인,Owner\r\n저쪽에 은행이 있어요,There is a bank over there\r\n안 보이는데요,Well, (I) don't see it\r\n없는데요,Well, there isn't any\r\n어제 했는데요,(I) did it yesterday, (why?)\r\n전부,All / Whole\r\n전부 다 다시 할 거예요?,Are (you) going to do it all again?\r\n이 김치 건부 살 수 있나요?,Can (I) buy all of this kimchi?\r\n이 식당은 뭐가 맛있나요?,What is delicious in this restaurant?\r\n닫다,To close / To shut (V)\r\n예약,Reservation\r\n식사,Meal\r\n창문 닫아 주세요,Please close the window\r\n예약 하셨어요?,Have (you) made a reservation?\r\n몇 분 오셨어요?,How many people have come?\r\n저녁 드셨어요?,Have (you) had dinner?\r\n오늘 몇 시까지 일해요?,What time do (you) work until today?\r\n이거 얼마인가요?,How much is this?\r\n뭐가 제일 좋은가요?,Which one is the best?\r\n평일,Weekday / During the week\r\n서늘하다,To be cool (V)\r\n밥이 없으면 못 살아요,(I) can't live without rice\r\n똑똑하다,To be smart (V)\r\n새상,World / Universe\r\n수학,Mathematics\r\n이해하다,To understand (V)\r\n몇 번째 ...?,How many times ...?\r\n... 새상에서 제일 좋아해요,(I) like ... the most in the world\r\n보면 볼수록 ...,The more (I) see it, the more ...\r\n자주 오면 올수록, 좋아요,The more often (you) come, the better\r\n생각하면 생각할수록 ...,The more (I) think about it ...	여보	\N	\N	\N	kr-en-basic	\N
5821	deliberate	신중한	\N	\N	\N	gongmuwon	하
9913	festive	축제 같은 즐거운	\N	\N	\N	gtelp	하
9801	differ from	과 다르다	\N	\N	\N	gtelp	기타
9822	in addition	게다가	\N	\N	\N	gtelp	기타
9891	researcher	학자 연구자	\N	\N	\N	gtelp	하
10005	selected	선택된	\N	\N	\N	gtelp	하
9878	take over	양도받다 물려받다	\N	\N	\N	gtelp	기타
9959	contain	포함하다 이 들어 있다	\N	\N	\N	gtelp	하
10001	nervous	흥분하기 쉬운	\N	\N	\N	gtelp	하
10079	produce	생산하다	\N	\N	\N	gtelp	하
10145	breathe	숨 쉬다	\N	\N	\N	gtelp	하
10184	positive	긍정적인	\N	\N	\N	gtelp	하
10205	realistic style	사실주의적인 양식	\N	\N	\N	gtelp	기타
10292	influence	영향을 미치다	\N	\N	\N	gtelp	하
10400	greatness	거대함 위대함	\N	\N	\N	gtelp	하
10035	researcher	연구조사원	\N	\N	\N	gtelp	하
12609	ไม่นึกเลยว่าเป็นคุณ	98.당신 일줄은 전혀 생각도 못했어.	마＾이 늑↗ 르ㅓ이 와＾아 뻰 쿤 아니다 생각하다 전혀, 절대로 ~ 라고 이다 당신	\N	\N	thai-conversation	기타
12560	อยากลองดี	49.한번 해 보고 싶어.	야악↘ 러엉   디이 하고싶다 한번 해보다 좋다 정말로 좋은지 나쁜지 시험해 보다	\N	\N	thai-conversation	기타
12636	ในที่สุดเขา ก็ โทรมา	125. 마침내 그가 전화했다.	나이 티＾이 쑷↘ 카오↗ 꺼＾ 토오 마아 마침내  그 ~ 하면, ~ 해도 전화하다 오다	\N	\N	thai-conversation	기타
12709	อยากเจ็บตัว รึไง	179. 다치고 싶어 ?	야악↘  쩹↘   뚜아 르↗ 응아이 ~ 하고 싶다, 바라다 아프다, 병들다 몸 ~ 인거야 ?	\N	\N	thai-conversation	기타
12717	หมู่นี้ ไม่ค่อย สบาย	185. 요즘 몸이 안 좋아.	무우↘ 니이↗ 마＾이 커＾이   싸↘바이 요즘  그다지~ 아니다 편하다 พักนี้ (팍↗ 니이↗) 와 ช่วงนี้ (추＾엉 니이↗) 또한 &ldquo; 요즘 &ldquo; 이라는 뜻이다.	\N	\N	thai-conversation	기타
12728	หลับตา	눈감아	(랍↘ 따아) หลับ 은 &ldquo; (눈을) 감다 &ldquo; 의 뜻 이외에 &ldquo; 자다 &rdquo; 라는 뜻도 가지고 있다.	\N	\N	thai-conversation	기타
12881	ถ้าไม่ได้คุณฉัน คงแย่	283. 만약에 당신이 없으면, 나는 아마 곤란할 거야.	타＾아 마＾이 다＾이 쿤 폼v 콩 얘＾애 만약 아니다 얻다, 있다 당신 나 아마 ~ 일 것이다 매우 곤란하다, 아주 어렵다	\N	\N	thai-conversation	기타
12883	โสดแต่ไม่สด	285. 씽글인 데, 처녀(총각) 는 아냐.	쏘옷↘   때애↘ 마＾이 쏫↘ 독신의, 단독의 하지만 아니다 처녀 (총각) 이다,	\N	\N	thai-conversation	기타
12975	เดินทางข้าม น้ำข้ามทะเล	366. 물 건너 바다 건너 여행하다	드ㅓㄴ   타앙 카＾암 나암↗ 카＾암 탈↗레애 걷다, 활동하다 길 건너다 물 건너다 바다	\N	\N	thai-conversation	기타
13017	ทำใจไม่ได้	404. 마음을 진정시킬 수가 없어.	탐 짜이     마＾이 다＾이 마음을 진정시키다, 감정을 누그러뜨리다 ~ 할 수 없다	\N	\N	thai-conversation	기타
3745	combustible	가연성의	\N	\N	\N	toefl	하
3462	ambivalence	양면 가치	\N	\N	\N	toefl	하
3616	besmirch	더럽히다; (명성) 훼손하다	\N	\N	\N	toefl	중
3668	cajole	감언으로 꼬셔서 ~하게 하다	\N	\N	\N	toefl	중
3801	console	위로하다	\N	\N	\N	toefl	하
4159	equivocally	분명치 않게	\N	\N	\N	toefl	기타
3809	contentious	논쟁적인; 논쟁을 일으키는	\N	\N	\N	toefl	하
3909	alleviate	완화하다	\N	\N	\N	toefl	하
4028	dissuade	하지 않도록 설득하다	\N	\N	\N	toefl	하
4066	intimidate	위협하다	\N	\N	\N	toefl	하
4086	edible	먹을 수 있는	\N	\N	\N	toefl	하
3902	defiantly	반항적으로	\N	\N	\N	toefl	하
3995	disconcert	당황하게 하다	\N	\N	\N	toefl	상
4025	disseminate	vt.(씨를) 흩뿌리다; (주장	\N	\N	\N	toefl	하
4234	falter	비틀거리다; 주저하다; 말을 더듬다	\N	\N	\N	toefl	하
15869	poll (poul) = survey	n . 여론 조사 : 투표 | v . 여론 조사 를 하다 : 득표 하다	\N	\N	\N	toeic	기타
4395	hamlet	작은 마을	\N	\N	\N	toefl	하
8297	collapse	v. *무너지다	\N	\N	\N	suneung	하
8533	trim	v. *잘라내다 다듬다*	\N	\N	\N	suneung	하
8648	locate	v. *~에 위치하다	\N	\N	\N	suneung	하
9172	statesman	n. *정치가*	\N	\N	\N	suneung	하
9190	stride	v. *성큼성큼 걷다*	\N	\N	\N	suneung	하
9198	escape	v. *달아나다	\N	\N	\N	suneung	하
9223	incorporate	v. *법인회사로 만들다	\N	\N	\N	suneung	하
9295	complacent	a. (스스로) *만족해하는	\N	\N	\N	suneung	하
9341	poise	v. *균형을 잡다*	\N	\N	\N	suneung	하
9255	unless	c. *~이 아닌 한	\N	\N	\N	suneung	하
13338	Pleased to meet you! / Pleased to see you!	반갑습니다!	\N	\N	\N	kr-en-basic	기타
13350	Of course! / Sure!	그럼요!	\N	\N	\N	kr-en-basic	기타
13367	Knife	칼	\N	\N	\N	kr-en-basic	하
13532	Of course! (Informal)	당연하지!	\N	\N	\N	kr-en-basic	기타
13545	Korean BBQ style	갈비	\N	\N	\N	kr-en-basic	기타
13339	Thank you! (Intimate)	고마워!	\N	\N	\N	kr-en-basic	기타
13347	Long time	오랜만이에요!	\N	\N	\N	kr-en-basic	기타
3826	corollary	당연한 결과	\N	\N	\N	toefl	하
3866	curtail	축소하다	\N	\N	\N	toefl	하
4171	esteem	존중하다	\N	\N	\N	toefl	하
10415	adjust	조정하다 조절하다	\N	\N	\N	gtelp	하
10176	describe	묘사하다 설명하다	\N	\N	\N	gtelp	하
10203	even though	비록 일지라도	\N	\N	\N	gtelp	기타
10263	cannot afford to	할 여유가 없다	\N	\N	\N	gtelp	기타
10042	appetite	식욕	\N	\N	\N	gtelp	하
10129	discover	발견하다	\N	\N	\N	gtelp	하
10150	native	출생의 출생지의 본국의 제나라의 토산의 그 토지 에서 태어난산출되는 원산의 토착의 그 지방 고유의	\N	\N	\N	gtelp	하
10297	attachment	첨부물	\N	\N	\N	gtelp	하
10511	fought fight	싸우다의 과거	\N	\N	\N	gtelp	기타
10716	trophy	트로피	\N	\N	\N	gtelp	하
10725	cleaners and soap for the home	가정용 비누와 세제	\N	\N	\N	gtelp	기타
10642	stem	줄기	\N	\N	\N	gtelp	하
10648	stay steady	안정되어 있다	\N	\N	\N	gtelp	기타
10768	social failure	사회적 실패자	\N	\N	\N	gtelp	기타
13348	Have you been good?	잘 있었어요?	\N	\N	\N	kr-en-basic	기타
13361	No!	아니요!	\N	\N	\N	kr-en-basic	기타
13364	Name	이름	\N	\N	\N	kr-en-basic	하
13366	This (inanimate object)	이거	\N	\N	\N	kr-en-basic	기타
13370	My	제	\N	\N	\N	kr-en-basic	하
13379	Five (K)	다섯	\N	\N	\N	kr-en-basic	기타
13398	Seven (S)	칠	\N	\N	\N	kr-en-basic	기타
13427	Home	집	\N	\N	\N	kr-en-basic	하
13438	Left	왼쪽	\N	\N	\N	kr-en-basic	하
13439	Right	오른쪽	\N	\N	\N	kr-en-basic	하
13476	Cigarrette	담배	\N	\N	\N	kr-en-basic	기타
13482	This!	이것!	\N	\N	\N	kr-en-basic	기타
13504	To drink (V)	마시다	\N	\N	\N	kr-en-basic	기타
13542	Section Chief	과장님	\N	\N	\N	kr-en-basic	기타
13575	Stomach	배	\N	\N	\N	kr-en-basic	하
13583	To be big (V)	크다	\N	\N	\N	kr-en-basic	기타
13589	Eating out	외식	\N	\N	\N	kr-en-basic	기타
13591	To be cheap (V)	싸다	\N	\N	\N	kr-en-basic	기타
10816	friendly	우호적인	\N	\N	\N	gtelp	하
10559	experiment	실험	\N	\N	\N	gtelp	하
10625	green with envy	질투로 파래지다	\N	\N	\N	gtelp	기타
10676	become involved in	합류하다	\N	\N	\N	gtelp	기타
10790	alert	에게 위험을 경고하다	\N	\N	\N	gtelp	하
10817	environmentally	환경적으로	\N	\N	\N	gtelp	하
11025	brilliance	훌륭함 재기 발랄	\N	\N	\N	gtelp	하
11064	marriage proposal	청혼 프러포즈	\N	\N	\N	gtelp	기타
11196	religious	종교적인	\N	\N	\N	gtelp	하
11243	keep ing ing	계속해서 하다	\N	\N	\N	gtelp	기타
10987	ice cube	얼음 덩어리	\N	\N	\N	gtelp	기타
11029	in order toR R	하기 위하여	\N	\N	\N	gtelp	기타
11107	thorn bush	가시덤불	\N	\N	\N	gtelp	기타
11140	purchase	구입하다	\N	\N	\N	gtelp	하
11185	reason	추론하다 논리적으로 생각하다	\N	\N	\N	gtelp	하
11303	editorinchief	편집장	\N	\N	\N	gtelp	기타
11327	gray	회색의	\N	\N	\N	gtelp	하
11342	suppose	라고 가정하다	\N	\N	\N	gtelp	하
11381	have difficulty ing	하는 데 어려움을 겪다	\N	\N	\N	gtelp	기타
11501	pace	보폭 속도 페이스	\N	\N	\N	gtelp	하
11600	sigh	한숨을 쉬다	\N	\N	\N	gtelp	하
16692	collective	adj . 축적 된 : 공동 의	\N	\N	\N	toeic	하
11352	response	반응 대답	\N	\N	\N	gtelp	하
11397	log	통나무	\N	\N	\N	gtelp	하
12809	ยกมือขึ้น	234. 손 들어	욕↗ 므으 큰＾ 들다 손 오르다 / 앞의 동작이 상승 또는 증대되는 것을 의미, 우리 생각으로는 ยกมือ (욕↗ 므으) 라고만 해도 손들어 의 뜻이 되지만,태국인들은 99.9 % ยกมือขึ้น (욕↗ 므으 큰＾) 이라고 말한다는 것을 주의하자.	\N	\N	thai-conversation	기타
12718	ช่วยตามเขามาด้วย	186. 가서 그 사람 좀 데려 와.	추＾어이   따암 카오↗ 마아   두＾어이 ~해 주세요, 도와 주세요 불러오다 그 오다 함께 그런데, 말 짧게 하기 좋아하는 태국인들은 줄여서 ไปตามมา (빠이 따암 마아) 라고 한다	\N	\N	thai-conversation	기타
12866	เขาไม่พูดซัก คำ	272. 그는 한마디도 안 했어.	카오↗ 마＾이 푸＾웃 싹↗   캄 그 ~ 아니다 말하다 ~ 만큼, ~ 정도 단어, 말	\N	\N	thai-conversation	기타
12712	เขาตายคาที่	181. 그는 현장에서 즉사했어	카오↗ 따이 카아   티＾이 그 죽다 딱 달라붙어 있다, 남아 있다 장소	\N	\N	thai-conversation	기타
12865	ปรับ ความเข้าใจ	271. 양해를 구하다	쁘랍↘ 콰암   카＾오 짜이 통고하다 ~ 하는 것, ~ 하기, ~ 함 (명사형 어미) 이해하다	\N	\N	thai-conversation	기타
12940	เขา ไม่โทรหาตั้งนาน	336. 그가 전화 안한지 오래 됐어.	카오↗ 마＾이 토오 하v아 땅＾ 나안 그 ~ 아니다 전화하다 찾다 ~ 부터, ~ 이나 오래다, (시간이) 길다	\N	\N	thai-conversation	기타
12882	มันธรรมดา	284. 그건 보통이야, 평범해.	만 탐마다아 그것 보통이다, 평범하다	\N	\N	thai-conversation	기타
13008	แบบนี้แหละดีแล้ว	398. 바로 이 방법이 좋겠다.	배앱↘   니이↗ 래↘ 디이 래애우↗ 모양, 형식, 방법 이 바로, 틀림없이 좋다 이미	\N	\N	thai-conversation	기타
1499	look back at	을 다시 보다	\N	\N	\N		기타
16390	stand	v . 서다 . 서 있다 n . ( 공개적 으로 드러내는 ) 태도 [ 의견 ] : 가판대 	\N	\N	\N	toeic	하
13534	To cook / Dish / Cuisine	여리	\N	\N	\N	kr-en-basic	기타
1546	tend toR R	하는 경향이 있다	\N	\N	\N		기타
1783	No matter where	어디에 한다 하더라도	\N	\N	\N		기타
13590	To be expensive (V)	비싸다	\N	\N	\N	kr-en-basic	기타
5814	defunct	현존하지 않는; 효력을 잃은	\N	\N	\N	gongmuwon	하
15803	supplement	v . 보충 ( 추가 ] 하다 n 보충 ( 추가 ] ( 물 ) : ( 책 의 ) 부록 : ( 신문 의 ) 증보판	\N	\N	\N	toeic	하
13593	Do you want me to give you ...? (Formal)	... 드릴까요?	\N	\N	\N	kr-en-basic	기타
13570	Light (weight)	가벼워요	\N	\N	\N	kr-en-basic	기타
4180	evoke	(감정) 불러일으키다; (반응) 이끌어내다	\N	\N	\N	toefl	하
4182	exacerbate	악화시키다	\N	\N	\N	toefl	하
10107	general	일반적인	\N	\N	\N	gtelp	하
10164	active	활동적인	\N	\N	\N	gtelp	하
10518	different shape	다양한 형태	\N	\N	\N	gtelp	기타
10057	describe	묘사하다 서술하다	\N	\N	\N	gtelp	하
10837	The Board of Education	교육 위원회	\N	\N	\N	gtelp	기타
10861	get out	내리다	\N	\N	\N	gtelp	기타
10933	sensation	반향 센세이션	\N	\N	\N	gtelp	하
10781	iron	철	\N	\N	\N	gtelp	하
10892	be good at	를 잘하다	\N	\N	\N	gtelp	기타
10950	delighted	아주 기뻐하는	\N	\N	\N	gtelp	하
11004	report	보도하다	\N	\N	\N	gtelp	하
11115	rainfall	강수량	\N	\N	\N	gtelp	하
11127	heart attack	심장 마비발작	\N	\N	\N	gtelp	기타
11154	lightlitlit	불을 켜다	\N	\N	\N	gtelp	기타
11175	enter	들어가다	\N	\N	\N	gtelp	하
11220	lock	잠그다	\N	\N	\N	gtelp	하
11241	although	에도 불구하고	\N	\N	\N	gtelp	하
11292	appreciate	감사하다	\N	\N	\N	gtelp	하
13337	Thank you! (Formal)	감사합니다!	\N	\N	\N	kr-en-basic	기타
13349	I have been good!	잘 있었어요!	\N	\N	\N	kr-en-basic	기타
13353	I'm hungry!	배고파요!	\N	\N	\N	kr-en-basic	기타
13354	I'm full!	배불러요!	\N	\N	\N	kr-en-basic	기타
13381	Seven (K)	일곱	\N	\N	\N	kr-en-basic	기타
13411	Monday	월요일	\N	\N	\N	kr-en-basic	하
13412	Tuesday	화요일	\N	\N	\N	kr-en-basic	하
13417	Sunday	일요일	\N	\N	\N	kr-en-basic	하
13424	Head	머리	\N	\N	\N	kr-en-basic	하
13428	To get up (V)	일어나다	\N	\N	\N	kr-en-basic	기타
13430	Please give!	주세요!	\N	\N	\N	kr-en-basic	기타
13441	Where is (it)?	어디예요?	\N	\N	\N	kr-en-basic	기타
13457	Together	같이	\N	\N	\N	kr-en-basic	하
13492	Excuse me!	저기요!	\N	\N	\N	kr-en-basic	기타
13517	English Language	영어	\N	\N	\N	kr-en-basic	기타
13523	Book	책	\N	\N	\N	kr-en-basic	하
13527	Not ... But ...	말고	\N	\N	\N	kr-en-basic	기타
13543	Department Chief	부장님	\N	\N	\N	kr-en-basic	기타
13546	To be good at something (V)	잘 하다	\N	\N	\N	kr-en-basic	기타
13569	Heavy	무거워요	\N	\N	\N	kr-en-basic	하
13580	Cut it! (Intimate)	잘라!	\N	\N	\N	kr-en-basic	기타
13587	I don't want to study!	안 공부 하고 싶어!	\N	\N	\N	kr-en-basic	기타
13595	Please give me ...! (Formal)	... 주세요!	\N	\N	\N	kr-en-basic	기타
10931	mood	기분	\N	\N	\N	gtelp	하
11000	especially	특히	\N	\N	\N	gtelp	하
11060	criticism	비평 비판	\N	\N	\N	gtelp	하
11099	reflect	반영하다	\N	\N	\N	gtelp	하
11123	research	연구하다 조사하다	\N	\N	\N	gtelp	하
11207	agreeable	기분 좋은 쾌적한 마음에 드는	\N	\N	\N	gtelp	하
11267	as for	로 말하자면 은 어떠냐 하면	\N	\N	\N	gtelp	기타
11224	survive	살아남다	\N	\N	\N	gtelp	하
11302	make sense	일리가 있다	\N	\N	\N	gtelp	기타
11570	effective	효과적인	\N	\N	\N	gtelp	하
11307	physically	신체적으로	\N	\N	\N	gtelp	하
11430	disappointed	실망한	\N	\N	\N	gtelp	하
12156	หมู่นี้ ไม่ค่อย สบาย	185. 요즘 몸이 안 좋아.	무우↘ 니이↗ 마＾이 커＾이   싸↘바이 요즘  그다지~ 아니다 편하다 พักนี้ (팍↗ 니이↗) 와 ช่วงนี้ (추＾엉 니이↗) 또한 &ldquo; 요즘 &ldquo; 이라는 뜻이다.	\N	\N		기타
13049	เอาไว้คราวหน้า ก็แล้วกัน	428. 다음번으로 미뤄두죠.	아아오 와이↗ 크라우 나아↗ 꺼＾래애우↗깐 가져가다 ~ 해 두다 ~ 번, ~ 회 다음의 ~ 하도록 하죠	\N	\N	thai-conversation	기타
13059	ธุรกิจเฟื่องฟู	438. 사업이 번창하다	투↘라↗낏↘ 희＾으앙 후우 사업 번영하다, 진보하다 부풀다, 팽창하다, 번영하다 เฟื่อง (희＾으앙) 과 ฟู (후우) 에 있는 ฟ 의 발음은 / ㅎ + ㅍ / 즉, 영어의 / f / 발음처럼&hellip;	\N	\N	thai-conversation	기타
16277	host	v . 개최 하다 . 주최 하다 n . ( 손님 을 초대 한 ) 주인 : ( TV . 라디오 프로 의 ) 진행자	\N	\N	\N	toeic	하
13566	To be difficult	어려워	\N	\N	\N	kr-en-basic	기타
1908	maintain	유지하다 관리하다 주장하다	\N	\N	\N		하
5720	congregate	~을 많이 모으다	\N	\N	\N	gongmuwon	하
10882	though	임에도 불구하고	\N	\N	\N	gtelp	하
11310	prefer A to B B A	보다 를 더 좋아하다	\N	\N	\N	gtelp	기타
13431	A bit / some	좀	\N	\N	\N	kr-en-basic	기타
6067	fallacious	그릇된; 허위의; 논리적 오류가 있는	\N	\N	\N	gongmuwon	중
15878	accommodate	v . 요구 등에 부용 하다 . 수용 하다 . ( 사람 을 ) 숙박 시키다	\N	\N	\N	toeic	하
4414	hazardous	위험한	\N	\N	\N	toefl	하
4705	livid	[타박상으로 피부 따위가]검푸른; 흙빛의; 격노한(enraged)discolored; black and blue; enraged	\N	\N	\N	toefl	하
13399	Eight (S)	팔	\N	\N	\N	kr-en-basic	기타
12124	แล้งแต่คุณ	166. 당신에게 달려 있지.	(래우↗ 때애↘ 쿤) 택시를 탔는 데, 기사가 고속도로 로 갈지 아니면 국도로 갈 지 물어 봤을 때,기사 맘대로 하라고 말하고 싶을 때 이 표현을 쓰면 된다.	\N	\N		기타
13626	encourage	격려하다 용기를 주다	\N	\N	\N		하
13637	awesome	멋진 근사한 두려운	\N	\N	\N		하
13641	a color photograph accompanied by a story	이야기사연 가 동반된 컬러사진 한 장	\N	\N	\N		기타
13657	census	인구조사	\N	\N	\N		하
13670	somewhat close	다소 근접한	\N	\N	\N		기타
13688	rush into action	즉시 행동에 옮기다	\N	\N	\N		기타
13700	chief executive officer	최고경영자	\N	\N	\N		기타
13711	play a role	역할을 하다	\N	\N	\N		기타
13724	scrap	까지다 찢어지다	\N	\N	\N		하
4261	filthy	더러운	\N	\N	\N	toefl	하
4174	eulogy	(고인에 대한) 추도 연설	\N	\N	\N	toefl	하
4332	fruitlessly	헛되이	\N	\N	\N	toefl	중
4461	illegible	A. 읽기 어려운	\N	\N	\N	toefl	하
4489	imperative	반드시 해야 하는	\N	\N	\N	toefl	하
4522	incalculable	헤아릴 수 없는	\N	\N	\N	toefl	중
4539	2. 중요치 않은	 시시한	\N	\N	\N	toefl	기타
4592	inspiring	영감을 주는	\N	\N	\N	toefl	하
4704	literal	글자 그대로의	\N	\N	\N	toefl	하
4818	nagging	잔소리하는	\N	\N	\N	toefl	하
4576	initially	ad. 처음에	\N	\N	\N	toefl	하
4817	nadir	천저	\N	\N	\N	toefl	하
4837	nominate	지명하다	\N	\N	\N	toefl	하
4995	plunge	뛰어들다	\N	\N	\N	toefl	하
5036	pretentious	허세부리는	\N	\N	\N	toefl	하
5048	proceeds	n. 수익금	\N	\N	\N	toefl	하
5058	prognosticate	예언하다	\N	\N	\N	toefl	상
5067	prominent	저명한	\N	\N	\N	toefl	하
5096	punctilious	세심한	\N	\N	\N	toefl	중
5119	ransack	철저히 수색하다	\N	\N	\N	toefl	중
5143	recurring	되풀이해 발생하는	\N	\N	\N	toefl	하
5183	resemble	~을 닮다	\N	\N	\N	toefl	하
5403	abstruse	난해한	\N	\N	\N	gongmuwon	중
5091	proximity	근접	\N	\N	\N	toefl	하
5152	rehabilitate	사회로 복귀시키다	\N	\N	\N	toefl	하
5188	resilient	탄력 있는; 회복력 있는	\N	\N	\N	toefl	하
5228	rustle	v. 와삭거리다	\N	\N	\N	toefl	중
5300	slim	호리호리한	\N	\N	\N	toefl	하
5388	abide	머무르다	\N	\N	\N	gongmuwon	하
5406	abuse	모욕하다	\N	\N	\N	gongmuwon	하
5060	prohibitive	(가격) 지나치게 비싼; 금지하는	\N	\N	\N	toefl	하
5332	splice	잇다	\N	\N	\N	toefl	하
5372	strand	오도가도 못하게 하다	\N	\N	\N	toefl	하
5436	admire	존경하다; 동경하다	\N	\N	\N	gongmuwon	하
5482	anachronism	시대착오	\N	\N	\N	gongmuwon	중
5556	beef-up	종강	\N	\N	\N	gongmuwon	기타
5671	collaborate	공동으로 일하다	\N	\N	\N	gongmuwon	하
5758	correlate	상호 관계를 나타내다; 서로 관련시키다(with)	\N	\N	\N	gongmuwon	하
5458	alight	~에서 내리다; ~에 내려앉다; 착륙하다; 우연히 마주치다	\N	\N	\N	gongmuwon	하
5627	catchy	사람의 마음을 끄는	\N	\N	\N	gongmuwon	하
5662	clog	~을 방해하다	\N	\N	\N	gongmuwon	하
5682	commuter	정기권 통근자	\N	\N	\N	gongmuwon	하
5635	chamber	방	\N	\N	\N	gongmuwon	하
5718	congenial	알맞은; 쾌적한	\N	\N	\N	gongmuwon	하
5751	conviction	유죄 판결	\N	\N	\N	gongmuwon	하
5785	cryptic	수수께끼 같은	\N	\N	\N	gongmuwon	하
5792	curtail	짧게 줄이다; 단축하다	\N	\N	\N	gongmuwon	하
5838	descry	어렴풋이 ~을 알아보다	\N	\N	\N	gongmuwon	상
6009	equivocal	두가지 뜻으로 해석되는	\N	\N	\N	gongmuwon	중
6069	falter	말을 더듬다	\N	\N	\N	gongmuwon	하
6087	fickle	마음이 잘 변하는	\N	\N	\N	gongmuwon	하
6128	freak	정신을 못 차리게 하다; 흥분시키다	\N	\N	\N	gongmuwon	하
5997	enthrall	마음을 사로잡다	\N	\N	\N	gongmuwon	중
6189	haphazard	아무렇게나 하는; 계획성 없는	\N	\N	\N	gongmuwon	하
6311	inquisitive	탐구적인	\N	\N	\N	gongmuwon	하
6363	irrigate	물을 대다	\N	\N	\N	gongmuwon	중
6474	molten	(금속 등이) 녹은; 주조한; (정열이) 타는 듯한	\N	\N	\N	gongmuwon	하
6512	obligatory	의무로서 지워지는	\N	\N	\N	gongmuwon	하
6545	outlandish	이국풍의; 기이한	\N	\N	\N	gongmuwon	하
6234	imaginative	상상력이 풍부한; 상상하기 좋아하는	\N	\N	\N	gongmuwon	하
6403	literacy	읽고 쓰는 능력; 교양있음	\N	\N	\N	gongmuwon	하
6478	monumental	기념이 되는; 기념비의	\N	\N	\N	gongmuwon	하
6280	inconceivable	상상도 못할; 믿을 수 없는	\N	\N	\N	gongmuwon	하
6360	irrecoverable	돌이킬 수 없는; 회복하기 어려운	\N	\N	\N	gongmuwon	중
6640	precipitate	마구 재촉하다	\N	\N	\N	gongmuwon	하
6664	procure	마련하다	\N	\N	\N	gongmuwon	하
6553	overpower	압도하다	\N	\N	\N	gongmuwon	중
6626	porosity	구멍; 다공성	\N	\N	\N	gongmuwon	하
6768	requisite	필요한	\N	\N	\N	gongmuwon	하
6839	seemly	알맞은	\N	\N	\N	gongmuwon	중
6907	staggering	혼비백산케 하는	\N	\N	\N	gongmuwon	하
10134	imagine	상상하다	\N	\N	\N	gtelp	하
10299	literally	글자 뜻대로 사실상	\N	\N	\N	gtelp	하
10470	develop	개발하다 향상 되다	\N	\N	\N	gtelp	하
10542	fled flee	도망가다의 과거	\N	\N	\N	gtelp	기타
10078	solar energy	태양 에너지	\N	\N	\N	gtelp	기타
10111	side by side	나란히	\N	\N	\N	gtelp	기타
10496	select	선택하다	\N	\N	\N	gtelp	하
10544	loudly	큰소리로	\N	\N	\N	gtelp	하
10551	discouraging	좌절감을 주는	\N	\N	\N	gtelp	하
10557	whenever	할 때마다	\N	\N	\N	gtelp	하
10578	exploration	탐험 탐사	\N	\N	\N	gtelp	하
10611	available	이용할 수 있는	\N	\N	\N	gtelp	하
10675	active	적극적인	\N	\N	\N	gtelp	하
10909	darken	빛깔이 거뭇해지다	\N	\N	\N	gtelp	하
10604	milky	우유가 들어있는	\N	\N	\N	gtelp	하
10703	flame	불꽃	\N	\N	\N	gtelp	하
10877	supposed	가정의 가상의 상상된	\N	\N	\N	gtelp	하
10968	fill A with B A B	를 로 채우다	\N	\N	\N	gtelp	기타
11265	convince	납득시키다	\N	\N	\N	gtelp	하
11156	cheer	활기 원기	\N	\N	\N	gtelp	하
11177	be filled with	으로 가득 차다	\N	\N	\N	gtelp	기타
10936	offer	제공하다	\N	\N	\N	gtelp	하
11005	news industry	뉴스 산업	\N	\N	\N	gtelp	기타
11263	as a result	그 결과	\N	\N	\N	gtelp	기타
11372	attend	출석하다	\N	\N	\N	gtelp	하
11423	color	색칠하다	\N	\N	\N	gtelp	하
4280	flip a coin	(동전을) 휙 던져 올리다	\N	\N	\N	toefl	기타
4345	galvanize	활기를 띠게 하다	\N	\N	\N	toefl	중
4163	erroneous belief	잘못된 믿음 (illusion)	\N	\N	\N	toefl	기타
4290	foolproof	A. (기계 등이) 누구나 다룰 수 있는; 절대 실패할 수 없는	\N	\N	\N	toefl	하
4351	gelatinous	a. 아교질의; 젤라틴으로 된 [= semiliquid	\N	\N	\N	toefl	중
4403	haphazardly	우연히	\N	\N	\N	toefl	중
4427	hesitant	주저하는	\N	\N	\N	toefl	하
4441	homogenized	균질화(동질화)된	\N	\N	\N	toefl	중
4526	incompatible	A.양립할 수 없는	\N	\N	\N	toefl	하
4577	initiate	시작하다	\N	\N	\N	toefl	하
4773	mince	점잔빼며 말하다	\N	\N	\N	toefl	하
4879	onset	N. 1. 착수	\N	\N	\N	toefl	하
4561	infraction	위반	\N	\N	\N	toefl	하
4632	involuntary	무의식적인	\N	\N	\N	toefl	하
4570	inherited	물려받은	\N	\N	\N	toefl	하
4606	intermittently	간헐적으로 occasionally	\N	\N	\N	toefl	하
5230	sabotage	고의적으로 방해하다	\N	\N	\N	toefl	하
5301	sloppy	부주의한/조잡한	\N	\N	\N	toefl	하
5111	quintessential	본질적인	\N	\N	\N	toefl	하
5286	shudder	떨다	\N	\N	\N	toefl	하
5433	adduce	(증거로서) 제출하다	\N	\N	\N	gongmuwon	중
5582	blunder	큰 실수; 터무니없는 실책	\N	\N	\N	gongmuwon	하
5447	affluent	풍부한	\N	\N	\N	gongmuwon	하
5527	atrophy	(영양 부족에서 오는) 위축	\N	\N	\N	gongmuwon	하
5636	champion	앞장서서 ~을 옹호하다	\N	\N	\N	gongmuwon	하
5667	codify	법전으로 편찬하다	\N	\N	\N	gongmuwon	중
5773	covetous	(남의 것을) 몹시 탐내는	\N	\N	\N	gongmuwon	중
5892	dishearten	낙심시키다	\N	\N	\N	gongmuwon	상
6187	handy	바로 쓸 수 있는; 쓰기 편리한; 솜씨 좋은	\N	\N	\N	gongmuwon	하
6222	humiliate	굴욕감을 느끼게 하다	\N	\N	\N	gongmuwon	하
5954	efficient	능률적인; 효과가 있는	\N	\N	\N	gongmuwon	하
6025	even	평평한; 한결같은	\N	\N	\N	gongmuwon	하
6050	extension	연장; 확장	\N	\N	\N	gongmuwon	하
6135	fuel	연료를 보급하다; 지지하다; 자극하다	\N	\N	\N	gongmuwon	하
6182	hallow	신성하게 하다; 신에게 바치다	\N	\N	\N	gongmuwon	중
5984	engaged	바쁜; ~에 종사하는; 교전중인	\N	\N	\N	gongmuwon	하
6058	extrovert	외향적인 사람	\N	\N	\N	gongmuwon	중
6097	flatter	아첨하다	\N	\N	\N	gongmuwon	하
6466	misnomer	잘못된 명칭	\N	\N	\N	gongmuwon	하
6224	hunt	뒤지다	\N	\N	\N	gongmuwon	하
6306	innate	타고난	\N	\N	\N	gongmuwon	하
6351	invalid	병약한; 허약한; 환자용의	\N	\N	\N	gongmuwon	하
6239	immoderate	무절제한; 지나친	\N	\N	\N	gongmuwon	중
6256	impetuous	성급한; 열렬한	\N	\N	\N	gongmuwon	중
6394	lengthen	길게 늘이다	\N	\N	\N	gongmuwon	하
6484	mundane	현세의; 세속적인	\N	\N	\N	gongmuwon	하
6516	obsolete	시대에 뒤떨어진	\N	\N	\N	gongmuwon	하
6521	odorous	향기로운	\N	\N	\N	gongmuwon	중
6559	overture	서곡	\N	\N	\N	gongmuwon	하
6620	plunge	떨어뜨리다	\N	\N	\N	gongmuwon	하
6690	prudent	조심성있는; 신중한; 사려깊은	\N	\N	\N	gongmuwon	하
6739	regretful	뉘우치는	\N	\N	\N	gongmuwon	중
6735	refresh	원기를 회복시키다	\N	\N	\N	gongmuwon	하
6889	sophisticated	세련된; 매우 복잡한	\N	\N	\N	gongmuwon	하
6944	succeed	성공하다; 뒤를 잇다	\N	\N	\N	gongmuwon	하
10629	be sent to a prison	감옥에 보내지다	\N	\N	\N	gtelp	기타
10665	clear away	제거하다	\N	\N	\N	gtelp	기타
10695	wing	날개	\N	\N	\N	gtelp	하
10690	at almost twice the rate	거의 배 비율	\N	\N	\N	gtelp	기타
10720	strange object	이상한 물건	\N	\N	\N	gtelp	기타
10753	government	정부	\N	\N	\N	gtelp	하
10792	unique	독특한 고유한	\N	\N	\N	gtelp	하
10562	nickname	별명	\N	\N	\N	gtelp	하
10658	put out	을 끄다	\N	\N	\N	gtelp	기타
10727	smell of vanilla	바닐라 향	\N	\N	\N	gtelp	기타
10754	even worse	더 나쁜 것은	\N	\N	\N	gtelp	기타
10929	increase	증가하다	\N	\N	\N	gtelp	하
11085	cause	의 원인이 되다	\N	\N	\N	gtelp	하
10946	button	버튼을 누르다	\N	\N	\N	gtelp	하
10973	source	근원 원천 원인	\N	\N	\N	gtelp	하
11027	care	관심을 갖다 신경 쓰다	\N	\N	\N	gtelp	하
11075	serious	진지한 진정인	\N	\N	\N	gtelp	하
10939	as soon as possible	가능한 빨리	\N	\N	\N	gtelp	기타
10963	common	일반적인 흔한	\N	\N	\N	gtelp	하
11059	neither A nor B A B	도 도 아니다	\N	\N	\N	gtelp	기타
11089	sweat	땀을 흘리다	\N	\N	\N	gtelp	하
11167	take shape	형체를 갖추다	\N	\N	\N	gtelp	기타
11242	calm	침착한 고요한	\N	\N	\N	gtelp	하
11287	spread out	펼치다	\N	\N	\N	gtelp	기타
11306	imagination	상상	\N	\N	\N	gtelp	하
11441	regardless of	와 상관없이	\N	\N	\N	gtelp	기타
11528	turn red	얼굴이 붉어지다	\N	\N	\N	gtelp	기타
16585	promptly	adv . 지체 없이 	\N	\N	\N	toeic	하
11376	constant	지속적인	\N	\N	\N	gtelp	하
11445	companionship	교류 교제	\N	\N	\N	gtelp	하
13497	Mom / Mum	엄마	\N	\N	\N	kr-en-basic	기타
13513	You (plural)	너희	\N	\N	\N	kr-en-basic	기타
15767	concentration of sth	( 무엇이 한 곳에 모이는 ) 집중	\N	\N	\N	toeic	기타
1730	have difficulty ing	하는 데 어려움을 겪다	\N	\N	\N		기타
16204	secure	v . 안전하게 지키다 : 얻다 . 확보 하 다 . 고정 시키다 adj . 안전한	\N	\N	\N	toeic	하
15899	estimate	n . 추정 ( 치 ) : 견적 ( 서 ) ( = a quote ) v . 추산 하다 . 추정 하다	\N	\N	\N	toeic	하
4209	expurgate	(책이나 기록에서 부적당한 부분을) 삭제하다	\N	\N	\N	toefl	기타
13514	Too (much/many)	너무	\N	\N	\N	kr-en-basic	기타
10841	unsportsmanlike	스포츠맨 정신에 어긋나는	\N	\N	\N	gtelp	중
12795	กว่าเขา จะมา ก็ดึก แล้ว	224. 그가 도착할 때쯤이면, 이미 밤이 깊었을 거야.	꽈아↘ 카오↗ 짜↘   마아   꺼＾ 득↘   래우↗ ~ 까지, ~ 했을 때는 그 ~ 할것이다 오다 ~ 하면 심야, 밤이 깊다 이미, 벌써	\N	\N	thai-conversation	기타
4512	impulse	충동	\N	\N	\N	toefl	하
5882	discomfit	계획을 좌절시키다; 당황케 하다	\N	\N	\N	gongmuwon	기타
4359	germane	관련있는	\N	\N	\N	toefl	하
4378	gregarious	군집성의	\N	\N	\N	toefl	하
4393	hallmark	(전형적인) 특징[특질]; (귀금속의) 품질 보증 마크	\N	\N	\N	toefl	하
4426	hermitage	은둔장소; 세상과 분리되어 살 수 있는 곳	\N	\N	\N	toefl	하
4490	imperceptible	A. 1. 지각[감지]할 수 없는	\N	\N	\N	toefl	중
4195	exhortation	간곡한 권유	\N	\N	\N	toefl	하
4278	fleetingly	일시적으로	\N	\N	\N	toefl	중
4551	inevitable	피할 수 없는	\N	\N	\N	toefl	하
4618	intriguing	호기심을 자아내는	\N	\N	\N	toefl	하
4644	jaundiced	a. 편견을 가진; 비뚤어진 [= mistrustful	\N	\N	\N	toefl	중
4695	lexicon	사전	\N	\N	\N	toefl	하
4753	meek	얌전한	\N	\N	\N	toefl	하
4855	object	물체	\N	\N	\N	toefl	하
4781	mishap	N. (가벼운) 사고	\N	\N	\N	toefl	하
4854	obfuscate	Vt. (판단 등을) 흐리게 하다	\N	\N	\N	toefl	중
4921	overdue	a. 미납의	\N	\N	\N	toefl	하
4934	paranormal	'과학적으로 알 수가 없는	\N	\N	\N	toefl	하
4581	innumerable	셀 수 없이 많은	\N	\N	\N	toefl	하
13341	It's nothing! / You are welcome!	아니에요!	\N	\N	\N	kr-en-basic	기타
13351	How about Carlos?	칼러스는요?	\N	\N	\N	kr-en-basic	기타
13355	To like (V)	좋아하다	\N	\N	\N	kr-en-basic	기타
13375	One (K)	하나	\N	\N	\N	kr-en-basic	기타
13380	Six (K)	여섯	\N	\N	\N	kr-en-basic	기타
13391	How old are you?	몇살이에요?	\N	\N	\N	kr-en-basic	기타
13400	Nine (S)	구	\N	\N	\N	kr-en-basic	기타
13406	Honorific suffix (sir	님	\N	\N	\N	kr-en-basic	기타
13423	Mrs (older)	아줌마	\N	\N	\N	kr-en-basic	기타
13425	Where?	어디?	\N	\N	\N	kr-en-basic	기타
13435	Alright!	그래!	\N	\N	\N	kr-en-basic	기타
13468	Time	시간	\N	\N	\N	kr-en-basic	하
13475	Since	부터	\N	\N	\N	kr-en-basic	하
13478	Let's do!	하자!	\N	\N	\N	kr-en-basic	기타
13483	And	랑 / 이랑 / 와 / 과	\N	\N	\N	kr-en-basic	하
13487	Red	빨간	\N	\N	\N	kr-en-basic	하
13505	To eat (V)	먹다	\N	\N	\N	kr-en-basic	기타
13512	Pretty	예뻐	\N	\N	\N	kr-en-basic	하
13519	To be boring (V)	지루하다	\N	\N	\N	kr-en-basic	기타
13524	What kind of ...?	무슨	\N	\N	\N	kr-en-basic	기타
13529	Purple	보라	\N	\N	\N	kr-en-basic	하
13535	To drive (a car)	운전	\N	\N	\N	kr-en-basic	기타
13544	President	사장님	\N	\N	\N	kr-en-basic	하
13559	Again	또	\N	\N	\N	kr-en-basic	하
13567	Real / Really?	정말	\N	\N	\N	kr-en-basic	기타
13572	Next	다음	\N	\N	\N	kr-en-basic	하
13573	To be sleepy (V)	졸리다	\N	\N	\N	kr-en-basic	기타
5010	postulate	가정하다; 당연한 것으로 여기다	\N	\N	\N	toefl	하
5030	presently	ad. 현재	\N	\N	\N	toefl	하
5055	progeny	N. 1. (집합적) 자손; 제자	\N	\N	\N	toefl	하
5191	respite	짧은 휴식	\N	\N	\N	toefl	하
5335	spontaneous	자발적인	\N	\N	\N	toefl	하
5209	revert	되돌아가다	\N	\N	\N	toefl	하
5259	secede	탈퇴하다	\N	\N	\N	toefl	중
5126	rave	1. 횡설수설 말하다	\N	\N	\N	toefl	하
5156	relentless	엄격한	\N	\N	\N	toefl	하
5172	repellent	불쾌감을 주는	\N	\N	\N	toefl	하
5227	run-of-the-mill	보통의	\N	\N	\N	toefl	기타
5312	sojourn	Vi. 묵다	\N	\N	\N	toefl	하
5413	account	설명하다	\N	\N	\N	gongmuwon	하
5510	arraign	(법률) 죄의 인정 여부를 심문하다; 비난하다	\N	\N	\N	gongmuwon	상
5650	circumvent	(교묘하게)회피하다	\N	\N	\N	gongmuwon	하
5696	compound	혼합의	\N	\N	\N	gongmuwon	하
5804	deceptive	속이는	\N	\N	\N	gongmuwon	하
5866	digressive	주제를 벗어난; 탈선하기 쉬운	\N	\N	\N	gongmuwon	상
5916	distill	증류하다; 증류하여 불순물을 제거하다	\N	\N	\N	gongmuwon	중
5885	discreet	사려있는	\N	\N	\N	gongmuwon	하
5947	ebullient	끓어 넘치는; 넘쳐 흐르는	\N	\N	\N	gongmuwon	중
6033	exclude	제외하다	\N	\N	\N	gongmuwon	하
6084	fertile	기름진	\N	\N	\N	gongmuwon	하
6220	hubris	오만	\N	\N	\N	gongmuwon	하
6267	improbable	일어날 듯하지 않은	\N	\N	\N	gongmuwon	하
6323	install	설치하다; 자리에 앉히다	\N	\N	\N	gongmuwon	하
6605	pitch in	열심히 하기 시작하다; 서로 협력하다; 참여하다	\N	\N	\N	gongmuwon	기타
6749	reluctant	마음 내키지 않는; 마지못해 하는	\N	\N	\N	gongmuwon	하
6816	sadistic	가학적인	\N	\N	\N	gongmuwon	하
6570	paramount	최고의; 주요한; 탁월한; 훌륭한	\N	\N	\N	gongmuwon	하
6694	punctual	시간을 잘 지키는	\N	\N	\N	gongmuwon	하
6725	recount	자세히 말하다	\N	\N	\N	gongmuwon	하
6780	resurrection	부활	\N	\N	\N	gongmuwon	하
6819	salvage	구출; 인명구조; 해난구조	\N	\N	\N	gongmuwon	하
6923	strain	잡아 당기다	\N	\N	\N	gongmuwon	하
6847	sentient	감각력이 있는; 의식하는	\N	\N	\N	gongmuwon	하
6977	term	말; 술어	\N	\N	\N	gongmuwon	하
11618	be covered with	으로 덮여있다	\N	\N	\N	gtelp	기타
15925	acknowledge	v . 인정 하다 : ~ 에게 감사 를 표하다 . 받았음 을 알리다	\N	\N	\N	toeic	하
3975	digressive	a. 주제를 벗어나기 쉬운; 탈선하기 쉬운(=deflectable); 지엽적인(=unessential	\N	\N	\N	toefl	상
9851	attract	유혹하다 마음을 끌어당기다	\N	\N	\N	gtelp	하
4728	maladroit	솜씨 없는	\N	\N	\N	toefl	중
4822	nearly	거의	\N	\N	\N	toefl	하
4599	insurmountable	극복할 수 없는	\N	\N	\N	toefl	하
4903	orient	(~을) 지향하게 하다; (특정 목적에) 맞추다; (새로운 상황에) 적응하다(익숙해지다)	\N	\N	\N	toefl	하
4972	persuasively	ad. 설득력 있게	\N	\N	\N	toefl	중
4984	piscina	양어지 양어장	\N	\N	\N	toefl	하
5005	ponderous	무거운	\N	\N	\N	toefl	중
5253	scrupulous	양심적인; 세심한	\N	\N	\N	toefl	중
5352	starry-eyed	a. 몽상적인	\N	\N	\N	toefl	기타
13336	Hello!	안녕하세요!	\N	\N	\N	kr-en-basic	기타
13340	Thank you! (Informal)	고맙습니다!	\N	\N	\N	kr-en-basic	기타
13342	Me too!	저두요!	\N	\N	\N	kr-en-basic	기타
13346	Hello? (Over the phone)	여보세요?	\N	\N	\N	kr-en-basic	기타
13352	How about your mother?	어머니는요?	\N	\N	\N	kr-en-basic	기타
13356	Why?	왜?	\N	\N	\N	kr-en-basic	기타
13357	Really	진짜	\N	\N	\N	kr-en-basic	하
13363	To not exist / To not be there / To not have (V)	없다	\N	\N	\N	kr-en-basic	기타
13368	Bag	가방	\N	\N	\N	kr-en-basic	하
13369	That (inanimate object)	그거	\N	\N	\N	kr-en-basic	기타
13371	Mom	엄마	\N	\N	\N	kr-en-basic	하
13377	Three (K)	셋	\N	\N	\N	kr-en-basic	기타
13382	Eight (K)	여덟	\N	\N	\N	kr-en-basic	기타
13384	Ten (K)	열	\N	\N	\N	kr-en-basic	기타
13385	Eleven (K)	열하나	\N	\N	\N	kr-en-basic	기타
13387	Thirty	서른	\N	\N	\N	kr-en-basic	하
13392	One (S)	일	\N	\N	\N	kr-en-basic	기타
13395	Four (S)	사	\N	\N	\N	kr-en-basic	기타
13396	Five (S)	오	\N	\N	\N	kr-en-basic	기타
13397	Six (S)	육	\N	\N	\N	kr-en-basic	기타
13402	Month	월	\N	\N	\N	kr-en-basic	하
13403	Day / Date	일	\N	\N	\N	kr-en-basic	기타
13404	Birthday	생일	\N	\N	\N	kr-en-basic	하
13407	Minute	분	\N	\N	\N	kr-en-basic	하
13408	Hour	시	\N	\N	\N	kr-en-basic	하
13409	What time is it?	몇시예요?	\N	\N	\N	kr-en-basic	기타
13410	Now	지금	\N	\N	\N	kr-en-basic	하
13413	Wednesday	수요일	\N	\N	\N	kr-en-basic	하
13415	Friday	금요일	\N	\N	\N	kr-en-basic	하
13416	Saturday	토요일	\N	\N	\N	kr-en-basic	하
13418	Money	돈	\N	\N	\N	kr-en-basic	하
13420	Tomorrow	내일	\N	\N	\N	kr-en-basic	하
13421	Present	선물	\N	\N	\N	kr-en-basic	하
13422	Mr (older)	아저씨	\N	\N	\N	kr-en-basic	기타
13429	Water	물	\N	\N	\N	kr-en-basic	하
13436	In front	앞	\N	\N	\N	kr-en-basic	기타
13443	Police station	경찰서	\N	\N	\N	kr-en-basic	기타
13445	Convenience store	평의점	\N	\N	\N	kr-en-basic	기타
13446	Subway	지하철	\N	\N	\N	kr-en-basic	하
13448	Because of	때문에	\N	\N	\N	kr-en-basic	기타
13450	1	천	\N	\N	\N	kr-en-basic	기타
13451	10	만	\N	\N	\N	kr-en-basic	기타
13455	I (formal)	저	\N	\N	\N	kr-en-basic	기타
13456	I (casual)	나	\N	\N	\N	kr-en-basic	기타
13458	You (intimate)	너	\N	\N	\N	kr-en-basic	기타
13459	Too	도	\N	\N	\N	kr-en-basic	하
13463	Rich person	부자	\N	\N	\N	kr-en-basic	기타
13465	Boyfriend	남자친구	\N	\N	\N	kr-en-basic	하
13469	How about ...? / How is it?	어때요?	\N	\N	\N	kr-en-basic	기타
13471	Cake	케이크	\N	\N	\N	kr-en-basic	하
13472	Sandwich	센드위치	\N	\N	\N	kr-en-basic	하
13477	Picture / Photo	사진	\N	\N	\N	kr-en-basic	기타
13480	Let's watch!	보자!	\N	\N	\N	kr-en-basic	기타
13481	Let's go!	가자!	\N	\N	\N	kr-en-basic	기타
13485	Swimming pool	수영장	\N	\N	\N	kr-en-basic	기타
13486	I don't want to!	싫어!	\N	\N	\N	kr-en-basic	기타
13489	Yellow	노란	\N	\N	\N	kr-en-basic	하
13493	Kimchee soup	김치찌개	\N	\N	\N	kr-en-basic	기타
13494	Curry	카레	\N	\N	\N	kr-en-basic	하
13496	It's hot!	뜨거워!	\N	\N	\N	kr-en-basic	기타
13498	This	이	\N	\N	\N	kr-en-basic	하
13500	To not know (V)	몰르다	\N	\N	\N	kr-en-basic	기타
13501	Tylenol	타이레놀	\N	\N	\N	kr-en-basic	하
13503	To be bad (V)	나쁘다	\N	\N	\N	kr-en-basic	기타
13507	To want to drink	마시고 싶어	\N	\N	\N	kr-en-basic	기타
13508	To want to eat	먹고 싶어	\N	\N	\N	kr-en-basic	기타
13511	More	더	\N	\N	\N	kr-en-basic	하
13518	Slow	느려요	\N	\N	\N	kr-en-basic	하
13522	Just (no reason)	그냥	\N	\N	\N	kr-en-basic	기타
13526	To read (V)	읽다	\N	\N	\N	kr-en-basic	기타
13528	Green	초록	\N	\N	\N	kr-en-basic	하
13530	Brown	갈색	\N	\N	\N	kr-en-basic	하
13531	Gray	회색	\N	\N	\N	kr-en-basic	하
13533	To be able to (V)	할 수 있다	\N	\N	\N	kr-en-basic	기타
13538	Hot	더워	\N	\N	\N	kr-en-basic	하
13539	Honey (married couple nickname)	여보	\N	\N	\N	kr-en-basic	기타
13548	(More) than	보다	\N	\N	\N	kr-en-basic	기타
13549	Simple	단수해	\N	\N	\N	kr-en-basic	하
13550	To like (V)	좋다	\N	\N	\N	kr-en-basic	기타
13551	Laundry	빨래	\N	\N	\N	kr-en-basic	하
13552	Cleaning	전소	\N	\N	\N	kr-en-basic	하
13554	To cook (V)	요리 하다	\N	\N	\N	kr-en-basic	기타
13555	To study (V)	공부 하다	\N	\N	\N	kr-en-basic	기타
13557	Shopping	쇼핑	\N	\N	\N	kr-en-basic	하
13558	To buy (V)	사다	\N	\N	\N	kr-en-basic	기타
13563	Cucumber	오이	\N	\N	\N	kr-en-basic	하
13564	Carrot	당근	\N	\N	\N	kr-en-basic	하
13565	To be easy	쉬워	\N	\N	\N	kr-en-basic	기타
13571	Kg / Km	킬러	\N	\N	\N	kr-en-basic	기타
13576	To be busy (V)	바쁘다	\N	\N	\N	kr-en-basic	기타
13581	Then / if that's the case ...	그럼	\N	\N	\N	kr-en-basic	기타
13582	To be embarrassing (V)	창피하다	\N	\N	\N	kr-en-basic	기타
13588	Congrats!	훅하해!	\N	\N	\N	kr-en-basic	기타
10583	severe temperature	심한 온도	\N	\N	\N	gtelp	기타
13039	เสียวไส้	420. 오싹해, 소름끼쳐, 조마조마해.	씨v여우 싸＾이 오싹하다, 소름끼치다 (동물의) 장, (만두 등의) 속, 내정, 실정	\N	\N	thai-conversation	기타
13596	Spicy	메워요	\N	\N	\N	kr-en-basic	하
5382	stubby	땅딸막한	\N	\N	\N	toefl	하
5421	acquiesce	잠자코 따르다; 묵인하다	\N	\N	\N	gongmuwon	중
5059	prohibit	금지하다	\N	\N	\N	toefl	하
5066	prolong	연장하다	\N	\N	\N	toefl	하
5324	specify	(구체적으로) 명시하다	\N	\N	\N	toefl	하
5365	stifling	숨막히는	\N	\N	\N	toefl	하
5103	putative	' 추정의	\N	\N	\N	toefl	하
5189	resolute	굳게 결심한	\N	\N	\N	toefl	하
5251	screen	상영하다/가려내다	\N	\N	\N	toefl	하
5282	shrewdly	기민하게	\N	\N	\N	toefl	중
5341	spurn	경멸하다	\N	\N	\N	toefl	중
5622	carefree	무사태평한	\N	\N	\N	gongmuwon	하
5739	contentious	다투기 좋아하는	\N	\N	\N	gongmuwon	하
5579	bleak	(장래	\N	\N	\N	gongmuwon	하
5600	brink	가장자리	\N	\N	\N	gongmuwon	하
5747	contrite	죄를 깊이 뉘우치고 있는	\N	\N	\N	gongmuwon	중
5768	counterfeit	위조의	\N	\N	\N	gongmuwon	하
5827	demolish	(건물 따위를) 파괴하다	\N	\N	\N	gongmuwon	하
5881	disclaim	부인하다	\N	\N	\N	gongmuwon	하
5903	dispense	분해하다	\N	\N	\N	gongmuwon	하
5935	drivel	침(콧물)을 흘리다; 철없는 소리를 하다; 낭비하다	\N	\N	\N	gongmuwon	하
6153	generalize	특정 사실에서 법칙을 이끌어내다	\N	\N	\N	gongmuwon	하
5894	disintegration	분해	\N	\N	\N	gongmuwon	하
5899	disoriented	방향감각을 잃은; 정신적 혼란에 빠진	\N	\N	\N	gongmuwon	하
6109	forbid	금지하다; 허락하지 않다	\N	\N	\N	gongmuwon	하
6151	gelatinous	아교질의; 젤라틸으로 된	\N	\N	\N	gongmuwon	중
6212	hinder	방해하다	\N	\N	\N	gongmuwon	하
6253	imperil	위험하게 하다	\N	\N	\N	gongmuwon	중
6285	incumbent	의무가 있는	\N	\N	\N	gongmuwon	하
6326	insufferable	참을 수 없는	\N	\N	\N	gongmuwon	중
6396	lethal	치명적인; 죽음에 이르는	\N	\N	\N	gongmuwon	하
6421	mainspring	시계의 큰 태엽; 주요 원인	\N	\N	\N	gongmuwon	중
6321	inspect	세심하게 조사하다	\N	\N	\N	gongmuwon	하
6381	lapse	시간의 경과	\N	\N	\N	gongmuwon	하
6438	maul	뭇매질하다; 짐승 등이 할퀴어 상처내다	\N	\N	\N	gongmuwon	하
6492	nascent	발생하려고 하는; 초기의	\N	\N	\N	gongmuwon	하
6431	maritime	바다의	\N	\N	\N	gongmuwon	하
6581	paycheck	급료지불수표	\N	\N	\N	gongmuwon	하
6529	opinionated	자기 주장을 끈덕지게 고집하는	\N	\N	\N	gongmuwon	하
6588	periodical	정기 간행물	\N	\N	\N	gongmuwon	하
6721	recess	일시적인 휴식; 휴가	\N	\N	\N	gongmuwon	하
6653	presumptuous	주제넘은	\N	\N	\N	gongmuwon	중
6843	selfmade	자력으로 입신 출세한; 자기가 만든; 자작의	\N	\N	\N	gongmuwon	중
11475	keep A from B A B	가 하는 것을 막다	\N	\N	\N	gtelp	기타
11571	be supposed toV	하기로 되어있다	\N	\N	\N	gtelp	기타
11317	process	과정	\N	\N	\N	gtelp	하
11335	prepare	준비하다	\N	\N	\N	gtelp	하
11500	lecture	강연 강의	\N	\N	\N	gtelp	하
11593	appear	인 것 같다 나타나다	\N	\N	\N	gtelp	하
11632	ride	탈것에타다	\N	\N	\N	gtelp	하
728	unnecessarily	불필요하게 쓸데없이	\N	\N	\N		하
11984	พอได้ ก็ได้มาก	34. 충분한데 그 이상이다. (비만 오면, 쏟아붓는다.)	퍼어  다＾이   꺼   다＾이 마＾악 충분하다 가능하다 ~도, ~면 가능하다 많이	\N	\N		기타
12070	เขาเป็นเจ้าของความคิด	120. 이건 그사람 아이디어야.	카오↗ 뻰 짜＾오 커v엉 콰암킷↗ 그 ~ 이다 주인 ~ 의 생각	\N	\N		기타
12085	ไม่ย่อท้อ	132. 기죽은 게 아냐, 의기소침한 게 아냐.	마＾이 여＾어 터어↗ ~ 아니다 기죽다, 의기소침해지다, 전의를 상실하다	\N	\N		기타
12234	กว่าเขา จะมา ก็ดึก แล้ว	224. 그가 도착할 때쯤이면, 이미 밤이 깊었을 거야.	꽈아↘ 카오↗ 짜↘   마아   꺼＾ 득↘   래우↗ ~ 까지, ~ 했을 때는 그 ~ 할것이다 오다 ~ 하면 심야, 밤이 깊다 이미, 벌써	\N	\N		기타
12161	ตกลงตามนี้	188. 이대로 하는 걸로 하죠	똑↘ 롱   따암   니이↗ 동의하다, 결정하다 ~ 대로, ~ 에 따라서 이	\N	\N		기타
12207	ยิง กระต่าย		ยิง (잉 : 쏘다) + กระต่าย (까따이↘ : 토끼) = 토끼사냥을 하다 라는 뜻 차 타고 가다가 갓길에 내려서 남자가 소변보다 남성의 숲속 방뇨(?)	\N	\N		기타
12250	นักพนันมือ อาชีพ	236. 프로 도박사	낙↗ 파↗난 므으 아아 치＾입 ~ 사, ~ 가 내기하다 1) 손 2) 도박이나 계 등의 멤버 직업프로	\N	\N		기타
12320	ถ้าไม่ได้คุณฉัน คงแย่	283. 만약에 당신이 없으면, 나는 아마 곤란할 거야.	타＾아 마＾이 다＾이 쿤 폼v 콩 얘＾애 만약 아니다 얻다, 있다 당신 나 아마 ~ 일 것이다 매우 곤란하다, 아주 어렵다	\N	\N		기타
12271	กิน ไม่ได้นอน ไม่หลับ	244. 먹을 수도 없고, 잘 수도 없어.	낀 마＾이 다＾이 너언 마＾이 랍↘ 먹다 ~ 할 수 없다 눕다, 자다 ~ 아니다 (눈을)감다,자다	\N	\N		기타
12315	ท่าทางมีความ สุข	280. 행복해 보여.	타＾아 타앙 미이 콰암   쑥↘ 자세, 풍모, 형세 있다 ~ 함, ~ 하기 (명사형 어미) 행복하다 태국인들은 99.9 % เขามีความสุข (카오↗ 미이 콰암 쑥↘) 이라고 말한다.우리말 뜻으로는 그는 / 가지고 있다 / 행복함을.	\N	\N		기타
13599	thread	실	\N	\N	\N		하
13600	needle	바늘	\N	\N	\N		하
13601	pattern	도안 모양	\N	\N	\N		하
13602	distribute	분배하다	\N	\N	\N		하
13603	distributor	분배업자 도매상인	\N	\N	\N		하
13604	for oneself	혼자의 힘으로	\N	\N	\N		기타
13605	feature n v	특징 특징을 이루다	\N	\N	\N		기타
13606	creativity	창조성	\N	\N	\N		하
13608	tend to Root	하는 경향이 있다	\N	\N	\N		기타
13609	celebrate	기념하다	\N	\N	\N		하
13610	woodcutter	나무꾼	\N	\N	\N		중
13611	hut	오두막	\N	\N	\N		하
13612	by signalling	신호로서	\N	\N	\N		기타
13613	indicate	가리키다	\N	\N	\N		하
13614	gratitude	감사	\N	\N	\N		하
13615	scold	꾸짖다 비난하다	\N	\N	\N		중
13616	care for	돌보다	\N	\N	\N		기타
13617	look after	돌보다	\N	\N	\N		기타
13619	natural response	자연스러운 반응	\N	\N	\N		기타
13620	According to	에 따르면	\N	\N	\N		기타
13621	recent study	최근의 연구	\N	\N	\N		기타
13622	do harm	해가 되다	\N	\N	\N		기타
13623	keep going on	계속해서 해나가다	\N	\N	\N		기타
13624	courage	용기	\N	\N	\N		하
13625	courageous	용기 있는	\N	\N	\N		하
13627	encouragement	격려	\N	\N	\N		하
13628	discourage	실망시키다 낙담시키다	\N	\N	\N		하
13629	recover	회복하다	\N	\N	\N		하
13630	benefit	이익	\N	\N	\N		하
13631	beneficial effect on	에 이로운 영향	\N	\N	\N		기타
13632	activity	활동	\N	\N	\N		하
13633	inactivity	비 활동	\N	\N	\N		하
13634	muscle weakness	근육약화	\N	\N	\N		기타
13635	depress	우울하게 만들다	\N	\N	\N		하
13636	depression	우울증	\N	\N	\N		하
13638	awesome trick	멋진 묘기	\N	\N	\N		기타
13639	amazing animal	놀라운 동물	\N	\N	\N		기타
13640	accompany	동반하다 수반하다	\N	\N	\N		하
13642	grand	웅장한	\N	\N	\N		하
13643	grand prize	대상	\N	\N	\N		기타
13644	include	포함하다	\N	\N	\N		하
13645	accommodations	숙박	\N	\N	\N		하
13646	encyclopedia	백과사전	\N	\N	\N		하
13647	the unique appeal	독특한 매력	\N	\N	\N		기타
13648	slim plates	가느다란 판	\N	\N	\N		기타
13649	enable A to Root A	가 하는 것을 가능하게하다	\N	\N	\N		기타
13650	powerproducing	동력을 발생시키는	\N	\N	\N		기타
13651	device	장치	\N	\N	\N		하
13652	expert	전문가 숙련가	\N	\N	\N		하
13653	advanced form	진보된 형태	\N	\N	\N		기타
13654	highly skilled sport	고도로 숙련된 스포츠	\N	\N	\N		기타
13655	soar	하늘로 솟아오르다	\N	\N	\N		하
13656	obstacle	장애물	\N	\N	\N		하
13658	bureau	사무소 국	\N	\N	\N		하
13659	census bureau	인구조사국	\N	\N	\N		기타
13660	popularity	인기	\N	\N	\N		하
13661	population	인구	\N	\N	\N		하
13662	calculate	계산하다	\N	\N	\N		하
13663	million	억	\N	\N	\N		하
13664	conduct	수행하다	\N	\N	\N		하
13665	predict	예측하다	\N	\N	\N		하
13666	omit	생략하다 누락하다	\N	\N	\N		하
13667	illegal immigrant	불법이민자	\N	\N	\N		기타
13668	precise	정확한	\N	\N	\N		하
13669	confident	확신하는	\N	\N	\N		하
13671	comic strip	연재만화	\N	\N	\N		기타
13672	remark	말하다 언급하다	\N	\N	\N		하
13673	mound	투수 마운드	\N	\N	\N		하
13674	faith	신념 확신	\N	\N	\N		하
13675	When it comes to ing	에 관한 한	\N	\N	\N		기타
13676	in other words	즉 다시 말해서	\N	\N	\N		기타
13677	as it were	즉 다시 말해서	\N	\N	\N		기타
13678	that is	즉 다시 말해서	\N	\N	\N		기타
13680	pursuit	추구	\N	\N	\N		하
13681	the pursuit of happiness	행복의 추구	\N	\N	\N		기타
13682	demand	요구 수요	\N	\N	\N		하
13683	realization	실현 현실화	\N	\N	\N		하
13684	frightened	두려운	\N	\N	\N		하
13685	scared	두려운	\N	\N	\N		하
13686	confused	혼란스러운	\N	\N	\N		하
13687	dogs biting people	사람을 무는 개들	\N	\N	\N		기타
13689	bite bit bitten	물다	\N	\N	\N		기타
13690	in this case	이런 경우에	\N	\N	\N		기타
13691	protect	보호하다	\N	\N	\N		하
13692	award	상	\N	\N	\N		하
13693	reward	보상	\N	\N	\N		하
13694	safety tips	안전 충고수칙	\N	\N	\N		기타
13695	approach	접근하다	\N	\N	\N		하
13696	lawyer	변호사	\N	\N	\N		하
13697	commute	통근하다	\N	\N	\N		하
13698	commuter train	통근기차	\N	\N	\N		기타
13699	CEO	최고경영자	\N	\N	\N		하
13701	principle	원리 원칙	\N	\N	\N		하
13702	daydream	공상에 잠기다	\N	\N	\N		하
13703	complain	불평하다	\N	\N	\N		하
13704	complaint	불평	\N	\N	\N		하
13705	reluctant to Root	마지못해서 하다	\N	\N	\N		기타
13706	be willing to Root	기꺼이 하다	\N	\N	\N		기타
13707	opportunity	기회	\N	\N	\N		하
13708	behavior	행동 처신	\N	\N	\N		하
13709	instinct	본능	\N	\N	\N		하
13710	instinctive	본능적인	\N	\N	\N		하
13712	biological need	생물학적인 욕구	\N	\N	\N		기타
13713	mammal	포유동물	\N	\N	\N		하
13714	genetic characters	유전적 특성	\N	\N	\N		기타
13715	complex	복잡한	\N	\N	\N		하
13716	process	과정 절차	\N	\N	\N		하
13717	enormous	거대한 막대한	\N	\N	\N		하
13718	tumble	구르다	\N	\N	\N		하
13720	stair	계단	\N	\N	\N		하
13721	below me	내 아래	\N	\N	\N		기타
13722	stretch	쭉 뻗다 잡아 늘리다	\N	\N	\N		하
13723	stare at	빤히 쳐다 보다 응시하다	\N	\N	\N		기타
13725	grateful	감사해하는	\N	\N	\N		하
13726	pleased	기쁜	\N	\N	\N		하
13728	embarrassed	당혹해하는 난처한	\N	\N	\N		하
13729	motorist	자가용 운전수	\N	\N	\N		하
13730	cigarette butt	담배 공초	\N	\N	\N		기타
13731	food container	음식물 용기	\N	\N	\N		기타
13732	vehicle	탈 것 차량	\N	\N	\N		하
13733	rubbish	쓰레기	\N	\N	\N		하
13734	trash	쓰레기	\N	\N	\N		하
13736	litter	더럽히다	\N	\N	\N		하
13737	seriously	심각하게 진지하게	\N	\N	\N		하
13738	muscles and joints	근육과 관절	\N	\N	\N		기타
13739	flexible	유연한	\N	\N	\N		하
13740	flexibility	유연성	\N	\N	\N		하
13741	mobility	움직임	\N	\N	\N		하
13742	moral	도덕적인	\N	\N	\N		하
13744	morality	도덕성	\N	\N	\N		하
13745	inform	알리다	\N	\N	\N		하
13746	reform	개혁하다	\N	\N	\N		하
13747	perform	수행하다	\N	\N	\N		하
13749	differ from	과 다르다	\N	\N	\N		기타
13750	spine	척추	\N	\N	\N		하
13751	oxygen	산소	\N	\N	\N		하
13752	internal organ	내장기관 내부 장기	\N	\N	\N		기타
13753	tissue	조직	\N	\N	\N		하
13754	maintain	유지하다	\N	\N	\N		하
13755	everyday routine	일상생활	\N	\N	\N		기타
13756	stiff	뻐근한 뻣뻣한	\N	\N	\N		하
13758	fasten	고정시키다	\N	\N	\N		하
13759	horizontally	수평으로	\N	\N	\N		하
13760	vertically	수직으로	\N	\N	\N		하
13761	grindgroundground	갈다	\N	\N	\N		기타
13762	grinding device	가는 기계	\N	\N	\N		기타
13764	be used to ing	하는데 익숙하다	\N	\N	\N		기타
13765	used to Root	하곤 했다	\N	\N	\N		기타
13766	flour	밀가루	\N	\N	\N		하
13767	paste	반죽	\N	\N	\N		하
13768	grain	곡물	\N	\N	\N		하
13769	mill n v	분쇄기 가루로 만들다	\N	\N	\N		기타
13770	in addition	게다가	\N	\N	\N		기타
13771	attach	붙이다 부착하다	\N	\N	\N		하
13772	detach	떨어뜨리다 분리하다	\N	\N	\N		하
13773	the grain jammed	짓눌려진 곡물	\N	\N	\N		기타
13774	groove	홈	\N	\N	\N		하
13775	concept	개념	\N	\N	\N		하
13776	care	보살핌	\N	\N	\N		하
13778	comfort	안락 위안	\N	\N	\N		하
13779	support	지원 지지 지원하다	\N	\N	\N		하
13780	lifelimiting illness	불치병	\N	\N	\N		기타
13781	no longer	더 이상 이 아니다	\N	\N	\N		기타
13782	respond to	에 반응하다	\N	\N	\N		기타
13783	treatment	치료	\N	\N	\N		하
13784	human dignity	인간의 존엄성	\N	\N	\N		기타
13785	counseling service	상담서비스	\N	\N	\N		기타
13787	professional	전문가	\N	\N	\N		하
13788	deal with	다루다 치료하다	\N	\N	\N		기타
13789	spiritual impact	정신적 충격	\N	\N	\N		기타
13790	emotional	정신적인 감성적인	\N	\N	\N		하
13791	something complex	복잡한 무엇인가	\N	\N	\N		기타
13792	scribble	갈겨쓰다	\N	\N	\N		하
13793	necessary	필요한	\N	\N	\N		하
13795	avoid	피하다	\N	\N	\N		하
13796	erase	지우다	\N	\N	\N		하
13797	refer to	언급하다 말하다	\N	\N	\N		기타
13798	if necessary	필요하다면	\N	\N	\N		기타
13799	attract	유혹하다 마음을 끌어당기다	\N	\N	\N		하
13800	attention	관심	\N	\N	\N		하
13801	effectively	효과적으로	\N	\N	\N		하
13802	explain	설명하다	\N	\N	\N		하
13803	explanation	설명	\N	\N	\N		하
13805	in contrast	반대로	\N	\N	\N		기타
13806	positive	긍정적인	\N	\N	\N		하
13807	negative	부정적인	\N	\N	\N		하
13808	competition	경쟁	\N	\N	\N		하
13809	attitude	태도	\N	\N	\N		하
13810	overcome	극복하다	\N	\N	\N		하
13811	defeat	부수다 이기다	\N	\N	\N		하
13812	recognize	인식하다	\N	\N	\N		하
13813	focus on	초점을 맞추다	\N	\N	\N		기타
13814	weakness	약점	\N	\N	\N		하
13815	explorer	탐험가	\N	\N	\N		하
13817	caravan	여행 대	\N	\N	\N		하
13818	award n v	상 상을 주다	\N	\N	\N		기타
13819	reward n v	보상 보상하다	\N	\N	\N		기타
13821	in gaining support	지원을 얻는데	\N	\N	\N		기타
13822	in theory	이론상	\N	\N	\N		기타
13823	particular path	특별한 길	\N	\N	\N		기타
13824	equip	장비를 갖추다	\N	\N	\N		하
13825	equipment	장비	\N	\N	\N		하
13826	take over	양도받다 물려받다	\N	\N	\N		기타
13827	aging population	노령인구	\N	\N	\N		기타
13828	above graph	위 도표	\N	\N	\N		기타
13830	be expected to Root	할 것으로 기대되어진다	\N	\N	\N		기타
13831	while	반면에 동안	\N	\N	\N		하
13832	gradual rise	점차적인 증가	\N	\N	\N		기타
13833	figure	숫자 모양	\N	\N	\N		하
13834	social context	사회적 상황	\N	\N	\N		기타
13835	various	다양한	\N	\N	\N		하
13837	female	여성의	\N	\N	\N		하
13838	happen to Root	우연히 알게 되다	\N	\N	\N		기타
13839	researcher	학자 연구자	\N	\N	\N		하
13840	prove	증명하다	\N	\N	\N		하
13841	pregnant	임신한	\N	\N	\N		하
13842	pregnancy	임신	\N	\N	\N		하
13844	male hormone	남성호르몬	\N	\N	\N		기타
13845	due to	때문에	\N	\N	\N		기타
13847	communicative connection	의사소통연결고리	\N	\N	\N		기타
13848	three times	세배	\N	\N	\N		기타
13849	floor	가속페달을 밟다	\N	\N	\N		하
13850	slam	쾅 부딪히다	\N	\N	\N		하
13851	all of a sudden	갑자기	\N	\N	\N		기타
13852	all at once	갑자기	\N	\N	\N		기타
13853	explode	폭발하다	\N	\N	\N		하
13979	temperature	온도	\N	\N	\N		\N
13980	lack	부족 결핍	\N	\N	\N		\N
13981	longdistance	장거리	\N	\N	\N		\N
13982	rare	보기 드문 희귀한	\N	\N	\N		\N
13983	researcher	연구조사원	\N	\N	\N		\N
13984	search for	을 찾다	\N	\N	\N		\N
13985	avoid	피하다	\N	\N	\N		\N
13986	toxic object	독이 있는 물질	\N	\N	\N		\N
13987	purple	보라색	\N	\N	\N		\N
13988	dye	염색하다	\N	\N	\N		\N
13855	gunshop	총격	\N	\N	\N		기타
13856	head for	로 향하다	\N	\N	\N		기타
13857	teartoretorn	찢다	\N	\N	\N		기타
13859	spin spanspun	돌다	\N	\N	\N		기타
13860	passerby	지나가는 사람 행인	\N	\N	\N		중
13861	festive	축제 같은 즐거운	\N	\N	\N		하
13862	urgent	다급한 긴박한	\N	\N	\N		하
13864	promising	가망 있는 유망한	\N	\N	\N		하
13865	pressure	압력 압박	\N	\N	\N		하
13866	exhausted	녹초가 된 기진맥진한	\N	\N	\N		하
13867	colleague	동료	\N	\N	\N		하
13868	customer	고객	\N	\N	\N		하
13869	nothing left	남겨진 것이 아무것도 없다	\N	\N	\N		기타
13870	gladiator	검투사	\N	\N	\N		하
13871	battle	전투	\N	\N	\N		하
13872	weary	피로한 지친	\N	\N	\N		하
13873	wearily	지쳐서	\N	\N	\N		중
13875	regain	되찾다	\N	\N	\N		하
13876	calmness	평온함 안정	\N	\N	\N		하
13877	this sorry scenario	이 슬픈 상황	\N	\N	\N		기타
13878	scenario	극본 상황 대본	\N	\N	\N		하
13879	greet	인사하다	\N	\N	\N		하
13881	bamboo	대나무	\N	\N	\N		하
13882	stick	막대기	\N	\N	\N		하
13883	gunpowder	화약	\N	\N	\N		하
13884	explode	폭발시키다	\N	\N	\N		하
13885	scare away	겁주어 ㅉㅗㅈ아내다	\N	\N	\N		기타
13886	evil spirits	악령	\N	\N	\N		기타
13887	various	다양한	\N	\N	\N		하
13889	bomb	폭탄	\N	\N	\N		하
13890	burst	터지다 폭발하다	\N	\N	\N		하
13891	key part	중요한 역할	\N	\N	\N		기타
13892	celebrate	축하하다	\N	\N	\N		하
13893	national holidays	국경일	\N	\N	\N		기타
13894	cultural events	문화 행사	\N	\N	\N		기타
13895	Trans fat	트랜스 지방	\N	\N	\N		기타
13896	increase	증가시키다	\N	\N	\N		하
13897	total	전체의	\N	\N	\N		하
13898	level	수준	\N	\N	\N		하
13900	sink	부엌 싱크대	\N	\N	\N		하
13901	that is	즉 다시 말하면	\N	\N	\N		기타
13902	block up	막다 방해하다	\N	\N	\N		기타
13903	blood vessel	혈관	\N	\N	\N		기타
13904	as a result	그 결과	\N	\N	\N		기타
13906	smooth	부드러운 유연한	\N	\N	\N		하
13907	contain	포함하다 이 들어 있다	\N	\N	\N		하
13908	be likely toR R	할 것 같다	\N	\N	\N		기타
13909	heart disease	심장 질환	\N	\N	\N		기타
13910	therefore	그러므로	\N	\N	\N		하
13911	communicate with	와 의사소통하다	\N	\N	\N		기타
13912	insect	곤충	\N	\N	\N		하
13913	such as	와 같은	\N	\N	\N		기타
13914	over there	저쪽에	\N	\N	\N		기타
13916	a ind of	일종의	\N	\N	\N		기타
13917	location	위치	\N	\N	\N		하
13918	mammal	포유동물	\N	\N	\N		하
13919	whale	고래	\N	\N	\N		하
13920	exchange	교환하다	\N	\N	\N		하
13921	symbol	상징	\N	\N	\N		하
13923	thought	생각	\N	\N	\N		하
13924	ease	덜다 완화시키다	\N	\N	\N		하
13925	pain	고통	\N	\N	\N		하
13926	loss	상실 잃음	\N	\N	\N		하
13927	special	특별한	\N	\N	\N		하
13928	in many ways	여러 면에서	\N	\N	\N		기타
13929	sense of humor	유머 감각	\N	\N	\N		기타
13930	passion	열정	\N	\N	\N		하
13931	pleasure	기쁨	\N	\N	\N		하
13933	funeral	장례식	\N	\N	\N		하
13934	come by	에 들리다	\N	\N	\N		기타
13935	in the meantime	그사이에	\N	\N	\N		기타
13937	take time from sleep	잠 잘 시간을 뺐다	\N	\N	\N		기타
13938	supper	저녁식사	\N	\N	\N		하
13939	society	사회	\N	\N	\N		하
13940	open	열려있는	\N	\N	\N		하
13941	company	회사	\N	\N	\N		하
13942	employee	종업원 사원	\N	\N	\N		하
13943	television station TV	방송국	\N	\N	\N		기타
13944	broadcast	방송하다	\N	\N	\N		하
13945	these days	요즘	\N	\N	\N		기타
13946	common	일반적인	\N	\N	\N		하
13947	express	표현하다	\N	\N	\N		하
13948	romantic	낭만적인	\N	\N	\N		하
13949	nervous	흥분하기 쉬운	\N	\N	\N		하
13950	decoration	장식	\N	\N	\N		하
13951	bouquet	부케	\N	\N	\N		하
13952	anniversary	기념일	\N	\N	\N		하
13954	select	선택하다	\N	\N	\N		하
13955	present	에게 주다	\N	\N	\N		하
13956	celebration	축하	\N	\N	\N		하
13957	exactly	정확하게	\N	\N	\N		하
13958	opinion	의견	\N	\N	\N		하
13960	dont have toR R	할 필요 없다	\N	\N	\N		기타
13961	difference	차이	\N	\N	\N		하
13962	accept	받아들이다	\N	\N	\N		하
13963	negative	부정적인	\N	\N	\N		하
13964	thought	생각	\N	\N	\N		하
13965	that is	즉	\N	\N	\N		기타
13966	diligent	부지런한	\N	\N	\N		하
13967	intelligent	지적인	\N	\N	\N		하
13968	bowl	주발 공기	\N	\N	\N		하
13969	separate	떼어 놓다	\N	\N	\N		하
13970	immediately	즉시	\N	\N	\N		하
13971	notice	알아차리다	\N	\N	\N		하
13972	behave	행동하다	\N	\N	\N		하
13973	strangely	이상하게	\N	\N	\N		하
13974	bang	쾅 부딪히다	\N	\N	\N		하
13976	float	뜨다 표류하다	\N	\N	\N		하
13977	surface	표면	\N	\N	\N		하
13978	broken heart	실연	\N	\N	\N		기타
13989	serve	음식을 차려내다	\N	\N	\N		\N
13990	appetite	식욕	\N	\N	\N		\N
13991	on the other hand	반면에	\N	\N	\N		\N
13992	decoration	장식	\N	\N	\N		\N
13993	most of	대부분	\N	\N	\N		\N
13994	textmessage	문자를 주고받다	\N	\N	\N		\N
13995	poetry	시	\N	\N	\N		\N
13996	common	일반적인	\N	\N	\N		\N
13997	education	교육	\N	\N	\N		\N
13998	any more	더 이상	\N	\N	\N		\N
13999	indoor	실내의	\N	\N	\N		\N
14000	be full of	으로 가득 차다	\N	\N	\N		\N
14001	for the first time	처음으로	\N	\N	\N		\N
14002	feel like	처럼 느끼다	\N	\N	\N		\N
14003	counselor	상담원 캠프지도자	\N	\N	\N		\N
14004	realize	깨닫다	\N	\N	\N		\N
14005	describe	묘사하다 서술하다	\N	\N	\N		\N
14006	tearful	눈물어린	\N	\N	\N		\N
14007	deeply	짙게 몹시	\N	\N	\N		\N
14008	move	감동시키다	\N	\N	\N		\N
14009	relationship	관계	\N	\N	\N		\N
14010	form	형성하다	\N	\N	\N		\N
14012	amazing	놀라운	\N	\N	\N		하
14014	effort	노력	\N	\N	\N		하
14015	truly	진심으로	\N	\N	\N		하
14016	depend on	에 의존하다	\N	\N	\N		기타
14017	fossil fuel	화석 연료	\N	\N	\N		기타
14018	increase	증가시키다	\N	\N	\N		하
14019	amount	양 총계	\N	\N	\N		하
14020	carbon	탄소	\N	\N	\N		하
14021	cause	의 원인이 되다	\N	\N	\N		하
14022	green house effect	온실효과	\N	\N	\N		기타
14024	avoid	피하다	\N	\N	\N		하
14025	sources of energy	에너지 원	\N	\N	\N		기타
14026	solar energy	태양 에너지	\N	\N	\N		기타
14027	produce	생산하다	\N	\N	\N		하
14028	electricity	전기	\N	\N	\N		하
14029	take steps	조치를 취하다	\N	\N	\N		기타
14030	skin	피부	\N	\N	\N		하
14031	most of	대부분	\N	\N	\N		기타
14033	select	고르다 선택하다	\N	\N	\N		하
14034	heat	열	\N	\N	\N		하
14035	dirt	오물	\N	\N	\N		하
14036	for instance	예를 들어	\N	\N	\N		기타
14037	function	기능	\N	\N	\N		하
14039	sense of touch	촉감	\N	\N	\N		기타
14040	sense	감각	\N	\N	\N		하
14041	difference	차이	\N	\N	\N		하
14042	rough	거친	\N	\N	\N		하
14043	smooth	부드러운	\N	\N	\N		하
14044	surface	표면	\N	\N	\N		하
14045	determine	결정하다	\N	\N	\N		하
14046	slightly	약간	\N	\N	\N		하
14047	pale	창백한	\N	\N	\N		하
14048	sign	징조 조짐	\N	\N	\N		하
14049	design	설계하다	\N	\N	\N		하
14050	illness	병	\N	\N	\N		하
14051	camel	낙타	\N	\N	\N		하
14052	spin	회전	\N	\N	\N		하
14054	achieve	이행하다 성취하다	\N	\N	\N		하
14055	general	일반적인	\N	\N	\N		하
14056	shape	모양 형태	\N	\N	\N		하
14057	letter	글자 문자	\N	\N	\N		하
14058	stretch	뻗치다	\N	\N	\N		하
14059	side by side	나란히	\N	\N	\N		기타
14060	upper body	상체	\N	\N	\N		기타
14062	forward	앞쪽으로	\N	\N	\N		하
14063	straight line	직선	\N	\N	\N		기타
14064	perform	실행하다 이행하다	\N	\N	\N		하
14065	either	둘 중 하나	\N	\N	\N		하
14066	backward	뒤쪽으로	\N	\N	\N		하
14067	among	사이에	\N	\N	\N		하
14069	path	길	\N	\N	\N		하
14070	female	암컷의	\N	\N	\N		하
14071	attract	끌다 매혹하다	\N	\N	\N		하
14072	male	수컷의	\N	\N	\N		하
14073	worker bee	일 벌	\N	\N	\N		기타
14074	respond	반응하다	\N	\N	\N		하
14076	human beings	인간	\N	\N	\N		기타
14077	discover	발견하다	\N	\N	\N		하
14078	fall in love	사랑에 빠지다	\N	\N	\N		기타
14079	relation	관계	\N	\N	\N		하
14080	govern	통치하다	\N	\N	\N		하
14081	differently	다르게	\N	\N	\N		하
14082	imagine	상상하다	\N	\N	\N		하
14083	hate	증오하다	\N	\N	\N		하
14085	clearly	분명하게	\N	\N	\N		하
14086	nap	낮잠	\N	\N	\N		하
14087	big mean	양이 많은 식사	\N	\N	\N		기타
14088	even though	비록 일지라도	\N	\N	\N		기타
14089	relax	긴장을 풀다	\N	\N	\N		하
14090	fairly	꽤 매우	\N	\N	\N		하
14092	beat	심장이 뛰다	\N	\N	\N		하
14093	breathe	숨 쉬다	\N	\N	\N		하
14094	rapid	빠른 신속한	\N	\N	\N		하
14095	digestion	소화	\N	\N	\N		하
14096	stomach	위장	\N	\N	\N		하
14097	digest	소화시키다	\N	\N	\N		하
14099	refer to	언급하다	\N	\N	\N		기타
14100	spine	등뼈 가시	\N	\N	\N		하
14101	mainly	주로	\N	\N	\N		하
14102	produce	생산하다	\N	\N	\N		하
14103	various	다양한	\N	\N	\N		하
14104	root	뿌리	\N	\N	\N		하
14105	treat	치료하다	\N	\N	\N		하
14106	fever	열 열병	\N	\N	\N		하
14107	creature	동물 생물	\N	\N	\N		하
14108	sharp	날카로운	\N	\N	\N		하
14109	rat	쥐	\N	\N	\N		하
14110	squirrel	다람쥐	\N	\N	\N		하
14111	amazingly	놀랍게	\N	\N	\N		하
14112	active	활동적인	\N	\N	\N		하
14113	evil	나쁜 사악한	\N	\N	\N		하
14114	sight	시력	\N	\N	\N		하
14115	above	위	\N	\N	\N		하
14116	prefer	더 좋아하다	\N	\N	\N		하
14117	silver	은 은색	\N	\N	\N		하
14118	four out of ten	개중에서 넷	\N	\N	\N		기타
14120	advertiser	광고주	\N	\N	\N		하
14121	consider	고려하다	\N	\N	\N		하
14122	culture	문화	\N	\N	\N		하
14123	advertisement	광고	\N	\N	\N		하
14124	describe	묘사하다 설명하다	\N	\N	\N		하
14125	product	제품	\N	\N	\N		하
14126	explain	설명하다	\N	\N	\N		하
14128	in this case	이런 경우에	\N	\N	\N		기타
14129	commercial	상업광고	\N	\N	\N		하
14130	goal	목표	\N	\N	\N		하
14131	create	창조하다 만들다	\N	\N	\N		하
14132	positive	긍정적인	\N	\N	\N		하
14133	mood	기분 분위기	\N	\N	\N		하
14134	disease	질병	\N	\N	\N		하
14135	gene	유전자	\N	\N	\N		하
14137	prevent	막다 예방하다	\N	\N	\N		하
14138	behavior	행동	\N	\N	\N		하
14139	form	형태	\N	\N	\N		하
14140	heart disease	심장 질환	\N	\N	\N		기타
14141	cancer	암	\N	\N	\N		하
14142	no matter who	일지라도	\N	\N	\N		기타
14143	basics	기본 기초	\N	\N	\N		하
14144	plenty of	많은	\N	\N	\N		기타
14145	physical	신체의	\N	\N	\N		하
14147	checkup	검사 건강 진단	\N	\N	\N		하
14148	period	기간	\N	\N	\N		하
14149	inventor	발명가	\N	\N	\N		하
14150	architect	건축가	\N	\N	\N		하
14151	even though	비록 일지라도	\N	\N	\N		기타
14152	most of	대부분	\N	\N	\N		기타
14154	pet	애완동물	\N	\N	\N		하
14155	these days	요즈음	\N	\N	\N		기타
14156	almost	거의	\N	\N	\N		하
14157	keep	기르다	\N	\N	\N		하
14158	at least	최소한	\N	\N	\N		기타
14159	in most cases	대부분의 경우에	\N	\N	\N		기타
14161	troublesome	골치 아픈	\N	\N	\N		하
14162	anymore	더 이상	\N	\N	\N		하
14163	company	회사	\N	\N	\N		하
14164	product	제품	\N	\N	\N		하
14165	purse	지갑	\N	\N	\N		하
14166	shoulder	어깨	\N	\N	\N		하
14167	this way	이런 식으로	\N	\N	\N		기타
14168	all the time	항상	\N	\N	\N		기타
14170	modern	현대의	\N	\N	\N		하
14171	more than	이상	\N	\N	\N		기타
14172	fingerprint	손금	\N	\N	\N		하
14173	identify	확인하다	\N	\N	\N		하
14174	claim	주장하다	\N	\N	\N		하
14175	sort	종류	\N	\N	\N		하
14176	silent	조용한	\N	\N	\N		하
14177	grave	무덤	\N	\N	\N		하
14178	notice	알아차리다	\N	\N	\N		하
14180	behind	뒤	\N	\N	\N		하
14181	straw	짚 밀짚	\N	\N	\N		하
14182	hook	갈고리처럼 구부리다	\N	\N	\N		하
14183	pointed	예리한 뾰족한	\N	\N	\N		하
14184	unusual	유별난	\N	\N	\N		하
14185	honeymoon	신혼여행	\N	\N	\N		하
14186	turn on	켜다	\N	\N	\N		기타
14188	proper	적절한	\N	\N	\N		하
14189	nutrition	영양	\N	\N	\N		하
14190	suggest	제안하다	\N	\N	\N		하
14191	establish	설립하다	\N	\N	\N		하
14192	organization	단체	\N	\N	\N		하
14194	almost	거의	\N	\N	\N		하
14195	volunteer	자원 봉사자	\N	\N	\N		하
14196	lots of	많은	\N	\N	\N		기타
14197	although	일지라도	\N	\N	\N		하
14198	valuable	귀중한	\N	\N	\N		하
14200	graduate	졸업하다	\N	\N	\N		하
14201	moreover	더구나	\N	\N	\N		하
14202	ability	능력	\N	\N	\N		하
14203	consider	고려하다	\N	\N	\N		하
14204	parking lot	주차장	\N	\N	\N		기타
14205	official	관리 공무원	\N	\N	\N		하
14206	liar	거짓말쟁이	\N	\N	\N		하
14207	cheat	속이다	\N	\N	\N		하
14208	congratulate	축하하다	\N	\N	\N		하
14209	victory	승리	\N	\N	\N		하
14210	seriously	심각하게	\N	\N	\N		하
14212	bill	청구서	\N	\N	\N		하
14213	expense	경비 비용	\N	\N	\N		하
14214	touch	감동시키다	\N	\N	\N		하
14215	nod	고개를 끄덕이다	\N	\N	\N		하
14216	worst	가장 나쁜	\N	\N	\N		하
14217	humans	인간	\N	\N	\N		하
14218	curious	호기심 있는 사물을 알고 싶어 하는	\N	\N	\N		하
14219	get bored	지루해하다	\N	\N	\N		기타
14221	certain	어떤	\N	\N	\N		하
14222	area	분야 영역	\N	\N	\N		하
14223	private	사적인	\N	\N	\N		하
14224	exist	존재하다	\N	\N	\N		하
14225	rare	희귀한 보기 드문	\N	\N	\N		하
14226	purpose	목적	\N	\N	\N		하
14227	used goods	중고품	\N	\N	\N		기타
14228	necessity	필요 필수품	\N	\N	\N		하
14229	value	가치	\N	\N	\N		하
14230	set a goal	목표를 설정하다	\N	\N	\N		기타
14231	ingredient	재료	\N	\N	\N		하
14232	Mediterranean	지중해	\N	\N	\N		하
14233	originally	원래	\N	\N	\N		하
14235	instruction	교육 명령 지시	\N	\N	\N		하
14236	enable	가능하게 하다 허락하다	\N	\N	\N		하
14237	individual	개인 개개의	\N	\N	\N		하
14239	aspect	외관 관점 용모	\N	\N	\N		하
14240	influence	영향을 미치다	\N	\N	\N		하
14241	interaction	상호 작용	\N	\N	\N		하
14242	scale	규모	\N	\N	\N		하
14243	property	재산 자산	\N	\N	\N		하
14244	payment	지불 납입	\N	\N	\N		하
14245	attachment	첨부물	\N	\N	\N		하
14246	hesitate	망설이다 주저하다	\N	\N	\N		하
14247	literally	글자 뜻대로 사실상	\N	\N	\N		하
14248	focus	집중하다	\N	\N	\N		하
14249	knowledge	지식	\N	\N	\N		하
14250	talent	재능	\N	\N	\N		하
14252	worldwide	세계적인	\N	\N	\N		하
14253	accomplish	이루다 성취하다	\N	\N	\N		하
14254	attract	끌다 매혹하다	\N	\N	\N		하
14255	be committed to	에 헌신하다	\N	\N	\N		기타
14256	motivate	동기를 주다	\N	\N	\N		하
14258	correctness	정확함	\N	\N	\N		하
14259	share	공유하다	\N	\N	\N		하
14260	operate	작동하다 움직이다	\N	\N	\N		하
14261	inborn	타고난 선천적인	\N	\N	\N		하
14262	physiology	생리학	\N	\N	\N		하
14263	detect	감지하다	\N	\N	\N		하
14265	opinion	의견	\N	\N	\N		하
14266	determine	결정하다 결론내리다	\N	\N	\N		하
14267	court	궁전 왕실	\N	\N	\N		하
14268	conclude	결론내리다	\N	\N	\N		하
14270	assume	역할 임무를 맡다	\N	\N	\N		하
14271	expose	노출시키다	\N	\N	\N		하
14272	organ	신체장기	\N	\N	\N		하
14273	wear out	닳다	\N	\N	\N		기타
14274	sustain	계속하다	\N	\N	\N		하
14275	eventually	드디어 결국	\N	\N	\N		하
14276	continually	계속해서	\N	\N	\N		하
14277	consequently	결론적으로	\N	\N	\N		하
14278	countryside	한 지방 시골	\N	\N	\N		하
14279	physically	물리적으로 육체적으로	\N	\N	\N		하
14280	annoying	괴롭히는	\N	\N	\N		하
14281	individual	개인의	\N	\N	\N		하
14282	camper	야영객	\N	\N	\N		하
14284	fascinating	매혹적인 황홀한	\N	\N	\N		하
14285	slap	뺨때림	\N	\N	\N		하
14286	entire	전체의 완전한	\N	\N	\N		하
14287	discipline	훈련 수양	\N	\N	\N		하
14288	actual	현실의	\N	\N	\N		하
14290	quarter	분	\N	\N	\N		하
14291	calendar	달력	\N	\N	\N		하
14292	match up	조화를 이루다	\N	\N	\N		기타
14293	orbit	궤도	\N	\N	\N		하
14294	leap day	윤일	\N	\N	\N		기타
14295	extend	확장하다	\N	\N	\N		하
14296	scenario	계획안	\N	\N	\N		하
14297	visualize	눈에 보이게 하다	\N	\N	\N		하
14299	productive	생산적인	\N	\N	\N		하
14300	creative	창의적인	\N	\N	\N		하
14301	joyful	반가운 즐거운	\N	\N	\N		하
14302	fewer	보다 소수의	\N	\N	\N		하
14303	otherwise	만약 그렇지 않으면 다른 면에서	\N	\N	\N		하
14304	prefer	선호하다	\N	\N	\N		하
14305	graduation	졸업	\N	\N	\N		하
14306	secretary	비서	\N	\N	\N		하
14308	translate	번역하다	\N	\N	\N		하
14309	harmonious	조화된 균형 잡힌	\N	\N	\N		하
14310	feature	특징	\N	\N	\N		하
14311	confidence	신임 신용 신뢰	\N	\N	\N		하
14312	sentence	문장	\N	\N	\N		하
14313	define	정의하다	\N	\N	\N		하
14314	statement	진술	\N	\N	\N		하
14316	paragraph	절 단락	\N	\N	\N		하
14317	statement	말해진 것 진술	\N	\N	\N		하
14318	president	대통령 장	\N	\N	\N		하
14319	calculate	계산하다	\N	\N	\N		하
14320	as follow	다음과 같이	\N	\N	\N		기타
14321	belong to	에 속하다	\N	\N	\N		기타
14323	turn off	잠그다	\N	\N	\N		기타
14324	conserve	보존하다	\N	\N	\N		하
14325	firmly	견고하게	\N	\N	\N		하
14326	unnecessarily	불필요하게 쓸데없이	\N	\N	\N		하
14327	primitive	원시적인	\N	\N	\N		하
14328	plenty of	많은	\N	\N	\N		기타
14329	civilization	문명	\N	\N	\N		하
14330	doubtful	의심을 품고 있는	\N	\N	\N		하
14331	primitive	원시의	\N	\N	\N		하
14333	efficient	능률적인 효과 있는	\N	\N	\N		하
14334	inactive	활동하지 않은	\N	\N	\N		하
14335	rude	무례한	\N	\N	\N		하
14336	particularly	특별히	\N	\N	\N		하
14337	chew	씹다	\N	\N	\N		하
14338	document	문서	\N	\N	\N		하
14339	spice	향료	\N	\N	\N		하
14340	ginger	생강	\N	\N	\N		하
14341	garlic	마늘	\N	\N	\N		하
14342	ancient	고대의	\N	\N	\N		하
14343	inequality	불평등	\N	\N	\N		하
14344	statistics	통계	\N	\N	\N		하
14346	motivate	에게 동기를 주다	\N	\N	\N		하
14347	persuade	설득하다	\N	\N	\N		하
14348	greatness	거대함 위대함	\N	\N	\N		하
14349	potential	잠재력	\N	\N	\N		하
14350	sparkling	반짝이는	\N	\N	\N		하
14351	stuff	에 채우다	\N	\N	\N		하
14352	squash	호박	\N	\N	\N		하
14353	fig	무화과	\N	\N	\N		하
14355	servant	하인	\N	\N	\N		하
14356	sheepskin	양가죽	\N	\N	\N		하
14357	immigrant	이민 이주자	\N	\N	\N		하
14358	identity	동일함 신원	\N	\N	\N		하
14359	academic	학원의 대학의	\N	\N	\N		하
14360	failure	실패 실수	\N	\N	\N		하
14361	dropout	낙제하다 실패하다	\N	\N	\N		하
14362	selfesteem	자존심 자부심	\N	\N	\N		기타
14364	opportunity	기회	\N	\N	\N		하
14365	behave	행동하다	\N	\N	\N		하
14366	badly	나쁘게	\N	\N	\N		하
14367	polite	예의바른	\N	\N	\N		하
14368	exhausted	지친 힘든	\N	\N	\N		하
14369	lack	부족하다	\N	\N	\N		하
14370	pain	고통	\N	\N	\N		하
14371	annoyance	짜증	\N	\N	\N		하
14373	complain	불평하다	\N	\N	\N		하
14374	lose ones selfcontrol	자제력을 잃다	\N	\N	\N		기타
14375	patience	인내력	\N	\N	\N		하
14376	curiosity	호기심	\N	\N	\N		하
14377	creativity	창의력	\N	\N	\N		하
14378	export	수출하다	\N	\N	\N		하
14379	recognize	인식하다	\N	\N	\N		하
14380	excellence	우수성	\N	\N	\N		하
14381	match	어울리다	\N	\N	\N		하
14382	pronunciation	발음	\N	\N	\N		하
14383	represent	나타내다	\N	\N	\N		하
14384	actually	실제로	\N	\N	\N		하
14386	First Lady	영부인	\N	\N	\N		기타
14387	professor	교수	\N	\N	\N		하
14388	pet	애완동물	\N	\N	\N		하
14389	human	인간	\N	\N	\N		하
14390	raise	기르다	\N	\N	\N		하
14392	spiritual	정신의 영혼의	\N	\N	\N		하
14393	attractive	매력적인	\N	\N	\N		하
14394	piece	조각	\N	\N	\N		하
14395	recently	최근에	\N	\N	\N		하
14396	bone	뼈	\N	\N	\N		하
14397	remains	유해	\N	\N	\N		하
14399	fortunately	다행히	\N	\N	\N		하
14402	away from	멀리 떨어져	\N	\N	\N		기타
14403	prefer to	더 좋아하다	\N	\N	\N		기타
14404	though	라고 해도	\N	\N	\N		하
14405	cheaper	더 저렴한	\N	\N	\N		하
14406	dangerous	위험한	\N	\N	\N		하
14407	robber	강도	\N	\N	\N		하
14408	criminal	범죄자	\N	\N	\N		하
14410	wherever	어느 곳이든	\N	\N	\N		하
14411	bravery	용기 용맹	\N	\N	\N		하
14412	fine shooting	뛰어난 사격 솜씨	\N	\N	\N		기타
14414	pistol	권총	\N	\N	\N		하
14415	rifle	소총	\N	\N	\N		하
14416	vocabulary	어휘력	\N	\N	\N		하
14417	skill	기술	\N	\N	\N		하
14418	develop	개발하다 향상 되다	\N	\N	\N		하
14419	article	기사	\N	\N	\N		하
14420	rather than	라기 보다는	\N	\N	\N		기타
14421	context	문맥	\N	\N	\N		하
14422	neither	또한 아니다	\N	\N	\N		하
14423	word list	단어 목록	\N	\N	\N		기타
14424	guess	추측하다	\N	\N	\N		하
14425	meaning	의미	\N	\N	\N		하
14426	measure	측정하다	\N	\N	\N		하
14427	finger	손가락	\N	\N	\N		하
14429	some	어떤 사람들	\N	\N	\N		하
14430	others	다른 사람들	\N	\N	\N		하
14431	step	발걸음	\N	\N	\N		하
14432	therefore	그래서 그리하여	\N	\N	\N		하
14433	length	길이	\N	\N	\N		하
14434	royal	왕의	\N	\N	\N		하
14435	width	너비	\N	\N	\N		하
14437	blame	비난하다	\N	\N	\N		하
14438	international	국제적인	\N	\N	\N		하
14439	publishing company	출판사	\N	\N	\N		기타
14440	reveal	발표하다	\N	\N	\N		하
14441	list	목록	\N	\N	\N		하
14442	latest	최신의	\N	\N	\N		하
14443	phrase	어구	\N	\N	\N		하
14445	gain popularity	인기를 얻다	\N	\N	\N		기타
14446	make definition	정의를 내리다	\N	\N	\N		기타
14447	evidence	증거	\N	\N	\N		하
14448	publication	출판물	\N	\N	\N		하
14449	president	사장	\N	\N	\N		하
14451	delicious	맛있는	\N	\N	\N		하
14452	aroma	향	\N	\N	\N		하
14453	garlic	마늘	\N	\N	\N		하
14454	widely	널리	\N	\N	\N		하
14455	improve	향상시키다	\N	\N	\N		하
14456	for instance	예를 들어	\N	\N	\N		기타
14457	strength	힘	\N	\N	\N		하
14458	courage	용기	\N	\N	\N		하
14459	fought fight	싸우다의 과거	\N	\N	\N		기타
14461	nevertheless	그럼에도 불구하고	\N	\N	\N		하
14462	frighten	겁나게 하다	\N	\N	\N		하
14463	enemy	적 적군	\N	\N	\N		하
14464	magic power	마술적인 힘	\N	\N	\N		기타
14465	various taste	다양한 맛	\N	\N	\N		기타
14466	different shape	다양한 형태	\N	\N	\N		기타
14468	economic value	경제적 가치	\N	\N	\N		기타
14469	complain	불평하다	\N	\N	\N		하
14470	fingerprint	지문	\N	\N	\N		하
14471	cafeteria	학교 식당	\N	\N	\N		하
14472	index finger	검지손가락	\N	\N	\N		기타
14473	scanner	인식기	\N	\N	\N		하
14475	be concerned about	에 대해 염려하다	\N	\N	\N		기타
14476	be willing to	에 대해 기꺼이 하다	\N	\N	\N		기타
14477	be supposed to	할 예정이다	\N	\N	\N		기타
14478	be satisfied with	에 만족하다	\N	\N	\N		기타
14479	transfer	옮기다	\N	\N	\N		하
14480	gather	모으다	\N	\N	\N		하
14482	far from	멀리 떨어진	\N	\N	\N		기타
14483	village	마을	\N	\N	\N		하
14484	trail	길의 흔적 오솔길	\N	\N	\N		하
14485	curve	구부러지다	\N	\N	\N		하
14486	monster bear	괴물 같은 곰	\N	\N	\N		기타
14487	escape	도망가다	\N	\N	\N		하
14488	point	겨누다	\N	\N	\N		하
14489	fire	총을 쏘다	\N	\N	\N		하
14491	bark	개가 짖다	\N	\N	\N		하
14492	loudly	큰소리로	\N	\N	\N		하
14493	hill	언덕	\N	\N	\N		하
14494	follow	추적하다 쫓다	\N	\N	\N		하
14495	through the day	하루 종일	\N	\N	\N		기타
14496	stare at	응시하다	\N	\N	\N		기타
14497	blank	텅 빈	\N	\N	\N		하
14498	condition	상태	\N	\N	\N		하
14500	overcome	극복하다	\N	\N	\N		하
14501	opening	앞부분	\N	\N	\N		하
14502	section	부분	\N	\N	\N		하
14503	tend to	하게 하다 이끌다	\N	\N	\N		기타
14504	activate	활성화 하다	\N	\N	\N		하
14505	whenever	할 때마다	\N	\N	\N		하
14506	experience	경험	\N	\N	\N		하
14508	flight instructor	비행교관	\N	\N	\N		기타
14509	fighter jet	전투기	\N	\N	\N		기타
14510	nickname	별명	\N	\N	\N		하
14512	positive	긍정적인	\N	\N	\N		하
14513	negative	부정적인	\N	\N	\N		하
14514	characteristic	성향 성격	\N	\N	\N		하
14515	panic	공포	\N	\N	\N		하
14516	dangerous situation	위험한 상황	\N	\N	\N		기타
14517	cloud	구름	\N	\N	\N		하
14518	instructor	교관	\N	\N	\N		하
14519	control	통제하다	\N	\N	\N		하
14520	fix	고쳐주다	\N	\N	\N		하
14522	correct	수정하다 고치다	\N	\N	\N		하
14523	collect	수집하다	\N	\N	\N		하
14524	confidence	자신감	\N	\N	\N		하
14525	Mars	화성	\N	\N	\N		하
14526	exploration	탐험 탐사	\N	\N	\N		하
14527	microwave	전자레인지	\N	\N	\N		하
14528	wheel	바퀴	\N	\N	\N		하
14529	solar	태양의	\N	\N	\N		하
14530	panel	판	\N	\N	\N		하
14532	planet	행성	\N	\N	\N		하
14533	collect	수집하다	\N	\N	\N		하
14534	visual data	시각자료	\N	\N	\N		기타
14535	at the front	앞쪽의	\N	\N	\N		기타
14536	signal	신호	\N	\N	\N		하
14537	handlike	손과 같은	\N	\N	\N		기타
14539	hold	잡다	\N	\N	\N		하
14540	various	다양한	\N	\N	\N		하
14542	harmful	해로운	\N	\N	\N		하
14543	dietician	영양사	\N	\N	\N		하
14544	recommend	추천하다	\N	\N	\N		하
14545	point to	지적하다	\N	\N	\N		기타
14547	chemicals	화학물질	\N	\N	\N		하
14548	contain	포함하다	\N	\N	\N		하
14549	blood circulation	혈액순환	\N	\N	\N		기타
14550	relieve	제거하다 줄이다	\N	\N	\N		하
14551	headache	두통	\N	\N	\N		하
14552	milky	우유가 들어있는	\N	\N	\N		하
14553	sleepy	졸리는	\N	\N	\N		하
14554	stimulate	자극하다	\N	\N	\N		하
14555	ahead of a day	하루 시작 전	\N	\N	\N		기타
14556	add	덧붙여 말하다	\N	\N	\N		하
14558	choosing a career	직업 선택	\N	\N	\N		기타
14559	available	이용할 수 있는	\N	\N	\N		하
14560	option	선택상항	\N	\N	\N		하
14561	romantic person	낭만적인 사람	\N	\N	\N		기타
14562	in other words	다시 말해서	\N	\N	\N		기타
14563	theater	극장	\N	\N	\N		하
14564	suit	적합하다	\N	\N	\N		하
14565	earn	벌다	\N	\N	\N		하
14566	personality	성격	\N	\N	\N		하
14567	profession	직업 분야	\N	\N	\N		하
14569	different cultures	다른 문화	\N	\N	\N		기타
14570	be surprised at	에 놀라다	\N	\N	\N		기타
14571	get a stomachache	배가 아프다	\N	\N	\N		기타
14572	jealous	질투나는	\N	\N	\N		하
14574	skin of an ill	아픈 사람의 피부	\N	\N	\N		기타
14575	with jealousy	질투가 나서	\N	\N	\N		기타
14576	by carrying bags	가방을 날라주며	\N	\N	\N		기타
14577	be sent to a prison	감옥에 보내지다	\N	\N	\N		기타
14578	develop	익히다	\N	\N	\N		하
14579	pitching skills	던지기 기술	\N	\N	\N		기타
14580	get out	석방하다 나가다	\N	\N	\N		기타
14581	join	들어가다	\N	\N	\N		하
14583	diameter	지름	\N	\N	\N		하
14584	seed	씨앗	\N	\N	\N		하
14585	carry	운반하다	\N	\N	\N		하
14586	spread	퍼지다	\N	\N	\N		하
14587	lack	부족하다	\N	\N	\N		하
14588	structure	구조	\N	\N	\N		하
14589	survive	살다 생존하다	\N	\N	\N		하
14590	stem	줄기	\N	\N	\N		하
14591	leave	나뭇잎	\N	\N	\N		하
14593	suck	빨아 먹다	\N	\N	\N		하
14594	weigh	무게가 나가다	\N	\N	\N		하
14595	sharp increase	급격한 증가	\N	\N	\N		기타
14597	lowest number	가장 낮은 수	\N	\N	\N		기타
14598	fast rise	빠른 상승세	\N	\N	\N		기타
14599	peak	최고	\N	\N	\N		하
14600	fall continuously	계속 떨어지다	\N	\N	\N		기타
14601	forest fire	산불	\N	\N	\N		기타
14602	disaster	재앙	\N	\N	\N		하
14604	whenever	할 때마다	\N	\N	\N		하
14605	forest keeper	산림 감시원	\N	\N	\N		기타
14606	put out	을 끄다	\N	\N	\N		기타
14607	be allowed to	하기를 허락 하다	\N	\N	\N		기타
14608	Forest Service	산림청	\N	\N	\N		기타
14610	limited fire	제한된 화재	\N	\N	\N		기타
14611	make room	공간을 만들다	\N	\N	\N		기타
14612	diseased trees	죽은 나무	\N	\N	\N		기타
14613	clear away	제거하다	\N	\N	\N		기타
14614	acre	넓이의 단위	\N	\N	\N		하
14615	passive listener	수동적 청취자	\N	\N	\N		기타
14616	communicate	의사소통하다	\N	\N	\N		하
14618	miss	놓치다	\N	\N	\N		하
14619	run into	뛰어들다	\N	\N	\N		기타
14620	my gosh	맙소사	\N	\N	\N		기타
14621	assume	가정하다	\N	\N	\N		하
14622	point	핵심	\N	\N	\N		하
14623	active	적극적인	\N	\N	\N		하
14624	become involved in	합류하다	\N	\N	\N		기타
14625	block association	반상회	\N	\N	\N		기타
14626	organization	조직	\N	\N	\N		하
14627	ordinary citizen	일반시민	\N	\N	\N		기타
14628	activity	활동	\N	\N	\N		하
14629	common	평범한	\N	\N	\N		하
14631	cleanup day	대청소	\N	\N	\N		기타
14632	association	모임	\N	\N	\N		하
14633	neighborhood	이웃	\N	\N	\N		하
14634	crime	범죄	\N	\N	\N		하
14635	take a chance	기회를 잡다	\N	\N	\N		기타
14636	be in a hurry	서두르다	\N	\N	\N		기타
14637	time	시간을 재다	\N	\N	\N		하
14639	nervous	불안한	\N	\N	\N		하
14640	bean	콩	\N	\N	\N		하
14641	rename	새로운 이름을 짓다	\N	\N	\N		하
14642	funny	재미있는	\N	\N	\N		하
14643	wing	날개	\N	\N	\N		하
14644	chicken wings	닭 날개	\N	\N	\N		기타
14645	get out	나가다	\N	\N	\N		기타
14647	rise	오르다	\N	\N	\N		하
14648	stair	계단	\N	\N	\N		하
14649	blast	폭발 센 바람	\N	\N	\N		하
14651	flame	불꽃	\N	\N	\N		하
14652	shed tears	눈물을 흘리다	\N	\N	\N		기타
14653	breathe	호흡하다	\N	\N	\N		하
14654	ash	재	\N	\N	\N		하
14655	fly by	날아가다	\N	\N	\N		기타
14656	fire truck	소방차	\N	\N	\N		기타
14657	siren	사이렌	\N	\N	\N		하
14658	fire fighter	소방관	\N	\N	\N		기타
14659	attach	붙이다	\N	\N	\N		하
14660	lightning	번개	\N	\N	\N		하
14661	urgent	급한	\N	\N	\N		하
14663	United Kingdom	영국	\N	\N	\N		기타
14664	trophy	트로피	\N	\N	\N		하
14665	on display	전시 중에 있는	\N	\N	\N		기타
14666	investigate	조사하다	\N	\N	\N		하
14667	robbery	도난사건	\N	\N	\N		하
14669	wrap	포장하다	\N	\N	\N		하
14670	unwrap	포장을 풀다	\N	\N	\N		하
14671	buried	묻혀있는	\N	\N	\N		하
14674	lemon scent	레몬 향	\N	\N	\N		기타
14675	smell of vanilla	바닐라 향	\N	\N	\N		기타
14676	relax	편하게 하다	\N	\N	\N		하
14677	patient	환자	\N	\N	\N		하
14678	customer	고객	\N	\N	\N		하
14679	comfortable	편안한	\N	\N	\N		하
14680	remind	떠오르게 하다	\N	\N	\N		하
14681	pretend	인 척하다	\N	\N	\N		하
14682	cheerlead	응원하다	\N	\N	\N		기타
14683	outgoing	사교적인	\N	\N	\N		하
14684	shy	수줍은	\N	\N	\N		하
14686	perfect body	완벽한 신체	\N	\N	\N		기타
14687	perfect grade	완벽한 성적	\N	\N	\N		기타
14688	average	보통의	\N	\N	\N		하
14689	class president	학급 반장	\N	\N	\N		기타
14690	personality	성격	\N	\N	\N		하
14691	sigh	한숨	\N	\N	\N		하
14693	occur to	에 생각나다	\N	\N	\N		기타
14694	character	등장인물	\N	\N	\N		하
14695	script	대본	\N	\N	\N		하
14696	determine	결정하다	\N	\N	\N		하
14697	unavoidable circumstance	불가피한 상황	\N	\N	\N		기타
14698	beg for	구걸하다	\N	\N	\N		기타
14699	face up to	극복하다	\N	\N	\N		기타
14701	government	정부	\N	\N	\N		하
14702	even worse	더 나쁜 것은	\N	\N	\N		기타
14703	professional beggar	직업적 거지	\N	\N	\N		기타
14704	in real need	정말로 궁핍한	\N	\N	\N		기타
14705	sentiment	감정	\N	\N	\N		하
14707	in itself	그 자체인	\N	\N	\N		기타
14708	negative	부정적인	\N	\N	\N		하
14709	properly	적절하게	\N	\N	\N		하
14710	be applied to	에 적용시키다	\N	\N	\N		기타
14711	penniless	돈 없는	\N	\N	\N		중
14712	unemployment	실직	\N	\N	\N		하
14713	miserable	비참한	\N	\N	\N		하
14714	family background	가정환경	\N	\N	\N		기타
14715	be treated as	로 취급되다	\N	\N	\N		기타
14716	social failure	사회적 실패자	\N	\N	\N		기타
14717	end up	끝나다	\N	\N	\N		기타
14719	selfish	이기적인	\N	\N	\N		하
14720	individually	개인적인	\N	\N	\N		하
14721	individual giving	개인적 도움	\N	\N	\N		기타
14722	charity	자선 단체	\N	\N	\N		하
14723	government action	정부 조치	\N	\N	\N		기타
14724	be made from	으로 만들어지다	\N	\N	\N		기타
14725	brick	벽돌	\N	\N	\N		하
14726	concrete	콘크리트	\N	\N	\N		하
14727	steel	강철	\N	\N	\N		하
14728	iron	철	\N	\N	\N		하
14729	various	다양한	\N	\N	\N		하
14730	shape	모양	\N	\N	\N		하
14732	cliff	절벽	\N	\N	\N		하
14733	century	세기 년	\N	\N	\N		하
14734	sailor	선원	\N	\N	\N		하
14735	guide	안내하다	\N	\N	\N		하
14736	area	지역	\N	\N	\N		하
14738	flash	불 빛을 번쩍 발하다	\N	\N	\N		하
14739	unique	독특한 고유한	\N	\N	\N		하
14740	figure out	파악하다 이해하다	\N	\N	\N		기타
14741	location	위치	\N	\N	\N		하
14743	specialized	전문의	\N	\N	\N		하
14744	navigation	항법 항해	\N	\N	\N		하
14745	equipment	장비 설비	\N	\N	\N		하
14746	not any more	더 이상 않다	\N	\N	\N		기타
14747	builder	건축가	\N	\N	\N		하
14748	admire	존경하다	\N	\N	\N		하
14749	orderly	순서 바른	\N	\N	\N		하
14750	lay	쌓아 올리다	\N	\N	\N		하
14751	foundation	기초 토대	\N	\N	\N		하
14752	put up	올리다 설치하다	\N	\N	\N		기타
14753	process	진행 과정	\N	\N	\N		하
14754	roof	지붕	\N	\N	\N		하
14755	floor	마루	\N	\N	\N		하
14756	check	검사하다	\N	\N	\N		하
14757	progress	경과 추이	\N	\N	\N		하
14759	housework	집안일	\N	\N	\N		하
14760	immediately	즉시	\N	\N	\N		하
14761	accomplish	완성하다 이루다	\N	\N	\N		하
14762	special kind	특별한 종류	\N	\N	\N		기타
14763	friendly	우호적인	\N	\N	\N		하
14764	environmentally	환경적으로	\N	\N	\N		하
14766	typical	전형적인	\N	\N	\N		하
14767	stack	쌓아 올리다	\N	\N	\N		하
14768	cardboard	판지 마분지	\N	\N	\N		하
14769	one of	중에 하나	\N	\N	\N		기타
14770	major	주요한	\N	\N	\N		하
14771	cause	이유	\N	\N	\N		하
14773	feature	특징 특색	\N	\N	\N		하
14774	include	포함하다	\N	\N	\N		하
14775	solar panel	태양 전지판	\N	\N	\N		기타
14776	generate	발생시키다	\N	\N	\N		하
14777	electricity	전기	\N	\N	\N		하
14778	collect	모으다	\N	\N	\N		하
14780	recycle	재활용하다	\N	\N	\N		하
14781	waste	쓰레기	\N	\N	\N		하
14782	natural resources	천연 자원	\N	\N	\N		기타
14783	in the long run	결국	\N	\N	\N		기타
14784	The Board of Education	교육 위원회	\N	\N	\N		기타
14785	consider	고려하다	\N	\N	\N		하
14786	break up	해체하다	\N	\N	\N		기타
14787	agree with	동의하다	\N	\N	\N		기타
14789	behave n behavior	행동하다	\N	\N	\N		기타
14790	acceptable	수용할 수 있는 받아들일 수 있는	\N	\N	\N		하
14791	Year after year	해가 갈수록	\N	\N	\N		기타
14792	terribly	지독하게	\N	\N	\N		하
14793	be criticized for	에 대해 비난받다	\N	\N	\N		기타
14794	rude	무례한	\N	\N	\N		하
14795	conduct	행동 행위	\N	\N	\N		하
14797	continual	지속적인 계속되는	\N	\N	\N		하
14798	grocery	식료품	\N	\N	\N		하
14799	back seat	뒤 좌석	\N	\N	\N		기타
14800	sweet	귀여운	\N	\N	\N		하
14801	next to	옆에	\N	\N	\N		기타
14802	parking lot	주차장	\N	\N	\N		기타
14803	unlocked	잠기지 않은	\N	\N	\N		하
14805	alone	혼자	\N	\N	\N		하
14807	get in	타다	\N	\N	\N		기타
14808	get out	내리다	\N	\N	\N		기타
14809	concern	염려 걱정	\N	\N	\N		하
14810	front seat	앞좌석	\N	\N	\N		기타
14811	like	처럼	\N	\N	\N		하
14812	guarantee	보증하다	\N	\N	\N		하
14814	investment	투자	\N	\N	\N		하
14815	shape	모양	\N	\N	\N		하
14816	subject	주제	\N	\N	\N		하
14817	develop	발달시키다	\N	\N	\N		하
14818	skill T	기술 솜	\N	\N	\N		기타
14820	sort	분류하다	\N	\N	\N		하
14821	sleigh	썰매	\N	\N	\N		하
14822	absurd	부조리한 엉터리없는	\N	\N	\N		하
14823	first of all	우선 무엇보다도	\N	\N	\N		기타
14824	supposed	가정의 가상의 상상된	\N	\N	\N		하
14825	activity	행동	\N	\N	\N		하
14826	rule	규칙	\N	\N	\N		하
14827	physics	물리학	\N	\N	\N		하
14828	in just one night	하룻밤에	\N	\N	\N		기타
14830	nowadays	요즘	\N	\N	\N		하
14831	exist	존재하다	\N	\N	\N		하
14832	chimney	굴뚝	\N	\N	\N		하
14833	deliver	배달하다	\N	\N	\N		하
14834	at least	최소한 적어도	\N	\N	\N		기타
14835	mall	대형 상가	\N	\N	\N		하
14836	despite	에도 불구하고	\N	\N	\N		하
14837	suit	정장 한 벌	\N	\N	\N		하
14838	many of	대부분	\N	\N	\N		기타
14840	unfortunately	불행히도	\N	\N	\N		하
14841	make money	돈을 벌다	\N	\N	\N		기타
14842	in order to	하기 위해서	\N	\N	\N		기타
14844	try	시도하다	\N	\N	\N		하
14845	skill	기술 솜씨	\N	\N	\N		하
14846	pale	창백한	\N	\N	\N		하
14847	skin	피부	\N	\N	\N		하
14848	no longer	더 이상 않다	\N	\N	\N		기타
14849	desirable	바람직한 호감이 가는	\N	\N	\N		하
14850	tan	햇볕에 태우다	\N	\N	\N		하
14851	desire	욕구 욕망	\N	\N	\N		하
14852	lead to	결과를 가져오다	\N	\N	\N		기타
14853	invention	발명	\N	\N	\N		하
14855	lotion	로션	\N	\N	\N		하
14856	darken	빛깔이 거뭇해지다	\N	\N	\N		하
14857	vacation	휴가 방학	\N	\N	\N		하
14858	product	제품	\N	\N	\N		하
14859	lie down	눕다	\N	\N	\N		기타
14860	gain	얻다 늘리다	\N	\N	\N		하
14861	temperature	기온	\N	\N	\N		하
14862	expect	기대하다	\N	\N	\N		하
14863	rise	오르다	\N	\N	\N		하
14865	be careful	조심하다	\N	\N	\N		기타
14866	quarrel with	와 다투다	\N	\N	\N		기타
14867	spouse	배우자	\N	\N	\N		하
14869	actually	실제로	\N	\N	\N		하
14870	formal	정식의 형식적인	\N	\N	\N		하
14871	weather forecast	일기예보	\N	\N	\N		기타
14872	warn	경고하다	\N	\N	\N		하
14873	couples	부부	\N	\N	\N		하
14874	that day	그 날	\N	\N	\N		기타
14875	Celsius	섭씨의	\N	\N	\N		하
14876	increase	증가하다	\N	\N	\N		하
14877	relate	관련시키다	\N	\N	\N		하
14878	mood	기분	\N	\N	\N		하
14879	raise	일으키다	\N	\N	\N		하
14881	pray	기도하다	\N	\N	\N		하
14882	for the first time	처음으로	\N	\N	\N		기타
14883	offer	제공하다	\N	\N	\N		하
14884	position	직책	\N	\N	\N		하
14885	manager	관리자	\N	\N	\N		하
14887	amazed	깜짝 놀란	\N	\N	\N		하
14888	such a great	그 런 멋진	\N	\N	\N		기타
14889	opportunity	기회	\N	\N	\N		하
14890	hang up	전화를 끊다	\N	\N	\N		기타
14891	joy	기쁨	\N	\N	\N		하
14892	beat throb	심장맥박 따위가 뛰다	\N	\N	\N		기타
14893	button	버튼을 누르다	\N	\N	\N		하
14894	regretful	후회하는	\N	\N	\N		중
14896	disappointed	실망한	\N	\N	\N		하
14897	delighted	아주 기뻐하는	\N	\N	\N		하
14898	get old	나이를 먹다	\N	\N	\N		기타
14899	be supposed toR R	할 예정이다	\N	\N	\N		기타
14900	allow	허락하다	\N	\N	\N		하
14901	strict	엄격한 엄한	\N	\N	\N		하
14903	bring up	양육하다 기르다	\N	\N	\N		기타
14904	properly	올바르게 제대로	\N	\N	\N		하
14905	generous	관대한	\N	\N	\N		하
14906	toward	에 대하여	\N	\N	\N		하
14907	modern society	현대 사회	\N	\N	\N		기타
14908	silence	침묵	\N	\N	\N		하
14909	rare	드문 진기한	\N	\N	\N		하
14910	common	일반적인 흔한	\N	\N	\N		하
14912	unwanted	원치 않는	\N	\N	\N		하
14913	noise	소음	\N	\N	\N		하
14914	sunrise	해돋이 일출	\N	\N	\N		하
14915	fill A with B A B	를 로 채우다	\N	\N	\N		기타
14916	sunset	해질 녘 일몰	\N	\N	\N		하
14917	sauce	소스 양념	\N	\N	\N		하
14918	constant	끊임없는	\N	\N	\N		하
14919	sauce	양념	\N	\N	\N		하
14920	source	근원 원천 원인	\N	\N	\N		하
14922	noisiness	소음	\N	\N	\N		기타
14923	comfort	안락하게 하다	\N	\N	\N		하
14924	disturbing	어지럽히는	\N	\N	\N		하
14925	effect	효과 영향	\N	\N	\N		하
14926	anywhere	어느 곳에서나	\N	\N	\N		하
14927	one day	어느 날	\N	\N	\N		기타
14928	above	위	\N	\N	\N		하
14929	dont have to	할 필요가 없다	\N	\N	\N		기타
14930	automatic	자동의 자동적인	\N	\N	\N		하
14932	heat	열	\N	\N	\N		하
14933	melt	녹이다	\N	\N	\N		하
14934	ice cube	얼음 덩어리	\N	\N	\N		기타
14935	weight	무게	\N	\N	\N		하
14936	connect	연결하다	\N	\N	\N		하
14937	take a shower	샤워하다	\N	\N	\N		기타
14939	bucket	양동이	\N	\N	\N		하
14940	so That will	하기 위하여	\N	\N	\N		기타
15011	marriage proposal	청혼 프러포즈	\N	\N	\N		\N
15012	occur	일어나다 발생하다	\N	\N	\N		\N
15013	in the course of	동안에	\N	\N	\N		\N
15014	least little	의 최상급	\N	\N	\N		\N
15015	those who	하는 사람들	\N	\N	\N		\N
15016	more thanover	이상	\N	\N	\N		\N
15017	previous	이전의	\N	\N	\N		\N
15018	one fifth	분의	\N	\N	\N		\N
15019	steadily	꾸준히	\N	\N	\N		\N
15020	increase	증가하다	\N	\N	\N		\N
15021	anyone who	하는 사람은 누구나	\N	\N	\N		\N
15022	serious	진지한 진정인	\N	\N	\N		\N
15023	gym	체육관 체육	\N	\N	\N		\N
15024	according to	에 따르면	\N	\N	\N		\N
15025	recent search	최근 연구	\N	\N	\N		\N
15026	though	그러나	\N	\N	\N		\N
15027	researcher	연구가	\N	\N	\N		\N
15028	encourage	장려하다 권하다	\N	\N	\N		\N
15029	limit	제한하다	\N	\N	\N		\N
15030	amount	양	\N	\N	\N		\N
15031	opportunity	기회	\N	\N	\N		\N
15032	cause	의 원인이 되다	\N	\N	\N		\N
15033	such as	와 같은	\N	\N	\N		\N
15034	dizziness	현기증	\N	\N	\N		\N
15035	avoid	피하다	\N	\N	\N		\N
15036	sweat	땀을 흘리다	\N	\N	\N		\N
15037	labor union	노동조합	\N	\N	\N		\N
15038	economics	경제학	\N	\N	\N		\N
15039	profession	직업	\N	\N	\N		\N
15040	rise to fame	명성을 얻다	\N	\N	\N		\N
15041	prediction	예측	\N	\N	\N		\N
15042	predict	예언하다	\N	\N	\N		\N
15043	in the past	과거에	\N	\N	\N		\N
15044	even	비교급 훨씬 더욱	\N	\N	\N		\N
15045	endless	끝이 없는	\N	\N	\N		\N
15046	reflect	반영하다	\N	\N	\N		\N
15047	reality	현실	\N	\N	\N		\N
15048	island	섬	\N	\N	\N		\N
15049	rather	차라리 오히려 어느 쪽인가 하면	\N	\N	\N		\N
15050	as a result	결과적으로	\N	\N	\N		\N
15051	southern	남쪽의	\N	\N	\N		\N
15052	few	거의 없는	\N	\N	\N		\N
15053	yet	그러나	\N	\N	\N		\N
15054	thorn bush	가시덤불	\N	\N	\N		\N
15055	despite	에도 불구하고	\N	\N	\N		\N
15056	a variety of	다양한	\N	\N	\N		\N
15057	landscape	경치 풍경	\N	\N	\N		\N
15058	average	평균의	\N	\N	\N		\N
15059	yearly	년의	\N	\N	\N		\N
15060	around	약 대략	\N	\N	\N		\N
15061	with	때문에	\N	\N	\N		\N
15062	rainfall	강수량	\N	\N	\N		\N
15063	tropical rain forest	열대우림	\N	\N	\N		\N
15064	nap	선잠 잠시 졸기 낮잠	\N	\N	\N		\N
15065	mostly	대개	\N	\N	\N		\N
15066	common	흔한	\N	\N	\N		\N
15067	generally	일반적으로	\N	\N	\N		\N
15068	rate	비율	\N	\N	\N		\N
15069	disease	질병	\N	\N	\N		\N
15070	research	연구하다 조사하다	\N	\N	\N		\N
15071	play a part	역할을 하다	\N	\N	\N		\N
15072	reduce	줄이다	\N	\N	\N		\N
15073	risk	위험	\N	\N	\N		\N
15074	heart attack	심장 마비발작	\N	\N	\N		\N
15075	healthy	건강한	\N	\N	\N		\N
15076	take part in	에 참여하다	\N	\N	\N		\N
14942	position	위치 자리	\N	\N	\N		하
14943	recent	최근	\N	\N	\N		하
14944	get	얻다	\N	\N	\N		하
14945	print	인쇄 출판물	\N	\N	\N		하
14947	especially	특히	\N	\N	\N		하
14948	profit	이익 수익	\N	\N	\N		하
14949	decrease	감소하다	\N	\N	\N		하
14950	create	만들다	\N	\N	\N		하
14951	report	보도하다	\N	\N	\N		하
14952	news industry	뉴스 산업	\N	\N	\N		기타
14953	deliver	배달하다 전하다	\N	\N	\N		하
14954	comment	견해 의견	\N	\N	\N		하
14955	shape	구체화하다	\N	\N	\N		하
14957	lead A toR A R	에게 할 마음이 생기게 하다	\N	\N	\N		기타
14958	issue	논쟁점 문제	\N	\N	\N		하
14959	otherwise	그렇지 않으면	\N	\N	\N		하
14960	unexamined	검사하지 않은	\N	\N	\N		중
14961	take notes	필기하다	\N	\N	\N		기타
14962	in ing ing	할 때	\N	\N	\N		기타
14963	gain	얻다 획득하다	\N	\N	\N		하
14964	besides	게다가 더욱이	\N	\N	\N		하
14965	develop	발전시키다	\N	\N	\N		하
14966	curiosity	호기심	\N	\N	\N		하
14967	relationship	관계	\N	\N	\N		하
14968	interest	관심 흥미	\N	\N	\N		하
14970	huge	거대한	\N	\N	\N		하
14971	invitation	초대	\N	\N	\N		하
14972	brilliance	훌륭함 재기 발랄	\N	\N	\N		하
14973	when it comes to	에 관해서	\N	\N	\N		기타
14974	care	관심을 갖다 신경 쓰다	\N	\N	\N		하
14975	uncomfortable	불편한	\N	\N	\N		하
14977	stylish	현대식의 유행의	\N	\N	\N		하
14978	not only A but also B		\N	\N	\N		기타
14979	look taller	더 크게 보이다	\N	\N	\N		기타
14980	slim	늘씬한	\N	\N	\N		하
14981	attractive	매력적인	\N	\N	\N		하
14982	effect	영향 효과	\N	\N	\N		하
14983	cause	의 원인이 되다	\N	\N	\N		하
14984	blister	물집	\N	\N	\N		하
14985	painful	고통스런	\N	\N	\N		하
14986	misstep	실족	\N	\N	\N		중
14988	describe	묘사하다 설명하다	\N	\N	\N		하
14989	as	로서	\N	\N	\N		하
14990	light	색이 연한	\N	\N	\N		하
14991	front	앞	\N	\N	\N		하
14992	sound like	처럼 들리다 소리 나다	\N	\N	\N		기타
14993	unfinished	미완성의	\N	\N	\N		하
14994	stripe	줄무늬	\N	\N	\N		하
14995	herd	떼 무리	\N	\N	\N		하
14996	plain	평원	\N	\N	\N		하
14998	settler	정착민 개척자	\N	\N	\N		하
14999	protect	보호하다	\N	\N	\N		하
15000	grazing land	목초지	\N	\N	\N		기타
15001	cattle	소	\N	\N	\N		하
15002	revolution	혁명	\N	\N	\N		하
15004	publish	출판하다	\N	\N	\N		하
15005	earn	획득하다	\N	\N	\N		하
15006	neither A nor B A B	도 도 아니다	\N	\N	\N		기타
15007	criticism	비평 비판	\N	\N	\N		하
15008	popularity	인기	\N	\N	\N		하
15009	above	위에 위쪽에	\N	\N	\N		하
15010	chart	도표 그림	\N	\N	\N		하
15077	three times a week	일주일에 번	\N	\N	\N		\N
15078	death	죽음	\N	\N	\N		\N
15079	those who	하는 사람들	\N	\N	\N		\N
15080	improve	개선하다 향상시키다	\N	\N	\N		\N
15081	cash	현금	\N	\N	\N		\N
15082	check	수표	\N	\N	\N		\N
15083	decision	결정	\N	\N	\N		\N
15084	rent	빌리다	\N	\N	\N		\N
15085	task	일 과업 업무	\N	\N	\N		\N
15086	even if	비록 일지라도	\N	\N	\N		\N
15087	purchase	구입하다	\N	\N	\N		\N
15088	experience	경험	\N	\N	\N		\N
15089	much	비교급 훨씬	\N	\N	\N		\N
15090	process	과정	\N	\N	\N		\N
15091	unlike	와는 다르게	\N	\N	\N		\N
15092	handle	취급하다	\N	\N	\N		\N
15093	document	서류	\N	\N	\N		\N
15094	receipt	영수증	\N	\N	\N		\N
15095	record	기록	\N	\N	\N		\N
15096	company	회사	\N	\N	\N		\N
15097	look back at	을 다시 보다	\N	\N	\N		\N
15098	statement	명세서	\N	\N	\N		\N
15099	still	움직임 없는 고요한	\N	\N	\N		\N
15100	weak	몸이 약한 허약한	\N	\N	\N		\N
15101	lightlitlit	불을 켜다	\N	\N	\N		\N
15102	shake	흔들다 떨다	\N	\N	\N		\N
15103	cheer	활기 원기	\N	\N	\N		\N
15104	spirit	마음 정신	\N	\N	\N		\N
15105	all of sudden	갑자기	\N	\N	\N		\N
15106	footstep	발소리 걸음걸이	\N	\N	\N		\N
15107	approach	접근하다 다가서다	\N	\N	\N		\N
15108	along	을 따라서	\N	\N	\N		\N
15109	reach	도착하다	\N	\N	\N		\N
15110	pause	잠시 쉬다	\N	\N	\N		\N
15111	sense	알아채다 느껴 알다	\N	\N	\N		\N
15112	presence	존재 있음	\N	\N	\N		\N
15113	gradually	점차로 점진적으로	\N	\N	\N		\N
15114	take shape	형체를 갖추다	\N	\N	\N		\N
15115	perform trick	재주를 부리다	\N	\N	\N		\N
15116	sign	징조 표시	\N	\N	\N		\N
15117	be capable of	할 수 있다	\N	\N	\N		\N
15118	perhaps	아마	\N	\N	\N		\N
15119	surface	표면	\N	\N	\N		\N
15120	look for	을 찾다	\N	\N	\N		\N
15121	ring	종을울리다	\N	\N	\N		\N
15122	enter	들어가다	\N	\N	\N		\N
15123	do tricks	재주를 부리다	\N	\N	\N		\N
15124	be filled with	으로 가득 차다	\N	\N	\N		\N
15125	clap	손뼉을 치다	\N	\N	\N		\N
15126	seal	물개	\N	\N	\N		\N
15127	behavior	행동	\N	\N	\N		\N
15128	consider	라고 여기다	\N	\N	\N		\N
15129	trick	재주 곡예 책략	\N	\N	\N		\N
15130	intelligence	지능	\N	\N	\N		\N
15131	ability	능력	\N	\N	\N		\N
15132	reason	추론하다 논리적으로 생각하다	\N	\N	\N		\N
15133	solve	해결하다	\N	\N	\N		\N
15135	previous	이전의 앞선	\N	\N	\N		하
15137	actually	실제로	\N	\N	\N		하
15138	quite a lot	많은	\N	\N	\N		기타
15139	be likely toR R	할 것 같다	\N	\N	\N		기타
15140	creative	창조적인	\N	\N	\N		하
15141	on the other hand	반면에	\N	\N	\N		기타
15142	those who	하는 사람들	\N	\N	\N		기타
15143	religious	종교적인	\N	\N	\N		하
15145	trust	믿다 신용하다	\N	\N	\N		하
15146	others	다른 사람들	\N	\N	\N		하
15147	hardworking	열심히 일하는	\N	\N	\N		하
15148	practical	현실적인	\N	\N	\N		하
15149	prefer	을 더 좋아하다	\N	\N	\N		하
15150	physically	신체적으로	\N	\N	\N		하
15151	active	활동적인	\N	\N	\N		하
15153	athletic	운동경기의 운동선수다운 활발한	\N	\N	\N		하
15154	agreeable	기분 좋은 쾌적한 마음에 드는	\N	\N	\N		하
15155	view A as B A B	를 로 여기다	\N	\N	\N		기타
15156	attractive	매력적인	\N	\N	\N		하
15157	taste	기호 취향	\N	\N	\N		하
15158	theory	이론	\N	\N	\N		하
15159	profession	직업	\N	\N	\N		하
15160	personality	성격	\N	\N	\N		하
15161	talent	재주	\N	\N	\N		하
15162	performance	공연	\N	\N	\N		하
15164	fate	운명	\N	\N	\N		하
15165	fall upon	에게 일어나다	\N	\N	\N		기타
15166	go out	불이 꺼지다	\N	\N	\N		기타
15167	lock	잠그다	\N	\N	\N		하
15168	whip	채찍	\N	\N	\N		하
15169	protection	보호	\N	\N	\N		하
15170	circumstances	상황	\N	\N	\N		하
15171	survive	살아남다	\N	\N	\N		하
15172	calmly	침착하게	\N	\N	\N		하
15174	act	공연	\N	\N	\N		하
15175	rest	나머지	\N	\N	\N		하
15176	audience	청중	\N	\N	\N		하
15177	cage	우리	\N	\N	\N		하
15178	highlight	강조하다	\N	\N	\N		하
15179	suspense	긴장 불안	\N	\N	\N		하
15180	skillfully	능숙하게	\N	\N	\N		하
15181	treat	다루다	\N	\N	\N		하
15183	admit	인정하다	\N	\N	\N		하
15184	fear	두려움	\N	\N	\N		하
15185	situation	상황	\N	\N	\N		하
15186	chilling	오싹하게 하는	\N	\N	\N		하
15187	point out	지적하다	\N	\N	\N		기타
15189	calm	침착한 고요한	\N	\N	\N		하
15190	keep ing ing	계속해서 하다	\N	\N	\N		기타
15191	crack	찰싹 때리다	\N	\N	\N		하
15192	drunk driving	음주 운전	\N	\N	\N		기타
15193	headache	두통 골칫거리	\N	\N	\N		하
15194	modern	현대의	\N	\N	\N		하
15195	suffer from	로 고통 받다	\N	\N	\N		기타
15197	unnecessarily	필요 없이	\N	\N	\N		하
15198	include	포함하다	\N	\N	\N		하
15199	innocent	죄 없는	\N	\N	\N		하
15200	passenger	승객	\N	\N	\N		하
15201	pedestrian	보행자	\N	\N	\N		하
15202	unable	할 수 없는	\N	\N	\N		하
15203	control	통제하다	\N	\N	\N		하
15204	vehicle	수송 수단 차량	\N	\N	\N		하
15205	carry out	시행하다	\N	\N	\N		기타
15206	random	무작위의	\N	\N	\N		하
15207	breath	호흡 숨	\N	\N	\N		하
15208	realize	깨닫다	\N	\N	\N		하
15210	as a result	그 결과	\N	\N	\N		기타
15211	sharply	급격하게	\N	\N	\N		하
15213	debate	토론 논쟁	\N	\N	\N		하
15215	of no use	쓸모없는 무익한	\N	\N	\N		기타
15216	for some time	얼마동안	\N	\N	\N		기타
15217	fall	감소	\N	\N	\N		하
15218	figure	숫자 합계	\N	\N	\N		하
15219	distinguish	구별하다	\N	\N	\N		하
15220	effect	효과	\N	\N	\N		하
15221	accompanying	동시에 시행되는	\N	\N	\N		하
15222	advertising	광고	\N	\N	\N		하
15223	campaign	캠페인 조직적인 운동	\N	\N	\N		하
15224	regularly	규칙적으로	\N	\N	\N		하
15225	record	기록	\N	\N	\N		하
15226	basically	기본적으로	\N	\N	\N		하
15227	store	저장하다	\N	\N	\N		하
15229	income	소득	\N	\N	\N		하
15230	nowadays	요즘	\N	\N	\N		하
15231	dolphin	돌고래	\N	\N	\N		하
15232	remain	남다	\N	\N	\N		하
15233	alone	혼자서	\N	\N	\N		하
15234	spread out	펼치다	\N	\N	\N		기타
15235	shallow	얕은	\N	\N	\N		하
15236	shore	해안	\N	\N	\N		하
15238	forget	잊다	\N	\N	\N		하
15239	appreciate	감사하다	\N	\N	\N		하
15240	effort	노력	\N	\N	\N		하
15241	retirement	퇴직	\N	\N	\N		하
15242	connection	관련	\N	\N	\N		하
15243	goat	염소	\N	\N	\N		하
15245	describe	묘사하다	\N	\N	\N		하
15246	consider	여기다	\N	\N	\N		하
15247	playfully	장난스럽게	\N	\N	\N		하
15248	annoying	성가신	\N	\N	\N		하
15249	make sense	일리가 있다	\N	\N	\N		기타
15250	editorinchief	편집장	\N	\N	\N		기타
15252	necessity	필수품	\N	\N	\N		하
15253	imagination	상상	\N	\N	\N		하
15254	physically	신체적으로	\N	\N	\N		하
15255	develop	발달하다	\N	\N	\N		하
15257	prefer A to B B A	보다 를 더 좋아하다	\N	\N	\N		기타
15258	appear	나타나다	\N	\N	\N		하
15259	gain	얻다	\N	\N	\N		하
15260	knowledge	지식	\N	\N	\N		하
15261	normal	보통의	\N	\N	\N		하
15262	go through	겪다	\N	\N	\N		기타
15263	whole	전체의	\N	\N	\N		하
15264	process	과정	\N	\N	\N		하
15266	political	정치의	\N	\N	\N		하
15267	fail to	하지 못하다	\N	\N	\N		기타
15268	instead of	대신에	\N	\N	\N		기타
15269	satisfy	만족시키다	\N	\N	\N		하
15270	merely	단지	\N	\N	\N		하
15271	researcher	연구자	\N	\N	\N		하
15272	wrinkle	주름	\N	\N	\N		하
15273	bald	대머리의	\N	\N	\N		하
15274	gray	회색의	\N	\N	\N		하
15276	situation	상황	\N	\N	\N		하
15277	hairdressing salon	미용실	\N	\N	\N		기타
15278	attractive	매력적인	\N	\N	\N		하
15279	attitude	태도	\N	\N	\N		하
15280	damage	손상시키다	\N	\N	\N		하
15281	doubt	의심	\N	\N	\N		하
15283	repair	수리하다	\N	\N	\N		하
15284	convenience food	인스턴트식품	\N	\N	\N		기타
15285	package	포장하다	\N	\N	\N		하
15286	reach into	속으로 손을 뻗다	\N	\N	\N		기타
15287	method	방법	\N	\N	\N		하
15288	number	번호를 매기다	\N	\N	\N		하
15289	suppose	라고 가정하다	\N	\N	\N		하
15290	tip	끝	\N	\N	\N		하
15292	represent	나타내다	\N	\N	\N		하
15293	remaining	남아 있는	\N	\N	\N		하
15294	rosebud	장미 봉오리	\N	\N	\N		하
15295	bloom	개화하다	\N	\N	\N		하
15296	appeal	간청하다	\N	\N	\N		하
15297	explain	설명하다	\N	\N	\N		하
15298	receive	받다	\N	\N	\N		하
15300	respond	반응하다 대답하다	\N	\N	\N		하
15301	score	득점하다	\N	\N	\N		하
15302	detail	세부 사항	\N	\N	\N		하
15303	think of A as B A B	를 로 생각하다	\N	\N	\N		기타
15304	evenly	균등하게	\N	\N	\N		하
15305	narrow	좁은	\N	\N	\N		하
15306	achieve	성취하다	\N	\N	\N		하
15307	suggest	시사하다	\N	\N	\N		하
15309	avoid	회피하다	\N	\N	\N		하
15310	dig	파다	\N	\N	\N		하
15311	scene	장면	\N	\N	\N		하
15312	openly	공개적으로	\N	\N	\N		하
15313	extraordinary	비범한	\N	\N	\N		하
15314	run	운영하다	\N	\N	\N		하
15316	cliff	절벽	\N	\N	\N		하
15317	distant	먼	\N	\N	\N		하
15318	recently	최근에	\N	\N	\N		하
15319	attend	출석하다	\N	\N	\N		하
15320	gifted	재능이 있는	\N	\N	\N		하
15321	obey	따르다	\N	\N	\N		하
15323	constant	지속적인	\N	\N	\N		하
15324	the instant	주어동사 하는 순간에	\N	\N	\N		기타
15325	desire	욕구	\N	\N	\N		하
15326	matter	중요하다	\N	\N	\N		하
15327	convenient	편리한	\N	\N	\N		하
15328	have difficulty ing	하는 데 어려움을 겪다	\N	\N	\N		기타
15329	accomplish	달성하다	\N	\N	\N		하
15330	available	이용할 수 있는	\N	\N	\N		하
15331	plenty	많음 다수	\N	\N	\N		하
15332	invention	발명	\N	\N	\N		하
15333	electric	전기의	\N	\N	\N		하
15334	dawn	새벽	\N	\N	\N		하
15336	wellpaid	보수가 좋은	\N	\N	\N		기타
15337	academic	학문의 학구적인	\N	\N	\N		하
15338	opportunity	기회	\N	\N	\N		하
15339	present	현재의	\N	\N	\N		하
15341	amazingly	놀랍게도	\N	\N	\N		하
15342	valley	골짜기	\N	\N	\N		하
15343	coast	해변 해안	\N	\N	\N		하
15344	log	통나무	\N	\N	\N		하
15345	blanket	담요	\N	\N	\N		하
15346	pass by	지나가다	\N	\N	\N		기타
15347	athlete	운동선수	\N	\N	\N		하
15348	stretch	뻗다 늘이다	\N	\N	\N		하
15349	muscle	근육	\N	\N	\N		하
15351	bitter	쓴	\N	\N	\N		하
15353	gene	유전자	\N	\N	\N		하
15355	flavor	맛 향	\N	\N	\N		하
15356	unpleasantly	불쾌하게	\N	\N	\N		중
15357	decision	결정	\N	\N	\N		하
15358	place an order	주문을 하다	\N	\N	\N		기타
15360	consumer	소비자	\N	\N	\N		하
15361	actual	실제의	\N	\N	\N		하
15362	compare	비교하다	\N	\N	\N		하
15363	advertise	광고하다	\N	\N	\N		하
15364	exchange	교환하다	\N	\N	\N		하
15365	product	상품	\N	\N	\N		하
15366	merchant	상인	\N	\N	\N		하
15367	feed	먹이다	\N	\N	\N		하
15369	nail	못	\N	\N	\N		하
15370	color	색칠하다	\N	\N	\N		하
15371	outline	윤곽선	\N	\N	\N		하
15372	zebra	얼룩말	\N	\N	\N		하
15373	uneasy	불안한	\N	\N	\N		하
15374	faintly	희미하게	\N	\N	\N		하
15376	hang hanghunghung	걸다	\N	\N	\N		기타
15377	disappointed	실망한	\N	\N	\N		하
15378	pleased	기쁜	\N	\N	\N		하
15379	popular	인기 있는	\N	\N	\N		하
15380	engage inA A	에 참여하다	\N	\N	\N		기타
15382	withinA A	이내에	\N	\N	\N		기타
15383	be good at	을 잘하다	\N	\N	\N		기타
15384	individually	개인적으로	\N	\N	\N		하
15385	indeed	실제로	\N	\N	\N		하
15386	cane pole	낚싯대	\N	\N	\N		기타
15387	hook	낚싯바늘	\N	\N	\N		하
15388	regardless of	와 상관없이	\N	\N	\N		기타
15389	income	수입 소득	\N	\N	\N		하
15390	appeal	호소 매력	\N	\N	\N		하
15391	opportunity	기회	\N	\N	\N		하
15392	companionship	교류 교제	\N	\N	\N		하
15393	vary	다양하다	\N	\N	\N		하
15394	bait	미끼	\N	\N	\N		하
15396	danger	위험	\N	\N	\N		하
15397	endangered	위험에 처한	\N	\N	\N		하
15398	species	생물학적 종	\N	\N	\N		하
15399	fearless	겁 없는	\N	\N	\N		하
15400	predator	약탈자	\N	\N	\N		하
15401	expert	전문가	\N	\N	\N		하
15403	stuffed	박제한	\N	\N	\N		하
15404	chase	추적하다	\N	\N	\N		하
15405	excellent	뛰어난 훌륭한	\N	\N	\N		하
15406	pleasure	기쁨 즐거움	\N	\N	\N		하
15408	pressure	압박	\N	\N	\N		하
15409	extracurricular activities	교과 외 활동의특활	\N	\N	\N		기타
15410	management	관리 경영	\N	\N	\N		하
15411	extremely	매우	\N	\N	\N		하
15413	peer	동료 급우	\N	\N	\N		하
15414	make sure that SV	을 확신하다	\N	\N	\N		기타
15415	balance	균형	\N	\N	\N		하
15416	relaxation	휴식	\N	\N	\N		하
15417	success	성공	\N	\N	\N		하
15418	theory	가설 이론	\N	\N	\N		하
15419	bacteria	세균	\N	\N	\N		하
15420	dose	회분 복용량	\N	\N	\N		하
15421	beneficial	유익한	\N	\N	\N		하
15422	keep A from B A B	가 하는 것을 막다	\N	\N	\N		기타
15423	hospital	병원	\N	\N	\N		하
15424	pill	알약	\N	\N	\N		하
15426	risk	위험	\N	\N	\N		하
15427	diarrhea	설사	\N	\N	\N		하
15428	southern	남부의 남쪽의	\N	\N	\N		하
15429	amaze	깜짝 놀라게 하다	\N	\N	\N		하
15430	ancient	고대의	\N	\N	\N		하
15431	temple	사원	\N	\N	\N		하
15432	solid	단단한 견고한	\N	\N	\N		하
15434	hide	숨기다 은닉하다	\N	\N	\N		하
15435	exist	존재하다	\N	\N	\N		하
15436	spread spreadspread	퍼지다	\N	\N	\N		기타
15437	square	평방제곱 광장 사각형	\N	\N	\N		하
15438	enormous	거대한	\N	\N	\N		하
15439	several	몇몇의	\N	\N	\N		하
15440	stage	단계	\N	\N	\N		하
15442	tomb	무덤	\N	\N	\N		하
15443	function	기능	\N	\N	\N		하
15444	popular	인기 있는	\N	\N	\N		하
15445	fantastic	환상적인	\N	\N	\N		하
15446	efficient	효율적인	\N	\N	\N		하
15447	lecture	강연 강의	\N	\N	\N		하
15448	pace	보폭 속도 페이스	\N	\N	\N		하
15449	suit	에 어울리다 맞추다 남자 정장 한 벌	\N	\N	\N		하
15450	pause	중단 정지	\N	\N	\N		하
15451	silence	침묵	\N	\N	\N		하
15452	tone	어조	\N	\N	\N		하
15453	pitch	높이 고저	\N	\N	\N		하
15454	emphasize	강조하다	\N	\N	\N		하
15456	avoid	피하다	\N	\N	\N		하
15457	freeze froze frozen	그자리에서 꼼짝못하게 하다 얼다	\N	\N	\N		기타
15458	make full use of	을 최대한 이용하다	\N	\N	\N		기타
15459	resources	자료	\N	\N	\N		하
15460	audiovisual aid	시청각 도구	\N	\N	\N		기타
15461	illustrate	설명하다	\N	\N	\N		하
15462	enhance	강조하다 강화하다	\N	\N	\N		하
15463	tool	방법 도구	\N	\N	\N		하
15464	unfailingly	틀림없이	\N	\N	\N		중
15466	surrender	굴복하다 항복하다	\N	\N	\N		하
15467	be on ones way to A A	로 가는 중이다	\N	\N	\N		기타
15468	appointment	약속	\N	\N	\N		하
15469	traffic	교통	\N	\N	\N		하
15470	roadwork	도로공사	\N	\N	\N		중
15471	accident	사건 사고	\N	\N	\N		하
15472	upset	화난	\N	\N	\N		하
15473	to the point ofA A	정도까지	\N	\N	\N		기타
15475	turn red	얼굴이 붉어지다	\N	\N	\N		기타
15476	stomach	위 배	\N	\N	\N		하
15477	stir	뒤틀리다 휘젓다 꿈틀거리다	\N	\N	\N		하
15478	headache	두통	\N	\N	\N		하
15479	realize	깨닫다 알다	\N	\N	\N		하
15480	unreasonable	비이성적인	\N	\N	\N		하
15481	reaction	반응	\N	\N	\N		하
15483	accept	받아들이다 수용하다	\N	\N	\N		하
15484	powerlessness	무력함	\N	\N	\N		중
15485	relax	편안해 지다 긴장을 풀다	\N	\N	\N		하
15486	be busy ing	하느라 바쁘다	\N	\N	\N		기타
15489	foreigner	외국인	\N	\N	\N		하
15490	preference	선호 애호	\N	\N	\N		하
15491	ignore	무시하다	\N	\N	\N		하
15492	compelling	강압적인 강제적인	\N	\N	\N		하
15493	approach	접근하다 다가가다	\N	\N	\N		하
15494	closely	면밀히 세밀히	\N	\N	\N		하
15495	immediately	즉시	\N	\N	\N		하
15496	obey	복종하다	\N	\N	\N		하
15498	intended	의도된	\N	\N	\N		하
15499	ancient	고대의	\N	\N	\N		하
15500	regard A as B A B	를 로 간주하다	\N	\N	\N		기타
15501	disease	질병	\N	\N	\N		하
15502	punishment	처벌	\N	\N	\N		하
15504	viruses	바이러스 병균	\N	\N	\N		하
15505	microorganism	미생물	\N	\N	\N		중
15506	maintain	유지하다 관리하다 주장하다	\N	\N	\N		하
15507	largely	대체로 일반적으로	\N	\N	\N		하
15508	responsibility	책임감	\N	\N	\N		하
15509	practice	실행하다	\N	\N	\N		하
15511	healthy	건강한	\N	\N	\N		하
15512	exercise	운동	\N	\N	\N		하
15513	prevent	예방하다 막다	\N	\N	\N		하
15514	illness	병	\N	\N	\N		하
15515	machine	기계	\N	\N	\N		하
15516	regular	규칙적인	\N	\N	\N		하
15517	effective	효과적인	\N	\N	\N		하
15518	be supposed toV	하기로 되어있다	\N	\N	\N		기타
15519	pass	넘겨주다 건네주다	\N	\N	\N		하
15520	by word of mouth	구두로 말로	\N	\N	\N		기타
15522	generation	세대	\N	\N	\N		하
15523	poet	시인	\N	\N	\N		하
15524	professional	전문적인	\N	\N	\N		하
15525	storyteller	이야기꾼	\N	\N	\N		하
15526	appoint	지명하다	\N	\N	\N		하
15527	specific	특별한	\N	\N	\N		하
15528	myth	신화	\N	\N	\N		하
15530	educate	교육시키다	\N	\N	\N		하
15531	entertain	을 즐겁게 해주다	\N	\N	\N		하
15532	lodging	숙박	\N	\N	\N		하
15533	As often happens	흔히 그렇듯이	\N	\N	\N		기타
15534	orally	구두로	\N	\N	\N		하
15535	details	세부사항	\N	\N	\N		하
15536	result	결과	\N	\N	\N		하
15538	culture	문화	\N	\N	\N		하
15539	sculptor	조각가	\N	\N	\N		하
15540	appear	인 것 같다 나타나다	\N	\N	\N		하
15541	garbage	쓰레기	\N	\N	\N		하
15542	heap	쌓아 놓는 것 더미	\N	\N	\N		하
15543	empty beer bottle	빈 맥주병	\N	\N	\N		기타
15544	ashtray	재떨이	\N	\N	\N		하
15546	trash	쓰레기	\N	\N	\N		하
15547	sigh	한숨을 쉬다	\N	\N	\N		하
15548	mass	덩어리	\N	\N	\N		하
15549	mess	엉망진창	\N	\N	\N		하
15550	apparently	분명히 확실히	\N	\N	\N		하
15551	grasp	이해하다 알다 움켜잡다	\N	\N	\N		하
15552	estimate	평가하다	\N	\N	\N		하
15553	fortunately	다행히도	\N	\N	\N		하
15554	art gallery	미술관	\N	\N	\N		기타
15556	item	물건 품목	\N	\N	\N		하
15557	recreate	다시 만들다 재창조하다	\N	\N	\N		하
15558	exhibit	전시	\N	\N	\N		하
15559	photograph	사진	\N	\N	\N		하
15561	underfloor heating system	방구들 난방시스템	\N	\N	\N		기타
15562	granite stone	화강암	\N	\N	\N		기타
15563	support	지탱하다	\N	\N	\N		하
15564	mound	둔덕 흙무덤	\N	\N	\N		하
15565	be covered with	으로 덮여있다	\N	\N	\N		기타
15566	oiled paper	기름 장판지	\N	\N	\N		기타
15568	hole	구멍	\N	\N	\N		하
15569	kitchen	부엌	\N	\N	\N		하
15570	direct	향하게 하다	\N	\N	\N		하
15571	stone	돌	\N	\N	\N		하
15572	radiate	방출하다 빛을 발하다	\N	\N	\N		하
15573	flow out	흘러나오다	\N	\N	\N		기타
15574	chimney	굴뚝	\N	\N	\N		하
15575	unusually	몹시 대단히	\N	\N	\N		하
15576	tap	두드리다	\N	\N	\N		하
15577	shift	근무 교대 순번	\N	\N	\N		하
15579	ride	탈것에타다	\N	\N	\N		하
15580	secretly	몰래	\N	\N	\N		하
15581	pedal	자전거 페달	\N	\N	\N		하
15582	manage toV	가까스로 하다	\N	\N	\N		기타
15583	oddest	가장 기괴한	\N	\N	\N		중
15584	breathe	호흡하다	\N	\N	\N		하
15585	in spite of A A	에도 불구하고	\N	\N	\N		기타
15586	complexity	복잡성	\N	\N	\N		하
15587	amazingly	놀랍게도	\N	\N	\N		하
15588	daughter	딸	\N	\N	\N		하
7006	tranquility	평온; 고요함	\N	\N	\N	gongmuwon	하
7034	unattended	수행원이 없는; 돌봄을 받지 않는; 주의하지 않은; 미처리의	\N	\N	\N	gongmuwon	하
7220	issue	n. *논란거리	\N	\N	\N	suneung	하
6943	subtract	빼다	\N	\N	\N	gongmuwon	하
7254	decrease	n. *감소*	\N	\N	\N	suneung	하
7201	amaze	v. *놀라게 하다*	\N	\N	\N	suneung	하
7277	birth	n. *탄생*	\N	\N	\N	suneung	하
7332	manufacture	n. *제조	\N	\N	\N	suneung	하
7607	recite	v. *암송하다*	\N	\N	\N	suneung	하
7655	a. 가족의	 가정의	\N	\N	\N	suneung	기타
7311	announce	v. *발표하다	\N	\N	\N	suneung	하
7446	grain	n. *곡물	\N	\N	\N	suneung	하
7470	series	n. *연속	\N	\N	\N	suneung	하
7554	addict	v. *중독시키다*	\N	\N	\N	suneung	하
7650	ignorant	a. *무식한	\N	\N	\N	suneung	하
7752	laboratory	n. *실험실*	\N	\N	\N	suneung	하
7707	companion	n. *동료	\N	\N	\N	suneung	하
7867	nevertheless	ad. *그럼에도 불구하고*	\N	\N	\N	suneung	하
7972	representative	n. *대표	\N	\N	\N	suneung	하
8059	inherit	v. *상속하다	\N	\N	\N	suneung	하
10546	follow	추적하다 쫓다	\N	\N	\N	gtelp	하
7733	offend	v. *감정을 상하게 하다	\N	\N	\N	suneung	하
7832	propose	v. *제안하다	\N	\N	\N	suneung	하
15136	collection	수집 수집물	\N	\N	\N		하
15144	tend toR R	하는 경향이 있다	\N	\N	\N		기타
15152	adventurous	모험을 좋아하는 대담한	\N	\N	\N		하
15188	although	에도 불구하고	\N	\N	\N		하
15196	seriously	심각하게 진지하게	\N	\N	\N		하
15212	convince	납득시키다	\N	\N	\N		하
15228	display	보여주다	\N	\N	\N		하
15244	accept	받아들이다	\N	\N	\N		하
15256	get along with	와 잘 지내다	\N	\N	\N		기타
15308	customer	고객	\N	\N	\N		하
15340	Antarctica the South Pole	남극	\N	\N	\N		기타
15352	blame	탓하다	\N	\N	\N		하
15368	blacksmith	대장장이	\N	\N	\N		하
15412	deal with	처리하다 다루다 취급하다	\N	\N	\N		기타
15488	happen toV	우연히 하다	\N	\N	\N		기타
15560	traditional	전통적인	\N	\N	\N		하
7583	emit	v. (빛 · 열 · 소리 등을) *방출하다*	\N	\N	\N	suneung	하
13719	cafeteria	학교식당구내식당	\N	\N	\N		하
13727	indifferent	무관심한	\N	\N	\N		하
13735	garbage	쓰레기	\N	\N	\N		하
13743	immoral	비도덕적인	\N	\N	\N		하
13763	be used to Root	하는데 사용되어지다	\N	\N	\N		기타
13843	turn into	로 바뀌다	\N	\N	\N		기타
13863	monotonous	단조로운 무미건조한	\N	\N	\N		하
13899	grease	기름 지방	\N	\N	\N		하
13915	by sight	시각으로	\N	\N	\N		기타
13959	get along with	와 사이좋게 지내다	\N	\N	\N		기타
13975	miss	그리워하다	\N	\N	\N		하
14038	have to do with	와 관계가 있다	\N	\N	\N		기타
14098	native	출생의 출생지의 본국의 제나라의 토산의 그 토지 에서 태어난산출되는 원산의 토착의 그 지방 고유의	\N	\N	\N		하
14146	stuff	요소 음식물	\N	\N	\N		하
14234	acquire	얻다	\N	\N	\N		하
14238	govern	좌우하다 다스리다	\N	\N	\N		하
14332	engage	약속하다 보증하다	\N	\N	\N		하
14391	ancient	고대의	\N	\N	\N		하
14428	while	반면에	\N	\N	\N		하
14481	state government	주정부	\N	\N	\N		기타
14490	fled flee	도망가다의 과거	\N	\N	\N		기타
14511	calm	침착한 차분한	\N	\N	\N		하
14538	structure	구조	\N	\N	\N		하
14546	scientific evidence	과학적 증거	\N	\N	\N		기타
14582	the Baseball Hall of Fame	야구 명예의 전당	\N	\N	\N		기타
14630	tree and flower planting	나무 꽃 심기	\N	\N	\N		기타
14638	at almost twice the rate	거의 배 비율	\N	\N	\N		기타
14646	temperature	기온	\N	\N	\N		하
14650	sound of exploding glass	유리 폭발 소리	\N	\N	\N		기타
14662	be hold	개최되다	\N	\N	\N		기타
14706	an easy source of money	쉬운 돈 벌이의 원천	\N	\N	\N		기타
14718	family or community support		\N	\N	\N		기타
14742	be equipped with	을 장착하다 설비를 갖추다	\N	\N	\N		기타
14758	at any time	언제라도	\N	\N	\N		기타
14806	leave	남기다	\N	\N	\N		하
14854	spray	스프레이 분무	\N	\N	\N		하
14886	as soon as possible	가능한 빨리	\N	\N	\N		기타
14902	bend	악용하다 구부리다	\N	\N	\N		하
14938	tray	칸막이 한 작은 상자 쟁반	\N	\N	\N		하
14946	organization	조직체 단체	\N	\N	\N		하
15134	by ing ing	하므로	\N	\N	\N		기타
15182	afterward	후에 나중에	\N	\N	\N		하
15214	as for	로 말하자면 은 어떠냐 하면	\N	\N	\N		기타
15282	prepare	준비하다	\N	\N	\N		하
15322	get into trouble	어려움에 처하다	\N	\N	\N		기타
15350	crash	쿵 떨어지다	\N	\N	\N		하
15354	determine	결정하다	\N	\N	\N		하
15402	specially	특별히 특히	\N	\N	\N		하
15474	physical action	신체적 반응	\N	\N	\N		기타
15482	take a deep breath	심호흡을 하다	\N	\N	\N		기타
15510	preventive medicine	예방약	\N	\N	\N		기타
15578	notice	알다 주의하다 알아차리다	\N	\N	\N		하
13748	suffer from	로 고통 받다	\N	\N	\N		기타
13804	similarly	유사하게 이와 마찬가지로	\N	\N	\N		하
13816	expedition	탐험	\N	\N	\N		하
13820	yet	그러나 그럼에도 불구하고	\N	\N	\N		하
13836	male	남성의	\N	\N	\N		하
13880	fill A with B A B	를 로 채우다	\N	\N	\N		기타
13888	describe	묘사하다 서술하다	\N	\N	\N		하
13932	cherish	소중히 하다	\N	\N	\N		하
13936	sympathy pl	동정 헤아림 종종 조위 문상 위문	\N	\N	\N		기타
14011	experience	경험하다	\N	\N	\N		하
14023	in order toR R	하기 위하여	\N	\N	\N		기타
14075	affect	영향을 주다	\N	\N	\N		하
14091	slow down	속도가떨어뜨리다	\N	\N	\N		기타
14119	in ing ing	할 때	\N	\N	\N		기타
14127	depend on	에 달려있다	\N	\N	\N		기타
14179	movement	움직임 동작	\N	\N	\N		하
14187	poverty	가난	\N	\N	\N		하
14199	certain types of jobs	어떤 종류의 일	\N	\N	\N		기타
14211	cannot afford to	할 여유가 없다	\N	\N	\N		기타
14251	condition	상태 조건	\N	\N	\N		하
14257	perform	이행하다 공연하다	\N	\N	\N		하
14298	disastrous	비참한 재난의	\N	\N	\N		하
14307	invisible	보이지 않는	\N	\N	\N		하
14385	official	공식적인	\N	\N	\N		하
14401	borrow	빌리다	\N	\N	\N		하
14450	ordinary people	평범한 사람들	\N	\N	\N		기타
14507	experiment	실험	\N	\N	\N		하
14521	instructions	지시사항	\N	\N	\N		하
14541	wake up	잠에서 깨다	\N	\N	\N		기타
14568	different parts	다른 지역	\N	\N	\N		기타
14592	attach	에 붙다	\N	\N	\N		하
14596	stay steady	안정되어 있다	\N	\N	\N		기타
14668	strange object	이상한 물건	\N	\N	\N		기타
14672	recognize	인식하다	\N	\N	\N		하
14692	escape	탈출하다 도피하다	\N	\N	\N		하
14700	financial problem	재정적인 문제	\N	\N	\N		기타
14772	traffic accident	교통사고	\N	\N	\N		기타
14788	unsportsmanlike	스포츠맨 정신에 어긋나는	\N	\N	\N		중
14796	such	그런	\N	\N	\N		하
14804	completely	완전히	\N	\N	\N		하
14864	in a short time	짧은 시간에	\N	\N	\N		기타
14868	in the world	비교급 강조 도대체	\N	\N	\N		기타
14880	sensation	반향 센세이션	\N	\N	\N		하
14956	examine	검사조사하다 고찰하다	\N	\N	\N		하
14976	in order toR R	하기 위하여	\N	\N	\N		기타
15163	worst bad	의 최상급	\N	\N	\N		기타
15251	educator	교육자	\N	\N	\N		하
15275	conclude	결론짓다	\N	\N	\N		하
15291	place	두다 배치하다	\N	\N	\N		하
15299	response	반응 대답	\N	\N	\N		하
15315	sight	시력 시각	\N	\N	\N		하
15335	various	다양한	\N	\N	\N		하
15359	according to	에 따르면	\N	\N	\N		기타
15375	direction	지시	\N	\N	\N		하
15395	line	낚싯줄	\N	\N	\N		하
15407	Now that SV	때문에	\N	\N	\N		기타
15455	clearly and directly	명확하고 직접적으로	\N	\N	\N		기타
15487	shop	쇼핑하다	\N	\N	\N		하
15503	cause	일으키다 초래하다	\N	\N	\N		하
15555	rescue	구하다	\N	\N	\N		하
15567	hot flue gases	뜨거운 통기관의 가스	\N	\N	\N		기타
13757	aching back	욱신거리는 등	\N	\N	\N		기타
13777	be designed to Root	하도록 고안되어져 있다	\N	\N	\N		기타
13829	elderly people	노인	\N	\N	\N		기타
13905	blood stream	혈류피의 흐름	\N	\N	\N		기타
13953	selected	선택된	\N	\N	\N		하
14032	protect	보호하다	\N	\N	\N		하
14068	play a role	역할을 하다	\N	\N	\N		기타
14084	last	지속하다 계속하다	\N	\N	\N		하
14136	play a role	역할을 하다	\N	\N	\N		기타
14160	carry	운반하다 휴대하다	\N	\N	\N		하
14220	specialize	전문으로 다루다하다전공하다	\N	\N	\N		하
14264	sensitive	민감한	\N	\N	\N		하
14289	completely	완전히 완벽하게	\N	\N	\N		하
14345	wage	임금	\N	\N	\N		하
14354	pat	가볍게 톡톡 치다	\N	\N	\N		하
14398	vacation	휴가 방학	\N	\N	\N		하
14400	equipment	장비	\N	\N	\N		하
14409	organize	조직하다	\N	\N	\N		하
14460	unknown	알려지지 않은	\N	\N	\N		하
14467	healing effect	치료 효과	\N	\N	\N		기타
14531	severe temperature	심한 온도	\N	\N	\N		기타
14573	green with envy	질투로 파래지다	\N	\N	\N		기타
14609	chief of the Forest Service	산림청장	\N	\N	\N		기타
14617	factual message	사실적 메시지	\N	\N	\N		기타
14673	cleaners and soap for the home	가정용 비누와 세제	\N	\N	\N		기타
14685	get involved with	에 열중하다	\N	\N	\N		기타
14737	alert	에게 위험을 경고하다	\N	\N	\N		하
14765	look like	처럼 보이다	\N	\N	\N		기타
14813	cardboard	마분지	\N	\N	\N		하
14829	though	임에도 불구하고	\N	\N	\N		하
14921	be well known for	을 잘 알려지다	\N	\N	\N		기타
14941	original	최초의 본래의	\N	\N	\N		하
14969	improve	향상시키다	\N	\N	\N		하
14997	extinction	멸종	\N	\N	\N		하
15173	well known	잘 알려진	\N	\N	\N		기타
15209	at any time	언제라도	\N	\N	\N		기타
15237	encouragement	격려	\N	\N	\N		하
15265	throughout	에 걸쳐서	\N	\N	\N		하
15381	No matter where	어디에 한다 하더라도	\N	\N	\N		기타
15425	effect	효과 영향 결과	\N	\N	\N		하
15433	date back	거슬러 올라가다	\N	\N	\N		기타
15441	marvelous	놀라운 기적적인	\N	\N	\N		하
15465	reduce	줄이다 감소하다	\N	\N	\N		하
15497	realize	깨닫다 알다	\N	\N	\N		하
15521	hand down	건네주다	\N	\N	\N		기타
15529	retell	다시 말하다	\N	\N	\N		중
15537	version	각색 번역 편곡	\N	\N	\N		하
15545	throw threwthrown	던지다 버리다	\N	\N	\N		기타
15589	participate in A A	에 참여참석하다	\N	\N	\N		기타
13786	in order to Root	하기 위해서	\N	\N	\N		기타
13794	room to complete	완성할 수 있는 공간	\N	\N	\N		기타
13846	rich connection	풍부한 연결고리	\N	\N	\N		기타
13854	explosion	폭발	\N	\N	\N		하
13858	torn metal	찢겨진 금속	\N	\N	\N		기타
13874	arm chair	안락의자	\N	\N	\N		기타
13922	represent	말하다 표현하다	\N	\N	\N		하
14013	point	어떤 특정한 때 시점 순간 찰나	\N	\N	\N		하
14053	spin move	회전동작	\N	\N	\N		기타
14061	bend	구부리다	\N	\N	\N		하
14153	realistic style	사실주의적인 양식	\N	\N	\N		기타
14169	handwriting	필적 손으로 씀	\N	\N	\N		하
14193	throughout the world	전 세계에	\N	\N	\N		기타
14269	isolate	고립시키다 분리시키다	\N	\N	\N		하
14283	fortunate	운이 좋은 행운의	\N	\N	\N		하
14315	to the point	적절한	\N	\N	\N		기타
14322	take the place of	대체하다	\N	\N	\N		기타
14363	adjust	조정하다 조절하다	\N	\N	\N		하
14372	accept	수용하다 받아들이다	\N	\N	\N		하
14413	ability to ride horse	말 타는 능력	\N	\N	\N		기타
14436	thumb	엄지손가락	\N	\N	\N		하
14444	select	선택하다	\N	\N	\N		하
14474	personal information	개인 정보	\N	\N	\N		기타
14499	discouraging	좌절감을 주는	\N	\N	\N		하
14557	compare A to B A B	를 에 비유하다	\N	\N	\N		기타
14603	in the past	과거에	\N	\N	\N		기타
14731	flat	편평한 납작한	\N	\N	\N		하
14779	not only A but also B A B	뿐만아니라 도	\N	\N	\N		기타
14819	match	맞추다 조화시키다	\N	\N	\N		하
14839	be good at	를 잘하다	\N	\N	\N		기타
14843	every timewhen	할 때마다	\N	\N	\N		기타
14895	indifferent	무관심한	\N	\N	\N		하
14911	suffer from	로 부터 고통 받다	\N	\N	\N		기타
14931	invention	발명 발명품	\N	\N	\N		하
14987	hammertoe	갈고리 모양의 기형적인 발가락	\N	\N	\N		기타
15003	flee	달아나다 도망치다	\N	\N	\N		하
\.


--
-- TOC entry 4122 (class 0 OID 17393)
-- Dependencies: 345
-- Data for Name: messages_2025_09_06; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_09_06 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- TOC entry 4123 (class 0 OID 17404)
-- Dependencies: 346
-- Data for Name: messages_2025_09_07; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_09_07 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- TOC entry 4124 (class 0 OID 17415)
-- Dependencies: 347
-- Data for Name: messages_2025_09_08; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_09_08 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- TOC entry 4128 (class 0 OID 17961)
-- Dependencies: 351
-- Data for Name: messages_2025_09_09; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_09_09 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- TOC entry 4129 (class 0 OID 18057)
-- Dependencies: 352
-- Data for Name: messages_2025_09_10; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_09_10 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- TOC entry 4130 (class 0 OID 18068)
-- Dependencies: 353
-- Data for Name: messages_2025_09_11; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_09_11 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- TOC entry 4131 (class 0 OID 19363)
-- Dependencies: 354
-- Data for Name: messages_2025_09_12; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.messages_2025_09_12 (topic, extension, payload, event, private, updated_at, inserted_at, id) FROM stdin;
\.


--
-- TOC entry 4113 (class 0 OID 17003)
-- Dependencies: 332
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-09-05 01:20:27
20211116045059	2025-09-05 01:20:28
20211116050929	2025-09-05 01:20:29
20211116051442	2025-09-05 01:20:30
20211116212300	2025-09-05 01:20:31
20211116213355	2025-09-05 01:20:31
20211116213934	2025-09-05 01:20:32
20211116214523	2025-09-05 01:20:33
20211122062447	2025-09-05 01:20:34
20211124070109	2025-09-05 01:20:35
20211202204204	2025-09-05 01:20:36
20211202204605	2025-09-05 01:20:37
20211210212804	2025-09-05 01:20:39
20211228014915	2025-09-05 01:20:40
20220107221237	2025-09-05 01:20:41
20220228202821	2025-09-05 01:20:42
20220312004840	2025-09-05 01:20:43
20220603231003	2025-09-05 01:20:44
20220603232444	2025-09-05 01:20:45
20220615214548	2025-09-05 01:20:46
20220712093339	2025-09-05 01:20:47
20220908172859	2025-09-05 01:20:47
20220916233421	2025-09-05 01:20:48
20230119133233	2025-09-05 01:20:49
20230128025114	2025-09-05 01:20:50
20230128025212	2025-09-05 01:20:51
20230227211149	2025-09-05 01:20:52
20230228184745	2025-09-05 01:20:53
20230308225145	2025-09-05 01:20:53
20230328144023	2025-09-05 01:20:54
20231018144023	2025-09-05 01:20:55
20231204144023	2025-09-05 01:20:57
20231204144024	2025-09-05 01:20:57
20231204144025	2025-09-05 01:20:58
20240108234812	2025-09-05 01:20:59
20240109165339	2025-09-05 01:21:00
20240227174441	2025-09-05 01:21:01
20240311171622	2025-09-05 01:21:02
20240321100241	2025-09-05 01:21:04
20240401105812	2025-09-05 01:21:06
20240418121054	2025-09-05 01:21:07
20240523004032	2025-09-05 01:21:10
20240618124746	2025-09-05 01:21:11
20240801235015	2025-09-05 01:21:12
20240805133720	2025-09-05 01:21:13
20240827160934	2025-09-05 01:21:14
20240919163303	2025-09-05 01:21:15
20240919163305	2025-09-05 01:21:16
20241019105805	2025-09-05 01:21:16
20241030150047	2025-09-05 01:21:20
20241108114728	2025-09-05 01:21:21
20241121104152	2025-09-05 01:21:21
20241130184212	2025-09-05 01:21:22
20241220035512	2025-09-05 01:21:23
20241220123912	2025-09-05 01:21:24
20241224161212	2025-09-05 01:21:25
20250107150512	2025-09-05 01:21:26
20250110162412	2025-09-05 01:21:26
20250123174212	2025-09-05 01:21:27
20250128220012	2025-09-05 01:21:28
20250506224012	2025-09-05 01:21:29
20250523164012	2025-09-05 01:21:29
20250714121412	2025-09-05 01:21:30
\.


--
-- TOC entry 4118 (class 0 OID 17139)
-- Dependencies: 338
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- TOC entry 4099 (class 0 OID 16546)
-- Dependencies: 315
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- TOC entry 4119 (class 0 OID 17166)
-- Dependencies: 339
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (id, type, format, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4101 (class 0 OID 16588)
-- Dependencies: 317
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-09-05 01:20:25.806518
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-09-05 01:20:25.818772
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-09-05 01:20:25.828512
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-09-05 01:20:25.896933
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-09-05 01:20:26.140166
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-09-05 01:20:26.145734
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-09-05 01:20:26.15184
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-09-05 01:20:26.158847
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-09-05 01:20:26.164783
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-09-05 01:20:26.170823
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-09-05 01:20:26.177935
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-09-05 01:20:26.184228
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-09-05 01:20:26.197801
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-09-05 01:20:26.203437
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-09-05 01:20:26.209188
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-09-05 01:20:26.315951
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-09-05 01:20:26.321294
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-09-05 01:20:26.32658
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-09-05 01:20:26.335398
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-09-05 01:20:26.341993
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-09-05 01:20:26.348044
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-09-05 01:20:26.355451
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-09-05 01:20:26.377322
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-09-05 01:20:26.426421
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-09-05 01:20:26.431806
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-09-05 01:20:26.440385
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-09-05 01:20:26.445689
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-09-05 01:20:26.468059
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-09-05 01:20:26.480104
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-09-05 01:20:26.493942
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-09-05 01:20:26.504213
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-09-05 01:20:27.502978
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-09-05 01:20:27.585227
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-09-05 01:20:27.593995
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-09-05 01:20:27.596138
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-09-05 01:20:27.602699
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-09-05 01:20:27.607825
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-09-05 01:20:27.615968
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-09-05 01:20:27.621337
\.


--
-- TOC entry 4100 (class 0 OID 16561)
-- Dependencies: 316
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
\.


--
-- TOC entry 4116 (class 0 OID 17093)
-- Dependencies: 335
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4114 (class 0 OID 17040)
-- Dependencies: 333
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- TOC entry 4115 (class 0 OID 17054)
-- Dependencies: 334
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- TOC entry 4121 (class 0 OID 17348)
-- Dependencies: 344
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: supabase_migrations; Owner: postgres
--

COPY supabase_migrations.schema_migrations (version, statements, name) FROM stdin;
20250905014543	{"\\\\n\\\\nCREATE TABLE IF NOT EXISTS comments (\\\\n  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),\\\\n  word_id integer NOT NULL,\\\\n  content text NOT NULL,\\\\n  author text NOT NULL DEFAULT '익명',\\\\n  created_at timestamptz DEFAULT now(),\\\\n  updated_at timestamptz DEFAULT now()\\\\n)","\\\\n\\\\n-- Enable RLS\\\\nALTER TABLE comments ENABLE ROW LEVEL SECURITY","\\\\n\\\\n-- Allow anyone to read comments\\\\nCREATE POLICY \\"Anyone can read comments\\"\\\\n  ON comments\\\\n  FOR SELECT\\\\n  TO anon, authenticated\\\\n  USING (true)","\\\\n\\\\n-- Allow anyone to insert comments\\\\nCREATE POLICY \\"Anyone can insert comments\\"\\\\n  ON comments\\\\n  FOR INSERT\\\\n  TO anon, authenticated\\\\n  WITH CHECK (true)","\\\\n\\\\n-- Allow anyone to delete comments (for moderation purposes)\\\\nCREATE POLICY \\"Anyone can delete comments\\"\\\\n  ON comments\\\\n  FOR DELETE\\\\n  TO anon, authenticated\\\\n  USING (true)","\\\\n\\\\n-- Create index for better performance\\\\nCREATE INDEX IF NOT EXISTS comments_word_id_idx ON comments(word_id)","\\\\nCREATE INDEX IF NOT EXISTS comments_created_at_idx ON comments(created_at DESC)",""}	navy_king
\.


--
-- TOC entry 3637 (class 0 OID 16658)
-- Dependencies: 318
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4296 (class 0 OID 0)
-- Dependencies: 310
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- TOC entry 4297 (class 0 OID 0)
-- Dependencies: 349
-- Name: words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.words_id_seq', 16938, true);


--
-- TOC entry 4298 (class 0 OID 0)
-- Dependencies: 337
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- TOC entry 3811 (class 2606 OID 16827)
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- TOC entry 3766 (class 2606 OID 16531)
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 3834 (class 2606 OID 16933)
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- TOC entry 3790 (class 2606 OID 16951)
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- TOC entry 3792 (class 2606 OID 16961)
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- TOC entry 3764 (class 2606 OID 16524)
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- TOC entry 3813 (class 2606 OID 16820)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- TOC entry 3809 (class 2606 OID 16808)
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- TOC entry 3801 (class 2606 OID 17001)
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- TOC entry 3803 (class 2606 OID 16795)
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- TOC entry 3860 (class 2606 OID 17304)
-- Name: oauth_clients oauth_clients_client_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_client_id_key UNIQUE (client_id);


--
-- TOC entry 3863 (class 2606 OID 17302)
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3838 (class 2606 OID 16986)
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3758 (class 2606 OID 16514)
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3761 (class 2606 OID 16738)
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3823 (class 2606 OID 16867)
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- TOC entry 3825 (class 2606 OID 16865)
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3830 (class 2606 OID 16881)
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- TOC entry 3769 (class 2606 OID 16537)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3796 (class 2606 OID 16759)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3820 (class 2606 OID 16848)
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- TOC entry 3815 (class 2606 OID 16839)
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- TOC entry 3751 (class 2606 OID 16921)
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- TOC entry 3753 (class 2606 OID 16501)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3875 (class 2606 OID 17804)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 3877 (class 2606 OID 17912)
-- Name: words words_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT words_pkey PRIMARY KEY (id);


--
-- TOC entry 3865 (class 2606 OID 17345)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3869 (class 2606 OID 17401)
-- Name: messages_2025_09_06 messages_2025_09_06_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_09_06
    ADD CONSTRAINT messages_2025_09_06_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3871 (class 2606 OID 17412)
-- Name: messages_2025_09_07 messages_2025_09_07_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_09_07
    ADD CONSTRAINT messages_2025_09_07_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3873 (class 2606 OID 17423)
-- Name: messages_2025_09_08 messages_2025_09_08_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_09_08
    ADD CONSTRAINT messages_2025_09_08_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3879 (class 2606 OID 17969)
-- Name: messages_2025_09_09 messages_2025_09_09_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_09_09
    ADD CONSTRAINT messages_2025_09_09_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3881 (class 2606 OID 18065)
-- Name: messages_2025_09_10 messages_2025_09_10_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_09_10
    ADD CONSTRAINT messages_2025_09_10_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3883 (class 2606 OID 18076)
-- Name: messages_2025_09_11 messages_2025_09_11_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_09_11
    ADD CONSTRAINT messages_2025_09_11_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3885 (class 2606 OID 19371)
-- Name: messages_2025_09_12 messages_2025_09_12_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_09_12
    ADD CONSTRAINT messages_2025_09_12_pkey PRIMARY KEY (id, inserted_at);


--
-- TOC entry 3854 (class 2606 OID 17147)
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- TOC entry 3843 (class 2606 OID 17007)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3857 (class 2606 OID 17176)
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- TOC entry 3772 (class 2606 OID 16554)
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- TOC entry 3782 (class 2606 OID 16595)
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- TOC entry 3784 (class 2606 OID 16593)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3780 (class 2606 OID 16571)
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- TOC entry 3851 (class 2606 OID 17102)
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- TOC entry 3848 (class 2606 OID 17063)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- TOC entry 3846 (class 2606 OID 17048)
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- TOC entry 3867 (class 2606 OID 17354)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: supabase_migrations; Owner: postgres
--

ALTER TABLE ONLY supabase_migrations.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3767 (class 1259 OID 16532)
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- TOC entry 3741 (class 1259 OID 16748)
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3742 (class 1259 OID 16750)
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3743 (class 1259 OID 16751)
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3799 (class 1259 OID 16829)
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- TOC entry 3832 (class 1259 OID 16937)
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- TOC entry 3788 (class 1259 OID 16917)
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 3788
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- TOC entry 3793 (class 1259 OID 16745)
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- TOC entry 3835 (class 1259 OID 16934)
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- TOC entry 3836 (class 1259 OID 16935)
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- TOC entry 3807 (class 1259 OID 16940)
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- TOC entry 3804 (class 1259 OID 16801)
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- TOC entry 3805 (class 1259 OID 16946)
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- TOC entry 3858 (class 1259 OID 17305)
-- Name: oauth_clients_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_client_id_idx ON auth.oauth_clients USING btree (client_id);


--
-- TOC entry 3861 (class 1259 OID 17306)
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- TOC entry 3839 (class 1259 OID 16993)
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- TOC entry 3840 (class 1259 OID 16992)
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- TOC entry 3841 (class 1259 OID 16994)
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- TOC entry 3744 (class 1259 OID 16752)
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3745 (class 1259 OID 16749)
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- TOC entry 3754 (class 1259 OID 16515)
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- TOC entry 3755 (class 1259 OID 16516)
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- TOC entry 3756 (class 1259 OID 16744)
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- TOC entry 3759 (class 1259 OID 16831)
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- TOC entry 3762 (class 1259 OID 16936)
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- TOC entry 3826 (class 1259 OID 16873)
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- TOC entry 3827 (class 1259 OID 16938)
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- TOC entry 3828 (class 1259 OID 16888)
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- TOC entry 3831 (class 1259 OID 16887)
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- TOC entry 3794 (class 1259 OID 16939)
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- TOC entry 3797 (class 1259 OID 16830)
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- TOC entry 3818 (class 1259 OID 16855)
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- TOC entry 3821 (class 1259 OID 16854)
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- TOC entry 3816 (class 1259 OID 16840)
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- TOC entry 3817 (class 1259 OID 17002)
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- TOC entry 3806 (class 1259 OID 16999)
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- TOC entry 3798 (class 1259 OID 16828)
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- TOC entry 3746 (class 1259 OID 16908)
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- TOC entry 4300 (class 0 OID 0)
-- Dependencies: 3746
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- TOC entry 3747 (class 1259 OID 16746)
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- TOC entry 3748 (class 1259 OID 16505)
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- TOC entry 3749 (class 1259 OID 16963)
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- TOC entry 3852 (class 1259 OID 17346)
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- TOC entry 3855 (class 1259 OID 17226)
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- TOC entry 3770 (class 1259 OID 16560)
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- TOC entry 3773 (class 1259 OID 16582)
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- TOC entry 3844 (class 1259 OID 17074)
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- TOC entry 3774 (class 1259 OID 17120)
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- TOC entry 3775 (class 1259 OID 17039)
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- TOC entry 3776 (class 1259 OID 17151)
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- TOC entry 3849 (class 1259 OID 17152)
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- TOC entry 3777 (class 1259 OID 16583)
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- TOC entry 3778 (class 1259 OID 17121)
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- TOC entry 3886 (class 0 OID 0)
-- Name: messages_2025_09_06_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_09_06_pkey;


--
-- TOC entry 3887 (class 0 OID 0)
-- Name: messages_2025_09_07_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_09_07_pkey;


--
-- TOC entry 3888 (class 0 OID 0)
-- Name: messages_2025_09_08_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_09_08_pkey;


--
-- TOC entry 3889 (class 0 OID 0)
-- Name: messages_2025_09_09_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_09_09_pkey;


--
-- TOC entry 3890 (class 0 OID 0)
-- Name: messages_2025_09_10_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_09_10_pkey;


--
-- TOC entry 3891 (class 0 OID 0)
-- Name: messages_2025_09_11_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_09_11_pkey;


--
-- TOC entry 3892 (class 0 OID 0)
-- Name: messages_2025_09_12_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_09_12_pkey;


--
-- TOC entry 3917 (class 2620 OID 17178)
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- TOC entry 3910 (class 2620 OID 17159)
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- TOC entry 3911 (class 2620 OID 17118)
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- TOC entry 3912 (class 2620 OID 17116)
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- TOC entry 3913 (class 2620 OID 17117)
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- TOC entry 3915 (class 2620 OID 17155)
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- TOC entry 3916 (class 2620 OID 17115)
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- TOC entry 3914 (class 2620 OID 17027)
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- TOC entry 3895 (class 2606 OID 16732)
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3899 (class 2606 OID 16821)
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 3898 (class 2606 OID 16809)
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- TOC entry 3897 (class 2606 OID 16796)
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3904 (class 2606 OID 16987)
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3893 (class 2606 OID 16765)
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- TOC entry 3901 (class 2606 OID 16868)
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 3902 (class 2606 OID 16941)
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- TOC entry 3903 (class 2606 OID 16882)
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 3896 (class 2606 OID 16760)
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- TOC entry 3900 (class 2606 OID 16849)
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- TOC entry 3909 (class 2606 OID 17810)
-- Name: comments comments_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.comments(id) ON DELETE CASCADE;


--
-- TOC entry 3894 (class 2606 OID 16572)
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 3908 (class 2606 OID 17103)
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 3905 (class 2606 OID 17049)
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 3906 (class 2606 OID 17069)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- TOC entry 3907 (class 2606 OID 17064)
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- TOC entry 4069 (class 0 OID 16525)
-- Dependencies: 313
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4083 (class 0 OID 16927)
-- Dependencies: 330
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4074 (class 0 OID 16725)
-- Dependencies: 321
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4068 (class 0 OID 16518)
-- Dependencies: 312
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4078 (class 0 OID 16814)
-- Dependencies: 325
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4077 (class 0 OID 16802)
-- Dependencies: 324
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4076 (class 0 OID 16789)
-- Dependencies: 323
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4084 (class 0 OID 16977)
-- Dependencies: 331
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4067 (class 0 OID 16507)
-- Dependencies: 311
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4081 (class 0 OID 16856)
-- Dependencies: 328
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4082 (class 0 OID 16874)
-- Dependencies: 329
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4070 (class 0 OID 16533)
-- Dependencies: 314
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4075 (class 0 OID 16755)
-- Dependencies: 322
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4080 (class 0 OID 16841)
-- Dependencies: 327
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4079 (class 0 OID 16832)
-- Dependencies: 326
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4066 (class 0 OID 16495)
-- Dependencies: 309
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4089 (class 0 OID 17331)
-- Dependencies: 343
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4071 (class 0 OID 16546)
-- Dependencies: 315
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4088 (class 0 OID 17166)
-- Dependencies: 339
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4073 (class 0 OID 16588)
-- Dependencies: 317
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4072 (class 0 OID 16561)
-- Dependencies: 316
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4087 (class 0 OID 17093)
-- Dependencies: 335
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4085 (class 0 OID 17040)
-- Dependencies: 333
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4086 (class 0 OID 17054)
-- Dependencies: 334
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- TOC entry 4090 (class 6104 OID 16426)
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- TOC entry 4091 (class 6104 OID 17426)
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime_messages_publication OWNER TO supabase_admin;

--
-- TOC entry 4092 (class 6106 OID 17427)
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: supabase_admin
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- TOC entry 4137 (class 0 OID 0)
-- Dependencies: 76
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT USAGE ON SCHEMA auth TO postgres;


--
-- TOC entry 4138 (class 0 OID 0)
-- Dependencies: 23
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- TOC entry 4139 (class 0 OID 0)
-- Dependencies: 13
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- TOC entry 4140 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- TOC entry 4141 (class 0 OID 0)
-- Dependencies: 77
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- TOC entry 4142 (class 0 OID 0)
-- Dependencies: 32
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
GRANT USAGE ON SCHEMA vault TO service_role;


--
-- TOC entry 4149 (class 0 OID 0)
-- Dependencies: 418
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- TOC entry 4150 (class 0 OID 0)
-- Dependencies: 437
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- TOC entry 4152 (class 0 OID 0)
-- Dependencies: 417
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- TOC entry 4154 (class 0 OID 0)
-- Dependencies: 416
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- TOC entry 4155 (class 0 OID 0)
-- Dependencies: 412
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- TOC entry 4156 (class 0 OID 0)
-- Dependencies: 413
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- TOC entry 4157 (class 0 OID 0)
-- Dependencies: 384
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- TOC entry 4158 (class 0 OID 0)
-- Dependencies: 414
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- TOC entry 4159 (class 0 OID 0)
-- Dependencies: 388
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4160 (class 0 OID 0)
-- Dependencies: 390
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4161 (class 0 OID 0)
-- Dependencies: 381
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- TOC entry 4162 (class 0 OID 0)
-- Dependencies: 380
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- TOC entry 4163 (class 0 OID 0)
-- Dependencies: 387
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4164 (class 0 OID 0)
-- Dependencies: 389
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4165 (class 0 OID 0)
-- Dependencies: 391
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- TOC entry 4166 (class 0 OID 0)
-- Dependencies: 392
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- TOC entry 4167 (class 0 OID 0)
-- Dependencies: 385
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- TOC entry 4168 (class 0 OID 0)
-- Dependencies: 386
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- TOC entry 4170 (class 0 OID 0)
-- Dependencies: 419
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- TOC entry 4172 (class 0 OID 0)
-- Dependencies: 423
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4174 (class 0 OID 0)
-- Dependencies: 420
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- TOC entry 4175 (class 0 OID 0)
-- Dependencies: 383
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4176 (class 0 OID 0)
-- Dependencies: 382
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- TOC entry 4177 (class 0 OID 0)
-- Dependencies: 368
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


--
-- TOC entry 4178 (class 0 OID 0)
-- Dependencies: 367
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- TOC entry 4179 (class 0 OID 0)
-- Dependencies: 369
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


--
-- TOC entry 4180 (class 0 OID 0)
-- Dependencies: 415
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- TOC entry 4181 (class 0 OID 0)
-- Dependencies: 411
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- TOC entry 4182 (class 0 OID 0)
-- Dependencies: 405
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4183 (class 0 OID 0)
-- Dependencies: 407
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4184 (class 0 OID 0)
-- Dependencies: 409
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 4185 (class 0 OID 0)
-- Dependencies: 406
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4186 (class 0 OID 0)
-- Dependencies: 408
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4187 (class 0 OID 0)
-- Dependencies: 410
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- TOC entry 4188 (class 0 OID 0)
-- Dependencies: 401
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- TOC entry 4189 (class 0 OID 0)
-- Dependencies: 403
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- TOC entry 4190 (class 0 OID 0)
-- Dependencies: 402
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- TOC entry 4191 (class 0 OID 0)
-- Dependencies: 404
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- TOC entry 4192 (class 0 OID 0)
-- Dependencies: 397
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- TOC entry 4193 (class 0 OID 0)
-- Dependencies: 399
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4194 (class 0 OID 0)
-- Dependencies: 398
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 4195 (class 0 OID 0)
-- Dependencies: 400
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4196 (class 0 OID 0)
-- Dependencies: 393
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- TOC entry 4197 (class 0 OID 0)
-- Dependencies: 395
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- TOC entry 4198 (class 0 OID 0)
-- Dependencies: 394
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- TOC entry 4199 (class 0 OID 0)
-- Dependencies: 396
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- TOC entry 4200 (class 0 OID 0)
-- Dependencies: 421
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 422
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4203 (class 0 OID 0)
-- Dependencies: 424
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- TOC entry 4204 (class 0 OID 0)
-- Dependencies: 375
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- TOC entry 4205 (class 0 OID 0)
-- Dependencies: 376
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- TOC entry 4206 (class 0 OID 0)
-- Dependencies: 377
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 4207 (class 0 OID 0)
-- Dependencies: 378
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- TOC entry 4208 (class 0 OID 0)
-- Dependencies: 379
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- TOC entry 4209 (class 0 OID 0)
-- Dependencies: 370
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- TOC entry 4210 (class 0 OID 0)
-- Dependencies: 371
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- TOC entry 4211 (class 0 OID 0)
-- Dependencies: 373
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- TOC entry 4212 (class 0 OID 0)
-- Dependencies: 372
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- TOC entry 4213 (class 0 OID 0)
-- Dependencies: 374
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- TOC entry 4214 (class 0 OID 0)
-- Dependencies: 436
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- TOC entry 4215 (class 0 OID 0)
-- Dependencies: 366
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- TOC entry 4216 (class 0 OID 0)
-- Dependencies: 473
-- Name: FUNCTION insert_comment_with_parent(p_word_id integer, p_content text, p_author text, p_parent_id uuid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.insert_comment_with_parent(p_word_id integer, p_content text, p_author text, p_parent_id uuid) TO anon;
GRANT ALL ON FUNCTION public.insert_comment_with_parent(p_word_id integer, p_content text, p_author text, p_parent_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.insert_comment_with_parent(p_word_id integer, p_content text, p_author text, p_parent_id uuid) TO service_role;


--
-- TOC entry 4217 (class 0 OID 0)
-- Dependencies: 466
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 4218 (class 0 OID 0)
-- Dependencies: 472
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- TOC entry 4219 (class 0 OID 0)
-- Dependencies: 468
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- TOC entry 4220 (class 0 OID 0)
-- Dependencies: 464
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- TOC entry 4221 (class 0 OID 0)
-- Dependencies: 463
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- TOC entry 4222 (class 0 OID 0)
-- Dependencies: 467
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- TOC entry 4223 (class 0 OID 0)
-- Dependencies: 469
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- TOC entry 4224 (class 0 OID 0)
-- Dependencies: 462
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- TOC entry 4225 (class 0 OID 0)
-- Dependencies: 471
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- TOC entry 4226 (class 0 OID 0)
-- Dependencies: 461
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- TOC entry 4227 (class 0 OID 0)
-- Dependencies: 465
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- TOC entry 4228 (class 0 OID 0)
-- Dependencies: 470
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- TOC entry 4229 (class 0 OID 0)
-- Dependencies: 426
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


--
-- TOC entry 4230 (class 0 OID 0)
-- Dependencies: 428
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- TOC entry 4231 (class 0 OID 0)
-- Dependencies: 429
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


--
-- TOC entry 4233 (class 0 OID 0)
-- Dependencies: 313
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- TOC entry 4235 (class 0 OID 0)
-- Dependencies: 330
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 321
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 312
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 325
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 324
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 323
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 342
-- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.oauth_clients TO postgres;
GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


--
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 331
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 311
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- TOC entry 4252 (class 0 OID 0)
-- Dependencies: 310
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- TOC entry 4254 (class 0 OID 0)
-- Dependencies: 328
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- TOC entry 4256 (class 0 OID 0)
-- Dependencies: 329
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- TOC entry 4260 (class 0 OID 0)
-- Dependencies: 322
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 327
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- TOC entry 4265 (class 0 OID 0)
-- Dependencies: 326
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- TOC entry 4268 (class 0 OID 0)
-- Dependencies: 309
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- TOC entry 4269 (class 0 OID 0)
-- Dependencies: 308
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- TOC entry 4270 (class 0 OID 0)
-- Dependencies: 307
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 348
-- Name: TABLE comments; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.comments TO anon;
GRANT ALL ON TABLE public.comments TO authenticated;
GRANT ALL ON TABLE public.comments TO service_role;


--
-- TOC entry 4272 (class 0 OID 0)
-- Dependencies: 350
-- Name: TABLE words; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.words TO anon;
GRANT ALL ON TABLE public.words TO authenticated;
GRANT ALL ON TABLE public.words TO service_role;


--
-- TOC entry 4274 (class 0 OID 0)
-- Dependencies: 349
-- Name: SEQUENCE words_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.words_id_seq TO anon;
GRANT ALL ON SEQUENCE public.words_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.words_id_seq TO service_role;


--
-- TOC entry 4275 (class 0 OID 0)
-- Dependencies: 343
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- TOC entry 4276 (class 0 OID 0)
-- Dependencies: 345
-- Name: TABLE messages_2025_09_06; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_09_06 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_09_06 TO dashboard_user;


--
-- TOC entry 4277 (class 0 OID 0)
-- Dependencies: 346
-- Name: TABLE messages_2025_09_07; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_09_07 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_09_07 TO dashboard_user;


--
-- TOC entry 4278 (class 0 OID 0)
-- Dependencies: 347
-- Name: TABLE messages_2025_09_08; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_09_08 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_09_08 TO dashboard_user;


--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 351
-- Name: TABLE messages_2025_09_09; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_09_09 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_09_09 TO dashboard_user;


--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 352
-- Name: TABLE messages_2025_09_10; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_09_10 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_09_10 TO dashboard_user;


--
-- TOC entry 4281 (class 0 OID 0)
-- Dependencies: 353
-- Name: TABLE messages_2025_09_11; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_09_11 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_09_11 TO dashboard_user;


--
-- TOC entry 4282 (class 0 OID 0)
-- Dependencies: 354
-- Name: TABLE messages_2025_09_12; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_09_12 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_09_12 TO dashboard_user;


--
-- TOC entry 4283 (class 0 OID 0)
-- Dependencies: 332
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- TOC entry 4284 (class 0 OID 0)
-- Dependencies: 338
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- TOC entry 4285 (class 0 OID 0)
-- Dependencies: 337
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- TOC entry 4287 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


--
-- TOC entry 4288 (class 0 OID 0)
-- Dependencies: 339
-- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
GRANT ALL ON TABLE storage.buckets_analytics TO anon;


--
-- TOC entry 4290 (class 0 OID 0)
-- Dependencies: 316
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


--
-- TOC entry 4291 (class 0 OID 0)
-- Dependencies: 335
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- TOC entry 4292 (class 0 OID 0)
-- Dependencies: 333
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 334
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- TOC entry 4294 (class 0 OID 0)
-- Dependencies: 318
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


--
-- TOC entry 4295 (class 0 OID 0)
-- Dependencies: 319
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


--
-- TOC entry 2450 (class 826 OID 16603)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- TOC entry 2451 (class 826 OID 16604)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- TOC entry 2449 (class 826 OID 16602)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


--
-- TOC entry 2460 (class 826 OID 16682)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


--
-- TOC entry 2459 (class 826 OID 16681)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


--
-- TOC entry 2458 (class 826 OID 16680)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


--
-- TOC entry 2463 (class 826 OID 16637)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2462 (class 826 OID 16636)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2461 (class 826 OID 16635)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2455 (class 826 OID 16617)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2457 (class 826 OID 16616)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2456 (class 826 OID 16615)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2442 (class 826 OID 16490)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2443 (class 826 OID 16491)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2441 (class 826 OID 16489)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2445 (class 826 OID 16493)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2440 (class 826 OID 16488)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2444 (class 826 OID 16492)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 2453 (class 826 OID 16607)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


--
-- TOC entry 2454 (class 826 OID 16608)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


--
-- TOC entry 2452 (class 826 OID 16606)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


--
-- TOC entry 2448 (class 826 OID 16545)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


--
-- TOC entry 2447 (class 826 OID 16544)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


--
-- TOC entry 2446 (class 826 OID 16543)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


--
-- TOC entry 3630 (class 3466 OID 16621)
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- TOC entry 3635 (class 3466 OID 16700)
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- TOC entry 3629 (class 3466 OID 16619)
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- TOC entry 3636 (class 3466 OID 16703)
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

--
-- TOC entry 3631 (class 3466 OID 16622)
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- TOC entry 3632 (class 3466 OID 16623)
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

-- Completed on 2025-09-10 09:10:20

--
-- PostgreSQL database dump complete
--

\unrestrict zkJY2asSWcNoJN5y1sN6O5JDV34zn7v8zKrmAZJUsZlknUOwUG2AUj8HHdYSQNp

-- Completed on 2025-09-10 09:10:20

--
-- PostgreSQL database cluster dump complete
--

