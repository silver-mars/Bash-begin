#!/bin/bash

#a random number generation, the range $1-$2
function rand_num {
	shuf -i $1-$2 -n 1
}

#shuffle lines in the $1-file with random string extraction
function rand_insert {
	sort -R $1 | head -n 1
}

#a random number generation with $1-length
function rand_Num {
	for (( i = 1; i <= $1; i++ ))
	do
	echo -n $[ $RANDOM % 10 ]
	done
}

#random kyrillic alphabet letters generation [range of 10-20 letters. This range is under development]
function rand_kyrillic {
	kyrillic='абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
	k=$( rand_num 10 20 )
	result=
	for ((i = 0; i < k; ++i))
		do
		result+=${kyrillic:RANDOM%33:1}
	done
	echo "$result"
}

#random sequence generation of latin alphabet letters and numbers
function rand_alnum {
	head /dev/urandom | tr -dc [:alnum:] | head -c $1
}

#datetime generation (dd-mm-yy-hh-mm) [under development]
function rand_datetime {
	n0=$( rand_num 0 2 )
	if [ $n0 -eq 0 ]
		then
		n1=$( rand_num 1 9 )
	elif [ $n0 -eq 1 ]
		then
		n1=$( rand_num 0 9 )
		else
		n1=$( rand_num 0 8 )
	fi
	n2=$( rand_num 0 1 )
	if [ $n2 -eq 1 ]
		then
		n3=$( rand_num 0 2 )
		else
		n3=$( rand_num 1 9 )
	fi
	n4=$( rand_num 0 9 )
	n5=$( rand_num 0 9 )
	n6=$( rand_num 0 2 )
	if [ $n6 -eq 2 ]
		then
		n7=$( rand_num 0 3 )
		else
		n7=$( rand_num 0 9 )
	fi
	n8=$( rand_num 0 5 )
	n9=$( rand_num 0 9 )
	echo "$n0$n1$n2$n3$n4$n5$n6$n7$n8$n9"
}

#a random number generation in the range of $1-$3 with $2 step
function rand_num_step {
	seq $1 $2 $3 | sort -R | head -n 1
}
