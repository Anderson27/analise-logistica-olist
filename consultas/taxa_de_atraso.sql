-- Pergunta 1: Qual a porcentagem de pedidos entregues com atraso?
-- Resultado: 96.470 entregues, 6.534 atrasados (6,77%)

SELECT
  COUNT(*) AS total_entregues,
  SUM(CASE WHEN order_delivered_customer_date::date > order_estimated_delivery_date::date
      THEN 1 ELSE 0 END) AS atrasados,
  ROUND(100.0 * SUM(CASE WHEN order_delivered_customer_date::date > order_estimated_delivery_date::date
      THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_atrasados
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;
