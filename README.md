#  Analyse Promotions and Provide Tangible Insights to the Sales Director
## Project's Objective
**AtliQ Mart**, a prominent retail chain with 50 supermarkets in South India, conducted extensive promotions during Diwali 2023 and Sankranti 2024. **Bruce Haryali**, Sales Director, seeks insights into the success of these promotions to inform future strategies. The project involves analyzing store performance, promotions, product and categories, and 5 key business/ad-hoc requests.

Refer problem statement, recommended insights, and ad-hoc requests pdfs for further details.

### Data overview
1. dim_campaigns: Contains all campaigns information
2. dim_products: Includes information about products and categories
3. dim_stores: Encompasses all stores data along with city
4. fact_events: Contains details about events happened during campaigns
5. retail_events_db: Includes all the tables mentioned above



### Tools and Approach
For the ad-hoc requests, I've used **MySQL**. Imported datasets to **Power BI** and built a report. Using Snowflake schema constructed a data model.

I've created 3 pages: Store performance, Promotional Analysis, and Product & Category Analysis and they have:

**Incremental Revenue(IR)** and **Incremental Sold Units(ISU)** are nothing but KPIs of Sales / Promotions. I've levereged to use both in my report with a toggle to switch between.

**Key Performance Indicators**
1. Promotional period average (PPA): Average IR/ISU generated during campaigns
2. Before Promo: IR/ISU before promotions
3. After Promo: IR/ISU after promotions
4. IR/IR%
5. ISU/ISU%

**Store Performance:**
1. Number of stores by city
2. City/Store performance matrix
3. Top and Bottom 10 stores across all cities

**Promotional Analysis:**
1. IR/ISU by campaign
2. IR/ISU distribution by promotion type (BOGOF, 500 Cashback, 25% Off, 33% Off, and 50% Off)
3. IR Vs ISU by promotion type
4. Top and Bottom 2 promotion types across all campaigns

**Product & Category Analysis:**
1. IR/ISU by category
2. Product level performance matrix
3. IR/ISU by product/category Vs campaign/promotion type


+ To interact with [Live dashboard](https://app.powerbi.com/view?r=eyJrIjoiYWFiNmZjZTQtM2RkMy00ZjYwLThlMmItOGFkNjYyZDgyOWYxIiwidCI6ImM2ZTU0OWIzLTVmNDUtNDAzMi1hYWU5LWQ0MjQ0ZGM1YjJjNCJ9).
+ [Presentation Link](https://drive.google.com/file/d/1fzNAuiC2PDp6VLHRn8P8FlzLRmfnLmSr/view?usp=drive_link).

### Insights
+ The City **Bengaluru**, with the highest number of stores 10 generates an incremental revenue of 38.23M reports first
+ Top 10 stores from Mysore (2), Chennai (4), and Bengaluru (4) in terms of **IR**
+ Bottom 10 stores from Coimbatore (1), Vijayawada (2), Mangalore (3), Trivandrum (2), and Visakhapatnam (2) in terms of **ISU**
+ The top 2 promotion types that resulted in the highest IR are **500 cashback and BOGOF**
+ The bottom 2 promotion types that resulted in terms of ISU are **50% and 25%**
+ Of all the promotion types, **discount-based** are not performing well
+ The promotion type **500 Cashback** strikes the best balance ISU and maintains healthy margins
+ The product category **Combo1** with incremental revenue of 91.05M reports first
+ **Home_Essential_8_Product_combo and WaterProof_Immersion_Rod** respond **exceptionally well** to the promotions
+ **Doodh_Kesar_Body_Lotion (200ML) and Body_Milk_Nourishing_Lotion (120ML)** respond **poorly** to the promotions
+ The product categories **Grocery & Staples, Home care, and Home appliances** respond well with the **BOGOF** promotion type

