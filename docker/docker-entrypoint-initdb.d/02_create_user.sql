\set postgres_application_user     `echo blog_user`
\set postgres_application_password `echo blog_password`


CREATE ROLE :postgres_application_user CREATEDB LOGIN PASSWORD :'postgres_application_password';
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES ON ALL TABLES IN SCHEMA public TO :postgres_application_user;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO :postgres_application_user;
