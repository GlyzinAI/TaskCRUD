CREATE TABLE public.computer_components
(
  id        SERIAL PRIMARY KEY,
  title     TEXT                  NOT NULL,
  necessary BOOLEAN DEFAULT FALSE NOT NULL,
  quantity  INTEGER               NOT NULL
);

CREATE UNIQUE INDEX computer_components_uindex
  ON computer_components (title);

INSERT INTO computer_components (title, necessary, quantity)
VALUES
  ('материнская плата', '1', 9),
  ('звуковая карта', '0', 5),
  ('процессор', '1', 10),
  ('подстветка корпуса', '0', 2),
  ('HDD диск', '0', 4),
  ('корпус', '1', 10),
  ('память', '1', 11),
  ('SSD диск', '1', 15),
  ('блок питания', '1', 12),
  ('оптический привод DVD', '0', 9),
  ('система охлаждения', '0', 16),
  ('устройство видеозахвата', '0', 6),
  ('контроллер usb', '0', 10),
  ('оптический привод Blu-ray', '0', 4),
  ('TV-тюнер', '0', 5),
  ('сетевая карта', '0', 13),
  ('адаптер bluetooth', '0', 18),
  ('модуль WiFi', '0', 18),
  ('кулер', '1', 15),
  ('термопаста', '1', 25),
  ('SD контроллер ', '0', 11);

