select `id`, `c3`, `c5` from `crud` where `c1`=11 and `c2`=2;
select * from `crud` where `c1`>18 or `c2`<2;
insert into `crud` (`c1`,`c2`,`c3`,`c5`) values (7,4,'col101',0);
insert into `crud` (`id`,`c1`,`c2`,`c3`,`c5`) values (103,3,3,'col103',1);
select * from `crud` where `id`>100;
update `crud` set `c3`='col0', `c5`=0 where `c1`>4 and `c1`<9 and `c2`=1;
select * from `crud` where `c1`>4 and `c1`<9 and `c2`=1;
delete from `crud` where `c5`=0;
select * from `crud` where `c5`=0;