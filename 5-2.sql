select `users`.`id`, `users`.`name`, `tickets`.`seat_number` from `users`
inner join `tickets` on `users`.`id` = `tickets`.`user` and `tickets`.`train`=11 group by `users`.`id` order by `tickets`.`seat_number`;

select `users`.`id`, `users`.`name`, Count(*) as `trains_count`, Sum(`trains`.`distance`) / 10 as `total_distance` from `users`
inner join `tickets` on `users`.`id` = `tickets`.`user`
inner join `trains` on `trains`.`id` = `tickets`.`train`
group by `users`.`id` order by `total_distance` desc limit 6;

select `trains`.`id`, `types`.`name` as `type`, `src`.`name` as `src_stn`, `dst`.`name` as `dst_stn`, Timediff(`arrival`, `departure`) as `travel_time` from `trains`
inner join `types` on `types`.`id` = `trains`.`type`
inner join `stations` as `src` on `src`.`id` = `trains`.`source`
inner join `stations` as `dst` on `dst`.`id` = `trains`.`destination`
group by `trains`.`id` order by `travel_time` desc limit 6;

select `types`.`name` as `type`, `src`.`name` as `src_stn`, `dst`.`name` as `dst_stn`, `trains`.`departure` as `departure`, `trains`.`arrival` as `arrival`,
Round(`types`.`fare_rate` * `trains`.`distance` / 1000, -2) as `fare` from `trains`
inner join `types` on `types`.`id` = `trains`.`type`
inner join `stations` as `src` on `src`.`id` = `trains`.`source`
inner join `stations` as `dst` on `dst`.`id` = `trains`.`destination`
group by `trains`.`id` order by `departure`;

select `trains`.`id`, `types`.`name` as `type`, `src`.`name` as `src_stn`, `dst`.`name` as `dst_stn`, Count(*) as `occupied`, `types`.`max_seats` as `maximum` from `tickets`
inner join `trains` on `trains`.`id` = `tickets`.`train`
inner join `types` on `types`.`id` = `trains`.`type`
inner join `stations` as `src` on `src`.`id` = `trains`.`source`
inner join `stations` as `dst` on `dst`.`id` = `trains`.`destination`
group by `tickets`.`train` order by `trains`.`id`;