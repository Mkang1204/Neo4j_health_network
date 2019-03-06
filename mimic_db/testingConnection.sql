set search_path to mimiciii;
SELECT count( subject_id)
	FROM mimiciii.patients;
	
select distinct(gender)
	from mimiciii.patients;
	
select count (*)
	from mimiciii.patients
	where gender = 'F';
	
select gender, count(*)
from patients
group by gender;
