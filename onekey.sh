#!/bin/bash
echo; echo "Введите один символ и нажмите ENTER ."
read Anykey
if [ "${#Anykey}" = 1 ]
then
case "$Anykey" in
[a-z]   ) echo "буква в нижнем регистре";;
[A-Z]   ) echo "Буква в верхнем регистре";;
[0-9]   ) echo "Цифра";;
*       ) echo "Знак пунктуации, пробел или что-то другое";;
esac
else
echo "ОДИН символ!"
fi
exit 0
