-- get the average per month

SELECT
    date_trunc( 'month', sub.created_at ) AS mon,
    AVG(sub.final_price) AS average
FROM
    (
    SELECT
        orders.created_at,
        orders.discount,
        CASE
            when orders.discount = 10 then (products.price - products.price/10)
            else products.price
        end AS final_price
    FROM
        "public"."orders"
    INNER JOIN
        "public"."products"
    USING (product_id)
    ) AS sub
group by mon
order by mon

-- the highest income of the last 10 months

