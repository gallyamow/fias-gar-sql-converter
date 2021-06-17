-- for AS_ADDR_OBJ_DIVISION_2_251_19_04_01_01.xsd
create table gar.addr_obj_division
(
    id       bigint not null primary key,
    parentid bigint not null,
    childid  bigint not null,
    changeid bigint not null

);

comment on table gar.addr_obj_division is 'Сведения по операциям переподчинения';

comment on column gar.addr_obj_division.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.addr_obj_division.parentid is 'Родительский ID';
comment on column gar.addr_obj_division.childid is 'Дочерний ID';
comment on column gar.addr_obj_division.changeid is 'ID изменившей транзакции';