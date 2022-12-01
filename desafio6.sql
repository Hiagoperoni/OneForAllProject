SELECT CONVERT(FORMAT(MIN(plan.plan_price), 2), CHAR) AS faturamento_minimo,
CONVERT(MAX(plan.plan_price), CHAR) AS faturamento_maximo,
CONVERT(ROUND(AVG(plan.plan_price), 2), CHAR) AS faturamento_medio,
CONVERT(ROUND(SUM(plan.plan_price), 2), CHAR) AS faturamento_total
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.plans AS plan
ON users.user_plan = plan.plan_id;