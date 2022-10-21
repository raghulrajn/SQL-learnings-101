

-- The Question is
-- Table: UserActivity
-- | Column Name | Type |
-- |username| varchar |
-- |activity| varchar |
-- |startDate | Date |
-- |endDate| Date |

-- This table does not contain primary key.
-- This table contains information about the activity performed by each user in a period of time.A person with username performed an activity from startDate to endDate. 

-- Write an SQL query to show the second most recent activity of each user.

-- If the user only has one activity, return that one.
-- A user can't perform more than one activity at the same time. Return the result table in any order.

-- UserActivity table:
-- | username| activity| startDate| endDate |
-- | Amy|Travel| 2020-02-12| 2020-02-20 |
-- | Amy|Dancing| 2020-02-21| 2020-02-23 |
-- | Amy|Travel| 2020-02-24| 2020-02-28 |
-- | Joe| Travel| 2020-02-11| 2020-02-18 |
-- --+
-- Result table:
-- +
-- | username|activity| startDate| endDate |
-- | Amy| Dancing|2020-02-21|2020-02-23
-- | Joe|Travel|2020-02-11|2020-02-18





CREATE TABLE users (
  name VARCHAR(50) NOT NULL,
  activity VARCHAR(50) NOT NULL,
  start_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  end_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

insert into users values ('Amy', 'Travel', CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values ('Amy', 'Dancing', CURRENT_DATE-10, CURRENT_DATE-9);
insert into users values ('rich', 'Travel', CURRENT_DATE-5, CURRENT_DATE-4);
insert into users values ('rich', 'Dancing', CURRENT_DATE-10, CURRENT_DATE-9);
insert into users values ('Joe', 'Cycling', CURRENT_DATE-10, CURRENT_DATE-9);

with tab as
(select *,
ROW_NUMBER() OVER(PARTITION BY name order by start_date) AS Row, 
COUNT(*) over (PARTITION BY name order by start_date range between unbounded preceding and unbounded following) as chk 
from users)

select * 
from tab
where row = case when chk = 1 then 1 else chk-1 end;
-- select *,ROW_NUMBER() OVER(PARTITION BY name) AS Row from users
-- order By end_date desc