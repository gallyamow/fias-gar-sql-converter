create table gar.adm_hierarchy
(
    id          bigint   not null primary key,
    objectid    bigint   not null,
    parentobjid bigint,
    changeid    bigint   not null,
    regioncode  varchar,
    areacode    varchar,
    citycode    varchar,
    placecode   varchar,
    plancode    varchar,
    streetcode  varchar,
    previd      bigint,
    nextid      bigint,
    updatedate  date     not null,
    startdate   date     not null,
    enddate     date     not null,
    isactive    integer not null
);

comment on table gar.adm_hierarchy is 'Сведения по иерархии в административном делении';

comment on column gar.adm_hierarchy.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.adm_hierarchy.objectid is 'Глобальный уникальный идентификатор объекта';
comment on column gar.adm_hierarchy.parentobjid is 'Идентификатор родительского объекта';
comment on column gar.adm_hierarchy.changeid is 'ID изменившей транзакции';
comment on column gar.adm_hierarchy.regioncode is 'Код региона';
comment on column gar.adm_hierarchy.areacode is 'Код района';
comment on column gar.adm_hierarchy.citycode is 'Код города';
comment on column gar.adm_hierarchy.placecode is 'Код населенного пункта';
comment on column gar.adm_hierarchy.plancode is 'Код ЭПС';
comment on column gar.adm_hierarchy.streetcode is 'Код улицы';
comment on column gar.adm_hierarchy.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.adm_hierarchy.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.adm_hierarchy.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.adm_hierarchy.startdate is 'Начало действия записи';
comment on column gar.adm_hierarchy.enddate is 'Окончание действия записи';
comment on column gar.adm_hierarchy.isactive is 'Признак действующего адресного объекта';