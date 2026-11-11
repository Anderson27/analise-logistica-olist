-- Pergunta 3: Quais estados têm a maior porcentagem de pedidos atrasados?
-- Considera só estados com pelo menos 300 entregas, pra evitar distorção em amostras pequenas.
-- Resultado: AL (21,41%), MA (17,43%) e SE (15,22%) lideram, o Nordeste concentra os piores índices.
-- O RJ tem 12,11% de atraso, mas, pelo volume, soma quase 1.500 pedidos atrasados.

SELECT customers.customer_state,
  COUNT(*) AS entregues,
  SUM(CASE WHEN orders.order_delivered_customer_date::date > orders.order_estimated_delivery_date::date
      THEN 1 ELSE 0 END) AS atrasados,
  ROUND(100.0 * SUM(CASE WHEN orders.order_delivered_customer_date::date > orders.order_estimated_delivery_date::date
      THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_atrasados
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id
WHERE orders.order_status = 'delivered'
  AND orders.order_delivered_customer_date IS NOT NULL
GROUP BY customers.customer_state
HAVING COUNT(*) >= 300
ORDER BY pct_atrasados DESC;
