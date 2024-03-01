/*
	Create a report featuring the Top 5 products, ranked by Incremental Revenue Percentage (IR%), across all campaigns. 
    The report will provide essential information including product name, category, and IR%. 
    This analysis helps identify the most successful products in terms of incremental revenue across our campaigns, 
    assisting in product optimization.
        
*/


WITH fact_events_with_revenue AS (
	SELECT 
		*,
		`quantity_sold(before_promo)` * base_price AS 'revenue(before_promo)',
		CASE
			WHEN promo_type = '50% OFF' 		THEN `quantity_sold(after_promo)` * (base_price * (1 - 0.5))
			WHEN promo_type = '25% OFF' 		THEN `quantity_sold(after_promo)` * (base_price * (1 - 0.25))
			WHEN promo_type = 'BOGOF' 			THEN `quantity_sold(after_promo)` * base_price / 2
			WHEN promo_type = '500 Cashback' 	THEN `quantity_sold(after_promo)` * (base_price - 500)
			WHEN promo_type = '33% OFF' 		THEN `quantity_sold(after_promo)` * (base_price * (1 - 0.33))
		END AS 'revenue(after_promo)'
	FROM
		fact_events_revised
),
fact_events_revenue_aggregated	AS (
	SELECT 
		p.product_name,
        p.category,
		SUM(`revenue(before_promo)`) AS 'revenue(before_promo)',
		SUM(`revenue(after_promo)`) AS 'revenue(after_promo)'
	FROM
		dim_products p
			JOIN
		fact_events_with_revenue e USING (product_code)
	GROUP BY p.category, p.product_name
),
product_wise_IR_pct AS (
	SELECT
		product_name,
        category,
        ROUND(((`revenue(after_promo)` - `revenue(before_promo)`) / (`revenue(before_promo)`)) * 100,
            2) AS 'IR_pct'
	FROM fact_events_revenue_aggregated
)
SELECT
	*,
	DENSE_RANK() OVER (ORDER BY IR_pct DESC) AS rank_order
FROM product_wise_IR_pct
LIMIT 5;





