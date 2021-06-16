-- for AS_ADDR_OBJ_DIVISION_2_251_19_04_01_01.xsd
create table gar.items
(
    id       bigint not null primary key,
    parentid bigint not null,
    childid  bigint not null,
    changeid bigint not null

);

comment on table gar.items is 'Состав и структура файла со сведениями по операциям переподчинения';
comment on column gar.items.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.items.parentid is 'Родительский ID';
comment on column gar.items.childid is 'Дочерний ID';
comment on column gar.items.changeid is 'ID изменившей транзакции';
