import 'package:unilearn/features/main_screens/lessons_screen/my_courses/data/lesson.dart';
import 'package:unilearn/features/main_screens/lessons_screen/my_courses/data/module_data.dart';

List<ModuleData> courses = [
  ModuleData(id: 1, title: 'Python', percent: 70),
  ModuleData(id: 2, title: 'Java', percent: 54),
  ModuleData(id: 3, title: 'Dart', percent: 0),
];

final Map<String, List<Lesson>> courseLessons = {
  courses[0].title: [
    Lesson(
        id: 1,
        title: 'Переменные и типы данных',
        url: 'DZvNZ9l9NT4',
        percent: 0,
        lecture: '''
В Python переменные играют ключевую роль в хранении и обработке данных. Рассмотрим основные моменты по этой теме.

1. Что такое переменная?
Переменная — это имя, которое ссылается на определенные данные в памяти компьютера. В Python переменные могут хранить различные типы данных и не требуют явного объявления с указанием типа (как, например, в C++ или Java).

Объявление переменной:

x = 5  # Целое число
y = "Привет, мир!"  # Строка 
z = 3.14  # Число с плавающей точкой 

2. Именование переменных

Python обладает некоторыми рекомендациями для именования переменных:

Имя должно быть значимым (не писать x, y, если это неочевидно).

Недопустимо использовать пробелы, например: my variable неверно.

Можно использовать нижнее подчёркивание: my_variable.

Имя не должно содержать цифры в начале (например, 2name неверно).
'''),
    Lesson(
        id: 2,
        title: 'Условные операторы',
        url: 'SUDNfS_0X-Q',
        percent: 0,
        lecture: '''
Условные операторы в Python
Условные операторы (или ветвления) используются для выполнения различных блоков кода в зависимости от заданных условий. Рассмотрим, как это реализуется в Python.

1. Основной синтаксис
Условные операторы используют ключевые слова if, elif и else.

Пример:

x = 10
if x > 5:
    print("x больше 5")
elif x == 5:
    print("x равно 5")
else:
    print("x меньше 5")

2. Оператор if
if проверяет, выполняется ли заданное условие. Если условие истинно (т.е. True), будет выполнен блок кода после if.

Пример:

age = 18
if age >= 18:
    print("Вы совершеннолетний")

3. Оператор elif
elif (сокращение от "else if") используется для проверки дополнительных условий, если первоначальное if не сработало.

Пример:

score = 85
if score >= 90:
    print("Отлично")
elif score >= 70:
    print("Хорошо")
elif score >= 50:
    print("Удовлетворительно")
else:
    print("Неудовлетворительно")

4. Оператор else
else используется для выполнения блока кода, если все предыдущие условия не были истинными.

Пример:

x = -1
if x > 0:
    print("Число положительное")
else:
    print("Число отрицательное или равно нулю")

5. Вложенные условия
Внутри блока if, elif или else могут быть другие условия.

Пример:
num = 10
if num > 0:
    if num % 2 == 0:
        print("Число положительное и чётное")
    else:
        print("Число положительное и нечётное")
else:
    print("Число отрицательное или равно нулю")
'''),
    Lesson(
        id: 3,
        title: 'Циклы и операторы в них',
        url: 'vMD6-jzgDvI',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 4,
        title: 'Списки (list)',
        url: '-X2ubBdP2Ak',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 5,
        title: 'Функции строк',
        url: 'pqaBWcsBGyA',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 6,
        title: 'Кортежи (tuple)',
        url: 'cQfu-hYo2o4',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 7,
        title: 'Словари (dict)',
        url: 'W2oO1Y-QDzo',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 8,
        title: 'Множества (set и frozenset)',
        url: '6eNtZ8wY7qI',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 9,
        title: 'Функции (def, lambda)',
        url: '6K5v4--G__U',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 10,
        title: 'Работа с файлами ',
        url: 't-xQAhLNYSs',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 11,
        title: 'Обработчик исключений (try, except)',
        url: '3nveLco08Y0',
        percent: 0,
        lecture: 'Лекции нет'),
  ],
  courses[1].title: [
    Lesson(
        id: 1,
        title: 'JDK и Hello World.',
        url: 'ziOQ8wkmnSE',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 2,
        title: 'Переменные',
        url: 'lmK15qB_r70',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 3,
        title: 'Строки(String)',
        url: '-YK8B4WO7nI&',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 4,
        title: 'Цикл while',
        url: '15PjODTSTaw',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 5,
        title: 'Цикл for',
        url: 'UYbdAmgcNVc',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 6,
        title: 'Условный оператор if.',
        url: 'ryR033ld_N0',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 7,
        title: 'Ввод данных. Класс Scanner.',
        url: 'Y2iB_DwdyfM',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 8,
        title: 'Цикл do...while.',
        url: 'XV1M9sSWrhI',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 9,
        title: 'Операторы break и continue',
        url: 'otfC1v5YVAY',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 10,
        title: 'Оператор switch.',
        url: 'QJHcGWbzk3U',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 11,
        title: 'Массивы в Java.',
        url: 'li86TEAEhYM',
        percent: 0,
        lecture: ''),
    Lesson(
        id: 12,
        title: 'Цикл for each, Массивы строк.',
        url: '8AD55r64yNw',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 13,
        title: 'Многомерные массивы.',
        url: '17FwEtVsIMQ',
        percent: 0,
        lecture: 'Лекции нет'),
    Lesson(
        id: 14,
        title: 'Классы и объекты.',
        url: 'uPK2FVz6qUs',
        percent: 0,
        lecture: ''),
  ],
  courses[2].title: [
    Lesson(id: 4, title: 'Условные операторы', url: '', percent: 0, lecture: '')
  ],
};
