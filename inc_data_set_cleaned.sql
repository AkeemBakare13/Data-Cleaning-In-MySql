select *
from `data set- inc5000 company list_2014`
limit 10000;

-- first, we create a duplicate table to work with

create table data_set_inc2
select * from `data set- inc5000 company list_2014`;

select * from data_set_inc2
limit 10000;

-- look for duplicates

select *,
row_number() over(
partition by _widgetName, _source, _resultNumber, _pageUrl, id, 
`rank`, workers, company, url, state_l, state_s, city, metro, 
growth, revenue, industry, yrs_on_list )
from data_set_inc2
limit 10000;

with cte_dup as (
select *,
row_number() over(
partition by _widgetName, _source, _resultNumber, _pageUrl, id, 
`rank`, workers, company, url, state_l, state_s, city, metro, 
growth, revenue, industry, yrs_on_list ) as row_num
from data_set_inc2
limit 10000
)
select *
from cte_dup
where row_num > 1
;

-- no duplicates

-- standardization and looking for null values

select *
from data_set_inc2;

select distinct _num
from data_set_inc2
order by 1 asc
limit 10000;

select distinct _widgetName
from data_set_inc2
order by 1 asc
limit 10000;

select distinct _source
from data_set_inc2
order by 1 asc
limit 10000;

select distinct _resultNumber
from data_set_inc2
order by 1 asc
limit 10000;

select distinct _pageUrl
from data_set_inc2
order by 1 asc
limit 10000;

select distinct id
from data_set_inc2
order by 1 asc
limit 10000;

select distinct `rank`
from data_set_inc2
order by 1 asc
limit 10000;

select distinct workers
from data_set_inc2
order by 1 asc
limit 10000;

select distinct company
from data_set_inc2
order by 1 asc
limit 10000;

select distinct url
from data_set_inc2
order by 1 asc
limit 10000;

select distinct state_l
from data_set_inc2
order by 1 asc
limit 10000;

select distinct state_s
from data_set_inc2
order by 1 asc
limit 10000;

select distinct city
from data_set_inc2
order by 1 asc
limit 10000;

select distinct metro
from data_set_inc2
order by 1 asc
limit 10000;

select *
from data_set_inc2
where metro = ''
order by 1 asc
limit 10000;

update data_set_inc2
set metro = NULL
where metro = ''
;

select *
from data_set_inc2
where metro is NULL
order by 1 asc
limit 10000;

select distinct city, state_s
from data_set_inc2
where metro is NULL
order by 1 asc
limit 10000;

select state_s, city, metro
from data_set_inc2
where metro is NULL;

select state_l, state_s, city, metro
from data_set_inc2
limit 10000;

select state_l, state_s, city, metro
from data_set_inc2
where city = 'chicago';

select state_l, state_s, city, metro
from data_set_inc2
where city = 'chicago'
and metro is null;

update data_set_inc2
set metro = 'chicago'
where city = 'chicago'
and metro is null;

select state_s, city,  metro
from data_set_inc2
where metro is NULL
order by 1;

select distinct city, state_s,  metro
from data_set_inc2
where metro is NULL
order by 1;

select distinct state_s, city, metro
from data_set_inc2
where city = metro
order by 1;

select state_s, city, metro
from data_set_inc2
where state_s = 'FL'
order by 1;

select city, state_s,  metro
from data_set_inc2
where metro is NULL
order by 1;

select city, state_s,  metro
from data_set_inc2
where city = 'Chandler'
order by 1;

select city, state_s,  metro
from data_set_inc2
where city = 'Chandler'
and metro is NULL
order by 1;

update data_set_inc2
set metro = 'Phoenix'
where city = 'Chandler'
and metro is NULL
;

select city, state_s,  metro,
row_number() over(partition by city, state_s) as row_num
from data_set_inc2
where metro is NULL
order by 2;

with cte_row as (
select city, state_s,  metro,
row_number() over(partition by city, state_s) as row_num
from data_set_inc2
where metro is NULL
order by 2
)
select *
from cte_row
where row_num > 1
;

select state_s, city, metro
from data_set_inc2
where city = 'Riverview';

select state_s, city, metro
from data_set_inc2
where city = 'Wayland';

select state_s, city, metro
from data_set_inc2
where city = 'Hattiesburg';


with cte_row as (
select city, state_s,  metro,
row_number() over(partition by city, state_s) as row_num
from data_set_inc2
where metro is NULL
order by 2
)
select *
from cte_row
where row_num = 1
;

select state_s, city, metro
from data_set_inc2
where city = 'Gilbert';

select state_s, city, metro
from data_set_inc2
where city = 'Gilbert'
and metro is null;

update data_set_inc2
set metro = 'Phoenix'
where city = 'Gilbert'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city = 'Sacramento';

select state_s, city, metro
from data_set_inc2
where city = 'Sacramento'
and metro is null;

