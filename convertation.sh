#!/bin/bash
echo; echo "Конвертируем метры в мили."
echo "Введите расстояние в метрах"
read meters
cfactor=0.00062137
result=$(bc <<< "scale=7; $meters*$cfactor")
echo "$meters метра(ов) эквивалентно $result милям."
exit 0
