CREATE SCHEMA todoapp;

CREATE table todoapp.users (
    id UUID PRIMARY KEY,
    version bigint not null default 1,
    full_name varchar(100) not null check (char_length(full_name) BETWEEN 3 AND 100),
    phone_number VARCHAR(15) check (char_length(phone_number) BETWEEN 10 AND 15 AND phone_number ~ '^\+[0-9]+$') 
);

CREATE TABLE todoapp.tasks (
    id             UUID PRIMARY KEY,
    title          VARCHAR(100) NOT NULL,
    completed      BOOLEAN NOT NULL,
    created_at     TIMESTAMPTZ NOT NULL,
    completed_at   TIMESTAMPTZ,
    author_user_id UUID NOT NULL REFERENCES todoapp.users(id)
);