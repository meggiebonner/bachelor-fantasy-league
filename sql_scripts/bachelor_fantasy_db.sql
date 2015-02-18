drop database if exists bachelor_fantasy;
create database bachelor_fantasy;

use bachelor_fantasy;

drop table if exists bachelorette;
create table bachelorette(
id int not null primary key auto_increment,
name varchar(20));

load data local infile '/Users/meggie.bonner/Documents/bachelor-fantasy-league/bachelorettes.txt'
into table bachelorette
ignore 1 lines
(name);

drop table if exists player;
create table player(
id int not null primary key auto_increment,
name varchar(20));

load data local infile '/Users/meggie.bonner/Documents/bachelor-fantasy-league/players.txt'
into table player
ignore 1 lines
(name);

drop table if exists draft_scoring;
create table draft_scoring(
week int,
points int);

insert ignore into draft_scoring values (1,5), 
(2,5), 
(3,5),
(4,5),
(5,10),
(6,10),
(7,10),
(8,15),
(9,15),
(10,20);



drop table if exists final_pick_staging;
create table final_pick_staging(
player_name varchar(20),
bachelorette_name varchar(20));

load data local infile '/Users/meggie.bonner/Documents/bachelor-fantasy-league/final_pick.txt'
into table final_pick_staging
ignore 1 lines;

drop table if exists final_pick;
create table final_pick(
player_id int,
bachelorette_id int);

insert into final_pick
select p.id, b.id
from player p 
join final_pick_staging fps on p.name = fps.player_name
join bachelorette b on b.name = fps.bachelorette_name
order by p.id;

drop table if exists final_pick_staging;

drop table if exists draft_staging;
create table draft_staging(
player_name varchar(20),
round_1_pick varchar(20),
round_2_pick varchar(20),
round_3_pick varchar(20),
round_4_pick varchar(20));

load data local infile '/Users/meggie.bonner/Documents/bachelor-fantasy-league/draft.txt'
into table draft_staging
ignore 1 lines;

drop table if exists draft;
create table draft(
round int,
player_id int,
bachelorette_id int);

insert into draft
select 1, p.id, b.id
from player p 
join draft_staging ds on ds.player_name = p.name
join bachelorette b on b.name = ds.round_1_pick
order by p.id;

insert into draft
select 2, p.id, b.id
from player p 
join draft_staging ds on ds.player_name = p.name
join bachelorette b on b.name = ds.round_2_pick
order by p.id;

insert into draft
select 3, p.id, b.id
from player p 
join draft_staging ds on ds.player_name = p.name
join bachelorette b on b.name = ds.round_3_pick
order by p.id;


insert into draft
select 4, p.id, b.id
from player p 
join draft_staging ds on ds.player_name = p.name
join bachelorette b on b.name = ds.round_4_pick
order by p.id;


drop table if exists weekly_picks;
create table weekly_picks(
week int,
player_id int,
rose_bachelorette_id int,
tears_bachelorette_id int);

drop table if exists picks_scoring;
create table picks_scoring(
week int,
rose_points int,
tears_points int);

drop table if exists roses;
create table roses(
week int,
bachelorette_id int,
rose tinyint(1));


drop table if exists scores;
create table scoring(
player_id int,
total_score int,
week_2_score int,
week_3_score int,
week_4_score int,
week_5_score int,
week_6_score int,
week_7_score int,
week_8_score int,
week_9_score int,
week_10_score int);
