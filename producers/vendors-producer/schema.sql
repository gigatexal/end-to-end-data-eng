CREATE TABLE IF NOT EXISTS order_status(
  id INTEGER PRIMARY KEY, status TEXT);

CREATE UNIQUE INDEX IF NOT EXISTS uq_order_status ON order_status (status);

INSERT INTO order_status(id, status)
  SELECT 1,'CREATED'
  UNION ALL
  SELECT 2, 'UPDATED'
  UNION ALL
  SELECT 3, 'ACCEPTED'
  UNION ALL
  SELECT 4, 'REJECTED'
  UNION ALL
  SELECT 5, 'DELIVERED'
  UNION ALL
  SELECT 6, 'PICKEDUP';


