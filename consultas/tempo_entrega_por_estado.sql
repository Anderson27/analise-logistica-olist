-- Pergunta 4: Quantos dias, em média, um pedido leva para chegar em cada estado?
-- Resultado: o Norte é o mais lento (RR 29,3 dias, AP 27,2, AM 26,4); SP, MG e PR são os mais rápidos.
-- Achado: o Norte demora mais, mas não é o que mais atrasa (AL, MA e SE lideram),
-- então o prazo prometido para o Nordeste parece curto demais.

SELECT customers.customer_state,
  ROUND(AVG( order_delivered_customer_date::date - order_purchase_timestamp::date) , 1) AS media_dias
FROM orders
INNER JOIN  customers  ON customers.customer_id = orders.customer_id
WHERE  order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL
GROUP BY  customer_state
ORDER BY media_dias DESC;
