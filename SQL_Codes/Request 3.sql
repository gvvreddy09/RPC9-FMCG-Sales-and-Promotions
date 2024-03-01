/*
	Generate a report that displays each campaign along with the total revenue generated before and after the campaign. 
    The report includes three key fields: campaign_name, total_revenue(before_promotion), and total_revenue(after promotion). 
    This report should help in evaluating the financial impact of our promotional campaigns. 
    (Display the values in millions).
        
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
)	
SELECT 
	c.campaign_id,
	ROUND(SUM(`revenue(before_promo)`) / 1000000, 2) AS 'revenue(before_promo)_mln',
	ROUND(SUM(`revenue(after_promo)`) / 1000000, 2) AS 'revenue(after_promo)_mln'
FROM
	dim_campaigns c
		JOIN
	fact_events_with_revenue e USING (campaign_id)
GROUP BY c.campaign_id;






