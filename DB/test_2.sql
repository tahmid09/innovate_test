-- Table: public.device

-- DROP TABLE IF EXISTS public.device;

CREATE TABLE IF NOT EXISTS public.device
(
    id integer NOT NULL DEFAULT nextval('device_id_seq'::regclass),
    status boolean NOT NULL DEFAULT true,
    deviceid character varying COLLATE pg_catalog."default",
    devicetype character varying COLLATE pg_catalog."default",
    devicename character varying COLLATE pg_catalog."default",
    groupid character varying COLLATE pg_catalog."default",
    datatype character varying COLLATE pg_catalog."default",
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT device_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.device
    OWNER to postgres;

-- Table: public.temperature

-- DROP TABLE IF EXISTS public.temperature;

CREATE TABLE IF NOT EXISTS public.temperature
(
    id integer NOT NULL DEFAULT nextval('temperature_id_seq'::regclass),
    occupancy boolean NOT NULL DEFAULT false,
    status boolean NOT NULL DEFAULT true,
    deviceid integer NOT NULL,
    temperature integer NOT NULL,
    humidity integer NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    CONSTRAINT temperature_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.temperature
    OWNER to postgres;
