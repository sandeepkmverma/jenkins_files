#!/bin/bash
IFS=,
students=$1
division=$2

if [ -z $division ]
then
     echo -e "Wrong execution"
     echo "Execution should be ------> <scipt_name> <filen_name> <argument>"
     echo "<argument> can be distinction / first_division / second_division / third_division / fail"
     exit 1;
fi


student_marks_calculation(){

	while read Name Eng_Marks Hindi_Marks Science_Marks
do
        totalMarks=`echo $((Eng_Marks + Hindi_Marks + Science_Marks))`
	per=`echo \($totalMarks\) /3|bc`

if [ $division = "distinction" ]
then

        if [ $per -ge 85 ]
        then
                echo "Distinction-->$Name-->$per%"
        fi
fi

if [ $division = "first_division" ]
then
	
	if [ $per -ge 60 ] && [ $per -lt 85 ]
	then
		echo "1st-->$Name-->$per%"
	fi
fi


if [ $division = "second_division" ]
then

        if [ $per -ge 45 ] && [ $per -lt 60 ]
        then
                echo "2nd-->$Name-->$per%"
        fi
fi


if [ $division = "third_division" ]
then

        if [ $per -ge 33 ] && [ $per -lt 45 ]
        then
                echo "3rd-->$Name-->$per%"
        fi
fi


if [ $division = "fail" ]
then

        if [ $per -lt 33 ]
        then
                echo "Failed-->$Name-->$per%"
        fi
fi


done < $students

}

student_marks_calculation

