use tiny_theaters;

select
	p.title `Performance Title`,
    t.name `Theater Name`,
	perf.play_date `Performance Date`
from performance perf
inner join play p on perf.play_id = p.play_id
inner join theater t on perf.theater_id = t.theater_id
where perf.play_date between '2021-10-01' and '2021-12-31';

select
	c.first_name `First Name`,
    c.last_name `Last Name`
from customer c;

select
	c.first_name `First Name`,
    c.last_name `Last Name`,
    c.email_address `Email Address`
from customer c
where c.email_address not like '%com';

select
	p.title `Performance Title`,
    t.name `Theater Name`,
	perf.play_date `Performance Date`
from performance perf
inner join play p on perf.play_id = p.play_id
inner join theater t on perf.theater_id = t.theater_id
order by perf.price asc
limit 3;

select
	c.first_name `First Name`,
    c.last_name `Last Name`,
    p.title
from customer c
inner join ticket t on c.customer_id = t.customer_id
inner join performance perf on t.performance_id = perf.performance_id
inner join play p on perf.play_id = p.play_id
group by c.first_name, c.last_name, p.title;

select
	c.first_name `First Name`,
    c.last_name `Last Name`,
    p.title `Show Title`,
    th.name `Theater Name`,
    t.seat `Seat Number`
from customer c
inner join ticket t on c.customer_id = t.customer_id
inner join performance perf on t.performance_id = perf.performance_id
inner join play p on perf.play_id = p.play_id
inner join theater th on perf.theater_id = th.theater_id;

select
	c.first_name `First Name`,
    c.last_name `Last Name`,
    c.physical_address `Address`
from customer c
where c.physical_address = '';

select
	c.first_name `First Name`,
    c.last_name `Last Name`,
    c.email_address `Email Address`,
    c.phone `Phone Number`,
    c.physical_address `Physical Address`,
    t.seat `Seat Number`,
    p.title `Show Title`,
    perf.price `Price`,
    perf.play_date `Date`,
    th.name `Theater Name`,
    th.address `Theater Address`,
    th.phone `Phone Number`,
    th.email `Email Address`
from customer c
inner join ticket t on c.customer_id = t.customer_id
inner join performance perf on t.performance_id = perf.performance_id
inner join play p on perf.play_id = p.play_id
inner join theater th on perf.theater_id = th.theater_id;

select
	c.first_name `First Name`,
    c.last_name `Last Name`,
    count(t.performance_id) `Tickets Purchased`
from customer c
left outer join ticket t on c.customer_id = t.customer_id
group by c.customer_id;

select
	p.title `Show Title`,
    round(sum(perf.price), 2) `Revenue`
from performance perf
left outer join ticket t on perf.performance_id = t.performance_id
inner join play p on perf.play_id = p.play_id
group by p.title;

select
	th.name `Theater Name`,
    round(sum(perf.price), 2) `Revenue`
from performance perf
left outer join ticket t on perf.performance_id = t.performance_id
inner join theater th on perf.theater_id = th.theater_id
group by th.name;

select
	c.first_name `First Name`,
    c.last_name `Last Name`,
    round(sum(perf.price), 2) `Revenue`
from performance perf
left outer join ticket t on perf.performance_id = t.performance_id
left outer join customer c on t.customer_id = c.customer_id
group by c.first_name, c.last_name
order by `Revenue` desc
limit 1;