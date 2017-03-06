# language: ru

Функциональность: Распаковка каталога

Как разработчик
Я хочу иметь возможность распаковать на исходники все бинарные файлы 1С 7.7, расположенные в указанном каталоге
Чтобы иметь исходные коды проекта

Контекст:
Допустим Я создаю временный каталог бинарников и сохраняю его в контекст
    И я создаю другой временный каталог для исходников и сохраняю его в контекст
    И я сохраняю в контекст имя каталога ресурсов "features\resources"
    И каталог бинарников пустой    
    
Сценарий: Распаковка пустого каталога
    Допустим каталог бинарников пустой
    Когда я выполняю команду распаковки бинарников
    Тогда каталог исходников пустой

Сценарий: Распаковка каталога с внешней обработкой
    Когда я копирую файл "sample.proc1.ert" из каталога ресурсов в каталог бинарников
    И     я выполняю команду распаковки бинарников
    Тогда в каталоге исходников есть каталог "sample_proc1_ert"
    И     в каталоге исходников в подкаталоге "sample_proc1_ert" есть файл "МодульФормы.1s"
    И     в каталоге исходников в подкаталоге "sample_proc1_ert" есть файл "Форма.frm"
    
Сценарий: Распаковка каталога кириллицей с пробелами
    Когда я создаю временный каталог бинарников с именем "Кириллица с пробелами - бинарники" и сохраняю его в контекст
    И     я создаю временный каталог исходников с именем "Кириллица с пробелами - исходники" и сохраняю его в контекст
    И     я копирую файл "sample.proc1.ert" из каталога ресурсов в каталог бинарников
    И     я выполняю команду распаковки бинарников
    Тогда в каталоге исходников есть каталог "sample_proc1_ert"
    И     в каталоге исходников в подкаталоге "sample_proc1_ert" есть файл "МодульФормы.1s"
    И     в каталоге исходников в подкаталоге "sample_proc1_ert" есть файл "Форма.frm"

Сценарий: проверка перекодировки текста модуля после распаковки
    Когда я копирую файл "sample.proc1.ert" из каталога ресурсов в каталог бинарников
    И     я выполняю команду распаковки бинарников
    Когда я читаю текст файла "sample_proc1_ert\МодульФормы.1s" из каталога исходников в кодировке "UTF-8"
    Тогда прочитанный текст содержит строку "Процедура Сформировать()"

Сценарий: проверка перекодировки файлов подкаталога
    Когда я копирую содержимое каталога "bin" из каталога ресурсов в каталог бинарников
    И     я выполняю команду распаковки бинарников
    Тогда в каталоге исходников есть каталог "1Cv7_MD"
    Когда я читаю текст файла "1Cv7_MD\Справочники\Товары\ФормаСписка.fls\МодульФормы.1s" из каталога исходников в кодировке "UTF-8"
    Тогда прочитанный текст содержит строку "Процедура ПриНачалеРедактированияСтроки()" 

Сценарий: Распаковка каталога с md-файлом и внешней обработкой в подкаталоге
    Когда я копирую содержимое каталога "bin" из каталога ресурсов в каталог бинарников
    И     я выполняю команду распаковки бинарников
    Тогда в каталоге исходников есть каталог "1Cv7_MD"
    И     в каталоге исходников есть каталог "extforms"
    И     в каталоге исходников есть каталог "extforms\sample_proc1_ert"
    И     в каталоге исходников нет других каталогов кроме "1Cv7_MD,extforms"
    И     в каталоге исходников в подкаталоге "extforms\sample_proc1_ert" есть файл "МодульФормы.1s"
    И     в каталоге исходников в подкаталоге "extforms\sample_proc1_ert" есть файл "Форма.frm"
    И     в каталоге исходников в подкаталоге "1Cv7_MD" есть файл "ГлобальныйМодуль.1s"
    И     в каталоге исходников в подкаталоге "1Cv7_MD" есть каталог "Справочники"
    И     в каталоге исходников в подкаталоге "1Cv7_MD" есть каталог "Документы"