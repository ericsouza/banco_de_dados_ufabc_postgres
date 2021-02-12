alter table Emp drop constraint FK_EMP;
alter table Emp drop constraint FK_EMP_GER;
alter table depto drop constraint FK_depto;
alter table depte drop constraint  FK_depte;
alter table proj drop constraint  FK_proj;
alter table alocado drop constraint  FK_alocado_proj;
alter table alocado drop constraint  fk_alocado_emp;
alter table consult drop constraint  FK_consult;

drop table emp;
drop table depto;
drop table depte;
drop table proj;
drop table alocado;
drop table consult;