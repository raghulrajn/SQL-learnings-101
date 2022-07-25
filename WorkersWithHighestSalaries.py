# Find the titles of workers that earn the highest salary. Output the highest-paid title or multiple titles that share the highest salary.

# https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries?

############# WORKER DATAFRAME ##############
# worker_id	first_name	last_name	salary	joining_date	department
# 1	Monika	Arora	100000	2014-02-20 09:00:00	HR
# 2	Niharika	Verma	80000	2014-06-11 09:00:00	Admin
# 3	Vishal	Singhal	300000	2014-02-20 09:00:00	HR
# 4	Amitah	Singh	500000	2014-02-20 09:00:00	Admin
# 5	Vivek	Bhati	500000	2014-06-11 09:00:00

######## TITLE DATAFRAME ########################
# worker_ref_id	worker_title	affected_from
# 1	Manager	2016-02-20 00:00:00
# 2	Executive	2016-06-11 00:00:00
# 8	Executive	2016-06-11 00:00:00
# 5	Manager	2016-06-11 00:00:00
# 4	Asst. Manager	2016-06-11 00:00:00
import pandas as pd

# Start writing code
# worker.head()
title = title.rename(columns={'worker_ref_id': 'worker_id'})
total = worker.merge(title, how='inner',on='worker_id')

total['max_rank'] = total['salary'].rank(method='max',numeric_only=True,na_option = 'keep',ascending = False,pct = False)

df = pd.DataFrame()
filter = (total['max_rank'] == min(total['max_rank']))
df['best_paid_title'] = total['worker_title'].where(filter).dropna()

df.head()
# total = total.sort_values('max_rank').reset_index()
# total.head()
