#!/bin/bash
until [ -z "$1" ]  # До тех пор пока не будут разобраны все входные аргументы...
do
echo -n "$1 "
shift
done
exit 0
