# (от)ЦОС
Филлипов с кайфом принимает все ЛР, весь поток приносил скатанное.
Вопросы не меняются, если не отвечаешь -- он сам говорит ответ.
Иногда достаточно сказать какое-то слово из ответа, и он сразу принимает.

Ответы на некоторые лабораторные ниже.

Делал (брал у Винтерпумы) ЛР на Octave, но последняя лаба (там варианты по группам) работает только в Матлабе, поэтому есть лайфхак: зайти на mathworks под vpn, попросить студенческую версию, указать левые данные студента США, они без проверки дают на месяц лицензию, дальше можно использовать Web-версию.

## Лабораторные 4-5
### Почему не используем идеальный фильтр?
Будет возникать эффект Гиббса.

### Что произойдет с краями, если применить фильтр низких частот к изображению? 
Станут размытыми (поможет ответить свертка прямоугольного импульса).

### Зачем нужен фильтр высоких частот?
Показать малоразличимые объекты на фото, но фотография при этом станет темнее.

### Где находится результат фильтрации на графике? 
Показать график

### Что происходит с интенсивностью? 
Становится значительно ниже. 

### Что будет если применить фильтр высоких частот к изображению? 
Фотография станет темнее

### После применения фильтра высоких частот малоразличимые фото становится тёмным. А как его сделать обратно светлыми и чтобы мелкие детали видны были?
Надо добавить константу (среднюю интенсивность) к передаточной функции.

## Лабораторные 6-7
### Почему фильтр Винера дает более качественный результат, чем фильтр низких частот?
Потому что в формуле для фильтра также учитываются помехи.

### Функция импульсного отклика - во временной области, а как называется такая же в частотной?
Передаточная функция.

### Как называется функция искажения? Её смысл?
Функция импульсного отклика. Смысл -- реакция системы на импульс.

### Какие требования накладываются на помеху (шум) при использовании этого метода?
Аддитивность и статистическая независимость

### Почему фильтр Тихонова лучше, чем фильтр Винера?
С помощью параметра альфа можно, изменяя его, подгонять и смотреть, лучше изображение, или хуже.
При решении задачи в лоб мы получаем неустойчивые результаты, а вот с помощью параметра альфа в алгосе тихонова результаты становятся устойчивыми.
При стремлении альфа к нулю функция стремится к точному нужному нам значению. Но при равенстве 0 результаты становятся неустойчивыми, поэтому типа надо как-то понять, какой альфа туда подставлять.

### Какие три графика были построены?
Искаженный сигнал, искажающая функция отклика и неискаженный сигнал. 

## Какой физический смысл 3ей линии?
По неискаженному и искаженному сигналам вычислили третью линию, которая и исказила сигнал
