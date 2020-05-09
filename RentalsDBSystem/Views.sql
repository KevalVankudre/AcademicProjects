---------------------------------------------- VIEWS ---------------------------------------------

------------------------------------------------------------------------
-- View for products that are available for more than 10 days
CREATE VIEW Pro_Avl_More_Than_10_Days
AS
select d.Product_ID, d.Product_Type, p.Post_ID, p.From_Date, p.To_Date,p.Photos_Videos, p.Description, p.Rate, p.Location
from product d join post p on p.Product_ID = d.Product_ID where 
(DATEDIFF(dd, p.From_Date, p.To_Date)+1)>=10 and p.Is_Available like 'Yes' ;

Select * from Pro_Avl_More_Than_10_Days

------------------------------------------------------------------------
-- View for UnApproved posts

CREATE VIEW UnApproved_Posts 
AS
Select * from [Post] p where p.approved_by is null;

Select * from UnApproved_posts;

------------------------------------------------------------------------
-- View for products that are sold more
CREATE VIEW Top_3_Post
AS
select TOP 3 o.Post_ID, count(*) AS Sold_No_Of_Times from [Order] o where o.Post_ID in 
(select p.Post_ID from post p) group by o.Post_ID order by Sold_No_Of_Times desc;

select * from Top_3_Post;
drop view Top_3_Post;


