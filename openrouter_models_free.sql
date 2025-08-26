create table public.openrouter_models_free (
  model_id text not null,
  name text null,
  description text null,
  created text null,
  created_unix bigint null,
  created_at timestamp with time zone GENERATED ALWAYS as (to_timestamp((created_unix)::double precision)) STORED null,
  data jsonb not null,
  updated_at timestamp with time zone not null default now(),
  intelligence_score numeric null,
  work boolean null,
  constraint openrouter_models_free_pkey primary key (model_id)
) TABLESPACE pg_default;

create index IF not exists idx_models_free_created_unix on public.openrouter_models_free using btree (created_unix) TABLESPACE pg_default;

create index IF not exists idx_models_free_name on public.openrouter_models_free using btree (lower(name)) TABLESPACE pg_default;

create index IF not exists idx_models_free_data_gin on public.openrouter_models_free using gin (data) TABLESPACE pg_default;
