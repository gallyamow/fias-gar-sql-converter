create table gar.mun_hierarchy
(
    id          bigint  not null primary key,
    objectid    bigint  not null,
    parentobjid bigint,
    changeid    bigint  not null,
    oktmo       varchar,
    previd      bigint,
    nextid      bigint,
    updatedate  date    not null,
    startdate   date    not null,
    enddate     date    not null,
    isactive    integer not null

);

comment on table gar.mun_hierarchy is 'Сведения по иерархии в муниципальном делении';

comment on column gar.mun_hierarchy.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.mun_hierarchy.objectid is 'Глобальный уникальный идентификатор адресного объекта';
comment on column gar.mun_hierarchy.parentobjid is 'Идентификатор родительского объекта';
comment on column gar.mun_hierarchy.changeid is 'ID изменившей транзакции';
comment on column gar.mun_hierarchy.oktmo is 'Код ОКТМО';
comment on column gar.mun_hierarchy.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.mun_hierarchy.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.mun_hierarchy.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.mun_hierarchy.startdate is 'Начало действия записи';
comment on column gar.mun_hierarchy.enddate is 'Окончание действия записи';
comment on column gar.mun_hierarchy.isactive is 'Признак действующего адресного объекта';