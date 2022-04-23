INSERT INTO currency(
  id,
  currency_code
)
VALUES (1,'USD'),
       (2,'AED'),
       (3,'EUR'),
       (4,'JPY');

INSERT INTO country(
  id,
  name,
  currency_code,
  is_online
)
VALUES (1,'USA',1,'True'),
       (2,'AED',
