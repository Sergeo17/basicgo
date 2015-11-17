
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied
-- +goose StatementBegin

-- FTP schema
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

CREATE SCHEMA ftb;
COMMENT ON SCHEMA ftb IS 'Feed The Beast schema';

SET search_path = ftb, pg_catalog, public;
SET default_tablespace = '';
SET default_with_oids = false;

------------------------

CREATE SEQUENCE department_seq;
CREATE TABLE department (
  department_id         smallint NOT NULL DEFAULT nextval('department_seq'),
  name                  character varying(100) NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY department ADD CONSTRAINT pk_department PRIMARY KEY (department_id);

COMMENT ON COLUMN department.department_id IS '';
COMMENT ON COLUMN department.name IS '';
COMMENT ON COLUMN department.created_by_user IS 'User who created the record';
COMMENT ON COLUMN department.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN department.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN department.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE lead_seq;
CREATE TABLE lead (
  lead_id               integer NOT NULL DEFAULT nextval('lead_seq'),
  data                  hstore,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY lead ADD CONSTRAINT pk_lead PRIMARY KEY (lead_id);

COMMENT ON COLUMN lead.lead_id IS '';
COMMENT ON COLUMN lead.data IS '';
COMMENT ON COLUMN lead.created_by_user IS 'User who created the record';
COMMENT ON COLUMN lead.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN lead.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN lead.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE market_seq;
CREATE TABLE market (
  market_id             smallint NOT NULL DEFAULT nextval('market_seq'),
  name                  character varying(100) NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY market ADD CONSTRAINT pk_market PRIMARY KEY (market_id);

COMMENT ON COLUMN market.market_id IS '';
COMMENT ON COLUMN market.name IS '';
COMMENT ON COLUMN market.created_by_user IS 'User who created the record';
COMMENT ON COLUMN market.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN market.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN market.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE milestone_seq;
CREATE TABLE milestone (
  milestone_id          smallint NOT NULL DEFAULT nextval('milestone_seq'),
  name                  character varying(100) NOT NULL,
  url                   text,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY milestone ADD CONSTRAINT pk_milestone PRIMARY KEY (milestone_id);

COMMENT ON COLUMN milestone.milestone_id IS '';
COMMENT ON COLUMN milestone.name IS '';
COMMENT ON COLUMN milestone.url IS '';
COMMENT ON COLUMN milestone.created_by_user IS 'User who created the record';
COMMENT ON COLUMN milestone.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN milestone.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN milestone.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE role_seq;
CREATE TABLE role (
  role_id               smallint NOT NULL DEFAULT nextval('role_seq'),
  name                  character varying(100) NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY role ADD CONSTRAINT pk_role PRIMARY KEY (role_id);

COMMENT ON COLUMN role.role_id IS '';
COMMENT ON COLUMN role.name IS '';
COMMENT ON COLUMN role.created_by_user IS 'User who created the record';
COMMENT ON COLUMN role.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN role.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN role.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE status_seq;
CREATE TABLE status (
  status_id             smallint NOT NULL DEFAULT nextval('status_seq'),
  name                  character varying(100) NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY status ADD CONSTRAINT pk_status PRIMARY KEY (status_id);

COMMENT ON COLUMN status.status_id IS '';
COMMENT ON COLUMN status.name IS '';
COMMENT ON COLUMN status.created_by_user IS 'User who created the record';
COMMENT ON COLUMN status.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN status.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN status.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE timeline_event_type_seq;
CREATE TABLE timeline_event_type (
  timeline_event_type_id smallint NOT NULL DEFAULT nextval('timeline_event_type_seq'),
  name                  character varying(100) NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY timeline_event_type ADD CONSTRAINT pk_timeline_event_type PRIMARY KEY (timeline_event_type_id);

COMMENT ON COLUMN timeline_event_type.timeline_event_type_id IS '';
COMMENT ON COLUMN timeline_event_type.name IS '';
COMMENT ON COLUMN timeline_event_type.created_by_user IS 'User who created the record';
COMMENT ON COLUMN timeline_event_type.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN timeline_event_type.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN timeline_event_type.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE TABLE employee (
  employee_number       integer NOT NULL,
  address_guid          uuid NOT NULL,
  contact_guid          uuid NOT NULL,
  department_id         smallint NOT NULL,
  is_active             boolean NOT NULL DEFAULT true,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY employee ADD CONSTRAINT pk_employee PRIMARY KEY (employee_number);
ALTER TABLE ONLY employee ADD CONSTRAINT fk_employee__department_id FOREIGN KEY (department_id) REFERENCES department (department_id);

COMMENT ON COLUMN employee.employee_number IS '';
COMMENT ON COLUMN employee.address_guid IS '';
COMMENT ON COLUMN employee.contact_guid IS '';
COMMENT ON COLUMN employee.department_id IS '';
COMMENT ON COLUMN employee.is_active IS '';
COMMENT ON COLUMN employee.created_by_user IS 'User who created the record';
COMMENT ON COLUMN employee.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN employee.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN employee.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE employee_role_seq;
CREATE TABLE employee_role (
  employee_role_id      integer NOT NULL DEFAULT nextval('employee_role_seq'),
  employee_number       integer NOT NULL,
  role_id               smallint NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY employee_role ADD CONSTRAINT pk_employee_role PRIMARY KEY (employee_role_id);
ALTER TABLE ONLY employee_role ADD CONSTRAINT fk_employee_role__employee_number FOREIGN KEY (employee_number) REFERENCES employee (employee_number);
ALTER TABLE ONLY employee_role ADD CONSTRAINT fk_employee_role__role_id FOREIGN KEY (role_id) REFERENCES role (role_id);

COMMENT ON COLUMN employee_role.employee_role_id IS '';
COMMENT ON COLUMN employee_role.employee_number IS '';
COMMENT ON COLUMN employee_role.role_id IS '';
COMMENT ON COLUMN employee_role.created_by_user IS 'User who created the record';
COMMENT ON COLUMN employee_role.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN employee_role.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN employee_role.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE deal_seq;
CREATE TABLE deal (
  deal_id               integer NOT NULL DEFAULT nextval('deal_seq'),
  deal_guid             uuid NOT NULL default uuid_generate_v4(),
  account_guid          uuid,
  referenced_by_contact_guid uuid,
  lead_id               integer NOT NULL,
  partner_account_guid  uuid,
  market_id             smallint NOT NULL,
  status_id             smallint NOT NULL,
  is_active             boolean NOT NULL DEFAULT true,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY deal ADD CONSTRAINT pk_deal PRIMARY KEY (deal_id);
ALTER TABLE ONLY deal ADD CONSTRAINT fk_deal__lead_id FOREIGN KEY (lead_id) REFERENCES lead (lead_id);
ALTER TABLE ONLY deal ADD CONSTRAINT fk_deal__market_id FOREIGN KEY (market_id) REFERENCES market (market_id);
ALTER TABLE ONLY deal ADD CONSTRAINT fk_deal__status_id FOREIGN KEY (status_id) REFERENCES status (status_id);

COMMENT ON COLUMN deal.deal_id IS '';
COMMENT ON COLUMN deal.deal_guid IS '';
COMMENT ON COLUMN deal.account_guid IS '';
COMMENT ON COLUMN deal.referenced_by_contact_guid IS '';
COMMENT ON COLUMN deal.lead_id IS '';
COMMENT ON COLUMN deal.partner_account_guid IS '';
COMMENT ON COLUMN deal.market_id IS '';
COMMENT ON COLUMN deal.status_id IS '';
COMMENT ON COLUMN deal.is_active IS '';
COMMENT ON COLUMN deal.created_by_user IS 'User who created the record';
COMMENT ON COLUMN deal.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN deal.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN deal.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE campaign_seq;
CREATE TABLE campaign (
  campaign_id           integer NOT NULL default nextval('campaign_seq'),
  campaign_guid         uuid NOT NULL default uuid_generate_v4(),
  is_active             boolean NOT NULL DEFAULT true,
  active_from_timestamp timestamp with time zone NOT NULL default now(),
  active_to_timestamp   timestamp with time zone NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY campaign ADD CONSTRAINT pk_campaign PRIMARY KEY (campaign_id);

COMMENT ON COLUMN campaign.campaign_id IS '';
COMMENT ON COLUMN campaign.campaign_guid IS '';
COMMENT ON COLUMN campaign.is_active IS '';
COMMENT ON COLUMN campaign.active_from_timestamp IS '';
COMMENT ON COLUMN campaign.active_to_timestamp IS '';
COMMENT ON COLUMN campaign.created_by_user IS 'User who created the record';
COMMENT ON COLUMN campaign.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN campaign.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN campaign.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE campaign_deal_seq;
CREATE TABLE campaign_deal (
  campaign_deal_id      integer NOT NULL default nextval('campaign_deal_seq'),
  campaign_id           integer NOT NULL,
  deal_id               integer NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY campaign_deal ADD CONSTRAINT pk_campaign_deal PRIMARY KEY (campaign_deal_id);
ALTER TABLE ONLY campaign_deal ADD CONSTRAINT fk_campaign_deal__campaign_id FOREIGN KEY (campaign_id) REFERENCES campaign (campaign_id);
ALTER TABLE ONLY campaign_deal ADD CONSTRAINT fk_campaign_deal__deal_id FOREIGN KEY (deal_id) REFERENCES deal (deal_id);

COMMENT ON COLUMN campaign_deal.campaign_deal_id IS '';
COMMENT ON COLUMN campaign_deal.campaign_id IS '';
COMMENT ON COLUMN campaign_deal.deal_id IS '';
COMMENT ON COLUMN campaign_deal.created_by_user IS 'User who created the record';
COMMENT ON COLUMN campaign_deal.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN campaign_deal.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN campaign_deal.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE conversion_event_seq;
CREATE TABLE conversion_event (
  conversion_event_id   integer NOT NULL default nextval('conversion_event_seq'),
  lead_id               integer NOT NULL,
  deal_id               integer NOT NULL,
  is_success            boolean NOT NULL,
  is_duplicate          boolean NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY conversion_event ADD CONSTRAINT pk_conversion_event PRIMARY KEY (conversion_event_id);
ALTER TABLE ONLY conversion_event ADD CONSTRAINT fk_conversion_event__lead_id FOREIGN KEY (lead_id) REFERENCES lead (lead_id);
ALTER TABLE ONLY conversion_event ADD CONSTRAINT fk_conversion_event__deal_id FOREIGN KEY (deal_id) REFERENCES deal (deal_id);

COMMENT ON COLUMN conversion_event.conversion_event_id IS '';
COMMENT ON COLUMN conversion_event.lead_id IS '';
COMMENT ON COLUMN conversion_event.deal_id IS '';
COMMENT ON COLUMN conversion_event.is_success IS '';
COMMENT ON COLUMN conversion_event.is_duplicate IS '';
COMMENT ON COLUMN conversion_event.created_by_user IS 'User who created the record';
COMMENT ON COLUMN conversion_event.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN conversion_event.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN conversion_event.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE timeline_event_seq;
CREATE TABLE timeline_event (
  timeline_event_id     integer NOT NULL default nextval('timeline_event_seq'),
  contact_guid          uuid NOT NULL,
  deal_id               integer NOT NULL,
  event_timestamp       timestamp with time zone NOT NULL default now(),
  timeline_event_type_id smallint NOT NULL,
  description           text,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY timeline_event ADD CONSTRAINT pk_timeline_event PRIMARY KEY (timeline_event_id);
ALTER TABLE ONLY timeline_event ADD CONSTRAINT fk_timeline_event__deal_id FOREIGN KEY (deal_id) REFERENCES deal (deal_id);
ALTER TABLE ONLY timeline_event ADD CONSTRAINT fk_timeline_event__timeline_event_type_id 
  FOREIGN KEY (timeline_event_type_id) REFERENCES timeline_event_type (timeline_event_type_id);

COMMENT ON COLUMN timeline_event.timeline_event_id IS '';
COMMENT ON COLUMN timeline_event.contact_guid IS '';
COMMENT ON COLUMN timeline_event.deal_id IS '';
COMMENT ON COLUMN timeline_event.event_timestamp IS '';
COMMENT ON COLUMN timeline_event.timeline_event_type_id IS '';
COMMENT ON COLUMN timeline_event.description IS '';
COMMENT ON COLUMN timeline_event.created_by_user IS 'User who created the record';
COMMENT ON COLUMN timeline_event.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN timeline_event.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN timeline_event.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE calendar_event_seq;
CREATE TABLE calendar_event (
  calendar_event_id     integer NOT NULL default nextval('calendar_event_seq'),
  calendar_event_guid   uuid NOT NULL DEFAULT uuid_generate_v4(),
  contact_guid          uuid NOT NULL,
  deal_id               integer NOT NULL,
  subject               text,
  body                  text,
  start_timestamp       timestamp without time zone NOT NULL,
  end_timestamp         timestamp without time zone,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY calendar_event ADD CONSTRAINT pk_calendar_event PRIMARY KEY (calendar_event_id);
ALTER TABLE ONLY calendar_event ADD CONSTRAINT fk_calendar_event__deal_id FOREIGN KEY (deal_id) REFERENCES deal (deal_id);

COMMENT ON COLUMN calendar_event.calendar_event_id IS '';
COMMENT ON COLUMN calendar_event.calendar_event_guid IS '';
COMMENT ON COLUMN calendar_event.contact_guid IS '';
COMMENT ON COLUMN calendar_event.deal_id IS '';
COMMENT ON COLUMN calendar_event.subject IS '';
COMMENT ON COLUMN calendar_event.body IS '';
COMMENT ON COLUMN calendar_event.start_timestamp IS '';
COMMENT ON COLUMN calendar_event.end_timestamp IS '';
COMMENT ON COLUMN calendar_event.created_by_user IS 'User who created the record';
COMMENT ON COLUMN calendar_event.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN calendar_event.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN calendar_event.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE task_seq;
CREATE TABLE task (
  task_id               integer NOT NULL default nextval('task_seq'),
  deal_id               integer NOT NULL,
  contact_guid          uuid NOT NULL,
  description           text,
  action_timestamp      timestamp without time zone NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY task ADD CONSTRAINT pk_task PRIMARY KEY (task_id);
ALTER TABLE ONLY task ADD CONSTRAINT fk_task__deal_id FOREIGN KEY (deal_id) REFERENCES deal (deal_id);

COMMENT ON COLUMN task.task_id IS '';
COMMENT ON COLUMN task.deal_id IS '';
COMMENT ON COLUMN task.contact_guid IS '';
COMMENT ON COLUMN task.description IS '';
COMMENT ON COLUMN task.action_timestamp IS '';
COMMENT ON COLUMN task.created_by_user IS 'User who created the record';
COMMENT ON COLUMN task.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN task.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN task.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE milestone_template_seq;
CREATE TABLE milestone_template (
  milestone_template_id integer NOT NULL default nextval('milestone_template_seq'),
  market_id             integer NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY milestone_template ADD CONSTRAINT pk_milestone_template PRIMARY KEY (milestone_template_id);
ALTER TABLE ONLY milestone_template ADD CONSTRAINT fk_milestone_template__market_id FOREIGN KEY (market_id) REFERENCES market (market_id);

COMMENT ON COLUMN milestone_template.milestone_template_id IS '';
COMMENT ON COLUMN milestone_template.market_id IS '';
COMMENT ON COLUMN milestone_template.created_by_user IS 'User who created the record';
COMMENT ON COLUMN milestone_template.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN milestone_template.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN milestone_template.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE deal_milestone_seq;
CREATE TABLE deal_milestone (
  deal_milestone_id     integer NOT NULL default nextval('deal_milestone_seq'),
  milestone_id          integer NOT NULL,
  deal_id               integer NOT NULL,
  milestone_completion_timestamp timestamp without time zone NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY deal_milestone ADD CONSTRAINT pk_deal_milestone PRIMARY KEY (deal_milestone_id);
ALTER TABLE ONLY deal_milestone ADD CONSTRAINT fk_deal_milestone__deal_id FOREIGN KEY (deal_id) REFERENCES deal (deal_id);
ALTER TABLE ONLY deal_milestone ADD CONSTRAINT fk_deal_milestone__milestone_id FOREIGN KEY (milestone_id) REFERENCES milestone (milestone_id);

COMMENT ON COLUMN deal_milestone.deal_milestone_id IS '';
COMMENT ON COLUMN deal_milestone.milestone_id IS '';
COMMENT ON COLUMN deal_milestone.deal_id IS '';
COMMENT ON COLUMN deal_milestone.milestone_completion_timestamp IS '';
COMMENT ON COLUMN deal_milestone.created_by_user IS 'User who created the record';
COMMENT ON COLUMN deal_milestone.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN deal_milestone.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN deal_milestone.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE milestone_item_seq;
CREATE TABLE milestone_item (
  milestone_item_id     integer NOT NULL default nextval('milestone_item_seq'),
  milestone_id          integer NOT NULL,
  milestone_template_id integer NOT NULL,
  status_id             smallint NOT NULL,
  ordinal               smallint NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY milestone_item ADD CONSTRAINT pk_milestone_item PRIMARY KEY (milestone_item_id);
ALTER TABLE ONLY milestone_item ADD CONSTRAINT fk_milestone_item__milestone_id FOREIGN KEY (milestone_id) REFERENCES milestone (milestone_id);
ALTER TABLE ONLY milestone_item ADD CONSTRAINT fk_milestone_item__milestone_template_id 
  FOREIGN KEY (milestone_template_id) REFERENCES milestone_template (milestone_template_id);

COMMENT ON COLUMN milestone_item.milestone_item_id IS '';
COMMENT ON COLUMN milestone_item.milestone_id IS '';
COMMENT ON COLUMN milestone_item.milestone_template_id IS '';
COMMENT ON COLUMN milestone_item.status_id IS '';
COMMENT ON COLUMN milestone_item.ordinal IS '';
COMMENT ON COLUMN milestone_item.created_by_user IS 'User who created the record';
COMMENT ON COLUMN milestone_item.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN milestone_item.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN milestone_item.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

CREATE SEQUENCE sub_milestone_item_seq;
CREATE TABLE sub_milestone_item (
  sub_milestone_item_id integer NOT NULL default nextval('sub_milestone_item_seq'),
  milestone_id          integer NOT NULL,
  milestone_item_id     integer NOT NULL,
  created_by_user       character varying(50) NOT NULL DEFAULT current_user,
  created_timestamp     timestamp without time zone NOT NULL default (now() at time zone 'utc'),
  modified_by_user      character varying(50) NOT NULL DEFAULT current_user,
  modified_timestamp    timestamp without time zone NOT NULL default (now() at time zone 'utc')
);

ALTER TABLE ONLY sub_milestone_item ADD CONSTRAINT pk_sub_milestone_item PRIMARY KEY (sub_milestone_item_id);
ALTER TABLE ONLY sub_milestone_item ADD CONSTRAINT fk_sub_milestone_item__milestone_id 
  FOREIGN KEY (milestone_id) REFERENCES milestone (milestone_id);
ALTER TABLE ONLY sub_milestone_item ADD CONSTRAINT fk_sub_milestone_item__milestone_item_id 
  FOREIGN KEY (milestone_item_id) REFERENCES milestone_item (milestone_item_id);

COMMENT ON COLUMN sub_milestone_item.sub_milestone_item_id IS '';
COMMENT ON COLUMN sub_milestone_item.milestone_id IS '';
COMMENT ON COLUMN sub_milestone_item.milestone_item_id IS '';
COMMENT ON COLUMN sub_milestone_item.created_by_user IS 'User who created the record';
COMMENT ON COLUMN sub_milestone_item.created_timestamp IS 'Timestamp record was created';
COMMENT ON COLUMN sub_milestone_item.modified_by_user IS 'Record was last modified by user';
COMMENT ON COLUMN sub_milestone_item.modified_timestamp IS 'Record was last modified at this timestamp';

------------------------

-- +goose StatementEnd

-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back

DROP SCHEMA ftb CASCADE;
