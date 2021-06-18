#!/bin/bash
TIMELIMIT=5 # 5 секунд
read -t $TIMELIMIT variable <&1
echo
if [ -z "$variable" ]
then
echo "Время ожидания истекло."
else
echo "$variable"
fi
exit 0
