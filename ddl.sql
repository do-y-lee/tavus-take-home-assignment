-- #########################################################
-- # DDL for Tavus Take Home Assignment 
-- # Pushed all data to local postgres database
-- #########################################################

-- Removed duplicate emails 
CREATE TABLE public.users (
	avatar_color varchar(50) DEFAULT NULL::bpchar NULL,
	billing_account_id varchar NULL,
	created_at timestamp DEFAULT timezone('utc'::text, now()) NULL,
	email varchar(100) NOT NULL,
	first_name varchar(100) NULL,
    id serial4 NOT NULL Primary key,
	invited_by varchar NULL,
	is_demo_booked bool DEFAULT false NOT NULL,
	is_invite_flow bool DEFAULT false NULL,
	is_mic_available bool DEFAULT false NOT NULL,
	last_name varchar(100) NULL,
	marketing_communication bool DEFAULT true NULL,
	mobile varchar(20) NULL,
	"role" varchar(10) DEFAULT 'user'::character varying NULL,
	signup_type varchar(20) DEFAULT 'email'::character varying NOT NULL,
	status varchar(30) NULL,
	steps jsonb NULL,
	terms_and_condition bool DEFAULT false NULL,
	training_permission_video text NULL,
	uid varchar(100) NULL,
    updated_at timestamp DEFAULT timezone('utc'::text, now()) NULL,
	"uuid" varchar(255) DEFAULT NULL::character varying NULL,
    _SDC_BATCHED_AT timestamp DEFAULT timezone('utc'::text, now()) NULL,
    _SDC_RECEIVED_AT timestamp DEFAULT timezone('utc'::text, now()) NULL,
    _SDC_SEQUENCE varchar,
	_SDC_TABLE_VERSION varchar
);

CREATE INDEX idx_billing_account ON public.users USING btree (billing_account_id);
CREATE INDEX idx_users_uid ON public.users USING btree (uid);

COPY users
FROM '/Users/dlee/ds/tavus-take-home-assignment/tavus_users.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

CREATE TABLE public.conversation (
        id serial4 NOT NULL PRIMARY KEY,
        uuid text DEFAULT concat('c', "right"(gen_random_uuid()::character(36)::text, 11)) NULL,
        status text NULL,
        replica_uuid text NULL,
        persona_uuid text NULL,
        context_override text NULL,
        owner_id int4 NULL,
        webhook_url text NULL,
        is_deleted bool DEFAULT false NULL,
        created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
        updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL
);

COPY conversation
FROM '/Users/dlee/ds/tavus-take-home-assignment/tavus_conversation.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