update data_set_inc2
set metro = 'Sacramento--Arden-Arcade--Roseville CA'
where city = 'Sacramento'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city = 'Santa Rosa';

update data_set_inc2
set metro = 'Santa Rosa-Petaluma CA'
where city = 'Santa Rosa'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city = 'Santa Rosa Beach';

select state_s, city, metro
from data_set_inc2
where city like 'Santa Ros%';

select state_s, city, metro
from data_set_inc2
where city = 'The Villages';

select state_s, city, metro
from data_set_inc2
where city = 'Orlando';

update data_set_inc2
set metro = 'Orlando FL'
where city = 'Orlando'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city = 'Cedar Rapids';

select state_s, city, metro
from data_set_inc2
where city = 'Cedar Rapids'
and ( metro is null or metro = 'Iowa City IA');

update data_set_inc2
set metro = 'Cedar Rapids IA'
where city = 'Cedar Rapids'
and ( metro is null or metro = 'Iowa City IA');

select state_s, city, metro
from data_set_inc2
where city = 'Worley';

select state_s, city, metro
from data_set_inc2
where city ='Carmi';

select state_s, city, metro
from data_set_inc2
where city ='Chadwick';

select state_s, city, metro
from data_set_inc2
where city ='Marion';

select state_s, city, metro
from data_set_inc2
where city ='West Lafayette';

select state_s, city, metro
from data_set_inc2
where city ='Salina';

select state_s, city, metro
from data_set_inc2
where city ='Overland Park';

update data_set_inc2
set metro = 'Kansas City MO-KS'
where city = 'Overland Park'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='Rockland';

select state_s, city, metro
from data_set_inc2
where city ='Bethesda';

update data_set_inc2
set metro = 'Washington DC'
where city = 'Bethesda'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='Whiting';

select state_s, city, metro
from data_set_inc2
where city ='Manistee';

select state_s, city, metro
from data_set_inc2
where city ='Blue Earth';

select state_s, city, metro
from data_set_inc2
where city ='Mount Vernon';

select state_s, city, metro
from data_set_inc2
where city ='Monett';

select state_s, city, metro
from data_set_inc2
where city ='Sylva';

select state_s, city, metro
from data_set_inc2
where city ='Syracuse';

select state_s, city, metro
from data_set_inc2
where city ='Robbinsville';

update data_set_inc2
set metro = 'Trenton-Ewing NJ'
where city = 'Robbinsville'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='Rochelle Park';

update data_set_inc2
set metro = 'New York City'
where city = 'Rochelle Park'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='Manalapan';

update data_set_inc2
set metro = 'New York City'
where city = 'Manalapan'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='Garnet Valley';

select state_s, city, metro
from data_set_inc2
where city ='Chambersburg';

update data_set_inc2
set metro = 'Chambersburg PA'
where city = 'Chambersburg'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='Pittsburgh';

update data_set_inc2
set metro = 'Pittsburgh PA'
where city = 'Pittsburgh'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='Greenwood';

select state_s, city, metro
from data_set_inc2
where city ='Madison';

select state_s, city, metro
from data_set_inc2
where city ='Nashville';

update data_set_inc2
set metro = 'Nashville'
where city = 'Nashville'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='Montgomery';

update data_set_inc2
set metro = 'Houston'
where city = 'Montgomery'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='Spanish Fork';

select state_s, city, metro
from data_set_inc2
where city ='Exmore';

select state_s, city, metro
from data_set_inc2
where city ='Kilmarnock';

select state_s, city, metro
from data_set_inc2
where city ='Luray';

select state_s, city, metro
from data_set_inc2
where city ='Clarksville';

select state_s, city, metro
from data_set_inc2
where city ='Belle Haven';

select state_s, city, metro
from data_set_inc2
where city ='McLean';

update data_set_inc2
set metro = 'Washington DC'
where city = 'McLean'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='Chantilly';

update data_set_inc2
set metro = 'Washington DC'
where city = 'Chantilly'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='West Dover';

select state_s, city, metro
from data_set_inc2
where city ='Bellevue';

update data_set_inc2
set metro = 'Seattle'
where city = 'Bellevue'
and metro is null;

select state_s, city, metro
from data_set_inc2
where city ='Anacortes';

select state_s, city, metro
from data_set_inc2
where city ='Bridgeport';





select distinct growth
from data_set_inc2
order by 1 asc
limit 10000;

select distinct revenue
from data_set_inc2
order by 1 asc
limit 10000;

select distinct industry
from data_set_inc2
order by 1 asc
limit 10000;

select distinct yrs_on_list
from data_set_inc2
order by 1 asc
limit 10000;

select *
from data_set_inc2
limit 10000;

-- Drop unnecessary column

select `ï»¿_input`
from data_set_inc2
limit 10000;

alter table data_set_inc2
drop `ï»¿_input`;

select *
from data_set_inc2
limit 10000;










