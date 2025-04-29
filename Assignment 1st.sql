use assignment_1;

select * from netflix_originals ;

#Question 1

select *
from netflix_originals
where imdbscore > 7
  and runtime > 100
  and language in ('English', 'Spanish');
  
  #Question 2
  
select language, count(*) as totaltitles
from netflix_originals
group by language
having count(*) > 5;


#Question 3

select title, runtime, imdbscore
from netflix_originals
where language = 'hindi'
order by runtime desc, imdbscore desc
limit 3;


#Question 4 

select title, imdbscore
from netflix_originals
where title like '%house%'
  and imdbscore > 6;

#Question 5
  
  select title, premiere_date, language
from netflix_originals
where year(premiere_date) between 2018 and 2020
  and language in ('english', 'spanish', 'hindi');
  
#Question 6
  
select title, runtime, imdbscore, premiere_date
from netflix_originals
where runtime < 60 or imdbscore < 5
order by premiere_date;
  
#Question 7
  
select genreid, avg(imdbscore) as averageimdbscore
from netflix_originals
group by genreid
having count(*) >= 10;

#Question 8
  
select runtime, count(*) as count
from netflix_originals
group by runtime
order by count desc
limit 5;

#Question 9

select language, count(*) as totaltitles
from netflix_originals
where year(premiere_date) = 2020
group by language;


#Question 10

create table netflix_originals_with_constraints (
    title varchar(255),
    genreid int,
    runtime int check (runtime > 30),
    imdbscore decimal(3,2) check (imdbscore between 0 and 10),
    language varchar(50),
    premiere_date date
);

  





