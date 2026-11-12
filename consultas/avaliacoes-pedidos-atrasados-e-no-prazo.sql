-- Pergunta 2: O atraso na entrega afeta a nota do cliente?
-- Resultado: Atrasado = 2,27 (6.409 avaliações) | No prazo = 4,29 (89.944 avaliações)

SELECT CASE WHEN  orders.order_delivered_customer_date::date > orders.order_estimated_delivery_date::date 
  THEN 'Atrasado' ELSE 'No prazo' END AS situacao,
  COUNT(*) AS avaliacoes,
  ROUND(AVG(order_reviews.review_score), 2) AS nota_media  
FROM orders  
JOIN order_reviews ON orders.order_id = order_reviews.order_id
 WHERE orders.order_status = 'delivered'
  AND orders.order_delivered_customer_date IS NOT NULL
GROUP BY situacao;
