/*
	Produce a report that calculates the incremental sold quantity (ISU%) for each category during the Diwali campaign. 
    Additionally, provide rankings for the categories based on their ISU%. 
    The report will include three key fields: category, ISU%, and rank order. 
    This information will assist in assessing the category-wise success and impact of the Diwali campaign on incremental sales.
        
*/


WITH fact_events_aggregated AS (
	SELECT 
		p.category,
		SUM(`quantity_sold(before_promo)`) AS 'quantity_sold(before_promo)',
		SUM(`quantity_sold(after_promo)`) AS 'quantity_sold(after_promo)'
	FROM
		fact_events_revised e
			JOIN
		dim_products p USING (product_code)
	WHERE
		e.campaign_id = 'CAMP_DIW_01'
	GROUP BY p.category
),
category_wise_ISU_pct AS (
	SELECT 
    category, 
    ROUND(((`quantity_sold(after_promo)` - `quantity_sold(before_promo)`) / (`quantity_sold(before_promo)`)) * 100,
            2) AS 'ISU_pct'
	FROM
		fact_events_aggregated
)
SELECT
	*,
	DENSE_RANK() OVER (ORDER BY ISU_pct DESC) AS rank_order
FROM category_wise_ISU_pct;







