create table gar.reestr_objects
(
    objectid   bigint  not null primary key,
    createdate date    not null,
    changeid   bigint  not null,
    levelid    integer not null,
    updatedate date    not null,
    objectguid uuid    not null,
    isactive   integer not null

);

comment on table gar.reestr_objects is 'Сведения об адресном элементе в части его идентификаторов';

comment on column gar.reestr_objects.objectid is 'никальный идентификатор объекта';
comment on column gar.reestr_objects.createdate is 'Дата создания';
comment on column gar.reestr_objects.changeid is 'ID изменившей транзакции';
comment on column gar.reestr_objects.levelid is 'Уровень объекта';
comment on column gar.reestr_objects.updatedate is 'Дата обновления';
comment on column gar.reestr_objects.objectguid is 'GUID объекта';
comment on column gar.reestr_objects.isactive is 'Признак действующего объекта (1 - действующий, 0 - не действующий)';