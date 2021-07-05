create table gar.normative_docs
(
    id         bigint  not null primary key,
    name       varchar not null,
    date       date    not null,
    number     varchar not null,
    type       integer not null,
    kind       integer not null,
    updatedate date    not null,
    orgname    varchar,
    regnum     varchar,
    regdate    date,
    accdate    date,
    comment    varchar
);

comment on table gar.normative_docs is 'Сведения о нормативном документе, являющемся основанием присвоения адресному элементу наименования';

comment on column gar.normative_docs.id is 'Уникальный идентификатор документа';
comment on column gar.normative_docs.name is 'Наименование документа';
comment on column gar.normative_docs.date is 'Дата документа';
comment on column gar.normative_docs.number is 'Номер документа';
comment on column gar.normative_docs.type is 'Тип документа';
comment on column gar.normative_docs.kind is 'Вид документа';
comment on column gar.normative_docs.updatedate is 'Дата обновления';
comment on column gar.normative_docs.orgname is 'Наименование органа создавшего нормативный документ';
comment on column gar.normative_docs.regnum is 'Номер государственной регистрации';
comment on column gar.normative_docs.regdate is 'Дата государственной регистрации';
comment on column gar.normative_docs.accdate is 'Дата вступления в силу нормативного документа';
comment on column gar.normative_docs.comment is 'Комментарий';