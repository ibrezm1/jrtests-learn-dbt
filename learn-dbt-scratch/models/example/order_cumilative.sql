{{ config(materialized='table') }}

select O_ORDERDATE, SUM(O_TOTALPRICE) as tot_price,
sum(tot_price) over (order by O_ORDERDATE
                     rows between 1 preceding and current row)
           as cumulative_sum_quantity
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
group by O_ORDERDATE