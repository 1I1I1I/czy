#新建表
CREATE TABLE college(
id INT,
c_name VARCHAR(10),
PRIMARY KEY (id)
)

CREATE TABLE student(
 id INT,
 s_name VARCHAR(20),
 chinese FLOAT,
 english FLOAT,
 math FLOAT,
 college_id INT,
 CONSTRAINT student_college FOREIGN KEY(college_id) REFERENCES college(id),
 PRIMARY KEY (id)
)
#插入数据#
INSERT INTO college VALUES(1,"软件学院"),(2,"机械学院"),(3,"术美学院")
SELECT *FROM college
INSERT INTO student VALUES(1,"张三",97,67,89,2),(2,"李四",95,77,84,1),(3,"王五",84,54,99,3),(4,"张三",97,67,89,1)
SELECT *FROM student
#查询相同名字的数据
SELECT * FROM student WHERE s_name IN ( SELECT s_name FROM student GROUP BY s_name HAVING count(1)>1)
CREATE TABLE t_name (
 SELECT 
   * 
 FROM 
   student 
 WHERE 
   s_name 
 IN (
 SELECT 
   s_name 
 FROM 
   student 
 GROUP BY 
   s_name 
 HAVING 
   count(1)>1
	 ) 
AND id NOT IN(
 SELECT 
	 MIN(id) 
 FROM student)
	 )
SELECT *FROM t_name 

#删除相同名字的数据
DELETE FROM student WHERE id IN(SELECT id FROM t_name)

#成绩由高到低排名
SELECT *FROM student ORDER BY english DESC
SELECT *FROM student ORDER BY math DESC
SELECT *FROM student ORDER BY chinese DESC

SELECT s_name,(english+math+chinese)"总成绩" FROM student ORDER BY english+math+chinese
