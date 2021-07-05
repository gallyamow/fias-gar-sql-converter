create table gar.normative_docs_types
(
    id        integer not null primary key,
    name      varchar not null,
    startdate date    not null,
    enddate   date    not null
);

comment on table gar.normative_docs_types is 'Сведения по типам нормативных документов';

comment on column gar.normative_docs_types.id is 'Идентификатор записи';
comment on column gar.normative_docs_types.name is 'Наименование';
comment on column gar.normative_docs_types.startdate is 'Дата начала действия записи';
comment on column gar.normative_docs_types.enddate is 'Дата окончания действия записи';
