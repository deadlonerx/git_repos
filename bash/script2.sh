#!/bin/bash

sum=0
while read number
do 
	if [ "$number" -eq 0 ];then
		break;
	fi
	sum=$((sum+number))
done
echo "Summ ravna : $sum"
