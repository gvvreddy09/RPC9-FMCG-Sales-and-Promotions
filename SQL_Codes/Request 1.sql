/*
	Provide a list of products with a base price greater than 500 and that are featured in promo type of 'BOGOF' (Buy One Get One Free).
	This information will help us identify high-value products that are currently being heavily discounted, 
	which can be useful for evaluating our pricing and promotional strategies.
        
*/
        
SELECT DISTINCT
    (p.product_name), base_price, promo_type
FROM
    dim_products p
        JOIN
    fact_events_revised f USING (product_code)
WHERE
    base_price > 500
        AND promo_type = 'BOGOF'
