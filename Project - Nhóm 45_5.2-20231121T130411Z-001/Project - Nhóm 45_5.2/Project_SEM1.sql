use  `Project_SEM1`;

-- 1. Show dữ liệu:

SELECT * FROM region_and_code;

SELECT * FROM lower_secondary_cleaned;

SELECT * FROM primary_cleaned;

SELECT * FROM upper_secondary_cleaned;

-- 2. Nối các bảng:

SELECT *  
FROM Project_SEM1.lower_secondary_cleaned a 
JOIN Project_SEM1.region_and_code b 
ON a.Region = b.Code ;

-- 3. Nhóm các dữ liệu cùng Region theo tỉ lệ học sinh không được đến trường

select lower_secondary.region Region, total_primary, total_lower_secondary, total_upper_secondary,(total_primary+total_lower_secondary+total_upper_secondary)/3 avg_total
from 
(SELECT a.Total as total_lower_secondary , b.Region
FROM (
  SELECT Region, AVG(Total) as Total
  FROM Project_SEM1.lower_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) lower_secondary
inner join 
(SELECT a.Total as total_primary, b.Region
FROM (
  SELECT Region, AVG(Total) as Total
  FROM Project_SEM1.primary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) primary_data using(region)
inner join
(SELECT a.Total as total_upper_secondary, b.Region
FROM (
  SELECT Region, AVG(Total) as Total
  FROM Project_SEM1.upper_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) upper_secondary using(region)

-- 4. Tính trung bình tỉ lệ học sinh Nữ không được đến trường

select lower_secondary.region Region, female_primary, female_lower_secondary, female_upper_secondary,(female_primary+female_lower_secondary+female_upper_secondary)/3 avg_female
from 
(SELECT a.female as female_lower_secondary , b.Region
FROM (
  SELECT Region, AVG(female) as female
  FROM Project_SEM1.lower_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) lower_secondary
inner join 
(SELECT a.female as female_primary, b.Region
FROM (
  SELECT Region, AVG(female) as female
  FROM Project_SEM1.primary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) primary_data using(region)
inner join
(SELECT a.female as female_upper_secondary, b.Region
FROM (
  SELECT Region, AVG(female) as female
  FROM Project_SEM1.upper_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) upper_secondary using(region)


-- 5. Tính trung bình tỉ lệ học sinh Nam không được đến trường

select lower_secondary.region Region, male_primary, male_lower_secondary, male_upper_secondary,(male_primary+male_lower_secondary+male_upper_secondary)/3 avg_male
from 
(SELECT a.male as male_lower_secondary , b.Region
FROM (
  SELECT Region, AVG(male) as male
  FROM Project_SEM1.lower_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) lower_secondary
inner join 
(SELECT a.male as male_primary, b.Region
FROM (
  SELECT Region, AVG(male) as male
  FROM Project_SEM1.primary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) primary_data using(region)
inner join
(SELECT a.male as male_upper_secondary, b.Region
FROM (
  SELECT Region, AVG(male) as male
  FROM Project_SEM1.upper_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) upper_secondary using(region)

-- 6. Tính trung bình tỉ lệ học sinh Nam không được đến trường

select lower_secondary.region Region, male_primary, male_lower_secondary, male_upper_secondary,(male_primary+male_lower_secondary+male_upper_secondary)/3 avg_male
from 
(SELECT a.male as male_lower_secondary , b.Region
FROM (
  SELECT Region, AVG(male) as male
  FROM Project_SEM1.lower_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) lower_secondary
inner join 
(SELECT a.male as male_primary, b.Region
FROM (
  SELECT Region, AVG(male) as male
  FROM Project_SEM1.primary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) primary_data using(region)
inner join
(SELECT a.male as male_upper_secondary, b.Region
FROM (
  SELECT Region, AVG(male) as male
  FROM Project_SEM1.upper_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) upper_secondary using(region)


-- 7. Tính trung bình tỉ lệ học sinh Thành Thị không được đến trường

select lower_secondary.region Region, urban_primary, urban_lower_secondary, urban_upper_secondary,(urban_primary+urban_lower_secondary+urban_upper_secondary)/3 avg_urban
from 
(SELECT a.urban as urban_lower_secondary , b.Region
FROM (
  SELECT Region, AVG(Urban_Residence) as urban
  FROM Project_SEM1.lower_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) lower_secondary
inner join 
(SELECT a.urban as urban_primary, b.Region
FROM (
  SELECT Region, AVG(Urban_Residence) as urban
  FROM Project_SEM1.primary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) primary_data using(region)
inner join
(SELECT a.urban as urban_upper_secondary, b.Region
FROM (
  SELECT Region, AVG(Urban_Residence) as urban
  FROM Project_SEM1.upper_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) upper_secondary using(region)


-- 8. Tính trung bình tỉ lệ học sinh Nông thôn không được đến trường

select lower_secondary.region Region, rural_primary, rural_lower_secondary, rural_upper_secondary,(rural_primary+rural_lower_secondary+rural_upper_secondary)/3 avg_rural
from 
(SELECT a.rural as rural_lower_secondary , b.Region
FROM (
  SELECT Region, AVG(Rural_Residence) as rural
  FROM Project_SEM1.lower_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) lower_secondary
inner join 
(SELECT a.rural as rural_primary, b.Region
FROM (
  SELECT Region, AVG(Rural_Residence) as rural
  FROM Project_SEM1.primary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) primary_data using(region)
inner join
(SELECT a.rural as rural_upper_secondary, b.Region
FROM (
  SELECT Region, AVG(Rural_Residence) as rural
  FROM Project_SEM1.upper_secondary_cleaned
  GROUP BY Region
) as a
INNER JOIN Project_SEM1.region_and_code as b
ON a.Region = b.Code) upper_secondary using(region)

