--服务监控模型
create table dubbo_invoke
(
  ID             varchar2(255),
  invoke_date    date default sysdate,
  service        varchar2(255),
  method         varchar2(255),
  consumer       varchar2(255),
  provider       varchar2(255),
  type           varchar2(255),
  invoke_time    number(20),
  success        number(11),
  failure        number(11),
  elapsed        number(11),
  concurrent     number(11),
  max_elapsed    number(11),
  max_concurrent number(11)
);

alter table dubbo_invoke add primary key(id);
create index index_service on  dubbo_invoke(service);
create index index_method on  dubbo_invoke(method);