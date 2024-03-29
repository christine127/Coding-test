-- 방법1. 서브쿼리 활용하기 

DELETE FROM Person 
WHERE id NOT IN 
                (SELECT sub.min_id --한 번 더 SELECT문을 넣는 이유(하단)
                 FROM
                     (SELECT email, MIN(id) min_id
                     FROM Person
                     GROUP BY email) sub
       
-- 추가 설명:한 번 더 SELECT문을 넣는 이유
                 
-- MYSQL은 MySQL은 DELETE문의 하위 절에서 동일한 테이블을 사용하지 못하게 하고 있습니다. 
-- 그래서 'NOT IN'절에서 새 테이블이 필요하기 때문에 중간에 select 문을 넣어 새롭게 만들어줘야만 사용할 수 있습니다. 
       
                 
                 
-- 방법2. INNER JOIN 활용하기 
-- 2-1. where 문                 
DELETE p1 FROM Person p1, Person p2
WHERE p1.Email = P2.email  AND p1.Id > p2.Id
               
                 
-- 2-2. join 문
DELETE p1 
FROM Person p1 
     INNER JOIN Person p2 ON p1.Email = p2.Email
WHERE p1.Id > p2.Id
