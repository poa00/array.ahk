## .concat
> `array.concat([value*])`

Используется для объединения двух или более массивов.


#### Аргументы
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | значение/объект | Необязательный. (По умолчанию `[]`) Массивы и/или значения для объединения в новый массив. |


#### Возврат
(array): Новый экземпляр массива. 


#### Пример
```autohotkey
[1, 2, 3].concat([4, 5, 6])
; => [1, 2, 3, 4, 5, 6]

[1, 2, 3].concat([4, 5, 6], [7, 8, 9])
; => [1, 2, 3, 4, 5, 6, 7, 8, 9]

[].concat("Bill", "Ted")
; => ["Bill", "Ted"]
```
<!-- end of concat -->


## .every
> `array.every(func("function"))`

Проверяет, проходят ли все элементы массива тест, реализованный предоставленной функцией.


#### Аргументы
| Argument                              | Type                   | Description  |
| :------------------------------------ | :--------------------- | :----------- |
|  function(element, index, array)      | функция | Необходимый. Функция, запускаемая для каждого элемента массива. |


#### Возврат
(boolean): `true`, если все элементы прошли тестовую функцию, иначе `false`, если хотя бы один из них не прошел.


#### Пример
```autohotkey
[2, 4, 6].every(func("fn_isEven")
; => true

[2, 5, 7].every(func("fn_isEven")
; => false

fn_isEven(o)
{
	if (mod(o, 2) = 0) {
		return true
	}
	return false
}
```
<!-- end of every -->


## .fill
> `array.fill(value[, start, end])`

Заполните все элементы массива статическим значением.

> [!Note]
> Этот метод изменяет вызывающий массив

#### Аргументы
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | значение | Необходимый. Значение, которым нужно заполнить массив. |
|  start         | число | Необязательный. (По умолчанию `1`) Индекс, с которого начинается заполнение массива. |
|  end           | число | Необязательный. (По умолчанию `array.Count()`) Значение для заполнения массива. |


#### Возврат
(array): Модифицированный массив, заполненный значением.


#### Пример
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

Создает новый массив со всеми элементами, прошедшими проверку, реализованную предоставленной функцией.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | функция     | Необходимый. Функция является предикатом для проверки каждого элемента массива. |


#### Возврат
(array): Новый массив с элементами, прошедшими проверку. 


#### Пример
```autohotkey
[1, 2, 3, 4, 5, 6].filter(func("fn_filterIsEven"))
; => [2, 4, 6]

fn_filterIsEven(o) {
	if (mod(o, 2) = 0) {
		return true
	}
	return false
}
```
<!-- end of filter -->


## .find
> `array.find(func("function"))`

Возвращает значение первого элемента предоставленного массива, удовлетворяющего предоставленной функции тестирования.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | функция     | Необходимый. Функция, выполняемая для каждого значения массива. |


#### Возврат
(value): Значение первого элемента массива, удовлетворяющего предоставленной функции тестирования. 


#### Пример
```autohotkey
[1, 2, 3, 4, 5, 6].find(func("fn_findGreaterThanFive"))
; => 6

fn_findGreaterThanFive(o)
{
	if (o > 5) {
		return o
	}
}
```
<!-- end of find -->


## .findIndex
> `array.findIndex(func("function"))`

Возвращает индекс первого элемента массива, удовлетворяющего предоставленной функции тестирования.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | функция | Необходимый. Функция, выполняемая для каждого значения массива. |


#### Возврат
(value): Индекс или ключевое значение первого элемента массива, удовлетворяющего предоставленной функции тестирования. 


#### Пример
```autohotkey
[1, 2, 3, 4].findIndex(func("fn_findIndexFunc"))
; => 2

fn_findIndexFunc(o) {
	return o = 2
}

users := [{user: "Bill"}, {user: "Ted"}]
users.findIndex(func("fn_findIndexFunc2"))
; => 2

fn_findIndexFunc2(o) {
	return o.user = "Ted"
}
```
<!-- end of findIndex -->


## .forEach
> `array.forEach(func("function"))`

Выполняет предоставленную функцию один раз для каждого элемента массива.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | функция | Необходимый. Функция, выполняемая для каждого значения массива. |


#### Возврат
(""): `""` Всегда возвращается пустая строка.


