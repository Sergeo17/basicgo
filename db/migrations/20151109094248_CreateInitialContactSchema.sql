
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied
-- +goose StatementBegin

-- FTB Contact Schema

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

CREATE SCHEMA contact;
COMMENT ON SCHEMA contact IS 'Contact schema';

CREATE EXTENSION "uuid-ossp" WITH SCHEMA pg_catalog;
COMMENT ON EXTENSION "uuid-ossp" IS 'Functions to generate UUIDs in the DB';

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA pg_catalog;

SET search_path = contact, pg_catalog, public;
SET default_tablespace = '';
SET default_with_oids = false;

------------------------

CREATE SEQUENCE account_type_seq;
CREATE TABLE account_type (
  account_type_id       smallint NOT NULL DEFAULT nextval('account_type_seq'),
  name                  character varying(50) NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

COMMENT ON COLUMN account_type.name IS 'Account Type Name';

ALTER TABLE ONLY account_type ADD CONSTRAINT pk_account_type PRIMARY KEY (account_type_id);

------------------------

CREATE SEQUENCE address_status_seq;
CREATE TABLE address_status (
  address_status_id     smallint NOT NULL DEFAULT nextval('address_status_seq'),
  description           character varying(100) NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY address_status ADD CONSTRAINT pk_address_status PRIMARY KEY (address_status_id);

------------------------

CREATE SEQUENCE address_seq;
CREATE TABLE address (
  address_id            integer NOT NULL DEFAULT nextval('address_seq'),
  address_guid          uuid NOT NULL,
  line_1                character varying(64),
  line_2                character varying(64),
  line_3                character varying(64),
  city                  character varying(64),
  postal_code           character varying(16),
  country_code_iso_3166 character(2),
  state                 character varying(50),
  latitude              numeric(9,6),
  longitude             numeric(9,6),
  address_status_id     smallint NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

COMMENT ON COLUMN address.line_1 IS 'http://pe.usps.com/text/pub28/welcome.htm';
COMMENT ON COLUMN address.line_2 IS 'http://pe.usps.com/text/pub28/welcome.htm';
COMMENT ON COLUMN address.line_3 IS 'http://pe.usps.com/text/pub28/welcome.htm';

ALTER TABLE ONLY address ADD CONSTRAINT pk_address PRIMARY KEY (address_id);
ALTER TABLE ONLY address ADD CONSTRAINT fk_address__address_status_id FOREIGN KEY (address_status_id) REFERENCES address_status (address_status_id);

------------------------

CREATE SEQUENCE contact_type_seq;
CREATE TABLE contact_type (
  contact_type_id       smallint NOT NULL DEFAULT nextval('contact_type_seq'),
  name                  character varying(50),
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

COMMENT ON COLUMN contact_type.name IS 'Contact Type Name';
COMMENT ON COLUMN contact_type.created_by_user IS 'User who created the record';
COMMENT ON COLUMN contact_type.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN contact_type.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN contact_type.modified_timestamp IS 'Record was last modified at this timestamp';

ALTER TABLE ONLY contact_type ADD CONSTRAINT pk_contact_type PRIMARY KEY (contact_type_id);

------------------------

CREATE SEQUENCE contact_seq;
CREATE TABLE contact (
  contact_id            integer NOT NULL DEFAULT nextval('contact_seq'),
  contact_guid          uuid,
  first_name            character varying(50),
  middle_name           character varying(50),
  last_name             character varying(100),
  email_address         character varying(254),
  mobile_phone          integer,
  other_phone           integer,
  billing_address_id    integer,
  mailing_address_id    integer,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

COMMENT ON COLUMN contact.contact_id IS 'Contact ID';
COMMENT ON COLUMN contact.contact_guid IS 'Contact GUID, for cross-schema references';
COMMENT ON COLUMN contact.first_name IS 'Given name of contact';
COMMENT ON COLUMN contact.middle_name IS 'Middle name of contact';
COMMENT ON COLUMN contact.last_name IS 'Surname of contact';
COMMENT ON COLUMN contact.email_address IS 'Unencrypted primary email address of contact';
COMMENT ON COLUMN contact.mobile_phone IS 'INTEGER value of mobile phone';
COMMENT ON COLUMN contact.other_phone IS 'INTEGER value of other phone';
COMMENT ON COLUMN contact.billing_address_id IS 'address_id of billing address for contact';
COMMENT ON COLUMN contact.mailing_address_id IS 'address_id of mailing address for contact';
COMMENT ON COLUMN contact.created_by_user IS 'User who created the record';
COMMENT ON COLUMN contact.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN contact.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN contact.modified_timestamp IS 'Record was last modified at this timestamp';

ALTER TABLE ONLY contact ADD CONSTRAINT pk_contact PRIMARY KEY (contact_id);
ALTER TABLE ONLY contact ADD CONSTRAINT fk_contact__billing_address_id FOREIGN KEY (billing_address_id) REFERENCES address (address_id);
ALTER TABLE ONLY contact ADD CONSTRAINT fk_contact__mailing_address_id FOREIGN KEY (mailing_address_id) REFERENCES address (address_id);

------------------------

CREATE SEQUENCE account_seq;
CREATE TABLE account (
  account_id            integer NOT NULL DEFAULT nextval('account_seq'),
  account_guid          uuid,
  conversion_timestamp  timestamp with time zone,
  account_type_id       smallint NOT NULL,
  parent_account_id     integer,
  billing_address_id    integer,
  mailing_address_id    integer,
  system_address_id     integer,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

COMMENT ON COLUMN account.account_id IS 'ID of account';
COMMENT ON COLUMN account.account_guid IS 'GUID of account, for cross-schema references';
COMMENT ON COLUMN account.conversion_timestamp IS '';
COMMENT ON COLUMN account.account_type_id IS '';
COMMENT ON COLUMN account.parent_account_id IS '';
COMMENT ON COLUMN account.billing_address_id IS 'address_id of billing address for account';
COMMENT ON COLUMN account.mailing_address_id IS 'address_id of mailing address for account';
COMMENT ON COLUMN account.system_address_id IS 'address_id of system address for account';
COMMENT ON COLUMN account.created_by_user IS 'User who created the record';
COMMENT ON COLUMN account.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN account.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN account.modified_timestamp IS 'Record was last modified at this timestamp';

ALTER TABLE ONLY account ADD CONSTRAINT pk_account PRIMARY KEY (account_id);
ALTER TABLE ONLY account ADD CONSTRAINT fk_account__account_type_id FOREIGN KEY (account_type_id) REFERENCES account_type (account_type_id);
ALTER TABLE ONLY account ADD CONSTRAINT fk_account__billing_address_id FOREIGN KEY (billing_address_id) REFERENCES address (address_id);
ALTER TABLE ONLY account ADD CONSTRAINT fk_account__mailing_address_id FOREIGN KEY (mailing_address_id) REFERENCES address (address_id);
ALTER TABLE ONLY account ADD CONSTRAINT fk_account__system_address_id FOREIGN KEY (system_address_id) REFERENCES address (address_id);
ALTER TABLE ONLY account ADD CONSTRAINT fk_account__parent_account_id FOREIGN KEY (parent_account_id) REFERENCES account (account_id);

------------------------

CREATE SEQUENCE account_contact_seq;
CREATE TABLE account_contact (
  account_contact_id    integer NOT NULL DEFAULT nextval('account_contact_seq'),
  account_id            integer NOT NULL,
  contact_id            integer NOT NULL,
  contact_type_id       smallint NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

COMMENT ON COLUMN account_contact.created_by_user IS 'User who created the record';
COMMENT ON COLUMN account_contact.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN account_contact.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN account_contact.modified_timestamp IS 'Record was last modified at this timestamp';

ALTER TABLE ONLY account_contact ADD CONSTRAINT pk_account_contact PRIMARY KEY (account_contact_id);
ALTER TABLE ONLY account_contact ADD CONSTRAINT fk_account_contact__account_id FOREIGN KEY (account_id) REFERENCES account (account_id);
ALTER TABLE ONLY account_contact ADD CONSTRAINT fk_account_contact__contact_id FOREIGN KEY (contact_id) REFERENCES contact (contact_id);
ALTER TABLE ONLY account_contact ADD CONSTRAINT fk_account_contact__contact_type_id FOREIGN KEY (contact_type_id) REFERENCES contact_type (contact_type_id);

-- +goose StatementEnd


-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP SCHEMA contact CASCADE;

DROP EXTENSION "uuid-ossp";
DROP EXTENSION hstore;

