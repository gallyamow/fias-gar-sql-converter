create table gar.normative_docs_kinds
(
    id   integer not null primary key,
    name varchar not null
);

comment on table gar.normative_docs_kinds is 'Сведения по видам нормативных документов';

comment on column gar.normative_docs_kinds.id is 'Идентификатор записи';
comment on column gar.normative_docs_kinds.name is 'Наименование';