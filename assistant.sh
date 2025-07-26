#!/bin/bash

function assist()
{
	read anwser

		case $anwser in
		"open")
			echo "OK, what archive?"
			read archive
			nano $archive
		;;

		"date")
			echo "OK, what month?"
			read month
			echo "And what day?"
			read day
			sudo date --set="2025-$month-$day 5:20:00"
			assist
		;;
		"search")
			echo "OK, what?"
			read search
			xdg-open "https://www.google.com/search?q=$search"
			assist
		;;
		"node")
			echo "OK, what archive?";
			read archive
			node $archive
			assist
		;;
		"git")
			echo "OK, please enter the directory";
			read d
			cd $d
			echo "Do you want to initialice a proyect? y = yes n = no";
			read yn
			case $yn in
				"y")
					  echo "OK, yes"
					  git init
				;;
				"n")
					  echo "OK, no"
				;;
				*)
					  echo "Invalid anwser"
					  assist
				;;
			esac
		;;
		*)
			echo "Comand not found, $anwser"
			assist
		;;
	esac
}

echo "Hello, how can I help you?"
assist
