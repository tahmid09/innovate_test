-- Table: public.store

-- DROP TABLE IF EXISTS public.store;

CREATE TABLE IF NOT EXISTS public.store
(
    id integer NOT NULL DEFAULT nextval('store_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    parent_id integer NOT NULL DEFAULT 0,
    status boolean NOT NULL DEFAULT true,
    created_at time with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT store_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.store
    OWNER to postgres;

 --- DATA   

--  "id","name","parent_id","status","created_at"
-- 1,"Building A",0,True,"00:13:56.342220+06:00"
-- 2,"Building B",0,True,"00:14:24.766528+06:00"
-- 3,"Carpark",1,True,"00:15:51.139667+06:00"
-- 4,"Level 2",1,True,"00:15:51.139667+06:00"
-- 5,"Level 1",2,True,"00:16:47.091451+06:00"
-- 6,"Room 101",5,True,"00:18:33.470348+06:00"
-- 8,"Pantry",5,True,"00:19:30.867522+06:00"
-- 9,"Lobby C",6,True,"00:20:10.627813+06:00"
-- 10,"Kios A",9,True,"00:20:54.699737+06:00"
-- 11,"XXX",10,True,"00:21:43.994635+06:00"   