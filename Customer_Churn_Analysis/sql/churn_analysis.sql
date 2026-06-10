/*
Question:1
What is the overall customer churn rate?
*/

SELECT
    Churn,
    COUNT(*) AS customer_count
FROM churn_cleaned
GROUP BY Churn;

/*
Insight:
26.5% of customers have churned, indicating a significant customer retention challenge.

Recommendation:
Focus on identifying at-risk customers and improving retention strategies.
*/

/*
Question:2
Which contract type experiences the highest churn?
*/

SELECT
    Contract,
    COUNT(*) AS churned_customers
FROM churn_cleaned
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY churned_customers DESC;

/*
Insight:
Month-to-month customers account for the majority of churn cases.

Recommendation:
Encourage customers to switch to longer-term contracts through incentives and loyalty benefits.
*/

/*
Question:3
Which payment method is associated with the highest churn?
*/

SELECT
    PaymentMethod,
    COUNT(*) AS churned_customers
FROM churn_cleaned
WHERE Churn = 'Yes'
GROUP BY PaymentMethod
ORDER BY churned_customers DESC;

/*
Insight:
Customers using Electronic Check show the highest churn levels.

Recommendation:
Promote automatic payment methods and investigate issues affecting Electronic Check users.
*/

/*
Question:4
Which internet service category has the highest churn?
*/

SELECT
    InternetService,
    COUNT(*) AS churned_customers
FROM churn_cleaned
WHERE Churn = 'Yes'
GROUP BY InternetService
ORDER BY churned_customers DESC;

/*
Insight:
Fiber Optic customers contribute the highest number of churn cases.

Recommendation:
Improve service quality and customer support for Fiber Optic customers.
*/

/*
Question:5
How does customer tenure affect churn?
*/

SELECT
    CASE
        WHEN tenure <= 12 THEN 'New Customers'
        WHEN tenure <= 36 THEN 'Mid-Term Customers'
        ELSE 'Long-Term Customers'
    END AS customer_group,
    COUNT(*) AS churned_customers
FROM churn_cleaned
WHERE Churn = 'Yes'
GROUP BY customer_group;

/*
Insight:
New customers are the most likely to churn, while long-term customers are more loyal.

Recommendation:
Strengthen onboarding and engagement programs during the first year.
*/

/*
Question:6

How much monthly revenue is lost due to customer churn?
*/

SELECT
    ROUND(SUM(MonthlyCharges),2) AS monthly_revenue_lost
FROM churn_cleaned
WHERE Churn = 'Yes';


/*
Insight:

The company loses approximately $139,130.85 in
monthly recurring revenue due to customer churn.

Recommendation:

Focus on retaining high-value customers and
implement targeted retention campaigns to
reduce revenue loss.
*/

/*
Question:7

Which combination of contract type, internet service,
and payment method has the highest churn?
*/

SELECT
    Contract,
    InternetService,
    PaymentMethod,
    COUNT(*) AS churned_customers
FROM churn_cleaned
WHERE Churn = 'Yes'
GROUP BY Contract,
         InternetService,
         PaymentMethod
ORDER BY churned_customers DESC
LIMIT 10;


/*
Insight:

Month-to-month customers using Fiber Optic
internet and Electronic Check payment methods
show the highest churn concentration.

Recommendation:

Provide incentives for long-term contracts and
encourage customers to switch to automatic
payment methods.
*/

/*
Question:8

Which customer segment should be prioritized
for churn reduction efforts?
*/

SELECT
    CASE
        WHEN tenure <= 12 THEN 'New Customers'
        WHEN tenure <= 36 THEN 'Mid-Term Customers'
        ELSE 'Long-Term Customers'
    END AS customer_segment,
    COUNT(*) AS churned_customers
FROM churn_cleaned
WHERE Churn = 'Yes'
GROUP BY customer_segment
ORDER BY churned_customers DESC;


/*
Insight:

New customers contribute the highest number
of churn cases, indicating higher risk during
the early stages of the customer lifecycle.

Recommendation:

Improve onboarding experience, customer support,
and engagement programs during the first year
to increase retention.
*/