#### Пример
```autohotkey
[1, 2, 3, 4].forEach(func("fn_forEachFunc"))
; => msgboxes 1 then 2 then 3 then 4

fn_forEachFunc(value) {
	msgbox, % value
}
```
<!-- end of forEach -->


## .includes
> `array.includes(valueToFind[, fromIndex])`

Определяет, включает ли массив определенное значение среди своих записей, возвращая true или false в зависимости от ситуации.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | Необходимый. Искомое значение. |
|  fromIndex     | число       | Необязательный. (По умолчанию `1`) Индекс, с которого начинается поиск. |


#### Возврат
(boolean): `true`, если значение valueToFind найдено внутри массива (или части массива, указанной индексом fromIndex, если он указан). 


#### Пример
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

Возвращает первый индекс, по которому можно найти данный элемент в массиве, или «-1», если он отсутствует.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | значение        | Необходимый. Искомое значение. |
|  fromIndex     | число       | Необязательный. (По умолчанию `1`) Индекс, с которого начинается поиск. |


#### Возврат
(number): Индекс или значение ключа первого элемента массива, соответствующего элементу searchElement. 


#### Пример
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

Возвращает новую строку путем объединения всех элементов массива, разделенных запятыми или указанной строкой-разделителем.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | строка       | Необязательный. (По умолчанию `","`) Указывает строку для разделения каждой пары соседних элементов массива. |


#### Возврат
(string): Строка, в которой объединены все элементы массива. 


#### Пример
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

Возвращает новый массив, содержащий ключи для каждого индекса массива.

#### Аргументы
Не принимает никаких аргументов.


#### Возврат
(array): Новый массив, содержащий все ключи вызывающего массива.


#### Пример
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

Возвращает первый индекс, по которому можно найти данный элемент в массиве, или «-1», если он отсутствует.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | значение        | Необходимый. Искомое значение. |
|  fromIndex     | число       | Необязательный. (По умолчанию `1`) Индекс, с которого начинается поиск в обратном направлении. |


#### Возврат
(number): Последний индекс элемента массива


#### Пример
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

создает новый массив, заполненный результатами вызова предоставленной функции для каждого элемента вызывающего массива.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | функция     | Необходимый. Функция, вызываемая для каждого элемента arr. |


#### Возврат
(array): Новый массив, каждый элемент которого является результатом функции обратного вызова.


#### Пример
```autohotkey
[1, 2, 3].map(func("fn_timesTwo"))
; => [2, 4, 6]

fn_timesTwo(o)
{
	return o * 2
}


["Bill", "Ted"].map(func("fn_upcase"))
; => ["BILL", "TED"]

fn_upcase(o)
{
	StringUpper, OutputVar, o
	return OutputVar
}
```
<!-- end of map -->


## .reduce
> `array.reduce(func("function"))`

Выполняет функцию редуктора для каждого элемента массива, в результате чего получается одно выходное значение.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | функция     | Необходимый. Функция, выполняемая для каждого элемента массива (кроме первого, если не указано начальное значение). |


#### Возврат
(value): Единственное значение, полученное в результате сокращения.


#### Пример
```autohotkey
[1, 2, 3].reduce(func("fn_addition"))
; => 6

fn_addition(a, b)
{
	return a + b
}
```
<!-- end of reduce -->


## .reduceRight
> `array.reduceRight(func("function"))`

Применяет функцию к аккумулятору и каждому значению массива (справа налево), чтобы уменьшить его до одного значения.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | функция     | Необходимый. Функция, выполняемая для каждого элемента массива (кроме первого, если не указано начальное значение). |


#### Возврат
(value): Единственное значение, полученное в результате сокращения.


#### Пример
```autohotkey
[[0, 1], [2, 3], [4, 5]].reduceRight(func("fn_reduceNestedArray"))
; => [4, 5, 2, 3, 0, 1]

fn_reduceNestedArray(previousValue, currentValue)
{
	return previousValue.concat(currentValue)
}
```
<!-- end of reduceRight -->


## .reverse
> `array.reverse()`

Переворачивает массив на месте.

> [!Note]
> Этот метод изменяет вызывающий массив

#### Аргументы
Не принимает никаких аргументов.


#### Возврат
(array): Перевёрнутый массив.


#### Пример
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

Удаляет первый элемент из массива и возвращает этот удаленный элемент.

> [!Note]
> Этот метод изменяет вызывающий массив

