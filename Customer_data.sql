SELECT
ctr.Contractid, 
CONCAT(cs.FirstName, cs.LastName) as CustomerName,
 p.Name AS ProductType, 
 trs.Date AS DateOfSale, 
 (p.TotalPrice + p.Deposit) - SUM(Amount) AS TotalOutstandingBalance,
 trs.Status
 -- CASE WHEN p.TotalPrice - p.Deposit AND = 800 THEN trs.Date
 -- END AS 'ProjectedCompletionDate'
 -- , ProjectedCompletionDate
 -- SUM(PaymentAmount BETWEEN ctr.CreatedAt AND '2018-01-18') as OutstandingBalanceToDate
FROM contract ctr
JOIN customer cs 
ON cs.Customerid = ctr.Customerid
JOIN product p
ON ctr.Productid = p.Productid
JOIN transaction trs
ON ctr.Contractid = trs.Contractid
WHERE p.Deposit IS NOT NULL OR trs.Status = 'COMPLETED'
