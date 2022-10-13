#!/bin/bash
#1. Сделать папку dir_1
mkdir dir_1
#2. Зайти в папку dir_1
cd dir_1
#3. Создать папку inner_dir_1
mkdir inner_dir_1
#4. Посмотреть где ты находишся
pwd
#5. Находясь в папке dir_1 создать пустой текстовый файл tf_1.txt
touch tf_1.txt
#6. Находясь в папке dir_1 через команду cat создать текстовый файл tf_2.txt со следующими строками:
#- the first 1
#- the second 2
#- the third 3
cat > tf_2.txt << EOM
the first 1	
the second 2 
the third 3 
EOM
#7. Зайти в папку inner_dir_1
cd inner_dir_1
#8. Через cat сделать текстовый файл tf_3.txt  c любыми строками
cat > tf_3.txt << EOM
line 1	
line 2 
EOM
#9. Через cat добавить в текстовый файл tf_3.txt строку “the second 2”
cat >> tf_3.txt << EOM
the second 2
EOM
#10. Через cat добавить в текстовый файл tf_3.txt строку “the sec 2”
cat >> tf_3.txt << EOM
the sec 2
EOM
#11. Через cat добавить в текстовый файл tf_2.txt строку “the sec 3”
cat >> ../tf_2.txt << EOM
the sec 3
EOM
#12. Через cat добавить в текстовый файл tf_3.txt строку “the SeCoNd 2”
cat >> tf_3.txt <<EOM
the SeCoNd 2
EOM
#13. Через cat добавить в текстовый файл tf_2.txt строку “the seConD 2”
cat >> ../tf_2.txt << EOM
the seConD 2
EOM
#14. Сделать текстовый файл tf_4.txt в котором будет 15 строк
seq 15 > tf_4.txt
#15. Сделать текстовый файл tF_5.txt в котором будет 13 строк
seq 13 > tF_5.txt
#16. Вывести список всех файлов в папке.
find . -type f
#17. Выйти из папки inner_dir_1
cd ..
#18. Вывести содержимое файла tf_3.txt в терминал
cat inner_dir_1/tf_3.txt
#19. Найти путь к файлу tf_4.txt
realpath tf_4.txt
#20. Отчистить файл tf_4.txt от содержимого без удаления самого файла 
cat /dev/null >| tf_4.txt
#21. Найти путь к файлам у которых есть  “tf” в названии
find . -name "*tf*"
#22. Найти путь к файлам у которых есть  “tf” в названии и буквы в любом регистре
find . | grep -i -e ".*tf.*"
#23. Найти строки в файлах где есть комбинация букв “sec” в текущей папке
find . -maxdepth 1 -type f -exec cat {} + | grep sec
#24. Найти строки в файлах где есть комбинация букв “sec” в любом регистре в текущей папке
find . -maxdepth 1 -type f -exec cat {} + | grep -i sec
#25. Найти строки в файлах где есть только комбинация букв “sec” в текущей папке
find . -maxdepth 1 -type f -exec cat {} + | grep -w sec
#26. Найти строки в файлах где есть только комбинация букв “sec” в любом регистре в текущей папке
find . -maxdepth 1 -type f -exec cat {} + | grep -i -w sec
#27. Найти строки в файлах где есть комбинация букв “second” в текущей папке
find . -maxdepth 1 -type f -exec cat {} + | grep second
#28. Найти строки в файлах где есть комбинация букв “second” в любом регистре в текущей папке
find . -maxdepth 1 -type f -exec cat {} + | grep -i second
#29. Найти строки в файлах где есть комбинация букв “second” во всех папках ниже уровнем
find ./*/ -type f -exec cat {} + | grep second
#30. Найти только путь и название файла в строках которых есть комбинация букв “second” в текущей папке
find . -maxdepth 1 -type f -exec grep -H second {} \; | cut -d ':' -f 1
#31. Найти все строки во всех файлах где нет комбинации “second”
find . -type f -exec cat {} + | grep -v second
#32. Найти только название и путь к файлам где нет комбинации “second”
find . -type f -exec grep -Hv second {} \; | cut -d ':' -f 1 | uniq
#33. Вывести в терминал 4 последних строк любого текстового файла
tail -4 tf_2.txt
#34. Вывести в терминал 4 первые строки любого текстового файла.
head -4 ./inner_dir_1/tf_3.txt
#35. Команда в одну строку. Создать папку и создать текстовый файл с содержиммым.
mkdir ./inner_dir2 && echo -e "line1\nline2" > ./inner_dir2/file.txt
#36. Команда в одну строку. Переместить в любую одну папку текстовые файлы у которых в содержимом есть слово “sec”
mkdir dir_1_1 dir_1_2
mv $(find . -type f -exec grep -H sec {} \; | cut -d ':' -f 1 | uniq) dir_1_1
#37. Команда в одну строку. Скопировать в любую одну папку текстовые файлы у которых в содержимом есть слово “sec”
cp $(find . -type f -exec grep -H sec {} \; | cut -d ':' -f 1) dir_1_2
#38. Команда в одну строку. Найти все строки c “sec” во всех текстовых файлах, скопировать и вставить эти строки в один новый созданный текстовый файл.
find . -type f -exec grep sec {} \; >> new_file.txt
#39. Команда в одну строку. Удалить текстовые файлы у которых в содержимом есть слово “sec”
rm $(find . -type f -exec grep -H sec {} \; | cut -d ':' -f 1 | uniq)
#40. Просто вывести в терминал строку “Good job!!”
echo Good job!!
