# TaskCRUD

<h2>Deploy in heroku - https://componentsapp.herokuapp.com</h2>

**Для запуска приложения:**
```
1.Подключиться к БД(root,root). Скрипт находится в папке config.

database name - test

2.В терминале -mvn clean package

3.Подключить Tomcat.
```

<h1>Тестовое задание для участия в стажировке Java Enterprise </h1>

# Используемые технологии и инструменты:
- Java 8
- Spring MVC
- Hibernate
- PostgreSQL
- Maven
- Tomcat
- HTML/CSS/JS/Bootstrap/JSP/JSTL
- Git
- IntelliJ Idea

<h2>Задание</h2>

<h3>Задание: PARTS (компьютерные комплектующие)</h3>
Реализовать приложение Parts-list, для отображения списка деталей для сборки компьютеров на складе. 
<p>Записи хранить в базе данных. Схему таблички для хранения нужно придумать самому (достаточно одной таблицы).
<p>Нужно показывать список уже имеющихся деталей (с пейджингом по 10 штук на странице).
<p>В списке должно быть наименование детали (String), обязательна ли она для сборки (boolean) и их количество на складе (int).
<p> На склад можно добавлять новые детали, редактировать существующие детали (любое из полей), удалять.


<h4>Должна быть сортировка по принципу:</h4>
- все детали 
- детали, которые необходимы для сборки
- опциональные детали

<h4>Должен быть поиск по наименованию детали.</h4>

<h3>Бизнес-требование:</h3> 
Ниже списка деталей всегда выводить поле, в котором выводится, сколько компьютеров можно собрать из деталей в наличии. 
<p>Для сборки одного компьютера должны быть в наличии все детали, которые отмечены как необходимые.