#### Аргументы
Не принимает никаких аргументов.


#### Возврат
(value): Удаленный элемент из массива; 


#### Пример
```autohotkey
array := [1, 2, 3]
array.shift()
; => 1

msgbox, % array.join()
; => "2,3"
```
<!-- end of shift -->


## .slice
> `array.slice()`

Возвращает неглубокую копию части массива в новый объект массива, выбранный от начала до конца (конец не включен), где начало и конец представляют индекс элементов в этом массиве.

#### Аргументы
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | число | Необязательный. (По умолчанию `1`) Индекс, с которого начинается извлечение. |
|  end           | число | Необязательный. (По умолчанию `array.Count()`) Индекс, по которому следует завершить извлечение. |


#### Возврат
(value): Новый массив, содержащий извлеченные элементы.


#### Пример
```autohotkey
array := ["Bill", "Ted", "Socrates", "Lincoln"]
array.slice(3)
; => ["Socrates", "Lincoln"]

array.slice(1, 2)
; => ["Bill", "Ted"]
```
<!-- end of slice -->


## .some
> `array.some(func("function"))`

Проверяет, проходит ли хотя бы один элемент массива тест, реализованный предоставленной функцией.

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | функция     | Необходимый. Функция, выполняемая для каждого элемента массива. |


#### Возврат
(boolean): `true`, если функция обратного вызова возвращает истинное значение хотя бы для одного элемента массива. 


#### Пример
```autohotkey
[1, 2, 3, 4].some(func("fn_isEven"))
; => true

fn_isEven(o)
{
	if (mod(o, 2) = 0) {
		return true
	}
	return false
}
```
<!-- end of some -->


## .sort
> `array.sort([func("function")])`

Сортирует элементы массива по месту и возвращает отсортированный массив.

> [!Note]
> Этот метод изменяет вызывающий массив

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | функция     | Необязательный. Задает функцию, определяющую порядок сортировки. |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | сортировать `b` перед `a` |
| < 0			 | сортировать `a` перед `b` |
| == 0			 | сохранить первоначальный порядок `a` и `b` |


#### Возврат
(array): Сортированный массив.


#### Пример
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [deleteCount, values*])`

Изменяет содержимое массива, удаляя или заменяя существующие элементы и/или добавляя на место новые элементы.

> [!Note]
> Этот метод изменяет вызывающий массив

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | число       | Необходимый. Индекс, с которого следует начать изменение массива. |
|  deleteCount    | число       | Необязательный. (Default `-1`) Целое число, указывающее количество элементов массива, которые необходимо удалить. |
|  values*        | значение/объект | Необязательный. (Default `""`) Значения, добавляемые в массив. |


#### Возврат
(array): Массив, содержащий удаленные элементы. 


#### Пример
```autohotkey
array := ["Bill", "Socrates"]
array.splice(2, 0, "Ted")
; => ["Socrates"]

msgbox, % array.join()
; => "Bill,Ted"
```
<!-- end of splice -->


## .toString
> `array.toString()`

Возвращает строку, представляющую указанный массив и его элементы.

#### Аргументы
Не принимает никаких аргументов.


#### Возврат
(string): Строка, представляющая все элементы массива.


#### Пример
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

Добавляет один или несколько элементов в начало массива и возвращает новую длину массива.

> [!Note]
> Этот метод изменяет вызывающий массив

#### Аргументы
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | значение/объект | Необходимый. Элементы, добавляемые в начало массива. |



#### Возврат
Новая длина array.Count() массива, для которого был вызван метод.


#### Пример
```autohotkey
array := []
array.unshift("Bill", "Ted")
; => 2

msgbox, % array.join()
; => "Bill,Ted"
```
<!-- end of unshift -->


## .values
> `array.values()`

Возвращает новый массив, содержащий значения для каждого элемента вызывающего массива.

#### Аргументы
Не принимает никаких аргументов.


#### Возврат
(array): Новый массив, содержащий все значения вызывающего массива.


#### Пример
```autohotkey
["Bill", "Ted", "Socrates"].values()
; => ["Bill, "Ted, "Socrates"]

array := []
array.InsertAt("x", "Bill")
array.InsertAt("y", "Ted")
array.InsertAt("z", "Socrates")
array.values()
; => ["Bill, "Ted, "Socrates"]
```
<!-- end of values -->
