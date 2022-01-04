--DML_1 What are the Top 5 businesses with the highest average star ratings?

CREATE VIEW avg_review_ratings AS
SELECT TOP 5 b.busName AS 'Business Name', b.busCategories AS 'Category',
AVG(r.revStars) AS 'Average Star Ratings'
FROM BUSINESS_T b INNER JOIN REVIEW_T r ON b.busId = r.busId
GROUP BY b.busCategories, b.busName
ORDER BY 'Average Star Ratings' DESC;

--DML_2 What are the top 10 businesses with the most reviews?
CREATE VIEW top_10_business_with_most_reviews AS
SELECT TOP 10 b.busName AS 'Business Name', b.busCategories AS 'Category',
b.busReviewCnt AS 'Review Count'
FROM BUSINESS_T b
GROUP BY b.busCategories, b.busName, b.busReviewCnt
ORDER BY b.busReviewCnt DESC;

--DML_3 What are the top 10 businesses with the most business stars?
CREATE VIEW top_10_bus_with_most_stars AS
SELECT TOP 20 b.busName AS 'Business Name', b.busCategories AS 'Business Category',
b.busStars AS 'Stars'
FROM BUSINESS_T b
GROUP BY b.busStars, b.busCategories, b.busName
ORDER BY b.busStars DESC;

--DML_4 What businesses are closed and their location?
CREATE VIEW closed_bus AS
SELECT b.busName AS 'Business Name', b.busCategories AS 'Business Category',
b.busStreet AS 'Address', b.busCity AS 'City', b.busState AS 'State'
FROM BUSINESS_T b
WHERE b.busIsOpen = 0;