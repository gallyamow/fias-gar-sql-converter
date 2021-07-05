create table gar.change_history
(
    changeid    bigint  not null,
    objectid    bigint  not null,
    adrobjectid uuid    not null,
    opertypeid  integer not null,
    ndocid      bigint,
    changedate  date    not null
);

comment on table gar.change_history is 'Сведения по истории изменений';

comment on column gar.change_history.changeid is 'ID изменившей транзакции';
comment on column gar.change_history.objectid is 'Уникальный ID объекта';
comment on column gar.change_history.objectid is 'Уникальный ID изменившей транзакции (GUID)';
comment on column gar.change_history.opertypeid is 'Тип операции';
comment on column gar.change_history.ndocid is 'ID документа';
comment on column gar.change_history.changedate is 'Дата изменения';